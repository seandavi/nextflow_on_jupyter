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
    // here we are running 
    // bar, which takes a path, 
    // on the path that foo() outputs
    
    bar(foo())
}
