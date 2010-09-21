From: Italo Valcy <italo@dcc.ufba.br>
Subject: Re: How to log NAT translations
Date: Mon, 20 Sep 2010 23:25:13 -0300
Message-ID: <4C981789.3070004@dcc.ufba.br>
References: <4C8FAFDF.9080201@dcc.ufba.br> <alpine.LNX.2.01.1009141953580.23103@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009141953580.23103@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: jengelh@medozas.de
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Jan,

Em 14-09-2010 14:54, Jan Engelhardt escreveu:
> On Tuesday 2010-09-14 19:24, Italo Valcy wrote:
>=20
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi guys!
>>
>> I'm a newbie in this mainling list, so I'm sorry if this question wa=
s
>> already asked.
>>
>> I'd like to have more specific logging output of NAT translation in
>> iptables. Is there an way to logging of ORIGINAL_IP/ORIGINAL_PORT +
>> TRANSLATED_IP/TRANSLATED_PORT?
>=20
> conntrack -E

Thank you for the reply.

Actually, I wanna something more simple and specific than the command
above. Using 'conntrack -E', I still have to parse the package events
NEW, UPDATE and DESTROY if I wanna know the  of a NAT, for example.
=46urthermore, with 'conntrack -E', in my opinion, we have an important
overhead of the output (it's so many messages to write to stdout - or
even redirect to a file)...

My ideia is to write a NAT (or conntrack) helper (as a kernel module)
that monitors the DESTROY event of a DNAT and try to find out when was
the NEW event of the same connection (maybe we have this information in
some struct..); then we write a log message (like LOG target does) whic=
h
contains ip_src-orig/port_src-orig,
ip_src-translated/port_src-translated, ip_dst/port_dst, duration of the
NAT (a little bit similar to Cisco/Asa NAT logging..). What do you
think? Where can I find some documentation to read?

Thank you so much for any help!


- --=20
Sauda=E7=F5es,

Italo Valcy :: http://wiki.dcc.ufba.br/~ItaloValcy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyYF4kACgkQfidLqjN6RNGBrgCdGeGdZe4jzY7cR9xM5zNqV/RJ
k20AnRl6VKzz31k2vSqgQmL5Tafm931s
=3DbUcw
-----END PGP SIGNATURE-----
