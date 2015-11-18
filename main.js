var correctOrder = [
  "green", "blue", "red"
];

var clicks = 0;

var is_alive = true;

var wires = document.querySelectorAll('.wire');

var handleClick = function(event){
  if (!is_alive) { return }
  console.log("cut!");
  event.target.classList.add('cut');
  if (event.target.id === correctOrder[clicks]) {
    clicks++;
    console.log('safe');
  } else {
    console.log("boom!");
    is_alive = false;
  }
}

Array.prototype.forEach.call(wires, function(wire){
  wire.addEventListener('click', handleClick);
});
