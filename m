From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: irc
Date: Mon, 17 Nov 2003 18:11:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171811.hAHIBNj22368@agate.rockstone.co.uk>
References: <OFD7AE25B0.4E5DA4B4-ON85256DE1.00606EE3-85256DE1.006156D2@kal.kalsec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFD7AE25B0.4E5DA4B4-ON85256DE1.00606EE3-85256DE1.006156D2@kal.kalsec.com>
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
To: netfilter@lists.netfilter.org

On Monday 17 November 2003 5:43 pm, trainier@kalsec.com wrote:

> I'll attempt to clear things up a bit.
>
> An irc proxy, is a machine that accepts a connection, then forwards you=
 on
> to the proxy server.  An irc bounce, is very similiar in nature.

Ah, so there is a difference between an IRC proxy and an IRC server?   (I=
=20
didn't know - I'm not familiar enough with the IRC protocol).

> What I'm looking for, is not an irc proxy.  I'm already connecting to a=
n
> irc proxy.  The problem is, when I changed my default gateway to point =
at
> my http-proxy, I can no longer make connections out to my irc server.

That sort of makes sense.   Does your http proxy know how to forward non-=
http=20
traffic (so the traffic can get to the IRC proxy, for example), and is it=
=20
correctly forwarding such traffic?

> (It comes back with a "connection refused").

I'm puzzled about what "it" is in this sentence.   Which machine sends ba=
ck a=20
packet to your IRC client indicating that there's a problem?

> I thought I would have to use NAT in this case, just like I have to use=
 NAT
> to allow http and ftp requests, through the squid proxy server.

Whether or not you need to use NAT depends on where your public & private=
 IP=20
addresses meet.   If the squid proxy is also your router joining the publ=
ic=20
to the private network, then yes, you will need NAT rules in order to get=
 any=20
non-http traffic through it.   If the 'other side' of your squid proxy is=
=20
still privately addressed within your own network, and your public IP add=
ress=20
router is somewhere beyond it, then you don't need to do NAT on the squid=
=20
proxy, just normal routing table entries (and the machines on the other s=
ide=20
need to know that this is a gateway back to the addresses on the inside o=
f it=20
of course).

> Here's how I'm set up:
>
> Client machine ->   squid-proxy   ->  DMZ  ->  IRC Server.

If you can add some IP addresses / network ranges to that diagram, and ma=
ybe=20
include your Internet router in there as well, it would be helpful

Please note that I have chosen the sig below specifically for this email =
:)

Regards,

Antony.

--=20

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Please reply to the list;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0please don't CC me.

