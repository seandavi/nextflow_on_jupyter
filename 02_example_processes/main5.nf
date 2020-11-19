nextflow.preview.dsl=2

process foo {
    output:
      path 'foo.txt'
    script:
      """
      ls $HOME > foo.txt
      """
}

 process bar {
    input:
      path x
    output:
      path 'bar.txt'
    script:
      """
      wc $x > bar.txt
      """
}

workflow {
    foo()
    bar(foo.out)
    bar.out.view()
}
