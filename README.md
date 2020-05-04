# annotation

## Description

This module adds an extra Puppet metaparameter for the purpose of recording high-level or human-readable annotations about what classes or resources are for. This information can be used to automatically generate human-readable reports either of what work Puppet has performed on a system or of all the content Puppet is managing on a system, and why.

## Usage

Put this in site.pp to enable annotation

```puppet
annotation::enable()
```

Use the `annotation` metaparameter as needed on resources

```puppet
notify { 'example':
  message    => 'this is a notify resource',
  annotation => 'this is an annotation for it',
}
```

To annotate classes, either declare them resource-style, or use the `annotation()` function. Note that the two methods of annotating are exclusive.

```puppet
class example {
  annotation('this is an annotation declared IN the example class')
}
```

```puppet
class { 'example':
  annotation => 'this is an annotation on the example class',
}
```

## Querying

To query for all annotated resources on a node, use a PuppetDB PQL query such as the following.

```
resources { certname = "example.node.tld" and parameters.annotation is not null }
```
