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


/* Here, we add a println call
   that serves to show us the output,
   but most importantly, actually
   calls the functions. Functions that
   are not called are not executed. */

println("The foo function:")
println(foo())

println("The bar(2,2) result:")
println(bar(2,2))

println("The bar('Hello',' world') result:")
println(bar('Hello', ' world'))