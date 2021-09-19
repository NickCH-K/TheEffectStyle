# TheEffectStyle
Files and tips for modifying the **msmbstyle** Bookdown style to look like [The Effect](https://theeffectbook.net).

[bookdown](https://www.bookdown.org/) is an R package for formatting and publishing books. It's great!

You may intend your book to be in the Tufte style, as in [tufte-css](https://edwardtufte.github.io/tufte-css/) or [tufte-latex](https://www.ctan.org/pkg/tufte-latex?lang=en). Tufte-style books contain a number of stylistic decisions that imitate the formatting of Edward Tufte, perhaps the most prominent (and difficult to find a template for) being the sidenotes, margin notes, and `newthought` smallcaps minisection-starters. There are options for doing that in regular **bookdown** with its [Tufte-style outputs](https://bookdown.org/yihui/rmarkdown/bookdown-output.html).

[msmbstyle](https://github.com/grimbough/msmbstyle) is an R package that is, as far as I can tell, the only restyling option for **bookdown** output to a Tufte-style HTML book. It looks good! Certainly much more like you'd expect an HTML book to look than the standard `tufte_html_book()` output.

I will point out that if your goal is an HTML book and you are ambivalent about the whole sidenote thing, I'd recommend not going for a Tufte-style book. You're going to have way more options, with bigger support teams behind them, using the standard **bookdown** styles, like [bs4_book](https://pkgs.rstudio.com/bookdown/reference/bs4_book.html).

The sidenotes were pretty important to me! But there were several aspects of **msmbstyle** I wanted to change. This repo contains files and examples that include:

- How to restart the sidenote numbering in each chapter (`renumber_sidenotes.html`).
- How to move the chapter selection dropdown menu to instead be an always-on sidebar that reverts to the dropdown when the window shrinks, and some other minor fixes (`css.css`)
- How to add a search bar (see below)
- How to do the tab-selection code chunks like in [this section](https://theeffectbook.net/ch-StatisticalAdjustment.html#coding-up-a-regression) (this one has nothing to do with **msmbstyle** or Tufte exactly)
- My example YAML from [The Effect](https://theeffectbook.net), which includes the options that extended the section numbering as well as some other things.

The latter two are both in `index.RMD`. The code for sidenote renumbering and the search bar (except for `add_searchbar.R`) were written by [Atin Gupta](https://www.upwork.com/freelancers/~01b346e20aea8ac5f3) who does very good work and who you should patronize if you need any coding done.

## How to Add a Search Bar

- Add the `jquery.mark.min.js` and `myscript.php` files to the same folder as all the `html` output documents for your book.
- Modify line 10 of `myquery.js` to point to the URL of your book rather than to [theeffectbook.net](theeffectbook.net), and then put that in the same folder with all your `html` output documents
- Modify lines 6 and (possibly, if you've changed the default **bookdown** settings) 4 of `add_searchbar.R` to reflect the folder name in which your `html` output documents are, and the full title of your book.
- Each time you render your book, run `add_searchbar.R` afterwards to add the search bar code in the appropriate locations in your `html` output files

The search bar will only work on a live server. The bar will show up but search won't function properly if it's running on your local machine.

If you happen to know how to modify this code so it will jump to the section or first text presence on a page rather than just the chapter, please do and let me know!

## Disclaimers:

Maybe all this stuff will work for non-**msmbstyle** `tufte_html_book()` output from **bookdown**? I dunno. You can try!

I hope you find these materials helpful, and hope they solve whatever problem you have. I am not interested in helping you troubleshoot your particular book. Sorry! No time, I'm not really that much of a **bookdown**/**rmarkdown** expert anyway, and also troubleshooting someone else's **bookdown** is a real drag. I'd much rather help people troubleshoot their causal inference problems, which I already do plenty of. My dues are paid.

I have not tried **bookdown** for tufte-latex ([the published version of The Effect](https://www.routledge.com/The-Effect-An-Introduction-to-Research-Design-and-Causality/Huntington-Klein/p/book/9781032125787) was written directly in LaTeX, not **bookdown**). This repo has nothing to do with LaTeX output.
