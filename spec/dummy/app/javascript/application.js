import "bootstrap";
import { DataTable } from "datatables.net";
import "datatables.net-bs5";
import bootstrapPlugin from "@fullcalendar/bootstrap5";
import { Calendar } from "fullcalendar";
import dayGridPlugin from "fullcalendar/daygrid";
import TomSelect from "tom-select";

document.addEventListener("DOMContentLoaded", () => {
  for (const el of document.querySelectorAll('[data-controller="data-table"]')) {
    new DataTable(el);
  }

  for (const el of document.querySelectorAll('[data-controller="full-calendar"]')) {
    new Calendar(el, {
      plugins: [bootstrapPlugin, dayGridPlugin],
      themeSystem: "bootstrap",
      buttonClass: "btn-neutral",
      headerToolbar: {
        start: "title",
        end: "today prev,next dayGridMonth",
      },
      buttons: {
        today: { text: "Today" },
        prev: { iconClass: "fa-solid fa-chevron-left" },
        next: { iconClass: "fa-solid fa-chevron-right" },
      },
      events: [{ title: "Meeting", start: new Date() }],
    }).render();
  }

  for (const el of document.querySelectorAll('[data-controller="tom-select"]')) {
    const options = {
      create: false,
      plugins: [],
      refreshThrottle: 0,
      allowEmptyOption: true,
      render: {
        option: (data, escape) => `<div>${escape(data.text || "\u00A0")}</div>`,
      },
    };
    if (el.multiple) {
      options.plugins.push("clear_button");
    }
    if (el.dataset.search) {
      options.plugins.push("dropdown_input");

      if (!el.dataset.truncate) {
        options.maxOptions = null;
      }
    } else {
      options.controlInput = null;
      options.maxOptions = null;
    }
    new TomSelect(el, options);
  }
});
