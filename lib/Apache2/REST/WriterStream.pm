package Apache2::REST::WriterStream;
use strict;
use warnings;
use Carp;

=head2 new

You can override this if you like but remember
it has to build an object without arguments.

=cut

sub new{
    my ( $class ) = @_;
    return bless {} , $class;
}


=head2 mimeType

Returns the mime type this writer will output.

It is called like this by the framework:

   $this->mimeType($resp) ;

So you can adapt the mime type according to the response to be given.

=cut

sub mimeType{
    my ( $self , $resp )=@_;
    confess("Please implement me in an application subclass");
}

=head2 getPreambleBytes

Returns the bytes the framework has to write back to client as a Stream preamble.

It is called by the framework like this ($resp is a Apache2::REST::Response):

    $this->getPreambleBytes($resp) ;

=cut

sub getPreambleBytes{
    my ($self,  $resp ) = @_ ;
    confess("Please implement me in an application subclass");
}


=head2 getNextBytes

Returns the next bytes of the stream, or undef at the end of the stream.

Called by the framework like that:

while( defined my $bytes = $this->getNextBytes($response) ){
  ...
}

=cut

sub getNextBytes{
    my ($self, $resp) = @_;
    confess("Please implement me in an application subclass");
}

=head2 getPostambleBytes

Returns the last bytes to write in the stream when the stream is finished.

Called by the framework like that:

$this->getPostambleBytes($response);

=cut

sub getPostambleBytes{
    my ($self, $resp) = @_;
    confess("Please implement me in an application subclass");
}

1;