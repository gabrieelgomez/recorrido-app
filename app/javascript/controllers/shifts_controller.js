import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  change(event) {
    let id = event.target.dataset.id
    let employee_id = event.target.selectedOptions[0].value;
    const csrfToken = document.querySelector("[name='csrf-token']").content
  
    fetch(`/service_hours/${id}/`, {
      method: 'PATCH', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', // no-cors, *cors, same-origin
      cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
      credentials: 'same-origin', // include, *same-origin, omit
      headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ employee_id: employee_id })
    })
    .then(response => response.json())

  }
}
