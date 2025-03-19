import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import gsap from "gsap";


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    displaySearch: Boolean
  }
  connect() {
    console.log("connected");
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      center: [13.404954, 52.520008],
      zoom: 11.5,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    if (this.displaySearchValue) {
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }),'top-left')
    }
      this.isExpanded = false;
  }

  #fitMapToMarkers() {
    if (this.markersValue.length === 0) return; // If no markers, don't fit bounds

    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));

    // Ensure we have at least two points to prevent zooming out too much
    if (this.markersValue.length > 1) {
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    } else {
      // If there's only one marker, center on it with a fixed zoom
      this.map.setCenter([this.markersValue[0].lng, this.markersValue[0].lat]);
      this.map.setZoom(12);
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    });
  }

  resize() {
    const mapElement = document.querySelector(".map");

    if (!this.isExpanded) {
      gsap.to(mapElement, {
        height: this.isExpanded ? "150px" : "500px",
        duration: 0.5,
        ease: "power2.inOut",
        onComplete: () => {
          setTimeout(() => {
            this.map.resize();
          }, 100);
        },
      });

      this.isExpanded = true;
    }
  }
}
