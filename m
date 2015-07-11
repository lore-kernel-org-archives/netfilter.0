From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Network slowing down by masquerade
Date: Sat, 11 Jul 2015 23:05:06 +0200
Message-ID: <55A18502.6090201@plouf.fr.eu.org>
References: <C20C16F2-3345-4B9F-835B-7C35207A3A88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C20C16F2-3345-4B9F-835B-7C35207A3A88@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Glen Huang <hey.hgl@gmail.com>
Cc: netfilter@vger.kernel.org

Glen Huang a =E9crit :
> I have a pptp client connection (ppp1) on a gateway. If I directly
> using curl --interface ppp1 to download a file, I get full download
> speed very quickly (2m/s).

Why do you have to use --interface ?

> But if I route my lan host to ppp1 and -o ppp1 -j MASQUERADE, running
> curl to download the same file on the host starts very slow (less tha=
n
> 100k/s), then the speed *slowly* increases(about 50k per second), unt=
il
> it reach about 1.8m/s. While downloading the file on the host, the
> gateway's cpu usage never reach 1 from the output of top.
>=20
> If I directly establish the pptp client connection on host, I quickly
> get full speed again.
>=20
> I wonder what might slow down the network when the packets are
> forwarded. I'm currently guess it's the masquerade target, but I'm no=
t sure.

I don't think MASQUERADE is the culprit. I would suspect first MTU
issues (fragmentation, path MTU discovery).

> How do I test it?

Lower the MTU of the client host LAN interface below ~1460.
