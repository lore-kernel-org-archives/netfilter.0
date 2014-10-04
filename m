From: =?ISO-8859-15?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: Re: Basic routing
Date: Sat, 04 Oct 2014 15:56:50 +0200
Message-ID: <542FFCA2.3010208@bringe.com>
References: <m0nhf2$oqq$1@ger.gmane.org> <201410032134.59160.neal.p.murphy@alum.wpi.edu> <m0nncm$t77$1@ger.gmane.org> <542F9BEE.9070802@kickstone.com> <m0okc1$g5m$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m0okc1$g5m$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Smithee <for-gmane@mutluit.com>, netfilter@vger.kernel.org

Hi,

Am 04.10.2014 um 13:06 schrieb John Smithee:
> Ok, I admit using "ping -I" was a bad example. The whole point I trie=
d
> to make is, that the second net (69.0) cannot reach any other IP
> outside its own net.
> The goal is to let 69.0 reach the world via this gateway machine
> 68.22/69.22.
> Is some iptables needed in this case?

You do have IP forwarding enabled?

If not,  enable it using
  echo "1" > /proc/sys/net/ipv4/ip_forward
and try again.


HTH,
Thomas

--=20
BRINGE Informationstechnik GmbH
Zur Seeplatte 12
D-76228 Karlsruhe
Germany

=46on: +49 721 94246-0
=46on: +49 171 5438457
=46ax: +49 721 94246-66
Web: http://www.bringe.de/

Gesch=E4ftsf=FChrer: Dipl.-Ing. (FH) Martin Bringe
Ust.Id: DE812936645, HRB 108943 Mannheim


---
Diese E-Mail ist frei von Viren und Malware, denn der avast! Antivirus =
Schutz ist aktiv.
http://www.avast.com

