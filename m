From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: bad tcp packets?
Date: 31 Jan 2005 19:34:51 +0100
Message-ID: <1107193476.9909.4.camel@nostromo.bgsecm.com>
References: <41FE32D4.4000103@usna.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41FE32D4.4000103@usna.edu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 31 de 01 de 2005 a las 14:29, Kevin Van Workum escribi=C3=B3:
> I'm learning about iptables and am working through the example scripts=20
> in Oskar Andreasson's Iptables Tutorial 1.1.19. So I have the following=
=20
> rules:
>=20
> iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG=20
> --log-prefix "New not syn:"
> iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
>=20
> My understanding of this rule is that all NEW tcp packets should by SYN=
=20
> also. So if they are not NEW and SYN, then we should log them and drop=20
> them. I guess Andreasson wants to log them because they may indicate a=20
> problem of some sort. So in my log file, I get this:
>=20
> Jan 30 20:09:27 server kernel: New not syn:IN=3D OUT=3Dlo SRC=3D10.0.0.=
100=20
> DST=3D10.0.0.100 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D7678 DF =
PROTO=3DTCP=20
> SPT=3D34928 DPT=3D143 WINDOW=3D32767 RES=3D0x00 ACK PSH FIN URGP=3D0
>=20
> So what's the problem with these packets? It looks like some client is=20
> contacting the imapd (which is running on my firewall) with some bad tc=
p=20
> packets?

NEW without SYN packets can occur but they are very uncommon, the
rule proposed it's correct in the 99% of the systems, but if you
have a program or daemon that doesn't make the SYN/ACK-SYN/ACK
correctly then you maybe have to allow this packets.

Another situation when you could have this kind of packets is
when you have two firewalls in high availability and one of
them have a failover, then the packets are seen as NEW by
the conntrack system but they doesn't have the SYN.

Regards.


--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


