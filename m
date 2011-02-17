From: Italo Valcy <italo@dcc.ufba.br>
Subject: Re: How to use DNAT
Date: Thu, 17 Feb 2011 18:30:50 -0300
Message-ID: <4D5D938A.4050000@dcc.ufba.br>
References: <4D5D6D2C.7010109@dcc.ufba.br> <4D5D7F74.3090809@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D5D7F74.3090809@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Pascal,

Em 17-02-2011 17:05, Pascal Hambourg escreveu:
>=20
> Target ? Do you mean the original destination address ?

Yes, that's it! ;)

> As long as incoming packets reach the interface, it does not matter h=
ow.

Yes, it just have to know how to reach the interface. Beacause of this
either I have to use the original destination address as a secondary
address of my firewall (machine running iptables) or start answer the
arp request for that IP. Right now, I'm using the secondary IP address
approach.

>=20
> Please provide some details about the rule, packets...
> Note that iptables' NAT ignores packets in the INVALID state.

Well... so could be this: INVALID state... The packets are about a
netflow traffic (9996/UDP) comming to the firewall, which should be
redirected to a internal host (through the DNAT). How can I debug these
possible INVALID packets?


Thanks!


- --=20
Sauda=E7=F5es,

Italo Valcy :: http://wiki.dcc.ufba.br/~ItaloValcy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk1dk4oACgkQfidLqjN6RNG2tACglYQeFkqjl2HMXpzzLh0tJ3bY
aWwAoJj6t8t3v8q9vU14kO3m7dof0O5s
=3DORCq
-----END PGP SIGNATURE-----
