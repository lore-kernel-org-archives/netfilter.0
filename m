From: "per jarevez" <perj8@hotmail.com>
Subject: ipt_TARPIT generating illegal traffic ... skips POSTROUTING
Date: Sat, 14 Jun 2003 22:05:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F105d3G2VgUg8M0005ffd0@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Some packets 
(http://lists.netfilter.org/pipermail/netfilter/2003-June/044844.html) not 
masqueraded and routed out raw with src address of my internal box.

In addition to the thread above,
# tcpdump -npi ppp1 net 65.24/16
I get nothing no packets when they are showing on ppp0. Both tcpdumps are 
running simultaneously.
# tcpdump -npi ppp0 net 65.24/16
17:10:05.055600 65.24.XXX.238.56992 > 65.XXX.XXX.2.2662: S 
3924597812:3924597812(
0) win 52000 <mss 1460> (DF)
17:10:05.055885 10.1.0.100.2662 > 65.24.XXX.238.56992: S 
2933399770:2933399770(0
) ack 3924597813 win 5 (DF)
...

The router must be generating the replies, I looked into the PREROUTING and 
FORWARD chains of my iptables firewall.  These packets were matching the 
TARPIT target in my FORWARD chain after they have been DNAT to 10.1.0.100 in 
PREROUTING!

So of course ipt_TARPIT must be responsible for generating the replies 
without going through the POSTROUTING chain.  None of the reply packets by 
ipt_TARPIT were masqueraded!  I removed ipt_TARPIT target and everything is 
okay now.

ipt_TARPIT should forward its reply packets through POSTROUTING though!  and 
not directly out the interface.  This is a ipt_TARPIT bug.

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*.  
http://join.msn.com/?page=features/featuredemail


