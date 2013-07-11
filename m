From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: How to make conntrack to process all packets?
Date: Thu, 11 Jul 2013 11:21:15 +0200
Message-ID: <51DE790B.9070708@plouf.fr.eu.org>
References: <51DC51CB.5050002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51DC51CB.5050002@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Petr Chmelar <chmelab@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Petr Chmelar a =E9crit :
>=20
> We would like to use Ulogd's NFCT input for intelligent netflow-based=
=20
> statistics reporting. The problem is that the netfilter_conntrack=20
> doesn't process connections that don't go through the system (we have=
=20
> noticed and found in man conntrack /TABLES), which we need to process=
=20
> because of sniffing in promisc mode (we have forwarded traffic from=20
> different vlans). This doesn't work even when we do something like:
> iptables -I PREROUTING -i eth9.10 -t raw -j CT

=46rom reading the manpage, I do not think that CT without any option d=
oes
anything.

> In fact we're looking for an opposite of NOTRACK. Do you have any ide=
a=20
> how to setup or recompile the libnetfilter_conntrack or similar (ulog=
d2)=20
> so we get also flows not destined for the system?

IMO, you are looking in the wrong direction. The whole netfilter (not
only conntrack) won't process packets not destined to the host because
these packets do no reach the IP layer. A workaround may be to use a
bridge with bridge-nf-call-iptables enabled.
