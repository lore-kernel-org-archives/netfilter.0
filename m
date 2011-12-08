From: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Subject: Re: What happens after PREROUTING/nat ?
Date: Thu, 08 Dec 2011 09:55:24 +0100
Message-ID: <3132035.exjJScDA16@alaris>
References: <4EDFA920.4040804@freemail.hu>
Reply-To: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EDFA920.4040804@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: =?ISO-8859-1?Q?G=E1sp=E1r?= Lajos <swifty@freemail.hu>

On Wednesday 07 of December 2011 18:57EN, G=E1sp=E1r Lajos wrote:
> "A": the local router/gateway/firewall connected to the Internet and
> the LAN "B": a server on the LAN
> "C": a client on the same LAN or on the other side (Internet)
>=20
> If "C" connects from the Internet to a service on "A" (in reality the
> service is on "B") then everything is fine because I can DNAT the
> packets to "B"...
> But if "C" is in the LAN then the packets are simply disappearing...

They are not. If you monitor the LAN traffic, you should notice that th=
e=20
problem is not the redirected packet but the reply from B to C. Because=
=20
B and C are in the same segment, the response goes directly to C (not=20
through A) and its source address isn't translated back. Thus C sends a=
=20
packet to A but gets response with source address of B (which it can't=20
recognize). There are three usual solutions to this problem:

1. Don't put services accessible from outside into LAN, create a DMZ an=
d=20
put them there. Then the response will go through A and it will=20
translate its source address.

2. Make clients from LAN use the real address of B rather than A. This=20
is often done via views in BIND - you translate the name differently fo=
r=20
clients in LAN and for the rest of the world.

3. When translating the destination address from A to B for packets=20
coming from LAN, translate source address as well ("masquerade"). Then=20
the reply will go back to A and it will translate both source and=20
destination address. Awful? Definitely, but this is where all those=20
masquerades got us...

                                                          Michal Kube=E8=
ek

