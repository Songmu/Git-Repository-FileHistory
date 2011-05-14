package Git::Repository::Plugin::File;

use warnings;
use strict;
use 5.006;
our $VERSION = '0.01';

use Git::Repository::Plugin;
our @ISA = qw/Git::Repository::Plugin/;
sub _keywords { qw/file/ }

use Git::Repository::File;

our $VERSION = '0.01';

sub file {
    shift if !ref $_[0];
    Git::Repository::File->new(@_);
}

1;
