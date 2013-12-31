
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Skryf admin base plugin",
  "AUTHOR" => "Adam Stokes <adamjs\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-skryf-Plugin-Admin",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "App::skryf::Plugin::Admin",
  "PREREQ_PM" => {
    "DDP" => 0,
    "Mango::BSON" => 0,
    "Method::Signatures" => 0,
    "Mojo::Base" => 0
  },
  "TEST_REQUIRES" => {
    "FindBin" => 0,
    "Test::More" => 0,
    "lib" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.001_01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "DDP" => 0,
  "FindBin" => 0,
  "Mango::BSON" => 0,
  "Method::Signatures" => 0,
  "Mojo::Base" => 0,
  "Test::More" => 0,
  "lib" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



