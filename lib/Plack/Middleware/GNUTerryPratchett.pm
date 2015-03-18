package Plack::Middleware::GNUTerryPratchett;
# ABSTRACT: Keeping the legacy of Sir Terry Pratchett alive forever

use strict;
use warnings;

use Plack::Util;

use parent qw( Plack::Middleware );

our $clacks_header = 'X-Clacks-Overhead';
our $value         = 'GNU Terry Pratchett';
 
sub call {
    my $self = shift;

    my $res = $self->app->(@_);

    $self->response_cb(
        $res,
        sub {
            my $res = shift;
            Plack::Util::header_set($res->[1], $clacks_header => $value )
                unless Plack::Util::header_exists($res->[1], $clacks_header );
        });
}

1;

__END__

=head1 SYNOPSIS

    use Plack::Builder;
    
    my $app = builder {
        enable "Plack::Middleware::GNUTerryPratchett" ];
        sub {['200', ['Content-Type' => 'text/html'}, ['hello world']]};
    };

=head1 DESCRIPTION

This module adds a C<X-Clacks-Overhead> header to every response,
to celebrate and remember the legacy of Sir Terry Pratchett.

=head1 ORIGIN

(Taken from L<http://www.gnuterrypratchett.com>)

     "You know they'll never really die while the Trunk is alive[...]
    It lives while the code is shifted, and they live with it, always Going Home." 
            - Moist von Lipwig, Going Postal, Chapter 13 

In Terry Pratchett's Discworld series, the clacks are a series of semaphore towers loosely based on the concept of the telegraph. Invented by an artificer named Robert Dearheart, the towers could send messages "at the speed of light" using standardized codes. Three of these codes are of particular import:

    G: send the message on
    N: do not log the message
    U: turn the message around at the end of the line and send it back again

When Dearheart died, his name was inserted into the overhead of the clacks with a "GNU" in front of it to memorialize him forever (or for at least as long as the clacks are standing.)

    "A man is not dead while his name is still spoken." - Going Postal, Chapter 4 prologue 

Keeping the legacy of Sir Terry Pratchett alive forever.
For as long as his name is still passed along the Clacks, Death can't have him.

=head1 SEE ALSO

L<http://www.gnuterrypratchett.com>
