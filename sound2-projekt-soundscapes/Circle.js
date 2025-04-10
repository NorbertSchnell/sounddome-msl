export const size = 100;

export class Circle {
    constructor(x, y, duration, color, opacity = 1) {
        this.x = x;
        this.y = y;
        this.color = color;

        this.growthVelocity = 50; // pixels / sec
        this.minVelocity = 50; // if gain is < 0.25 => constant growth
        this.friction = -50; // pixels / sec

        this.lifeTime = duration;
        this.opacityScale = opacity / this.lifeTime;
        this.radius = 0;
    }

    render(dt, width, height, context) {
        this.lifeTime -= dt;

        if (this.growthVelocity > this.minVelocity) {
            this.growthVelocity += (this.friction * dt);
        }

        this.radius += this.growthVelocity * dt;

        if (this.lifeTime >= 0) {
            const x = 0.5 * width + 0.25 * this.x * size;
            const y = 0.5 * height - 0.25 * this.y * size;

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