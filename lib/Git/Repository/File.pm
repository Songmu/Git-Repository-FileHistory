package Git::Repository::File;
use strict;
use warnings;
our $VERSION = '0.01';

use Git::Repository::Log::Iterator;

sub new {
    my $kls = shift;
    my ($file) = grep { !ref $_ } @_;
    my $iter = Git::Repository::Log::Iterator->new(@_);
    my @logs;
    while ( my $log = $iter->next ){
        push @logs, $log;
    }
    die "$file has no logs!" unless @logs;
    bless {
        _file_name => $file,
        _logs      => \@logs,
    }, $kls;
}

sub name { shift->{_file_name}; }

sub created_at {
    shift->{_logs}[-1]->author_gmtime;
}

sub last_modified_at {
    shift->{_logs}[0]->author_gmtime;
}

sub created_by {
    shift->{_logs}[-1]->author_name;
}

sub last_modified_by {
    shift->{_logs}[0]->author_name;
}

sub logs {
    @{shift->{_logs}};
}

1;
__END__

=head1 NAME

Git::Repository::File -

=head1 SYNOPSIS

  use Git::Repository::File;

=head1 DESCRIPTION

Git::Repository::File is

=head1 AUTHOR

Masayuki Matsuki E<lt>y.songmu@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
