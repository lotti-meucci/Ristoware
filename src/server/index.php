<?php

require './components/navbar.php';

?>

<!DOCTYPE html>
<html lang="it" data-bs-theme="dark">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ristoware - Accesso</title>
    <link rel="stylesheet" href="./css/index.css">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <?php navbar_component() ?>
    <main class="p-4">

      <div class="container">
        <div class="card">
          <form class="card-body">
            <select class="form-select mb-3" required>
              <option value="" selected hidden>Open this select menu</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
            <div class="input-group mb-1">
              <span class="input-group-text">Password</span>
              <input type="password" class="form-control" placeholder="...">
            </div>
          </form>
        </div>
      </div>

    </main>
  </body>
</html>
