From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Strange ICMP packets
Date: Fri, 21 Feb 2003 02:50:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302210250.54241.netfilter@newkirk.us>
References: <85063BBE668FD411944400D0B744267A0232671D@ausmail.core.coremetrics.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <85063BBE668FD411944400D0B744267A0232671D@ausmail.core.coremetrics.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Dodson, Matthew" <mdodson@coremetrics.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
Cc: "Dodson, Matthew" <mdodson@coremetrics.com>

On Thursday 20 February 2003 05:48 pm, Dodson, Matthew wrote:
> Sorry if this question has been asked before but I am having a hard
> time following this iptables log. I would appreciate any help. I am
> getting about 2000 of these in my logs a day. The only thing that
> changes in the request are the external IP's
>
>
> Here is my setup.
>
> RedHat 7.1
> iptables-1.2.5-3
> kernel-2.4.10 (I also run 2.4.20)
> DROP all ICMP

Generally NOT what you want to do.  If you have a rule that ACCEPTs=20
anything ESTABLISHED or RELATED, you're OK, but it appears you don't,=20
otherwise the stuff getting dropped below would have been sent back to=20
the server that originated the packets that the problems occured with. =20

> server Internal IP 10.4.1.30
>
> Is used as an  apache webserver that gets load balanced through a css.
> This server is also behind a PIX firewall.
>
>
> IPTABLES-ICMP-IN:IN=3Deth1 OUT=3D
> MAC=3D00:20:94:12:14:0f:00:d0:b7:82:24:9c:08:00 SRC=3D200.35.93.2
> DST=3D10.4.1.30 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D238 ID=3D56298 PR=
OTO=3DICMP
> TYPE=3D3 CODE=3D13 [SRC=3D10.4.1.30 DST=3D200.75.116.55 LEN=3D48 TOS=3D=
0x00
> PREC=3D0x00 TTL=3D45 ID=3D0 DF PROTO=3DTCP INCOMPLETE [8 bytes] ]

This is type3 (Destination Unreachable) code13 (Administratively=20
Prohibited) generated in response to a connection attempt from 10.4.1.30=20
to 200.75.116.55. (somewhere in Venezuela, if I read correctly)  The=20
message comes from 200.35.93.2, which appears to be the gateway for the=20
destination in question, and likely this was REJECTed by a firewall=20
there.  Probably not much you can do about this, except double-check=20
that this traffic is actually being solicited by the firewalled=20
destination.

> IPTABLES-ICMP-IN:IN=3Deth1 OUT=3D
> MAC=3D00:20:94:12:14:0f:00:d0:b7:82:24:9c:08:00 SRC=3D199.70.10.33
> DST=3D10.4.1.30 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D244 ID=3D41725 PR=
OTO=3DICMP
> TYPE=3D11 CODE=3D0 [SRC=3D10.4.1.30 DST=3D12.88.181.78 LEN=3D40 TOS=3D0=
x00
> PREC=3D0x00 TTL=3D1 ID=3D34208 DF PROTO=3DTCP INCOMPLETE [8 bytes] ]

This one is type 11 (time exceeded) code0 (TimeToLive exceeded) which=20
tells you that TTL (decremented at each hop on the route) reached 1(as=20
noted in the last line) before reaching the destination, and so was=20
dropped.  If you have a lot of type11code0 messages, you should check=20
what the TTLs are for traffic leaving your network.  Keep in mind that=20
TTL will generally be decremented by each router in your internal=20
network, so if you have several hops between the server and the iptables=20
box (which also decrements TTL as the traffic passes through) then you=20
are starting out onto the internet at a severe disadvantage.

Generally the linux kernel will set a default TTL of 64 at origination,=20
which is considered a reasonable limit for most traffic.  If you are far=20
below that you need to address that. (I suspect you are - the ICMP=20
message itself has a TTL of 244, so it appears to have come a maximum of=20
11 hops from the point at which your outbound packet died!!) Try this:

iptables -t mangle -A POSTROUTING -o eth1 -j TTL --ttl-set 64

which will reset the TTL of all outbound traffic from the iptables box to=
=20
64 and eliminate 'losses' from internal routing.  If you don't have=20
mangle table loaded, you'll also need "insmod iptable_mangle".  This is=20
precisely the sort of thing the mangle table exists for - changing TTL,=20
TOS, or MARKing packets.  (last two useful for custom routing)

The theoretical limit for TTL is 255, but using anything over around 100=20
is considered rude at best.  (except for ICMP type11 code0... :^) If=20
your TTL is already at a 'reasonable' level and you still get=20
TTLexceeded problems, try increasing it slightly, maybe to 70.

j


