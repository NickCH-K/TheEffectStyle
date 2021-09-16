library(stringr)

# Get all the HTML files. Set bookfolder to whatever folder your chapter HTML files are in
bookfolder <- '_book'
# Title of book (to help locate)
booktitle <- 'The Effect: An Introduction to Research Design and Causality'


flist <- list.files(bookfolder, '.html', full.names = TRUE)

for (f in flist) {
  print(f)
  tx <- readLines(f)
  
  # Put the script before the last line (which should be </html>)
  lastline <- length(tx)
  
  tx[lastline:(lastline+11)] <-
  c('<script src="./myquery.js"></script><script src="./jquery.mark.min.js"></script>',
    '<script>',
    'const urlParams = new URLSearchParams(window.location.search);',
    'const search = urlParams.get(\'highlight\');',
    '$("div#jv-search").mark( search , {',
    '"accuracy": {',
    '"value": "exactly",',
    '"limiters": [",", "."]',
    '}',
    '});',
    '</script>',
    '</html>')
  
  # Add in searchbox
  introloc <- min(which(grepl(paste0(booktitle,'</a>'), tx)))
  tx[introloc] <- str_replace(tx[introloc],
                              paste0(booktitle,'</a>'),
                              paste0(booktitle,'</a>','<input type="text" id="search-box" placeholder="Search"><div id="result-box"></div>'))
  
  # Add in search locator
  doctypeloc <- min(which(grepl('DOCTYPE html PUBLIC', tx))) - 2
  # Should be this. Error otherwise
  if (!(tx[doctypeloc] == '<div class=\"row\">')) {
    stop(paste0('Can\'t find proper document start in ', f))
  }
  tx[doctypeloc] <- '<div class="row" id="jv-search">'
  
  writeLines(tx, f)
}
