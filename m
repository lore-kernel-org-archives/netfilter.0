From: Phil Oester <kernel@linuxace.com>
Subject: Re: nftables install error
Date: Tue, 5 Nov 2013 10:22:11 -0800
Message-ID: <20131105182210.GA4427@home>
References: <DUB116-W124BE6B6B01E0E32700AA42E3F10@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DUB116-W124BE6B6B01E0E32700AA42E3F10@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alex Chapman <ave_it_son1@hotmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, Nov 05, 2013 at 05:48:01PM +0000, Alex Chapman wrote:
> I have successfully installed nftables previously, but now running th=
rough the installation on a second machine I get the following error du=
ring nftables make:
>=20
> =A0 CC =A0 =A0 =A0 =A0 =A0 =A0src/scanner.c
> <stdout>: In function =E2nft_lex=E2:
> <stdout>:1738:23: error: comparison between signed and unsigned integ=
er expressions [-Werror=3Dsign-compare]
> <stdout>: In function =E2nft__scan_bytes=E2:
> <stdout>:3583:17: error: comparison between signed and unsigned integ=
er expressions [-Werror=3Dsign-compare]
> cc1: all warnings being treated as errors
> Makefile.rules:15: recipe for target 'src/scanner.o' failed
> make[1]: *** [src/scanner.o] Error 1
> Makefile.rules:88: recipe for target 'src' failed
> make: *** [src] Error 2
>=20
> These are using the latest Kernel, libnftables and nftables source.

See https://bugzilla.redhat.com/show_bug.cgi?id=3D993447.  Update your =
flex.

Phil
