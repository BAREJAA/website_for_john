FROM dukegcb/openshift-shiny-verse:4.0.2
ADD ./_site /srv/code
RUN install2.r metathis distill learnr knitr here rlang ggrepel viridis gghighlight twitterwidget patchwork 
RUN Rscript -e 'devtools::install_github("matthewhirschey/bespokelearnr")' 'devtools::install_github("matthewhirschey/proteins")'

