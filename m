From: Italo Valcy <italo@dcc.ufba.br>
Subject: Re: Time counter of connections (libnetfilter-conntrack?)
Date: Sat, 16 Oct 2010 09:57:03 -0300
Message-ID: <4CB9A11F.5010906@dcc.ufba.br>
References: <4CB924EC.3090906@dcc.ufba.br> <4CB960A8.3070001@netfilter.org> <alpine.LNX.2.01.1010161126330.2806@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010161126330.2806@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi guys,

Thank you Jan, Pablo, for the reply. It's like I imagined. One doubt:
the 'id' field of nf_conntrack struct is unique? (I'd like to use it as
index to the struct that I'll use to track the timestamps...)


Kind regards, Italo.


- --=20
Sauda=E7=F5es,

Italo Valcy :: http://wiki.dcc.ufba.br/~ItaloValcy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAky5oRsACgkQfidLqjN6RNGuYQCeMXOT2pyUGJfExEGudf2Z+OK/
jIcAn0b1BIYnQ9K4MkjiB6YHEhcZGsRb
=3DYYhQ
-----END PGP SIGNATURE-----
