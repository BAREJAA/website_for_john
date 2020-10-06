FROM dukegcb/openshift-shiny-verse:4.0.2
ADD ./_site /srv/code
RUN install2.r metathis distill learnr here ggrepel viridis gghighlight twitterwidget patchwork
RUN Rscript -e 'devtools::install_github("matthewhirschey/bespokelearnr")'
