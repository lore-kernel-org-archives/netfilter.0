From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Fri, 16 May 2008 17:15:16 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805161714450.15590@fbirervta.pbzchgretzou.qr>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar> <482DA36B.6070801@plouf.fr.eu.org> <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Friday 2008-05-16 17:14, Jan Engelhardt wrote:
>
>On Friday 2008-05-16 17:08, Pascal Hambourg wrote:
>>
>>> Anyway, there aren't nf_conntrack_amanda, nf_conntrack_irc, etc. =C2=
=BFare
>>> there available by now, or need some extra patches or something els=
e?
>>
>> Most of them were introduced in kernel 2.6.20 along with IPv4 statef=
ul NAT.
>> Aliases have been defined, so you can keep using the old names.
>
>No aliases have been defined.
>
>$ modinfo nf_conntrack
>filename:       /lib/modules/2.6.25.3-jen65-default/kernel/net/netfilt=
er/nf_conntrack.ko
>license:        GPL
>srcversion:     3BD1C8DA6B930848245F7A5
>depends:       =20
>vermagic:       2.6.25.3-jen65-default SMP mod_unload 586=20
>parm:           expect_hashsize:uint
>
Meh, jmp $gun. nf_conntrack_ipv4 has them, but of course, switching
protects against surprises.
