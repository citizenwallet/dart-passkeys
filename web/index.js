// Imports here
//...

// Declares a global function
window.jsInvokeMethod = async (method, params) => {
  //Process your Dart call here
  switch (method) {
    case "helloWorld":
      console.log("Hello World from js!");
      break;
    case "create":
      return create(params);
    default:
      console.log("Method not found", method);
      break;
  }
};

//Sends event to Dart
function callDart(event) {
  window.jsOnEvent(event);
}

// Code here
async function create(userId) {
  const publicKeyConfig = {
    rp: { id: "xyz.citizenwallet", name: "Citizen Wallet" },
    user: {
      //   id: new Uint8Array([79, 252, 83, 72, 214, 7, 89, 26]),
      id: userId,
    },
    pubKeyCredParams: [{ type: "public-key", alg: -7 }],
  };

  const credential = await navigator.credentials.create({
    publicKey: publicKeyConfig,
  });
  if (credential === null) {
    return;
  }

  console.log(credential.id);
  console.log(credential);
  return credential;
}
