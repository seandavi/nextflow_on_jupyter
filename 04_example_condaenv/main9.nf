nextflow.preview.dsl=2

process foo {

    output:
      path '*.txt.gz', emit: gse_matrix
    script:
      """
      wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE2nnn/GSE2553/matrix/GSE2553_series_matrix.txt.gz 
      """
}

 process bar {
    publishDir '.'
 
    input:
      path x
    output:
      path 'bar.txt'
    script:
      """
      gunzip -c $x | wc -l > bar.txt
      """
}

workflow {
    foo()
    bar(foo.out.gse_matrix)
    bar.out.view()
}
