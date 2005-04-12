From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Mon, 11 Apr 2005 20:36:54 -0400
Message-ID: <1113266214.2111.46.camel@grendel>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>
	<425AF2B7.2050402@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425AF2B7.2050402@riverviewtech.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: gtaylor+reply@riverviewtech.net
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 2005-04-11 at 17:57, Taylor, Grant wrote:
>
> The TCP RST flag looks like it can be sent with out any other flags set in the packet in such a situation where there is no known on going connection

Actually, you are usually going to see ACK set as well as the RST flab
because the receiving system is acknowledging the receipt of the packet.
The except is in reply to a non-established packet with only ACK set.
The proper response here per the RFC's is RST only.

> As to your question as to whether or not it is acceptable for firewalls to drop packets with just the RST packet set inbound to you?  I'd say that you probably should not do that b/c the RST packet is a way to tell your TCP stack that it has done something wrong.

The receipt of these packets should be pretty rare. Off the top of my
head, one possible cause would be an established session where the
remote end gets power cycled. You ACK to continue communications and the
remote end sets RST only because it has no knowledge of the session
(because the original session gets cleared during the power cycle). If
you filter out in inbound RST, you system will fail to kill the session
till it times out and issues its own RST/ACK.

> But if you choose to do this there is nothing technically wrong with it that I can see, just sort of like shooting your self

Agreed, nor is it really buying you anything. If you are maintaining
state Netfilter will dump the RST unless it matches the state table.

> iptables -t filter -A FORWARD -i $INet -o $LAN -d $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state INVALID,NEW -m limit ! --limit 1/second -j LOG --log-prefix 'Bogus inbound false TCP packets with RST flag set more than one time per second!'
> iptables -t filter -A FORWARD -i $INet -o $LAN -d $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state INVALID,NEW -j DROP
> iptables -t filter -A FORWARD -i $INet -o $LAN -d $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state ESTABLISHED,RELATED -j ACCEPT

Hummm. Not sure this is going to do anything. INVALID will be dropped
normally and a better way to deal with NEW is to mask on SYN in your
permit rules. ESTABLISHED should already be permitted as part of a
general permit rule of the state table. 

> This is an institutional political decision as some people feel that rejecting packets in some situations confirms your presence on the net vs just dropping them leaves the possible attacker wondering.

<semi-rant>
Actually, this is incorrect. Consider the following:
Port is open = SYN/ACK returned
Port is closed = RST/ACK returned
System down = ICMP type 3, code 1 returned
Net down = ICMP type 3, code 0 returned
Packet blocked = ICMP type 3, code 13 returned
Firewall with drop rule = nothing comes back

Note the *only* time you will see nothing coming back consistently is
when a firewall is in the way. So by dropping packets, you are
confirming the existence of a firewall. As an example, run nmap against
a firewall with a drop policy. It will actually report that a firewall
is in the way when nothing comes back. No head scratching required. ;-)

If you are looking to go stealthy, host unreachables (ICMP type 3, code
1) are a better choice. Now your firewall looks like a simple up stream
router with no filtering in place.

Now, a drop policy does have some benefits. For example it will slow
down a port scanner as the scanner tries to determine if its packets are
getting lost or if there is a firewall in the way. However a default
drop policy also has its drawbacks in that it returns nothing makes the
address space far more appealing to an attacker to spoof as part of a
TCP SYN flood attack (no response from your network allows them to tie
up the connection pool for a longer period of time on the victim's
system). So by implementing a default drop rule you are actually helping
the attacker perform a successful flood. This one of the reasons why the
RFC's define dropping packets as "A Bad Idea" (TM). See RFC 1812 for
more details.
</semi-rant>

HTH,
Chris



