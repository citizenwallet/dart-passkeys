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
      console.log("creating...");
      return create(params);
    case "get":
      console.log("getting...");
      return get(params);
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
  console.log("create2", userId);
  const publicKeyCredentialCreationOptions = {
    challenge: Uint8Array.from("a7c61ef9-dc23-4806-b486-2428938a547e", (c) =>
      c.charCodeAt(0)
    ),
    rp: { id: "localhost", name: "Citizen Wallet" },
    user: {
      //   id: new Uint8Array([79, 252, 83, 72, 214, 7, 89, 26]),
      id: Uint8Array.from(userId, (c) => c.charCodeAt(0)),
      name: "anonymous",
      displayName: "Anonymous",
    },
    pubKeyCredParams: [
      { type: "public-key", alg: -44 },
      { type: "public-key", alg: -8 },
      { type: "public-key", alg: -7 },
      { type: "public-key", alg: -257 },
    ],
  };

  const credential = await navigator.credentials.create({
    publicKey: publicKeyCredentialCreationOptions,
  });
  console.log(credential);

  if (credential === null) {
    return;
  }

  console.log(credential.id);
  console.log(credential);
  return credential;
}

async function get(id) {
  const publicKeyCredentialRequestOptions = {
    challenge: Uint8Array.from("a7c61ef9-dc23-4806-b486-2428938a547e", (c) =>
      c.charCodeAt(0)
    ),
    allowCredentials: [
      {
        id: Uint8Array.from(id, (c) => c.charCodeAt(0)),
        type: "public-key",
      },
    ],
    timeout: 60000,
  };

  const assertion = await navigator.credentials.get({
    publicKey: publicKeyCredentialRequestOptions,
  });

  console.log(assertion);
}
