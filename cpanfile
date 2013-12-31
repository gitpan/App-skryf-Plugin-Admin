requires "DDP" => "0";
requires "Mango::BSON" => "0";
requires "Method::Signatures" => "0";
requires "Mojo::Base" => "0";

on 'test' => sub {
  requires "FindBin" => "0";
  requires "Test::More" => "0";
  requires "lib" => "0";
  requires "strict" => "0";
  requires "warnings" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
};
