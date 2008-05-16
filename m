From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Fri, 16 May 2008 17:45:13 +0200
Message-ID: <482DAC09.90304@plouf.fr.eu.org>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar> <482DA36B.6070801@plouf.fr.eu.org> <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt a =E9crit :
> On Friday 2008-05-16 17:08, Pascal Hambourg wrote:
>=20
>>>Anyway, there aren't nf_conntrack_amanda, nf_conntrack_irc, etc. =BF=
are
>>>there available by now, or need some extra patches or something else=
?
>>
>>Most of them were introduced in kernel 2.6.20 along with IPv4 statefu=
l NAT.
>>Aliases have been defined, so you can keep using the old names.
>=20
> No aliases have been defined.
>=20
> $ modinfo nf_conntrack

I meant aliases for helper modules. In most cases other netfilter=20
modules should be autoloaded by iptables rules creation or other module=
=20
dependencies, so it should be useless to load them explicitly.
