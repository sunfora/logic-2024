<?
require_once "need_rebuild.php";

session_start();
?>
<!DOCTYPE html>

<?
$current_file = basename(trim(`cat watch`));
$name = pathinfo($current_file, PATHINFO_FILENAME);
?>

<style>
  .log {
    background-color: red;
    position: fixed;
    right: 0;
    top: 0;
    z-index: 100;
    min-width: 200px;
    width: 500px;
    pre {
      white-space: pre-wrap; 
    }
    min-height: 50px;
    transition: 1s;
    display: flex;
    align-items: center;
    padding: 0 1em;
    pre {
      margin: 0;
    }
  }

  .log.closed {
    font-size: 0;
    min-width: 50px;
    min-height: 50px;
  }
</style>

<script>
function check() {
  const resource = "/need_rebuild.php?";

  const params = new URLSearchParams({
    file: "<?=$current_file?>"
  }).toString();

  fetch(resource + params).then((response) => {
    if (!response.ok) {
      throw new Error("http error");
    }
    return response.text();
  }).then((text) => {
    if (text == "true") {
      window.location.reload();
    }
  });
}

window.addEventListener('DOMContentLoaded', function() {
  setInterval(check, 500);
  const log = document.querySelector(".log");
  log.addEventListener(
    "dblclick",
    (e) => {
      const lst = log.classList;
      lst.toggle("closed");
      localStorage.setItem("closed", lst.contains("closed")? "1" : "");
    }
  );
  if (localStorage.getItem("closed")) {
    log.classList.add("closed");
  } else {
    log.classList.remove("closed");
  }
});

</script>
<?
if (needs_rebuild($current_file)) {
  $_SESSION[$current_file] = filemtime("../$current_file");
  $_SESSION[$current_file . "log"] = htmlspecialchars(`scribble ../$current_file 2>&1`);
}
$log = $_SESSION[$current_file . "log"];
echo "<div class='log closed'><pre>$log</pre></div>";

include("$name.html");
