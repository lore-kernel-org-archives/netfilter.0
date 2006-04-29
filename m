From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Not NATed packets
Date: Sat, 29 Apr 2006 20:44:53 +0200
Message-ID: <e30c75$sm0$1@sea.gmane.org>
References: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>
	<e2goe1$f34$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e2goe1$f34$1@sea.gmane.org>
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

Petr Pisar wrote:
> lukas@tank.eu.org wrote:
> 
>>NAT configuration is simple but some packets are not NATed - on my
>>public interface packets with source address of my internal (NATed)
>>network appears and i have no clue what is wrong.
> 
> 
>>16:30:39.015880 IP (tos 0x0, ttl 127, id 28594, offset 0, flags [DF],
>>proto: TCP (6), length: 40) 10.10.10.104.3689 > 83.29.48.50.6881: F,
>>cksum 0x1623 (correct), 3885889894:3885889894(0) ack 3151418643 win 65535
> 
> Exactly. I can see only FIN packets which are not translated. After
> looking into conntrack table, I think MASQ ignores FIN packets that are
> missing in conntrack table (Is it INVALID or NEW state?).
> 

So, I'm able to reproduce this bug. Simply send untracked FIN pakcet 
from intranet station to the Internet:

$ hping2 -c 1 -F 1.2.3.4
HPING 1.2.3.4 (eth1 1.2.3.4): F set, 40 headers + 0 data bytes

--- 1.2.3.4 hping statistic ---
1 packets tramitted, 0 packets received, 100% packet loss
round-trip min/avg/max = 0.0/0.0/0.0 ms

And dump traffic on your gateway:

$ tcpdump -i ppp0 -n net  192.168.0.0/24
tcpdump: listening on ppp0
20:30:36.304397 192.168.0.2.1039 > 1.2.3.4.0: F 2063212909:2063212909(0) 
win 512


> Very strange behaviour have counters too. These strange packets are not
> loggable after MASQ rule. It seems like a bug.
> 

Here is my POSTROUTING chain (ppp0 is public interface):

Chain POSTROUTING (policy ACCEPT 783 packets, 126K bytes)
  pkts bytes target     prot opt in     out     source 
destination
   897 54437 LOG        all  --  *      *       0.0.0.0/0 
0.0.0.0/0           LOG flags 2 level 4 prefix `PRE'
  4531  365K MASQUERADE  all  --  *      ppp0    0.0.0.0/0 
0.0.0.0/0
    38  2258 LOG        all  --  *      *       0.0.0.0/0 
0.0.0.0/0           LOG flags 2 level 4 prefix `POST'

and after doing this excercise I can't see any change on counters in 
POSTROUTING chain. Naturaly I can't see anything in the kernel log (as 
you can see, I log everything before MASQ and after that).

I seems, these magic packets are completly bypassing POSTROUTING chain.

I found out too that TCP traffic goes inside this chain only with first 
SYN packet. After that there the packets are I don't see them anymore. 
Is it normal?

-- Petr


