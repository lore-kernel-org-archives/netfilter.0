From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: incoming interface confusion question
Date: Mon, 21 Jun 2004 23:28:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406212328.19329.Antony@Soft-Solutions.co.uk>
References: <40D71EC4.7090900@smxy.org> <1087849139.17067.25.camel@localhost> <40D74F60.6030105@smxy.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D74F60.6030105@smxy.org>
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
To: netfilter@lists.netfilter.org

On Monday 21 June 2004 10:13 pm, Shaun T. Erickson wrote:

> Ok, here's some more detail on what happened.
>
> I have a SonicWall firewall as my external firewall. Its external
> address and the address of the systems in the DMZ hanging off of it, are
> in a pool of 16 real IPs we got from the ISP.
>
> The LAN port of the SonicWall is connected to a hub. The only other
> thing connected to the hub is eth0 of my internal iptables
> router/firewall. I have an internal lan hanging off eth1 of the iptable
> system, and a second internal lan hanging off eth2 of the iptables
> system. The SonicWall has two static routes pointing traffic for my
> internal lans to eth0 on the iptables system. Both of my lans use
> non-routable private ip address space.

Since you use non-routable addresses on your internal LANs, and you say that 
the SonicWall has static routes pointing to those network ranges, I assume 
you are doing the NAT (which is necessary for clients to be able to access 
the Internet) on the SonicWall, not on the netfilter machine.

Unless you have any DNAT rules on your SonicWall redirecting some public 
address/es to your private address space, I think you can rule out someone on 
the Internet having sent the packets in to your internal address space, 
because they simply wouldn't be able to get the packets through to private 
addresses.

> What happened is that the iptables system dropped what appear to be
> quite methodical scans of system on one of my lans by sites out on the
> internet. It saw the packets coming in eth0 and destined to head out
> eth1 and, based on my rulesets, logged and dropped them.
>
> The source addresses are from multiple internet sites,
> coming from either port 80 or port 443, and were destined for the
> private address space of one of my internal lans. The initial
> destination port seemed randomly chosen, but then incremented by 1. Most
> often, 92 bytes was sent to each port, but not always.

What sort of packets were they?   You've said they were from source ports 80 
and 443, so I assume we're talking TCP, not UDP.   What flags were set?   
SYN? ACK? FIN? RST? (URG & PSH aren't very interesting really)

Packets from source ports 80 and 443 are to be expected - as replies from a 
web server - so I wonder whether you should be investigating some machine on 
your internal network (rather than puzzling over your firewall), to see 
whether it was sending *out* packets, which you have simply seen the replies 
to?

A Windows client which makes repeated connections to a web server will very 
likely choose successively higher source port numbers (which are the 
destination port numbers in the reply packets) for each connection attempt, 
therefore several things about what you've said suggest to me that you're 
seeing reply packets, not an externally-initiated port scan.

The fact that the packets you've seen are to multiple addresses within your 
own LAN in fact makes me wonder whether someone inside your network has 
(deliberately or unwittingly) performed a TCP port 80 scan of several 
external addresses, using source address spoofing to disguise the address of 
the machine doing the scan?

It's not unreasonable to think that a worm or trojan infection of an internal 
system could cause this.

Maybe it would be worth adding an outbound logging rule (perhaps just for port 
443 to keep the signal:noise ratio higher than it would be on port 80) to see 
if something similar happens again, and see whether you had outbound packets 
preceding the inbound ones?

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


