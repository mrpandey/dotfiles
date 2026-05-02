function dontShowBrowserNoticePage() {
  const browserNotice = document.getElementById('browser-support-notice');
  console.log({ browserNotice });
  if (browserNotice) {
    // When Spotify displays the browser notice, it's not just the notice,
    // but the entire page is focused on not allowing you to proceed.
    // So in this case, we hide the body element (so nothing shows)
    // until our JS deletes the service worker and reload (which will actually load the player)
    document.getElementsByTagName('body')[0].style.display = 'none';
  }
}

function reload() {
  window.location.href = window.location.href;
}

function nukeWorkers() {
  dontShowBrowserNoticePage();
  if ('serviceWorker' in navigator) {
    caches.keys().then(function (cacheNames) {
      cacheNames.forEach(function (cacheName) {
        console.debug('Deleting cache', cacheName);
        caches.delete(cacheName);
      });
    });
    navigator.serviceWorker.getRegistrations().then((registrations) => {
      registrations.forEach((worker) =>
        worker
          .unregister()
          .then((u) => {
            console.debug('Unregistered worker', worker);
            reload();
          })
          .catch((e) =>
            console.error('Unable to unregister worker', error, { worker }),
          ),
      );
    });
  }
}

document.addEventListener('DOMContentLoaded', () => {
  nukeWorkers();
});

if (document.readyState === 'interactive') {
  nukeWorkers();
}
