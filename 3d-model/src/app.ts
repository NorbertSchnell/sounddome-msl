import '@babylonjs/core/Debug/debugLayer';
import '@babylonjs/inspector';
import '@babylonjs/loaders/glTF';
import { Engine, Scene, SceneLoader, FreeCamera, ArcRotateCamera, HemisphericLight, PointLight, Vector3, Color3 } from '@babylonjs/core';
import { MeshBuilder, Mesh, SubMesh } from '@babylonjs/core';
import { StandardMaterial, MultiMaterial, Texture, DynamicTexture } from '@babylonjs/core';
import { VertexData } from '@babylonjs/core';
import { GridMaterial } from '@babylonjs/materials';
import { AdvancedDynamicTexture, TextBlock } from '@babylonjs/gui';

interface SpeakerDescr {
  id: string;
  cartesian: { x: number, y: number, z: number };
  spherical: { azimuth: number, elevation: number, distance: number } | null;
}

const speakerDims = { height: 0.12, width: 0.13, depth: 0.13 };
const centerPosition = { x: 0, y: 1.76, z: 0 };

const speakers: SpeakerDescr[] = [
  { id: '1.1', cartesian: { x: -1.229, y: 0.521, z: 2.754 }, spherical: null },
  { id: '1.2', cartesian: { x: 1.126, y: 0.539, z: 2.748 }, spherical: null },
  { id: '2.1', cartesian: { x: 0.412, y: 2.385, z: 2.761 }, spherical: null },
  { id: '2.2', cartesian: { x: 2.339, y: -0.196, z: 2.690 }, spherical: null },
  { id: '2.3', cartesian: { x: -0.243, y: -1.406, z: 2.640 }, spherical: null },
  { id: '2.4', cartesian: { x: -2.235, y: 1.259, z: 2.750 }, spherical: null },
  { id: '3.1', cartesian: { x: 1.012, y: 3.527, z: 1.37 }, spherical: null },
  { id: '3.2', cartesian: { x: -1.757, y: 3.547, z: 1.435 }, spherical: null },
  { id: '3.3', cartesian: { x: -3.44, y: 0.899, z: 1.595 }, spherical: null },
  { id: '3.4', cartesian: { x: -3.471, y: -1.908, z: 1.567 }, spherical: null },
  { id: '3.5', cartesian: { x: -1.116, y: -3.719, z: 1 }, spherical: null },
  { id: '3.6', cartesian: { x: 2.39, y: -3.733, z: 1.035 }, spherical: null },
  { id: '3.7', cartesian: { x: 3.432, y: -0.967, z: 1.48 }, spherical: null },
  { id: '3.8', cartesian: { x: 3.44, y: 1.933, z: 1.49 }, spherical: null },
  { id: '4.1', cartesian: { x: -0.62, y: 3.534, z: 0 }, spherical: null },
  { id: '4.2', cartesian: { x: 2.329, y: 3.526, z: 0 }, spherical: null },
  { id: '4.3', cartesian: { x: 3.422, y: 0.499, z: 0 }, spherical: null },
  { id: '4.4', cartesian: { x: 3.442, y: -2.444, z: 0 }, spherical: null },
  { id: '4.5', cartesian: { x: 1.421, y: -3.77, z: 0 }, spherical: null },
  { id: '4.6', cartesian: { x: -2.317, y: -3.723, z: 0 }, spherical: null },
  { id: '4.7', cartesian: { x: -3.435, y: -0.514, z: 0 }, spherical: null },
  { id: '4.8', cartesian: { x: -3.461, y: 2.909, z: 0 }, spherical: null },
  { id: '5.1', cartesian: { x: -0.375, y: 3.712, z: -0.93 }, spherical: null },
  { id: '5.2', cartesian: { x: -3.614, y: 3.253, z: -1.11 }, spherical: null },
  { id: '5.3', cartesian: { x: -3.629, y: -1.227, z: -1.115 }, spherical: null },
  { id: '5.4', cartesian: { x: -0.553, y: -3.747, z: -1.23 }, spherical: null },
  { id: '5.5', cartesian: { x: 3.606, y: -1.861, z: -1.12 }, spherical: null },
  { id: '5.6', cartesian: { x: 3.623, y: 2.151, z: -1.11 }, spherical: null },
];

const spatXyz = [];

for (let speaker of speakers) {
  spatXyz.push(speaker.cartesian.x);
  spatXyz.push(speaker.cartesian.y);
  spatXyz.push(speaker.cartesian.z);
}

console.log(spatXyz);

