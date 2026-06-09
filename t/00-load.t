use strict;
use warnings;
use Test::More;
use_ok('Samizdat::Model::PayPal');
use_ok('Samizdat::Controller::PayPal');
use_ok('Samizdat::Plugin::PayPal');
use YAML::XS qw(LoadFile);
use File::Spec;
my ($d) = grep { -d } map { File::Spec->catdir($_, 'Samizdat','resources') } @INC;
ok($d, 'resources dir is on @INC');
my $schema = eval { LoadFile(File::Spec->catfile($d,'settings','paypal','schema.yml')) };
ok(ref $schema eq 'HASH', 'paypal settings schema loads')
  and is($schema->{'x-samizdat-audience'}, 'operator', 'audience is operator');
ok(-d File::Spec->catdir($d,'templates','paypal'), 'paypal templates ship');
ok(scalar(glob(File::Spec->catfile($d,'migrations','pg','*-paypal.sql'))), 'paypal pg migration ships');
done_testing;
