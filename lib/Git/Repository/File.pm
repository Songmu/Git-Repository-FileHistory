package Git::Repository::File;
use strict;
use warnings;
use 5.006;
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

sub use_datetime {
    my $self = shift;
    eval 'use DateTime';
    $self->{_inflate} = sub {
        DateTime->from_epoch( epoch => shift);
    };
    $self;
}

sub use_time_piece {
    my $self = shift;
    eval 'use Time::Piece';
    $self->{_inflate} = sub {
        Time::Piece::gmtime(shift);
    };
    $self;
}

sub created_at {
    my $self = shift;
    my $epoch = $self->{_logs}[-1]->author_gmtime;
    $self->{_inflate} ? $self->{_inflate}->($epoch) : $epoch;
}

sub last_modified_at {
    my $self = shift;
    my $epoch = $self->{_logs}[0]->author_gmtime;
    $self->{_inflate} ? $self->{_inflate}->($epoch) : $epoch;
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

Git::Repository::File - Class representing file on git repository

=head1 SYNOPSIS

  # load the File plugin
  use Git::Repository 'File';
  
  my $repo = Git::Repository->new;
  my $file = $repo->file('somefile');
  
  print $file->created_at;
  print $file->created_by;
  print $file->last_modified_at;
  print $file->last_modified_by;

=head1 DESCRIPTION

Git::Repository::File is class representing file on git repository.

=head1 CONSTRUCTOR

=head2 new( $file_name )

Create a new C<Git::Repository::File> instance, using the file name
on git repository as parameter.

=head2 ACCESORS

The following accessors methods are recognized.

=over 5

=item created_at

=item last_modified_at

Return epoch as default.
You can use $file->use_datetime or $file->use_time_piece feature for
returning object of DateTime or Time::Piece;

=item created_by

=item last_modified_by

=item logs

Return array of Git::Repository::Log objects

=item use_datetime

=item use_time_piece

=back

=head1 AUTHOR

Masayuki Matsuki E<lt>y.songmu@gmail.comE<gt>

=head1 SEE ALSO

L<Git::Repository>
L<Git::Repository::Log>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
