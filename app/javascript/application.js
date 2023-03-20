// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Cookies from 'js-cookie'

window.addEventListener("DOMContentLoaded", function() {
  console.log("DOMContentLoaded fired!");
});

document.addEventListener("DOMContentLoaded", function() {
  const filterButton = document.getElementById("eligible-filter-toggle");

  if (filterButton) {
    filterButton.addEventListener("click", function() {
      const eligibleOnly = Cookies.get("eligible_only");
      console.log("Testing ---------------")

      if (eligibleOnly === "true") {
        Cookies.set("eligible_only", "false", { expires: 1 });
      } else {
        Cookies.set("eligible_only", "true", { expires: 1 });
      }

      window.location.reload();
    });
  }
});