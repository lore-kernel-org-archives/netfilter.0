From: Italo Valcy <italo@dcc.ufba.br>
Subject: Re: How to use DNAT
Date: Thu, 17 Feb 2011 16:17:46 -0300
Message-ID: <4D5D745A.1030405@dcc.ufba.br>
References: <4D5D6D2C.7010109@dcc.ufba.br> <alpine.LNX.2.01.1102172000340.30243@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1102172000340.30243@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Jan,

Em 17-02-2011 16:03, Jan Engelhardt escreveu:

> eth0:0 is not an interface. That is ifconfig misleading you. Avoid th=
is=20
> old and unmaintained tool.

Thank you so much for your quickly reply and tip. I change the
configuration according to your tip and I use "ip addr add" to add a
secondary ip address (the target IP for DNAT), but unfortunately that
does not help: the packets are still going to INPUT chain, even with th=
e
DNAT rule changing the DESTINATION of the packet.


Kind Regards, Italo.


- --=20
Sauda=E7=F5es,

Italo Valcy :: http://wiki.dcc.ufba.br/~ItaloValcy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk1ddFoACgkQfidLqjN6RNGBWgCfbva8mT/PyPkmzGg+OM1+lOad
UKkAniJ5wzWi2vq9qPsJAKuwpAStiTZx
=3DknvD
-----END PGP SIGNATURE-----
