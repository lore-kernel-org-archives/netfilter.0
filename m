From: Cloves Pereira Costa Jr <cloves.costa@m2sys.com.br>
Subject: Re: port forwarding question
Date: Mon, 17 Mar 2008 15:32:25 -0300
Message-ID: <1205778745.9569.12.camel@wtprit0036.m2sys.com.br>
References: <1205771195.2681.14.camel@dev002.ctekproducts.com>
	 <Pine.LNX.4.64.0803171912010.18817@fbirervta.pbzchgretzou.qr>
Reply-To: cloves.costa@m2sys.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0803171912010.18817@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter ML <netfilter@vger.kernel.org>

Em Seg, 2008-03-17 =C3=A0s 19:13 +0100, Jan Engelhardt escreveu:
> On Mar 17 2008 09:26, Phil Sutter wrote:
> >
> >I thought I could do the following but it does not work:
> >
> >iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 5080:5085 -j DN=
AT
> >--to 192.168.1.10:80-85
> >
> >Is there a way to do what I want to do with a single command or do I
> >have to forward each port with an individual command?
>=20
> To do it with a single rule requires your own target extension.
>=20
> :80-85 just tells it to choose any one of it.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

AFAIK, don't exist any single command to do that... What exists, is
NETMAP target that DNAT/SNAT every single address in two ranges.=20
i.e: "iptables -t mangle -A PREROUTING -s 192.168.1.0/24 -j NETMAP --to
10.5.6.0/24"

If anyone knows any command that do this, I'll be pleased to know too..=
=2E
If don't, this is a good feature to implement in futures versions of
IPTables.

[]s

Cloves

