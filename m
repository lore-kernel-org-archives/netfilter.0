From: Pete Toscano <pete-netfilter@verisignlabs.com>
Subject: Re: iptables not responding to packets destined for subinterface
Date: Mon, 01 Nov 2004 08:03:25 -0500
Message-ID: <4186341D.6080806@verisignlabs.com>
References: <000301c4bf08$4ae54700$6601a8c0@CHELA>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000301c4bf08$4ae54700$6601a8c0@CHELA>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Support Team wrote:
> My public interface has serveral IP address aliases.  Only the primary IP
> address responds to traffic (ip, imcp, et al).  I inserted a log statement
> at the top of each table and found that the packets destined for the virtual
> addresses never made it to any table.  However, according to tcpdump, I
> confirmed that the packets did get picked up by the kernel on the secondary
> address.  I guess they are just not passed to iptables.  

What options did you use for tcpdump?  I say this because if you were 
doing something like this:

tcpdump -ni <pub_interface> host <aliased_ip>

Then that'll put your interface into promisc mode, where tcpdump will 
see them, but if the problem's as I suspect, the dest Ethernet MAC 
address is wrong.

> Obviously, the
> packet was never replied to (icmp) or acknowledged (ip) by the process.

I do something very similar on a few boxes and this works fine unless 
provisions are made to handle things differently.  Pings return ICMP 
Echo Replies and IP packets that aren't explicitly DNATed are handled by 
the NAT box.  (You might want to have a default "drop all" rule for 
every aliased IP address to make sure you aren't leaking public access 
to your NAT box;  I think setting the policy of the PREROUTING chain to 
DROP might do this too, but I haven't checked this.  You also might want 
to double-check that the other services on your NAT box aren't binding 
to your public interface unless you specifically want to make them 
available.)

I have a new IP address to alias and DNAT (sometimes SNAT too, but I 
won't get into that here).  I add the alias to my public interface, then 
add the specific forwarding rules to the PREROUTING chain in the nat 
table.  Something like this:

iptables -t nat -A PREROUTING -i eth0 -p tcp -d <new_pub_ip> --dport 80 
-j DNAT --to-destination <some_private_ip>:<some_internal_port>

In this case, eth0 is my public interface and I'm only interested in 
DNATing TCP/80 traffic.

This used to be all I did to set up my DNATing, but things were kind of 
flaky for a while if I was moving the public IP address from a different 
interface on the pubic Ethernet segment (such as swapping out the NAT 
box).

I forgot that the router I was connected to would cache ARP responses 
and since the ones specific to the IP address I was moving hadn't 
expired, the router was still sending out packets to my newly aliased IP 
address using the old MAC address.  Obviously, since the Ethernet 
interface that the IP address was moved to didn't have that old MAC 
address, it just dropped and packets sent to it, not even looking beyond 
the Ethernet frame.

When I'd run tcpdump as shown above (which, by default, puts the 
interface into promiscuous mode, where it ignores all dest MAC 
addresses), I'd see all the packets and wonder WTF was going on. 
Eventually, if I stuck with it long enough, things would "just start to 
work," but I couldn't do this most of the time and had to back out 
machine upgrades.

Of course, with hind site, this is fairly obvious to me, but "sticking 
with it" turned out to be just waiting for the router's ARP cache entry 
specific to the moved IP address to expire.  I think the router's I've 
been working with have a ARP timeout of 120 minutes, so I'd either have 
to wait and hour (on average, two hours worst case) or get someone with 
op privs on it to flush the ARP entries specific to the moved IP address.

> How can I get iptables to respond to the packets on the secondary
> interfaces?  Or, how can I get the kernel to pass the packets to iptables?
> 
> I understand that when the packet hits the chain, all I have to do is create
> a rule with the primary interface and use the IP address to distinguish the
> packets of different virtual addresses.
> 
> If you are looking for more detail, see the email I sent on Sun, 24 Oct, at
> 9:28 p.m. (GMT -6).

I responded to your previous message both to you and the list 
(http://lists.netfilter.org/pipermail/netfilter/2004-October/056725.html), 
but your mail server is using very aggressive RBLs, so it rejected my 
message.  My guess is, unless something changed in the past week, you 
probably won't see this one either, but maybe this message can help 
someone else.  Regardless, I think this response is better anyway.

HTH,
pete

