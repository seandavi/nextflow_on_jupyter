nextflow.preview.dsl=2

process foo {
    output:
      path 'foo.txt', emit: foo_out
      path 'wc.txt', emit: wc_out
    script:
      """
      ls $HOME > foo.txt
      wc /etc/passwd > wc.txt
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
    bar(foo.out.foo_out)
    bar.out.view()
}
