From: "Shaun T. Erickson" <ste@smxy.org>
Subject: Re: incoming interface confusion question
Date: Mon, 21 Jun 2004 19:07:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D76A3F.90503@smxy.org>
References: <40D71EC4.7090900@smxy.org> <1087849139.17067.25.camel@localhost> <40D74F60.6030105@smxy.org> <200406212328.19329.Antony@Soft-Solutions.co.uk>
Reply-To: ste@smxy.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406212328.19329.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:

> Since you use non-routable addresses on your internal LANs, and you say that 
> the SonicWall has static routes pointing to those network ranges, I assume 
> you are doing the NAT (which is necessary for clients to be able to access 
> the Internet) on the SonicWall, not on the netfilter machine.

Correct. (Btw, if I come accross as niaeve, I apologize. I've never had 
to deal with a potential incident before, so I'll admit to being a bit 
spooked at the moment. I just replaced the previous admin and am still 
coming up to speed. Please forgive me.)

> Unless you have any DNAT rules on your SonicWall redirecting some public 
> address/es to your private address space, I think you can rule out someone on 
> the Internet having sent the packets in to your internal address space, 
> because they simply wouldn't be able to get the packets through to private 
> addresses.

There are no rules on the sonicwall that allow traffic initiated on the 
wan to go to the lan. There is one rule that allows one specific system 
in the dmz to connect to one specific system on an internal lan, on it's 
MySQL port.

>>The source addresses are from multiple internet sites,
>>coming from either port 80 or port 443, and were destined for the
>>private address space of one of my internal lans. The initial
>>destination port seemed randomly chosen, but then incremented by 1. Most
>>often, 92 bytes was sent to each port, but not always.
> 
> 
> What sort of packets were they?   You've said they were from source ports 80 
> and 443, so I assume we're talking TCP, not UDP.   What flags were set?   
> SYN? ACK? FIN? RST? (URG & PSH aren't very interesting really)

They are all TCP packets. The breakdown of flags was:

     140 ACK FIN URGP=0
     202 ACK PSH FIN URGP=0
     510 ACK PSH URGP=0
       2 ACK RST URGP=0
     350 ACK SYN URGP=0
   14719 ACK URGP=0
       3 RST URGP=0

> Packets from source ports 80 and 443 are to be expected - as replies from a 
> web server - so I wonder whether you should be investigating some machine on 
> your internal network (rather than puzzling over your firewall), to see 
> whether it was sending *out* packets, which you have simply seen the replies 
> to?

Perhaps.

> A Windows client which makes repeated connections to a web server will very 
> likely choose successively higher source port numbers (which are the 
> destination port numbers in the reply packets) for each connection attempt, 
> therefore several things about what you've said suggest to me that you're 
> seeing reply packets, not an externally-initiated port scan.

I don't fully understand this. If a Windows client on my lan makes 
repeated attempts to connect to web sites on the internet, it sends each 
request from a successively higher port number each time, rather than 
from the same port each time? And the port that it requests from then 
becomes the destination port for the return packet?

> The fact that the packets you've seen are to multiple addresses within your 
> own LAN in fact makes me wonder whether someone inside your network has 
> (deliberately or unwittingly) performed a TCP port 80 scan of several 
> external addresses, using source address spoofing to disguise the address of 
> the machine doing the scan?
> 
> It's not unreasonable to think that a worm or trojan infection of an internal 
> system could cause this.

Ok. I'm willing to buy that, except for one thing. Eth2 of the netfilter 
box creates the 192.168.32.0/24 net. Eth1 of the netfilter box creates 
the 192.168.40.0/24 net. My firewall contains (among others) these rules:

$IPTABLES -A INPUT   -i $DB_IFACE -s ! $DB_ADDRESSES -j DROP
$IPTABLES -A FORWARD -i $DB_IFACE -s ! $DB_ADDRESSES -j DROP
$IPTABLES -A INPUT   -i $DEV_IFACE -s ! $DEV_ADDRESSES -j DROP
$IPTABLES -A FORWARD -i $DEV_IFACE -s ! $DEV_ADDRESSES -j DROP

where:

DB_IFACE=eth1
DEV_IFACE=eth2
DB_ADDRESSES=192.168.40.0/24
DEV_ADDRESSES=192.168.32.0/24

Wouldn't those rules cause any packets coming from my internal lans, 
with spoofed source addresses, to be dropped? If so, then they couldn't 
have contacted internet websites for me to then see reply packets from, 
right?

> Maybe it would be worth adding an outbound logging rule (perhaps just for port 
> 443 to keep the signal:noise ratio higher than it would be on port 80) to see 
> if something similar happens again, and see whether you had outbound packets 
> preceding the inbound ones?

I shall consider it.

	-ste

