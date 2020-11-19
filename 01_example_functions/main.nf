nextflow.preview.dsl=2


/* foo takes no arguments 
   and returns a Hello World */

def foo() {
    'Hello world'
}



// bar takes two "things" 
// and returns their sum.

def bar(alpha, omega) {
    alpha + omega
}
