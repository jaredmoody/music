import { Controller } from "stimulus"

export default class extends Controller {
  static values = { url: String }

  remove(e) {
    e.preventDefault()

    const songId = e.target.closest('tr').dataset.songId

    fetch(this.urlValue +  `/songs/${songId}`, {
      method: 'DELETE',
      credentials: "same-origin",
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token"),
      }
    }).then((response) => response.text())
      .then((text) => document.body.insertAdjacentHTML("beforeend", text))
  }

  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
