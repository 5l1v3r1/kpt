## cat

Set an annotation on one or more Resources

![alt text][tutorial]

    kpt tutorial cfg annotate

[tutorial-script]

### Synopsis

  DIR:
    Path to local directory.

### Examples

    # set an annotation on all Resources: 'key: value'
    kpt cfg annotate DIR --kv key=value

    # set an annotation on all Service Resources
    kpt cfg annotate DIR --kv key=value --kind Service

    # set an annotation on the foo Service Resource only
    kpt cfg annotate DIR --kv key=value --kind Service --name foo

    # set multiple annotations
    kpt cfg annotate DIR --kv key1=value1 --kv key2=value2

### 

[tutorial]: https://storage.googleapis.com/kpt-dev/docs/cfg-annotate.gif "kpt cfg annotate"
[tutorial-script]: ../../gifs/cfg-annotate.sh
