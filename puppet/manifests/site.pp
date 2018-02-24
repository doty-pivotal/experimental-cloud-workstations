node 'data.pivotal.vm' {
  file {'/tmp/helloworld.txt':
    ensure  => present,
    content => "Hello World!",
  }

  package { 'vim-enhanced':
    ensure => 'installed',
  }

  #-- IaaS Paving is out of scope, see ci-infrastructure repo
  ### - if needed we can pull context from the infrastructure

  #-- Give me a secure connection is out of scope initially
  ### Will need some context from the IaaS paving step.
  ### Where it should live is not yet clear

  #-- What a Pivot expects:
  class { 'conventions::pivotal': }


  #-- What a member of team <name> expects:
  class { 'conventions::team': }

  #-- What the individual expects:
  # conventions::individual { 'pivot_1':
  #   pivot_name => 'jdoty'
  # }

}
