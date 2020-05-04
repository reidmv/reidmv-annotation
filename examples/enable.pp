# Put this in site.pp to enable annotation
annotation::enable()

# Then, use the `annotation` metaparameter as needed on resources
notify { 'example':
  message    => 'this is a notify resource',
  annotation => 'this is an annotation for it',
}

# To annotate classes, either declare them resource-style, or use the
# annotation() function. Note that the two methods of annotating are exclusive.
class example {
  annotation('this is an annotation declared IN the example class')
}

class { 'example':
  annotation => 'this is an annotation on the example class',
}
