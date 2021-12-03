$(document).ready(function () {
  var form_count = 1,
    previous_form,
    next_form,
    total_forms;
  total_forms = $("fieldset").length;
  $(".next-form").click(function () {
    previous_form = $(this).parent();
    next_form = $(this).parent().next();
    next_form.show();
    previous_form.hide();
    setProgressBarValue(++form_count);
  });
  $(".previous-form").click(function () {
    previous_form = $(this).parent();
    next_form = $(this).parent().prev();
    next_form.show();
    previous_form.hide();
    setProgressBarValue(--form_count);
  });
  setProgressBarValue(form_count);
  function setProgressBarValue(value) {
    var percent = parseFloat(100 / total_forms) * value;
    percent = percent.toFixed();
    $(".progress-bar")
      .css("width", percent + "%")
      .html(percent + "%");
  }
  $("#register_form").submit(function (event) {
    var error = "Por favor, complete los siguientes campos: ";
    var error_message = "";
    var error_preferencias = "";
    var b = 0;
    
    if (!$("#usuario").val()) {
      error_message += "*Nombre";
      b = 1;
    }
    if (!$("#apellido").val()) {
      error_message += "<br>*Apellido";
      b = 1;
    }
    if (!$("#dni").val()) {
      error_message += "<br>*Dni";
      b = 1;
    }
    if (!$("#email").val()) {
      error_message += "<br>*Email";
      b = 1;
    }
    if (!$("#fechanacimiento").val()) {
      error_message += "<br>*Fecha de nacimiento";
      b = 1;
    }
    
    if(!$("input[name='genero']:radio").is(':checked')) {
      error_message += "<br>*Genero";
      b = 1;
    }
    /*if (!$("#discapacidades").val()) {
      error_message += "<br>*Discapacidades";
      b = 1;
    }   */     
    if (!$("#contacto").val()) {
      error_message += "<br>*Telefono";
      b = 1;
    }
    if (!$("#domicilio").val()) {
      error_message += "<br>*Domicilio";
      b = 1;
    }
    if (!$("#ecivil").val()) {
      error_message += "<br>*Estado civil";
      b = 1;
    }
    if (!$("#localidad").val()) {
      error_message += "<br>*Localidad";
      b = 1;
    }
    if (!$("#departamento").val()) {
      error_message += "<br>*Departamento";
      b = 1;
    }
    if (!$("#provincia").val()) {
      error_message += "<br>*Provincia";
      b = 1;
    }
    if (!$("#pais").val()) {
      error_message += "<br>*Pais";
      b = 1;
    }
    if (!$("input[name='licencia']:radio").is(':checked')) {
      error_message += "<br>*Licencia de conducir";
      b = 1;
    }else if($("#licsi").is(':checked')){
      if (!$("input[name='auto']:radio").is(':checked')) {
        error_message += "<br>*Dispone de vehiculo propio";
        b = 1;
      }
    }
    if(b == 1){
      error_message = "Datos personales:<br>" + error_message;
      b = 0;
    }

    if (!$("#slaboral").val()) {
      error_preferencias += "<br>*Situacion laboral";
      b = 1;
    }
    if (!$("#modalidad").val()) {
      error_preferencias += "<br>*Modalidad";
      b = 1;
    }
    if (!$("#area").val()) {
      error_preferencias += "<br>*Area";
      b = 1;
    }
    if (!$("#salariomin").val()) {
      error_preferencias += "<br>*Salaro minimo aceptado";
      b = 1;
    }
    if (!$("input[name='dv']:radio").is(':checked')) {
      error_preferencias += "<br>*Disponibilidad para viajar";
      b = 1;
    }
    if (!$("input[name='dcr']:radio").is(':checked')) {
      error_preferencias += "<br>*Disponibilidad para mudarse";
      b = 1;
    }
    if(b == 1){
      error_preferencias = "<br><br>Preferencias laborales:" + error_preferencias;
      b = 0;
    }

    // Display error if any else submit form
    if (error_message || error_preferencias) {      
      $(".alert-success").removeClass("hide").html(error + error_message + error_preferencias);
      return false;
    } else {
      return true;
    }
  });

  $("#licsi").click(function () {
    var v = document.getElementById("auto");
    if (document.getElementById("licsi").checked) {
      v.style.display = "block";
    }
  });
  $("#licno").click(function () {
    var v = document.getElementById("auto");
    v.style.display = "none";
    document.getElementById("vsi").checked = false;
    document.getElementById("vno").checked = false;
    var auto = document.getElementsByName("auto");
    auto.value = 0;
  });

});