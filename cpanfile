requires 'Git::Repository';
requires 'Git::Repository::Plugin::Log';
requires 'parent';
requires 'perl', '5.006';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.59';
};
