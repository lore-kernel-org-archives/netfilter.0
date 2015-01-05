From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Transparent proxy requirement
Date: Mon, 05 Jan 2015 11:26:01 +0200
Message-ID: <54AA58A9.10502@ngtech.co.il>
References: <m768fd$cqt$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <m768fd$cqt$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "U.Mutlu" <for-gmane@mutluit.com>, netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hey,

For the example:
A client from ip 192.168.0.1 tries to access "serverpgm" which is
using an tcp based protocol... and has the IP 192.168.0.2.
Tproxy will not help you since the server needs to understand it and
since the proxypgm might be able to understand it.. still it cannot
pass the connection details to the serverpgm which talks plain TCP and
cannot be modified.

What do you need proxypgm to do? it depends on what you need to do...
Maybe there is some component in the linux kernel which can do what
you need.

Eliezer

On 12/21/2014 12:47 PM, U.Mutlu wrote:
> Hi everybody,
> 
> I've this scenario: internet <--> proxypgm <--> serverpgm
> 
> whith these requirements: 1) only ipv4 is used 2) protocol is tcp 
> 3) proxypgm and serverpgm are one the same host (linux with recent
> kernel) 4) serverpgm is reachable only thru the proxypgm 5)
> serverpgm needs to know the originating ip:port of the client 6)
> serverpgm cannot be modified (it does not know of TPROXY or 
> IP_TRANSPARENT socket option etc.) 7) proxypgm needs to be
> developed (in C/C++)
> 
> And now the question: Can TPROXY be used for this?
> 
> Are there other alternatives? What about doing this with raw
> sockets?
> 
> Thx

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUqlipAAoJENxnfXtQ8ZQUFxoH+wfQ4ItzmrMEnTIeStcKfO6Y
kh+RXEsT9ZgqgVsIl3d6l9rl4i1JgFyg3xNo0N6TT6elSBajtJkCSfxKA3g2/nRy
gR9lA+Ds8jqPnNrvQk8NZoRO/6iwfJSERHbXEJrFre5VWFMvsXCXpwjQXhpIZHqb
0gFSqzMUlSyNoSB30+Xi/sS8FQ09wDLmkp+PHeBkJ2tZQ/CCztjbjS9HZP9J3Ari
jhfUdeevniiPRsT8W561v1+O1yGI625ZpxTwV+It5Us07ekzq16GCCVQEIbPU+UL
tId5PGEh/BJcHVRBULUD1tYThZP7bQYT+0cS16l1rcyilaJEcWxe5i/9hHDr6n0=
=5RwJ
-----END PGP SIGNATURE-----
