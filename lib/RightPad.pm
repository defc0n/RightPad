package RightPad;

use strict;
use warnings;

use LeftPad;
use Exporter;

use base 'Exporter';
our @EXPORT = qw/rightpad/;

our $VERSION = '0.001';

sub rightpad {

    my ( $string, $min_length, $pad_char ) = @_;

    # default to space character if no pad character given
    $pad_char = " " if !defined $pad_char;

    my $lp_string = leftpad( $string, $min_length, $pad_char );

    my $num_lp = _num_padded( $lp_string, $pad_char );
    my $num_orig = _num_padded( $string, $pad_char );
    my $diff = $num_lp - $num_orig;

    return $string . ( $pad_char x $diff );
}

sub _num_padded {

    my ( $string, $pad_char ) = @_;

    my @chars = split( //, $string );

    my $num = 0;

    foreach my $char ( @chars ) {

        last if ( $char ne $pad_char );

        $num++;
    }

    return $num;
}

1;
