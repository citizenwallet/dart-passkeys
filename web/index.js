//Your JS libraries imports
//...

//Declares a global function
window.jsInvokeMethod = async (method, params) => {
  //Process your Dart call here
  switch (method) {
    case "helloWorld":
      console.log("Hello World from js!");
      break;

    default:
      console.log("Method not found");
      break;
  }
};

//Sends event to Dart
function callDart(event) {
  window.jsOnEvent(event);
}

//Your JS code
//...
