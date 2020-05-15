# metadata

## Description

This module adds an extra Puppet metaparameter for the purpose of recording high-level or human-readable metadata about what classes or resources are for. This information can be used to automatically generate human-readable reports either of what work Puppet has performed on a system or of all the content Puppet is managing on a system, and why.

## Usage

Put this in site.pp to enable metadata

```puppet
metadata::enable()
```

Use the `metadata` metaparameter as needed on resources

```puppet
notify { 'example':
  message  => 'this is a notify resource',
  metadata => 'this is metadata about it',
}

file { '/tmp/example.conf':
  ensure     => file,
  owner      => 'root',
  metadata => {
    'description' => 'Metadata does not need to be a string',
    'product'     => 'Example Product',
    'owner'       => 'Kelly',
  },
}
```

To set metadata for classes, either declare them resource-style, or use the `metadata()` function. Note that the two methods of annotating are mutually exclusive.

```puppet
class example {
  metadata('This is an metadata declared IN the example class')
}
```

Metadata set in a resource-style class parameter declaration will override the metadata set using `metadata()` inside the class.

```puppet
class { 'example':
  metadata => 'This metadata will override the other one',
}
```

## Querying

Metadata is a resource parameter, and all normal query operators for parameters apply. To query for all resources with metadata on a node, use a PuppetDB PQL query such as the following.

```
resources { certname = "example.node.tld" and parameters.metadata is not null }
```
