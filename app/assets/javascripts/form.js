$(document).ready(function () {
  function remove_selected() {
    index = document.getElementById("operation_banknote_name").selectedIndex
    options = document.getElementById("operation_banknote_name").options
    new_options = document.getElementById("operation_banknote_name_2").options
    if (index == 0) return;
    return_all_options();
    new_options.remove(index);
  }

  function return_all_options() {
    for (var i = 0; i < options.length; i++) {
      document.getElementById("operation_banknote_name_2").options[i] = new Option (options[i].text, options[i].value);
    }
  }

  $("#operation_banknote_name").on("change", remove_selected);
});
