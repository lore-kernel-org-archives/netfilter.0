From: Nick Taylor <nickt@lightlink.com>
Subject: Re: Possible Simple Configuration gone wrong
Date: Mon, 4 Oct 2004 10:27:09 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0410041013010.18968@adore.lightlink.com>
References: <41607945.8040802@Home.dataforce.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41607945.8040802@Home.dataforce.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dataforce <Dataforce@Home.dataforce.org.uk>
Cc: netfilter@lists.netfilter.org

On Sun, 3 Oct 2004, Dataforce wrote:
> To: netfilter@lists.netfilter.org
> Subject: Possible Simple Configuration gone wrong
>
> the iptables machine has the ip 82.133.x.x on eth1, and 192.168.0.5 on eth0
>
> (82.133.x.x) [Internet]----[iptables]----[Machine 1] (192.168.0.6)
>                                  |--------[Machine 2] (192.168.0.2)
>                                  `--------[Other Machines]
>
> I setup a port forward as follows:
> iptables -A PREROUTING -t nat -i eth0 -p tcp --dst 82.133.x.x --dport
> 3389 -j DNAT --to 192.168.0.6:3389
>
> iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 3389 -j DNAT --to
> 192.168.0.6:3389
>
> iptables -t nat -A POSTROUTING --dst 192.168.0.6 -p tcp --dport 3389 -j
> SNAT --to-source 82.133.x.x
>
> iptables -A POSTROUTING -t nat -j MASQUERADE
>
> now, this allows machine2 AND internet clients to connect to port 3389
> on 82.133.x.x and get to machine1
>
> however, according to machine1, all clients appear to have come from
> 192.168.0.5
>
> I would like it setup so that lan clients appear to come from
> 192.168.0.5 (so that packets get routed correctly
> [machine1]--[iptables]--[machine2] not [machine1]--[machine2]) where as
> packets from the internet appear to come from the correct ip.
>
> i have tried replacing
> iptables -A POSTROUTING -t nat -j MASQUERADE
>
> with
>
> iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -j SNAT --to-source
> 82.133.x.x
>
> iptables -t nat -A POSTROUTING -s ! 192.168.0.0/16 -j MASQUERADE
>
> (suggested by a friend)
>
> and vice versa (swapping the !) however it either prevents external
> connections compeltey or gives the same effect as before.
>
> is what i would like possible with iptables? or will i jsut have to live
> with all clients appearing as 192.168.0.5
>
> thanks
>
> -DF
>
IMHO, this is a bit of a kludge.  I am reading between the lines here a
little, but...  I assume that the connection from machine2 isn't made
directly to machine1, since they're in the same subnet, they would direct
deliver if they were allowed to.  Ie, in your client software on machine2,
if you enter the address 192.168.0.2, rather than 82.133.x.x, you'll see
192.168.0.6.  However, if you enter 82.133.x.x, you're doomed forever to
see 192.168.0.5.  A little reflection should show you why this is a limit
of TCP/IP, and not netfilter per se.

192.168.0.6 innitiates a connection to 82.133.x.x, which generates a SYN
packet like this:
192.168.0.6 -> 82.133.x.x
This packet is transmitted to the default gateway, at 192.168.0.5.
The gateway mangles the headers so that now it looks like
192.168.0.5 -> 192.168.0.2
and retransmits it.

Now, 192.168.0.2 sees a connection from 192.168.0.5, responds
appropriately, and 192.168.0.5 uses connection tracking to remember that
*this* connection should get sent back to 192.168.0.6, so it rewrites the
headers and retransmits.

If instead, the *gateway* transmitted a packet to 192.168.0.2 with
192.168.0.6 in the header, the reply packet would be sent directly to
192.168.0.6, without hitting the gateway again, which would NOT satisfy
TCP, since 192.168.0.6 *thinks* it's talking to 82.133.x.x, it wouldn't
recognize a return packet with the address 192.168.0.2.

To make a long story short, you either use the gateway for nat, or you
don't.  There's no logical meaning to half-natting, it would only break
things.  If you NAT the address, then the server will always think it's
talking to the gateway, otherwise, you can use the native IP of the
server, as long as routability is satisfied (for example being directly
connected to the same ehternet and on the same subnet should work fine)

