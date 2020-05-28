FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY . .

RUN Rscript -e "devtools::install('.', dependencies=TRUE, repos = BiocManager::repositories())"
RUN chown -R rstudio:rstudio .
