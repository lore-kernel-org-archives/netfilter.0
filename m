From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: SNAT with ip address range not working...
Date: Tue, 18 Nov 2008 17:00:15 +0100
Message-ID: <4922E68F.7020709@plouf.fr.eu.org>
References: <8FC72664318547708851AFDCFB7B1721@squarepi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8FC72664318547708851AFDCFB7B1721@squarepi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

John Lister a =E9crit :
> Hi, i'm trying to set up a rule to snat over a range of ip addresses =
with
> something like this:
>=20
> iptables -t nat -A POSTROUTING -m state --state NEW -j SNAT --to-sour=
ce=20
> 192.168.96.34-192.168.96.136
>=20
> however after dumping the packets, it seems that only the first addre=
ss=20
> is ever used and the rule is being matched correctly
>=20
> In the docs it mentions that it selects an address in the range at=20
> random for a stream - i'm assuming for netfilter a stream is a single=
=20
> connection and each subsequent connection should get a new ip address=
,=20
> or does it group similar connections to/from the same ip addresses an=
d=20
> give it the same ip address - which happens with routing (cache)?

Your documentation may be outdated. Since the linux kernel 2.6.11,=20
randomness (actually round robin AFAIK) in the SNAT and DNAT address=20
selection has been replaced with a selection based on a hash of the=20
source and destination address. So for the same (src, dst) SNAT and DNA=
T=20
will always select the same address in the range.
