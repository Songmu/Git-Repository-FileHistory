package Git::Repository::Plugin::File;
use strict;
use warnings;

use parent 'Git::Repository::Plugin';
sub _keywords { qw/file/ }

use Git::Repository::File;

our $VERSION = '0.01';

sub file {
    Git::Repository::File->new(@_);
}

1;
