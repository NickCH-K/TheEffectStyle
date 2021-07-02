# TheEffectStyle
Files and tips for modifying the **msmbstyle** Bookdown style to look like [The Effect](https://theeffectbook.net).

[bookdown](https://www.bookdown.org/) is an R package for formatting and publishing books. It's great!

You may intend your book to be in the Tufte style, as in [tufte-css](https://edwardtufte.github.io/tufte-css/) or [tufte-latex](https://www.ctan.org/pkg/tufte-latex?lang=en). Tufte-style books contain a number of stylistic decisions that imitate the formatting of Edward Tufte, perhaps the most prominent (and difficult to find a template for) being the sidenotes, margin notes, and `newthought` smallcaps minisection-starters. There are options for doing that in regular **bookdown** with its [Tufte-style outputs](https://bookdown.org/yihui/rmarkdown/bookdown-output.html).

[msmbstyle](https://github.com/grimbough/msmbstyle) is an R package that is, as far as I can tell, the only restyling option for **bookdown** output to a Tufte-style HTML book. It looks pretty nice! Certainly much more like you'd expect an HTML book to look.

I will point out that if your goal is an HTML book and you are ambivalent about the whole sidenote thing, I'd recommend not going for a Tufte-style book. You're going to have way more options, much better-supported options, and much less headache, using the standard **bookdown** styles, or something like [bs4_book](https://pkgs.rstudio.com/bookdown/reference/bs4_book.html).

The sidenotes were pretty important to me! But there were several aspects of **msmbstyle** I wanted to change. This repo contains files and examples that include:

- How to restart the sidenote numbering in each chapter (`renumber_sidenotes.html`).
- How to move the chapter selection dropdown menu to instead be an always-on sidebar that reverts to the dropdown when the window shrinks (`css.css`)
- How to do the tab-selection code chunks like in [this section](https://theeffectbook.net/ch-StatisticalAdjustment.html#coding-up-a-regression) (this one has nothing to do with **msmbstyle** or Tufte exactly)
- My example YAML from [The Effect](https://theeffectbook.net), which includes the options that extended the section numbering as well as some other things.

The latter two are both in `index.RMD`.

Ideally I will figure out how to add the search bar that you'd expect to find in an HTML book, and will add that here too.

## Disclaimers:

Maybe all this stuff will work for non-**msmbstyle** `tufte_html_book()` output from **bookdown**? I dunno. You can try!

I hope you find these materials helpful, and hope they solve whatever problem you have. I am not interested in helping you troubleshoot your particular book. Sorry! No time, I'm not really that much of a **bookdown**/**rmarkdown** expert anyway, and also troubleshooting someone else's **bookdown** is a real drag. I'd much rather help people troubleshoot their causal inference problems, which I already do plenty of. My dues are paid.

I have not tried **bookdown** for tufte-latex ([the published version of The Effect](https://www.routledge.com/The-Effect-An-Introduction-to-Research-Design-and-Causality/Huntington-Klein/p/book/9781032125787) was written directly in LaTeX, not **bookdown**). This repo has nothing to do with LaTeX output.
