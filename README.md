# MSL Sound Dome 

This repository contains documentation and software for the sound dome at the Media Synthesis Lab (I0.07) at Furtwangen University. The sound dome features a 28.4 *Fohhn Audio* loudspeaker system on a surface of about 50m<sup>2</sup>.

- **[3d-model](https://norbertschnell.github.io/sounddome-msl/3d-model/public/)**:
  3D visualisation of the sound dome using *babylon.js*
- **max**: Cyling'74 Max patches using *IRCAM Spat 5*
- **mobile-control**: HTML and Cyling'74 Max code to control a 3D position (e.g. of a virtual sound source)

## TODO

- [ ] label loudspeakers (ID), clamps ("Klangdom" + ID), the 5 stands ("Klangdom" + ID), cables ("Klangdom" + ID)
- [x] define final positions and cabling for subwoofers
- [x] perfect cabling of all loudspeakers
- [x] exchange the (smallest) stand of loudspeaker 5.4

## Quick Start - Loading A MaxPatch

### Hardware:

1. Turn on the 2 interfaces connected to the speaker network
2. Turn on the PC (you can connect your own PC to the LAN network)

### Software

1. Open Dante Virtual SoundCard
2. Soundcard Settings: ASIO, 32x32
3. Open Dante Virtual Controller
4. Load the [MSL speaker setup] (./setup/config-dante-controller-pc-msl.xml) from this repository into the Dante Controller
5. Open MAX and amke sure that the Dante Soundcard is selected a the driver in the audio status (found in settings)
6. Load your Maxpatch (You can also use the maxpatches in ./max in this repository)