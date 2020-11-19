nextflow.preview.dsl=2

process foo {
    publishDir '.'

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
      path 'gse_no_header.txt'
    script:
      """
      gunzip -c $x | grep -v '^[#!]' > gse_no_header.txt
      """
}

workflow {
    foo()
    bar(foo.out.gse_matrix)
    bar.out.view()
}
