$pdf_mode = 1;
$pdflatex = 'pdflatex --shell-escape';
$pdf_previewer = 'zathura -s -x "vim --servername SYNC --remote +%{line} %{input}" %O %S';
$clean_ext = "synctex.gz bbl pdf dvi";
$new_viewer_always [0];
