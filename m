From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd and natted tcp sessions
Date: Tue, 18 Aug 2015 19:34:48 +0200
Message-ID: <20150818173448.GA10314@salvia>
References: <55D33544.7050200@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55D33544.7050200@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0KLQtdC9INCb0LXQsg==?= <leo.ten@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Aug 18, 2015 at 07:38:12PM +0600, =D0=A2=D0=B5=D0=BD =D0=9B=D0=B5=
=D0=B2 wrote:
> Hello!
>=20
> I have a problem running conntrackd in active-active mode. My setup i=
s:
> 2 nat boxes in 2 different data centers - natbox1 and natbox2
> From each DC a single network is broadcasted through BGP, so both
> natboxes have the same IP.
> Behind nat boxes are networks with addresses 10.0.0.0/16 and
> 10.0.1.0/16, and there is a l2 tunnel between them, so all hosts in
> these networks are accessible to each other.
> There are identical servers in both DCs in 10.0/16 networks -server1
> and server2. Let's say the address of one of them is 10.0.1.2 and
> the second has address 10.0.0.2.
>=20
> server1 is behind natbox1 and server2 is behind natbox2.
>=20
> The problem I am trying to solve is that when server1 sends a TCP
> request (HTTP for example) and the remote server is replying to the
> natbox2 in another DC, instead of natbox1 due to the fact, that it
> is 'closer' to it, the reply should be delivered from natbox2 to
> server1, that initially sent the request through the tunnel between
> natboxes.
>=20
> Conntrackd perfectly syncs states and writes them into the kernel
> conntrack tables of natboxes, request gets to the natbox2, but never
> leaves it to server1.
>=20
> Everything is working for UDP and ICMP packets. But TCP gets stuck
> on the natbox and never gets sent to the correct server. And also if
> requests and relies go through the same DC TCP connections also
> work.

Did you disable TCP strict tracking? Otherwise the TCP connection
tracker will mark packets as invalid. Another alternative is to
distribute traffic at per-flow level better the active-active cluster,
instead of at per-packet level.

