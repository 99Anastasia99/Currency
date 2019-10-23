$(document).ready(function() {
  if($('#password_rules_list').length == 0) {
    return false;
  }
  var password;
  var confirmation;

  $('input[type=password][complexity_check=true]').keyup(function() {
    password = $(this).val();
    $('#password_rules_lowercase').toggleClass('valid', (/[a-z]/).test(password));
    $('#password_rules_uppercase').toggleClass('valid', (/[A-Z]/).test(password));
    $('#password_rules_number').toggleClass('valid', (/\d/).test(password));
    $('#password_rules_special').toggleClass('valid', (/[\W_]/).test(password));
    $('#password_rules_length').toggleClass('valid', password.length > 7);
    $('#password_rules_confirmation').toggleClass('valid', confirmation === password);
  });

  $('input[type=password]:last').keyup(function() {
    confirmation = $(this).val();
    $('#password_rules_confirmation').toggleClass('valid', confirmation === password);
  })
});
