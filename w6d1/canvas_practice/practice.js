document.addEventListener("DOMContentLoaded", function(){
  let pi = Math.PI;
  let canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(20, 20, 200)';
  ctx.fillRect(100, 100, 100, 100);
  ctx.beginPath();
  ctx.arc(150, 150, 50, 0, 2*pi);
  ctx.strokeStyle = 'rgb(200, 20, 20)';
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = 'rgb(20, 200, 20)';
  ctx.fill();

  ctx.fillStyle = 'rgb(20, 250, 300)';
  ctx.beginPath();
  ctx.arc(150, 250, 75, pi, 0);
  ctx.stroke();
  ctx.fill();

  ctx.beginPath();
  ctx.arc(250, 150, 75, 2.5* pi, 1.5 * pi);
  ctx.stroke();
  ctx.fill();

  ctx.beginPath();
  ctx.arc(50, 150, 75, 1.5* pi, 2.5 * pi);
  ctx.stroke();
  ctx.fill();

  ctx.beginPath();
  ctx.arc(150, 50, 75, 0, pi);
  ctx.stroke();
  ctx.fill();
  //


});
