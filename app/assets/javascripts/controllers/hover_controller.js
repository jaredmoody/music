import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["hover"]

  connect() {
    if (this.hasHoverTarget && !document.querySelector("body").dataset.noHover) {
      this.element.addEventListener("mouseenter", () => this.toggle(true))
      this.element.addEventListener("mouseleave", () => this.toggle(false))
    }
  }

  toggle(display) {
    this.hoverTargets.forEach((target) => {
      target.style.display = display ? "initial" : "none"
    })
  }
}
