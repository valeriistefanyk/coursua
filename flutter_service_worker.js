'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"index.html": "6580ca2ae8158e8e7f82e2b87412a268",
"/": "6580ca2ae8158e8e7f82e2b87412a268",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "a45ccdafc25bd41dd860f34e927e1124",
"manifest.json": "a9cab7eebd3994c036d66e0adb069033",
"version.json": "2ddc00fce1ec9641f74f06a4e8ab7aae",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "011dedd4682737dfc4664b8fb6e22a5d",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/avatars/monkey.jpg": "12299291e775e3ed1c685e5855d8b345",
"assets/assets/avatars/snake.jpg": "bc267fb3988624a230a9e1b7d259756e",
"assets/assets/avatars/bat.jpg": "cc834cc3b9ebb56bad0b97edf1bd28e2",
"assets/assets/avatars/cat.jpg": "e09e45b5cee1df846b299614c1077152",
"assets/assets/avatars/bird.jpg": "02fd096b9f2bb320ceb0b3a034b51273",
"assets/assets/avatars/chipmunk.jpg": "78d38e02f9f23046009877f9c06a9f58",
"assets/assets/avatars/snail.jpg": "5f10bf7a7934ea6fc512ff52fa80d154",
"assets/assets/avatars/owl.jpg": "9f28601c7d16d19d288a13b7e31f5f8b",
"assets/assets/avatars/dog.jpg": "243d749ae0df071cc18a0254250406c6",
"assets/assets/avatars/fox.jpg": "f66362d32a99ff47141204eac9aa820e",
"assets/assets/avatars/lion.jpg": "8274510449ed69d8448e99fc2fa273ea",
"assets/assets/avatars/wolf.jpg": "66029db4be4548569300517b695a7065",
"assets/assets/logos/maths.png": "62355ec0ecc7220e27bab780180aa8e7",
"assets/assets/logos/languages.png": "39a3773fd48e8b398d97138b95fc015c",
"assets/assets/logos/history.png": "adbdf517efc2a8305a0d4868285cf721",
"assets/assets/logos/biology.png": "5f5ed40fbccd06e4e4cc297720682b70",
"assets/assets/logos/chemistry.png": "1233277a198219a1923069ffed5f50bc",
"assets/assets/illustrations/chrysanthemum.png": "1e0745510e471963f50d36695f03a71c",
"assets/assets/illustrations/microscope.png": "1d1073075a67eb592e6d46d82e2bf5d5",
"assets/assets/illustrations/world-globe.png": "331f618c1d1b985b1da1335dfaa69619",
"assets/assets/illustrations/mathematics.png": "3cc56198e54505846aa79e7af86fa5d4",
"assets/assets/illustrations/lab.png": "d6dbd0c298cafb7650224f9ed8fec5b4",
"assets/AssetManifest.json": "a3f869f747e354235a19c86ad87a4ed9"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
