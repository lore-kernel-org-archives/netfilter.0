From: Frank Wallingford <frank.wallingford@technologist.com>
Subject: tcp forwarding with a local source isn't working
Date: Sun, 08 Dec 2002 14:15:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF39A60.9030808@technologist.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: netfilter@lists.netfilter.org

Here's one I can't quite wrap my head around.

I got tcp port forwarding working from machine 192.168.0.100 to machine 
192.168.0.200 with two rules:

iptables -t nat -A PREROUTING -d 192.168.0.100 -p tcp --dport 22 \
   -j DNAT --to 192.168.0.200
iptables -t nat -A POSTROUTING -d 192.168.0.200 -p tcp --dport 22 \
   -j SNAT --to 192.168.0.100

I realized that I needed the second rule because the hosts were on the 
same network, and without it, replies from .200 would go straight to the 
source.

This works for all machines *except* 192.168.0.100. I wanted to connect 
from .100 to .100 on the port, and have it forwarded to .200. First, I 
realized that I needed a rule on OUTPUT, because locally generated 
packets don't traverse PREROUTE. So for testing, I flushed all the 
rules, and started over with:

iptables -t nat -A OUTPUT -d 192.168.0.100 --dport 22 \
   -j DNAT --to 192.168.0.200

Now, I'm only trying to get this one case working:

(from machine 192.168.0.100:) ssh 192.168.0.100

and I'd like it to connect to 192.168.0.200. I'm not sure why it isn't.

I've also tried the above rule with a second SNAT rule, which doesn't help.

 From what I understand, this should be the case:
(1) The packet starts as
     SOURCE: 192.168.0.100:port_a (some random port)
     DEST:   192.168.0.100:22
(2) While traversing the OUTPUT chain in the NAT table, it's changed:
     SOURCE: 192.168.0.100:port_a
     DEST:   192.168.0.200:22
(3) The packet is sent out
(4) Host 192.168.0.200 sees it and sends the reply
     SOURCE: 192.168.0.200:22
     DEST:   192.168.0.100:port_a
(5) The packet arrives, and is un-snat'd:
     SOURCE: 192.168.0.100:22
     DEST:   192.168.0.100:port_a
(6) The local process sees a reply from the local machine, and accepts it.

What's actually happening is that it's getting as far as (4), and the 
reply comes in, but the local process doesn't accept it. I'm guessing 
this is because it wasn't un-snat'd correctly, or I'm doing something wrong.

I've also tried a few permutations of putting 0 in 
/proc/sys/net/ipv4/conf/eth0/rp_filter, in case something weird was 
happening there.


I would be grateful if anyone had any insight into why this doesn't 
work, what I'm doing wrong, or how to forward a tcp port from machine A 
to machine B and have it work when the packets originate from machine A 
itself.

Thanks,

-- 
----------------------------------
Frank Wallingford
frank.wallingford@technologist.com


