From: Alex Chapman <ave_it_son1@hotmail.com>
Subject: nftables install error
Date: Tue, 5 Nov 2013 17:48:01 +0000
Message-ID: <DUB116-W124BE6B6B01E0E32700AA42E3F10@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

I have successfully installed nftables previously, but now running thro=
ugh the installation on a second machine I get the following error duri=
ng nftables make:

=A0 CC =A0 =A0 =A0 =A0 =A0 =A0src/scanner.c
<stdout>: In function =E2nft_lex=E2:
<stdout>:1738:23: error: comparison between signed and unsigned integer=
 expressions [-Werror=3Dsign-compare]
<stdout>: In function =E2nft__scan_bytes=E2:
<stdout>:3583:17: error: comparison between signed and unsigned integer=
 expressions [-Werror=3Dsign-compare]
cc1: all warnings being treated as errors
Makefile.rules:15: recipe for target 'src/scanner.o' failed
make[1]: *** [src/scanner.o] Error 1
Makefile.rules:88: recipe for target 'src' failed
make: *** [src] Error 2

These are using the latest Kernel, libnftables and nftables source.

Any ideas?

Thanks! 		 	   		  