for (let speaker of speakers) {
  const coords = speaker.cartesian;
  const x = coords.x;
  const y = coords.y;
  const z = coords.z;
  const azimuth = Math.atan2(y, x) - 0.5 * Math.PI;
  const elevation = Math.atan2(z, Math.sqrt(x * x + y * y));
  const distance = Math.sqrt(x * x + y * y + z * z);
  speaker.spherical = { azimuth, elevation, distance };
}

(async function main() {
  // create the canvas html element and attach it to the webpage
  const canvas = document.createElement('canvas');
  canvas.style.width = '100%';
  canvas.style.height = '100%';
  canvas.id = 'gameCanvas';
  document.body.appendChild(canvas);

  // initialize babylon scene and engine
  const engine = new Engine(canvas, true);
  const scene = new Scene(engine);

  const camera = new ArcRotateCamera('camera', -Math.PI / 2, Math.PI / 4, 4, new Vector3(0, 1.76, 0));
  // const camera: FreeCamera = new FreeCamera('camera', new Vector3(0, 0, 0), scene);
  camera.attachControl(canvas, true);

  const result = await SceneLoader.ImportMeshAsync('', './models/', 'lx-10.obj', scene);

  console.log(result.meshes);

  const lx10Model = result.meshes[0];
  lx10Model.scaling = new Vector3(0.001, 0.001, 0.001);
  lx10Model.setEnabled(false);

  const groundMaterial = new GridMaterial('groundMaterial', scene);
  groundMaterial.majorUnitFrequency = 1;
  groundMaterial.minorUnitVisibility = 0.1;
  groundMaterial.gridRatio = 1;
  groundMaterial.backFaceCulling = false;
  groundMaterial.mainColor = new Color3(1, 1, 1);
  groundMaterial.lineColor = new Color3(1, 1, 1);
  groundMaterial.opacity = 0.2;

  const ground = MeshBuilder.CreateGround('ground', { height: 8, width: 8, subdivisions: 4 });
  ground.material = groundMaterial;

  const ambientLight = new HemisphericLight('ambient-light', new Vector3(10, 10, 0), scene);
  ambientLight.intensity = 1;

  const cameraLight = new PointLight('center-ight', new Vector3(0, 1.76, 0), scene);
  cameraLight.intensity = 0.5;

  const center: Mesh = MeshBuilder.CreateSphere('sphere', { diameter: 0.33 }, scene);
  center.position = new Vector3(0, 1.76, 0);
  const transparentMaterial = new StandardMaterial('transparent-material', scene);
  transparentMaterial.alpha = 0;
  center.material = transparentMaterial;

  const blackMaterial = new StandardMaterial('black-material', scene);
  blackMaterial.diffuseColor = new Color3(0.1, 0.1, 0.1);
  blackMaterial.specularColor = new Color3(0.3, 0.3, 0.3);
  blackMaterial.ambientColor = new Color3(1, 1, 1);

  const ui = AdvancedDynamicTexture.CreateFullscreenUI("ui");
  ui.layer.isEnabled = false;

  for (let speaker of speakers) {
    const cartesian = speaker.cartesian;
    const spherical = speaker.spherical;

    // const point: Mesh = MeshBuilder.CreateSphere(speaker.id + '-point', { diameter: 0.05 }, scene);
    // point.position.x = cartesian.x;
    // point.position.y = cartesian.z;
    // point.position.z = cartesian.y;
    // point.parent = center;

    //const box = MeshBuilder.CreateBox(speaker.id, speakerDims);
    const box = lx10Model.clone(speaker.id, null);
    box.setEnabled(true);
    box.parent = center;

    box.position.x = cartesian.x;
    box.position.y = cartesian.z;
    box.position.z = cartesian.y;

    box.rotation.y = -spherical.azimuth;
    box.rotation.x = -spherical.elevation;

    const text = new TextBlock();
    text.text = speaker.id;
    text.color = 'white';
    text.fontSize = 18;
    text.alpha = 0.5;
    ui.addControl(text);
    text.linkWithMesh(box);
    text.linkOffsetX = 0;
    text.linkOffsetY = 0;

    box.material = blackMaterial;
  }

  // hide/show the Inspector
  window.addEventListener('keydown', (ev) => {
    // console.log(ev.key);

    if (ev.ctrlKey) {
      if (ev.key === 'i') {
        if (scene.debugLayer.isVisible()) {
          scene.debugLayer.hide();
        } else {
          scene.debugLayer.show();
        }
      } else if (ev.key === 'l') {
        ui.layer.isEnabled = !ui.layer.isEnabled;
      }
    }
  });

  scene.registerBeforeRender(function () {
    cameraLight.position = camera.position;
  });

  // run the main render loop
  engine.runRenderLoop(() => {
    scene.render();
  });
})();
