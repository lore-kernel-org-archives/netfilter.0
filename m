From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Need help have some questions...
Date: 18 Aug 2003 23:09:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061240992.1628.56.camel@kermit>
References: <20030818201333.57194.qmail@web40202.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030818201333.57194.qmail@web40202.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: SBlaze <dagent.geo@yahoo.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-08-18 um 22.13 schrieb SBlaze:
> To Ralf, the netfilter team, and the whole of the OS community
>=20
> How am I supposed to proxy apache? Why should I have to? Is it not a fire=
walls
> job to protect a system(and LAN behind it)? This is a very valid form of
> protection I'm asking for here.
You sure are correct in pointing out that firewalls are supposed to
protect a system and maybe a LAN behind it.=20
You have to remember (or read up on) that there are basically 3
different technologies available to technically implement a firewall:
1. Packetfilter like netfilter and ipchains
2. Circuit Relays like socks
3. Application level gateways like fwtk

All three work on different network layers and have access to different
information.=20
Basically a packet filter has only access to the headers of the IP
packet (yes, I know that netfilter has the string match), but they
cannot reassemble the whole datastream and base their decision on it (at
least not yet). This means, that a packetfilter cannot find the
destination email address in an smtp data stream. It just does not have
the intelligence built in.=20

A circuit relay is a quite dumb proxy that just filters connections but
still cannot see inside.

An application level gateway is more or less a proxy written for the
specific protocol. It cannot access the packet headers anymore but it
sees the data stream. It can understand and parse the SMTP protocol and
filter based on the data send.

Now since Netfilter is a packet filter, you do not (and probably will
never) have the possibility to filter based on domains but only on IP
addresses.
If your domains use two different IP addresses it is easy to redirect
because netfilter can access the IP header holding the information.

By the way, even commercial packet filters like Checkpoint use a proxy
for this functionality.=20

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

