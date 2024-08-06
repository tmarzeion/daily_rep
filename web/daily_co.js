function initializeDailyCo(roomUrl, username) {

  const callFrame = window.Daily.createFrame({
    showLeaveButton: true,
    iframeStyle: {
      position: 'absolute',
      width: '100%',
      height: '100%',
      border: '0',
    }
  });

  callFrame.setUserName(username);
  callFrame.join({ url: roomUrl });

  const container = document.getElementById('daily-container');

    container.style.position = 'absolute';
    container.style.left = '10px'; // Example value, adjust as needed
    container.style.top = '10px'; // Example value, adjust as needed
    container.style.width = '25%'; // Example value, adjust as needed
    container.style.height = '25%'; // Example value, adjust as needed
    container.style.zIndex = '1000'; // Example value, adjust as needed

    container.appendChild(callFrame.iframe());

    // Event listeners for the call frame
    callFrame.on('left-meeting', (event) => {
        window.dartOnLeave();
  })
}

function setDailyLanguage(language) {
  callInstance = window.Daily.getCallInstance();
  callInstance.setDailyLang(language);
}

function setWindowPositionAndSize(left, top, width, height) {
  console.log('TEST' + left + '/' + top + '/' + '/' + width + '/' + height);
  const container = document.getElementById('daily-container');
  container.style.left = left + 'px';
  container.style.top = top + 'px';
  container.style.width = width + 'px';
  container.style.height = height + 'px';
}