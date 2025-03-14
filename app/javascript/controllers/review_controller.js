import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["comedianReview", "venueReview"];

  connect() {
    console.log("review controller connected");
  }

  showComedianReview() {
    console.log("Comedian button clicked!");
    this.comedianReviewTarget.classList.toggle("d-none");
    this.venueReviewTarget.classList.add("d-none");
  }

  showVenueReview() {
    console.log("Venue button clicked!");
    this.venueReviewTarget.classList.toggle("d-none");
    this.comedianReviewTarget.classList.add("d-none");
  }
}
