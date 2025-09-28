function toggleAccordion(btn) {
        let panel = btn.nextElementSibling;
        panel.style.display = (panel.style.display === "block") ? "none" : "block";
    }