const button = document.querySelector("#call-backend");
const statusText = document.querySelector("#status");
const responseBlock = document.querySelector("#backend-response");

button.addEventListener("click", async () => {
  button.disabled = true;
  statusText.textContent = "Calling backend...";

  try {
    const response = await fetch("/api/message", {
      headers: {
        "Accept": "application/json"
      }
    });

    if (!response.ok) {
      throw new Error(`Backend returned HTTP ${response.status}`);
    }

    const payload = await response.json();
    responseBlock.textContent = `${payload.message}\n\n${JSON.stringify(payload, null, 2)}`;
    statusText.textContent = "Success";
  } catch (error) {
    responseBlock.textContent = error.message;
    statusText.textContent = "Failed";
  } finally {
    button.disabled = false;
  }
});

