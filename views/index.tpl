<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>{{.title}}</title>
    <link rel="stylesheet" href={{.css}}>
  </head>
  <body>
  <div class="main-container mt-1">
    <div class="row">
      <div class="col">
        <label class="form-label" style="font-size: 180%; opacity: 0.6;">Order</label><br>
        <select id="order" class="form-select select-style">
          <option style="width: 100%" value="Random" selected>Random</option>
          <option style="width: 100%" value="Desc">Desc</option>
          <option style="width: 100%" value="Asc">Asc</option>
        </select>
        <hr class="hr-style">
      </div>
      <div class="col">
        <label class="form-label" style="font-size: 180%; opacity: 0.6;">Type</label><br>
        <select id="type" class="form-select select-style">
          <option style="width: 100%" value="All" selected>All</option>
          <option style="width: 100%" value="Static">Static</option>
          <option style="width: 100%" value="Animated">Animated</option>
        </select>
        <hr class="hr-style">
      </div>
    </div>
    <div class="row">
      <div class="col">
        <label class="form-label" style="font-size: 180%; opacity: 0.6;">Category</label><br>
        <select id="category" class="form-select select-style">
          <option style="width: 100%" value="None" selected>None</option>
          {{range $key, $val := .category}}
          <option style="width: 100%" value="{{$val.CategoryID}}">{{$val.CategoryName}}</option>
          {{end}}
        </select>
        <hr class="hr-style">
      </div>
      <div class="col">
        <label class="form-label" style="font-size: 180%; opacity: 0.6;">Breed</label><br>
        <select id="breed" class="form-select select-style">
          <option style="width: 100%" value="None" selected>None</option>
          {{range $key, $val := .breed}}
          <option style="width: 100%" value={{$val.BreedID}}>{{$val.BreedName}}</option>
          {{end}}
        </select>
        <hr class="hr-style">
      </div>
    </div>
    <div class="row">
      <div class="col">
        <div id="image-container" class="row">
          {{range $key, $val := .images}}
            <div class="col-md-4 image-box mb-1">
              <img src="{{$val.URL}}"></img>
            </div>
          {{end}}
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-8">
        <label class="form-label" style="font-size: 180%; opacity: 0.6;">Per Page</label>
        <select id="per-page" class="form-select select-style" style="width: 10%; font-size: 160%; font-weight: bold;">
          <option value="9" selected>9</option>
          <option value="18">18</option>
          <option value="80">80</option>
        </select>
      </div>

      <div class="col-4">
        <button style="width:100%; font-size: 130%;" type="button" class="btn btn-info rounded">More +</button>
      </div>
    </div>
  </div>
  <script>
    $(document).on('change', 'select', function() {
      let order = $('#order').val();
      let type = $('#type').val();
      let category = $('#category').val();
      let breed = $('#breed').val();
      let per_page = $('#per-page').val();
      $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/internalprocess',
        data: {
          "order": order,
          "type": type,
          "category": category,
          "breed": breed,
          "per_page": per_page
        },
        success: function(response) {
          let data = response;
          let html_data = "";
          $.each(data, function (key, value) {
            html_data += '<div class="col-md-4 image-box mb-1">',
            html_data += '<img src="' + value.url + '"></img>',
            html_data += '</div>'
          })
          $("#image-container").html(html_data);
        },
        error: function(error) {
          console.log(error)
        }
      })
    });

    $(document).ready(function(){
      $("button").click(function(){
        let order = $('#order').val();
        let type = $('#type').val();
        let category = $('#category').val();
        let breed = $('#breed').val();
        let per_page = $('#per-page').val();

        $.ajax({
          type: 'GET',
          url: 'http://localhost:8080/internalprocess',
          data: {
            "order": order,
            "type": type,
            "category": category,
            "breed": breed,
            "per_page": per_page
          },
          success: function(response) {
            let data = response;
            let html_data = "";
            $.each(data, function (key, value) {
              html_data += '<div class="col-md-4 image-box mb-1">',
              html_data += '<img src="' + value.url + '"></img>',
              html_data += '</div>'
            })
            $("#image-container").html(html_data);
          },
          error: function(error) {
            console.log(error)
          }
        })
      });
    });

  </script>
  </body>
</html>