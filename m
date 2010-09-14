From: Italo Valcy <italo@dcc.ufba.br>
Subject: How to log NAT translations
Date: Tue, 14 Sep 2010 14:24:47 -0300
Message-ID: <4C8FAFDF.9080201@dcc.ufba.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi guys!

I'm a newbie in this mainling list, so I'm sorry if this question was
already asked.

I'd like to have more specific logging output of NAT translation in
iptables. Is there an way to logging of ORIGINAL_IP/ORIGINAL_PORT +
TRANSLATED_IP/TRANSLATED_PORT?

I know that I can put a logging rule before my NAT rule, but this way
I haven't the TRANS_IP/TRANS_PORT... for instance:

iptables -t nat -I POSTROUTING -s 10.0.0.0/24 -j SNAT --to 172.16.0.1
iptables -t nat -I POSTROUTING -s 10.0.0.0/24 -j LOG

In the above example I don't know how to get the TRANS_PORT...

I also know that we can access this information through
/proc/net/ip_conntrack (or using netstat-nat), but to get all
translation of a whole day its a big overhead to parse that file all
the time...

Thanks for any help!

- --=20
Sauda=E7=F5es,

Italo Valcy :: http://wiki.dcc.ufba.br/~ItaloValcy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyPr98ACgkQfidLqjN6RNGWAgCgjLgYUkPiAEp+C2znpRqUskoU
=46AQAoIeWZQEXFS9LY2RSnxlSKjrmtkNL
=3DWLWD
-----END PGP SIGNATURE-----

