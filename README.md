# NAME

Git::Repository::FileHistory - Class representing file on git repository

# SYNOPSIS

    # load the File plugin
    use Git::Repository 'File';
    

    my $repo = Git::Repository->new;
    my $file = $repo->file('somefile');
    

    print $file->created_at;
    print $file->created_by;
    print $file->last_modified_at;
    print $file->last_modified_by;

# DESCRIPTION

Git::Repository::FileHistory is class representing file on git repository.

# CONSTRUCTOR

## new( $file\_name )

Create a new `Git::Repository::FileHistory` instance, using the file name
on git repository as parameter.

## ACCESORS

The following accessors methods are recognized.

- created\_at
- last\_modified\_at

    Return epoch as default.
    You can use $file->use\_datetime or $file->use\_time\_piece feature for
    returning object of DateTime or Time::Piece;

- created\_by
- last\_modified\_by
- logs

    Return array of Git::Repository::Log objects

- use\_datetime
- use\_time\_piece

# AUTHOR

Masayuki Matsuki <y.songmu@gmail.com>

# SEE ALSO

[Git::Repository](http://search.cpan.org/perldoc?Git::Repository)
[Git::Repository::Log](http://search.cpan.org/perldoc?Git::Repository::Log)

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
