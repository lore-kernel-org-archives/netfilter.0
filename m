From: trainier@kalsec.com
Subject: Re: irc
Date: Mon, 17 Nov 2003 13:42:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF35D63A47.696E0D67-ON85256DE1.0066888E-85256DE1.0066CA71@kal.kalsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

Okay, here's the revised copy of my situation, with ip addresses:

Client machine (192.168.1.162) ->  (192.168.1.7)  squid-proxy=20
(208.224.3.156)  ->  DMZ  (208.224.3.153) ->  (irc.blessed.net)  IRC Server.

I don't know what "IT" is.  That is what I need to find out (packet=20
sniffer?).  I'm assuming it's the irc server.

I know how to set nat up in this situation.  I know it's what I need, but=20
am not sure how to do it.





Antony Stone <Antony@Soft-Solutions.co.uk>
Sent by: netfilter-admin@lists.netfilter.org
11/17/2003 01:11 PM

=20
        To:     netfilter@lists.netfilter.org
        cc:=20
        Subject:        Re: irc


On Monday 17 November 2003 5:43 pm, trainier@kalsec.com wrote:

> I'll attempt to clear things up a bit.
>
> An irc proxy, is a machine that accepts a connection, then forwards you=20
on
> to the proxy server.  An irc bounce, is very similiar in nature.

Ah, so there is a difference between an IRC proxy and an IRC server?   (I=20
didn't know - I'm not familiar enough with the IRC protocol).

> What I'm looking for, is not an irc proxy.  I'm already connecting to an
> irc proxy.  The problem is, when I changed my default gateway to point=20
at
> my http-proxy, I can no longer make connections out to my irc server.

That sort of makes sense.   Does your http proxy know how to forward=20
non-http=20
traffic (so the traffic can get to the IRC proxy, for example), and is it=20
correctly forwarding such traffic?

> (It comes back with a "connection refused").

I'm puzzled about what "it" is in this sentence.   Which machine sends=20
back a=20
packet to your IRC client indicating that there's a problem?

> I thought I would have to use NAT in this case, just like I have to use=20
NAT
> to allow http and ftp requests, through the squid proxy server.

Whether or not you need to use NAT depends on where your public & private=20
IP=20
addresses meet.   If the squid proxy is also your router joining the=20
public=20
to the private network, then yes, you will need NAT rules in order to get=20
any=20
non-http traffic through it.   If the 'other side' of your squid proxy is=20
still privately addressed within your own network, and your public IP=20
address=20
router is somewhere beyond it, then you don't need to do NAT on the squid=20
proxy, just normal routing table entries (and the machines on the other=20
side=20
need to know that this is a gateway back to the addresses on the inside of =

it=20
of course).

> Here's how I'm set up:
>
> Client machine ->   squid-proxy   ->  DMZ  ->  IRC Server.

If you can add some IP addresses / network ranges to that diagram, and=20
maybe=20
include your Internet router in there as well, it would be helpful

Please note that I have chosen the sig below specifically for this email=20
:)

Regards,

Antony.

--=20

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Please reply to the=20
list;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0please don't CC=20
me.





