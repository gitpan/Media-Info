package Media::Info;

use 5.010001;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       get_media_info
               );

our $VERSION = '0.01'; # VERSION

our %SPEC;

$SPEC{get_media_info} = {
    v => 1.1,
    summary => 'Return information on media file/URL',
    args => {
        media => {
            summary => 'Media file/URL',
            schema  => 'str*',
            pos     => 0,
            req     => 1,
        },
    },
};
sub get_media_info {
    require Media::Info::Mplayer;

    Media::Info::Mplayer::get_media_info(@_);
}

1;
# ABSTRACT: Common interface for Media::Info::*

__END__

=pod

=encoding utf-8

=head1 NAME

Media::Info - Common interface for Media::Info::*

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 use Media::Info qw(get_media_info);
 my $res = get_media_info(media => '/path/to/celine.mp4');

=head1 DESCRIPTION

This module provides a common interface for Media::Info::* modules, which you
can use to get information about a media file (like video, music, etc) using
specific backends. Currently the only backend available is
L<Media::Info::Mplayer>, so this module uses that.

=head1 SEE ALSO

L<Video::Info> - This module is first written because I couldn't install
Video::Info. That module doesn't seem maintained (last release is in 2003 at the
time of this writing), plus I want a per-backend namespace organization instead
of per-format one, and a simple functional interface instead of OO interface.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 FUNCTIONS


None are exported by default, but they are exportable.

=head2 get_media_info(%args) -> [status, msg, result, meta]

Arguments ('*' denotes required arguments):

=over 4

=item * B<media>* => I<str>

Media file/URL.

=back

Return value:

Returns an enveloped result (an array). First element (status) is an integer containing HTTP status code (200 means OK, 4xx caller error, 5xx function error). Second element (msg) is a string containing error message, or 'OK' if status is 200. Third element (result) is optional, the actual result. Fourth element (meta) is called result metadata and is optional, a hash that contains extra information.

=cut
