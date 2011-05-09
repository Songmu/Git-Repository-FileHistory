use inc::Module::Install;
name 'Git-Repository-File';
all_from 'lib/Git/Repository/File.pm';

requires 'Git::Repository';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
