From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Thu, 22 Jan 2015 00:21:58 +0100
Message-ID: <54C03496.30504@plouf.fr.eu.org>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de> <54BF086E.5080906@ngtech.co.il> <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de> <54BFB8A3.7090504@chello.at> <20150121200324.Horde.ukdDqFj6DTInNSIVwG4VzA1@htjn.suhail.uberspace.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150121200324.Horde.ukdDqFj6DTInNSIVwG4VzA1@htjn.suhail.uberspace.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Niggemann <jn@hz6.de>
Cc: netfilter@vger.kernel.org

Jan Niggemann a =E9crit :
>=20
> nf_conntrack_proto_gre    12886  0
> nf_conntrack_ipv4      18003  1
> nf_defrag_ipv4         12443  1 nf_conntrack_ipv4
> xt_conntrack           12601  1
> nf_conntrack           57737  3 =20
> nf_conntrack_proto_gre,xt_conntrack,nf_conntrack_ipv4
> x_tables               18078  5 =20
> ip_tables,xt_tcpudp,xt_conntrack,iptable_filter,iptable_mangle

I do not see nf_conntrack_pptp here. It is required so that the first
GRE packet has the RELATED state.

Note : IIRC IME, the first GRE packet in a PPTP connection may be sent
by either side, client or server. GRE is used by PPTP to transport PPP,
and PPP is a peer-to-peer protocol, not client-server.
