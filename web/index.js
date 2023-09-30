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
      console.log("hello");
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
  console.log("create", userId);
  const publicKeyConfig = {
    challenge: Uint8Array.from("a7c61ef9-dc23-4806-b486-2428938a547e", (c) =>
      c.charCodeAt(0)
    ),
    rp: { id: "xyz.citizenwallet", name: "Citizen Wallet" },
    user: {
      //   id: new Uint8Array([79, 252, 83, 72, 214, 7, 89, 26]),
      id: Uint8Array.from(userId, (c) => c.charCodeAt(0)),
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
