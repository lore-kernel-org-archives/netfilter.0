From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Traffic going out wrong interface
Date: Wed, 27 Aug 2003 21:21:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4D5905.9030400@chrisbrenton.org>
References: <3F4B3DCC.8010104@chrisbrenton.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

I know its bad form to reply to one's own e-mail, but I have some 
additional info:

I tried disabling Snort on the firewall but the problem remained. Then 
for kicks I changed the REJECT rule to kick back host unreachables 
rather than TCP resets. Everything works fine now, even with Snort 
running on the firewall again.

So it appears that something about having iptables kick back RST's 
rather than type 3's caused the bogus ARP packets as well as the RST 
being transmitted out the wrong interface as I described below. I'm not 
sure if I'm the only one having this problem, but then again I'm not 
sure how many people scrutinize layer 2 as deeply as I do. ;-)

Thanks for the feedback,
Chris


Chris Brenton wrote:
> Greetings all,
> 
> I'm running into a weird bug/feature that is not causing problems per 
> se', but I thought I would pass it along to see if anyone has run into 
> the same.
> 
> I'm using SNAT and DNAT for some one to one mappings on some internal 
> addresses. Here are examples of the appropriate rules:
> 
> iptables -t nat -A PREROUTING -d 64.179.20.65 -j DNAT --to-destination 
> 192.168.1.6
> iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.7 -j SNAT 
> --to-source 64.179.20.66
> iptables -t nat -A PREROUTING -d 64.179.20.66 -j DNAT --to-destination 
> 192.168.1.7
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 64.179.20.22
> 
> 
> What I'm seeing on the internal network (192.168.1.0/24) on occasion is 
> this:
> 
> 23:46:50.091784 arp who-has 192.168.1.7 tell 64.179.20.66
> 0x0000   0001 0800 0604 0001 0050 8beb 5976 40b3        .........P..Yv@.
> 0x0010   1442 0000 0000 0000 c0a8 0107 0000 0000        .B..............
> 0x0020   0000 0000 0000 0000 0000 0000 0000             ..............
> 
> 23:47:08.698954 arp who-has 192.168.1.6 tell 64.179.20.65
> 0x0000   0001 0800 0604 0001 0050 8beb 5976 40b3        .........P..Yv@.
> 0x0010   1441 0000 0000 0000 c0a8 0106 0000 0000        .A..............
> 0x0020   0000 0000 0000 0000 0000 0000 0000             ..............
> 
> So the firewall is ARPing for the private address and asking it to 
> respond to the DNAT address mapped above. Hummm...
> 
> Here is another time I'm seeing this type of traffic:
> 
> iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,ACK -j LOG 
> --log-prefix " SYNACK_FALLOUT "
> iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,ACK -j REJECT 
> --reject-with tcp-reset
> 
> (yes these rules show up _after_ I process the state table. Its to make 
> spoofing my IP address space less useful for SYN flooding ;)
> 
> And what I'm seeing on the internal network on occasion is this:
> 
> 01:46:44.909145 64.179.20.65.1881 > 205.158.107.16.80: R [tcp sum ok] 
> 1192820737:1192820737(0) win 0 (DF) (ttl 255, id 0, len 40)
> 0x0000   4500 0028 0000 4000 ff06 ee2c 40b3 1441        E..(..@....,@..A
> 0x0010   cd9e 6b10 0759 0050 4719 0001 0000 0000        ..k..Y.PG.......
> 0x0020   5004 0000 d37a 0000 0000 0000 0000             P....z........
> 
> 02:05:54.646567 64.179.20.66.1525 > 205.158.107.16.80: R [tcp sum ok] 
> 149880833:149880833(0) win 0 (DF) (ttl 255, id 0, len 40)
> 0x0000   4500 0028 0000 4000 ff06 ee2b 40b3 1442        E..(..@....+@..B
> 0x0010   cd9e 6b10 05f5 0050 08ef 0001 0000 0000        ..k....P........
> 0x0020   5004 0000 1308 0000 0000 0000 0000             P.............
> 
> So the RST is getting transmitted out the wrong interface. Please note 
> that 99.9% of the time this all works fine. It only happens every now 
> and then (maybe once out of every 300-500 SYN/ACK packets seen).
> 
> I never see any other external packets going out the internal interface. 
> Its only ARP requests and RST packets. BTW, this is one of the few rules 
> I use to issue a bogus RST (only other is TCP/113 requests). Most of my 
> rules kick back ICMP host unreachables, and I never see those on the 
> internal network. It might mean something, it might not. Just thought I 
> would include it to complete the info. :)
> 
> Some config info:
> Hardware - Compaq Proliant; 1.2 GHz Intel; 512 MB RAM
> WAN link is 768 Kb
> Internal net is 100 Mb switched
> Kernel version - 2.4.20-20.7
> iptables version - 1.2.8
> 
> Any and all thoughts are greatly appreciated,
> Chris
> 



