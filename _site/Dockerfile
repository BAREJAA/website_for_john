FROM dukegcb/openshift-shiny-verse:4.0.2
ADD ./_site /srv/code
ADD ./_site/flashcard /srv/code/flashcard
RUN install2.r metathis distill learnr knitr here rlang ggrepel viridis gghighlight twitterwidget patchwork mixOmics glue devtools ggforce readxl lubridate xaringan xaringanthemer kableExtra janitor showtext DT fontawesome rolldown shinyjs
RUN apt-get update
RUN apt-get install build-essential libglpk-dev -y
RUN Rscript -e 'BiocManager::install("mixOmics")'
RUN Rscript -e 'devtools::install_github("matthewhirschey/proteins")'
RUN Rscript -e 'devtools::install_github("matthewhirschey/tidybiology")'
RUN Rscript -e 'devtools::install_github("gadenbuie/xaringanExtra")'
RUN Rscript -e 'devtools::install_github("rstudio/gradethis")'
