import "bootstrap";
import TomSelect from "tom-select";

document.addEventListener("DOMContentLoaded", () => {
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
