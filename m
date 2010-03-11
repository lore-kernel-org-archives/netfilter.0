From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables NATed or not NATed
Date: Thu, 11 Mar 2010 21:39:26 +0100
Message-ID: <4B9954FE.5030904@plouf.fr.eu.org>
References: <4B989616.7000904@perfaction.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B989616.7000904@perfaction.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Patrick Chemla a =E9crit :
>=20
> It works, but with tcpdump I have recorded packets on outgoing=20
> interfaces where addresses are NOT NATed, means, packets issued from=20
> internal servers on eth0, are routed to default route eth2 with there=
=20
> internal address 10.0.0.xx.
>=20
> It is very strange because it is a small percentage of packets, not a=
ll=20
> the packets from a specific server, directed to the same port than=20
> others who are routed and NATed the right way, at the same time.

Check the state of those packets. Usually, packets which skip NAT are
those classified in the INVALID state by the connection tracking.
