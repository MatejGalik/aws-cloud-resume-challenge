const counter = document.querySelector(".resume_counter");

async function updateCounter() {
    let response = await fetch("https://fiv6llwfaaelywbvirygwsgpg40aqago.lambda-url.us-east-1.on.aws/");
    let data = await response.json();
    counter.innerHTML = `Views: ${data}`; 
}

updateCounter();