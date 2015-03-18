requires "Plack::Middleware" => "0";
requires "Plack::Util" => "0";
requires "parent" => "0";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "File::Spec" => "0";
  requires "HTTP::Request::Common" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Plack::Builder" => "0";
  requires "Plack::Test" => "0";
  requires "Test::More" => "0.88";
  requires "perl" => "5.006";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "version" => "0.9901";
};
