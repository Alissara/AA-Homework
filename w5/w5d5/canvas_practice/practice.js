document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("mycanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = 'blue';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(75, 75, 20, 0, 2 * Math.PI, true);
  ctx.strokeStyle = 'purple';
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = 'purple';
  ctx.fill();
});
