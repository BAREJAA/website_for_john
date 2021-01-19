FROM dukegcb/openshift-shiny-verse:4.0.2
ADD ./_site /srv/code
RUN install2.r metathis distill learnr knitr here rlang ggrepel viridis gghighlight twitterwidget patchwork mixOmics glue devtools ggforce readxl lubridate
RUN apt-get update
RUN apt-get install build-essential libglpk-dev -y
RUN Rscript -e 'BiocManager::install("mixOmics")'
RUN Rscript -e 'devtools::install_github("matthewhirschey/proteins")'
RUN Rscript -e 'devtools::install_github("matthewhirschey/tidybiology")'
