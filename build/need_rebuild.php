<?
function needs_rebuild($current_file) {
  if (!file_exists("$current_file")) {
    return null;
  }

  $last_modified = filemtime($current_file);

  if (empty($_SESSION[$current_file])) {
    return true;
  }
  return $_SESSION[$current_file] !== $last_modified;
}

if(get_included_files()[0] == __FILE__ ) {
  session_start();

  $res = needs_rebuild($_GET["file"]);
  if ($res === null) {
    echo "no such file";
  } else if ($res === false) {
    echo "false";
  } else {
    echo "true";
  }
}
