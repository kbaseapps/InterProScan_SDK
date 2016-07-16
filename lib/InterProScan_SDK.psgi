use InterProScan_SDK::InterProScan_SDKImpl;

use InterProScan_SDK::InterProScan_SDKServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = InterProScan_SDK::InterProScan_SDKImpl->new;
    push(@dispatch, 'InterProScan_SDK' => $obj);
}


my $server = InterProScan_SDK::InterProScan_SDKServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
