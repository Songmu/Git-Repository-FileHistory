requires 'Git::Repository';
requires 'parent';
requires 'perl', '5.006';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.59';
};
