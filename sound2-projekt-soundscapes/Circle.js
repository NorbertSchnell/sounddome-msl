export const size = 10;

export class Circle {
    constructor(x, y, duration, color, opacity = 1) {
        this.x = x; // Pixel-Koordinaten
        this.y = y;
        this.color = color;

        this.growthVelocity = 20; // pixels / sec – langsamere Expansion
        this.minVelocity = 20;
        this.friction = -10; // sanftere Verlangsamung

        this.lifeTime = duration; // in Sekunden
        this.opacityScale = opacity / this.lifeTime;

        this.radius = 5; // Startgröße
    }

    render(dt, width, height, context) {
        this.lifeTime -= dt;

        if (this.growthVelocity > this.minVelocity) {
            this.growthVelocity += (this.friction * dt);
        }

        this.radius += this.growthVelocity * dt;

        if (this.lifeTime >= 0) {
            const x = this.x;
            const y = this.y;

            context.save();
            context.beginPath();
            context.strokeStyle = this.color;
            context.globalAlpha = this.opacityScale * this.lifeTime;
            context.arc(x, y, Math.round(this.radius), 0, Math.PI * 2, false);
            context.stroke();
            context.closePath();
            context.restore();
        }
    }
}
