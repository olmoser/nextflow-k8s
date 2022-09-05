#!/usr/bin/env nextflow

cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'

process sayHello {
  cpus 1	
  echo true
  input: 
    val x from cheers
  script:
    """
    echo '$x world!'
    """
}
