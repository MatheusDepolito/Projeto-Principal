
function printXY(obj) {

  return Math.round(obj.x) + "x" + Math.round(obj.y)
}

function pointVsRect(p, r){
  return(p[0] >= r.x && p[1] >= r.y && p[0] < r.x + r.width && p[1] < r.y + r.height)
}

function rectVsRect(r1,r2){
  return (r1.x < r2.x + r2.width && r1.x + r1.width > r2.x && r1.y < r2.y + r2.height && r1.y + r1.height > r2.y)
}
