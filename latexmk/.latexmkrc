$pdf_mode = 1;
$pdflatex = 'pdflatex --shell-escape';
$pdf_previewer = 'zathura -s -x "vim --servername SYNC --remote +%{line} %{input}" %O %S';
$out_dir = 'build';
$clean_ext = "synctex.gz synctex.gz(busy) bbl dvi nav run run.xml snm";
$new_viewer_always [0];
