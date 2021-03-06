$(document).ready(function () {
  var iduser = document.getElementById("iduser");
  let id = iduser.value;
  let $carh = document.querySelector('#carh');

  $.ajax({
    url: "../db/buscarh.php",
    type: "POST",
    success: function (res) {
      const carh = JSON.parse(res)
      let template = '<option class="from-control" selected disabled></option>'
      carh.forEach(carh => {
        template += `<option value="${carh.idcar}">${carh.carrera}</option>`
      })
      $carh.innerHTML = template;
    }
  });

  $.post("../db/mostrar_reg.php", { id }, function (response) {
    if (response) {
      $("#completar").remove();
      const datos = JSON.parse(response);
      $("#usuario").val(datos.usuario);
      $("#apellido").val(datos.apellido);
      $("#email").val(datos.correo);
      $("#dni").val(datos.dni);
      $("#fechanacimiento").val(datos.fechanacimiento);
      $("#contacto").val(datos.contacto);
      $("#localidad").val(datos.localidad);
      $("#departamento").val(datos.departamento);
      $("#provincia").val(datos.provincia);
      $("#idpais").val(datos.idpais);
      $("#codpostal").val(datos.codpostal);
      $("#domicilio").val(datos.domicilio);
      $("#discapacidades").val(datos.discapacidades);
      $("#habilidades").val(datos.habilidades);
      $("#cursos").val(datos.cursos);
      $("#progs").val(datos.progs);
      $("#puestodeseado").val(datos.puestodeseado);
      $("#area").val(datos.area);
      $("#salariomin").val(datos.salariomin);
      $("#discapacidades").val(datos.discapacidades);

      //console.log(datos.foto);
      if (datos.foto == null || datos.foto == "") {
        $("#fotomostrar").attr("src", "../db/images/default.png");
      } else {
        $("#fotomostrar").attr("src", "../db/images/" + datos.foto);
      }

      if (datos.genero == $("#g1").val()) {
        $("#g1").prop("checked", true);
      } else if (datos.genero == $("#g2").val()) {
        $("#g2").prop("checked", true);
      } else if (datos.genero == $("#g3").val()) {
        $("#g3").prop("checked", true);
      } else if (datos.genero == $("#g4").val()) {
        $("#g4").prop("checked", true);
      }

      switch (datos.ecivil) {
        case "1":
          $("#e1").prop("selected", true);
          break;
        case "2":
          $("#e2").prop("selected", true);
          break;
      }

      switch (datos.licencia) {
        case "1":
          $("#licsi").prop("checked", true);
          $('.auto').prop('disabled', false);
          break;
        case "2":
          $("#licno").prop("checked", true);
          $('.auto').prop('disabled', true);
          break;
      }

      switch (datos.auto) {
        case "1":
          $("#vsi").prop("checked", true);
          break;
        case "2":
          $("#vno").prop("checked", true);
          break;
      }

      switch (datos.situacionlab) {
        case "":
          $("#s1").prop("selected", true);
          break;
        case "1":
          $("#s2").prop("selected", true);
          break;
        case "2":
          $("#s3").prop("selected", true);
          break;
      }
      //console.log(datos.modalidad);
      switch (datos.modalidad) {
        case "0":
          $("#m0").prop("selected", true);
          break;
        case "1":
          $("#m1").prop("selected", true);
          break;
        case "2":
          $("#m2").prop("selected", true);
          break;
        case "3":
          $("#m3").prop("selected", true);
          break;
        case "4":
          $("#m4").prop("selected", true);
          break;
        case "5":
          $("#m5").prop("selected", true);
          break;
        case "6":
          $("#m6").prop("selected", true);
          break;
      }

      switch (datos.dispoviajar) {
        case "2":
          $("#dvsi").prop("checked", true);
          break;
        case "1":
          $("#dvno").prop("checked", true);
          break;
      }

      switch (datos.dispomuda) {
        case "2":
          $("#dcsi").prop("checked", true);
          break;
        case "1":
          $("#dcno").prop("checked", true);
          break;
      }

      edit = true;
    } else {
      $("#completar").html(
        "Por favor, tomese unos minutos para completar el formulario. Muchas gracias."
      );
      $("#completar").addClass("comp");
      $("#fotomostrar").attr("src", "../db/images/default.png");
    }
  });

  $.post("../db/mostrar_carrera.php", { id }, function (response) {
    if (response) {
      const datos = JSON.parse(response);
      $("#carh").val(datos.idcar);
    }
    edit = true;
  });
});
