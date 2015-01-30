From: Martin <develop@imagmbh.de>
Subject: Strange / irritating behaviour with NAT using Mark-based-Routing
Date: Fri, 30 Jan 2015 16:05:41 +0100
Message-ID: <1454470.IdrAbzO46p@term0>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Hello!

I have the following szenario:

 - client in a private net,
 - firewall (Ubuntu 14.04) with two uplinks (different providers and subnets) to 
internet,
 - I want to route some packets via provider1, some packets via provider2 
based on some criteria, selected by iptables-marks.

To simulate the szenario, I built some virtual machines:
 (a) my client (10.253.1.2/24) and gateway 10.253.1.1
 (b) my firewall
   - 10.253.1.1/24 (my private net)
   - 10.251.1.15/24 (simulation of "internet" of provider1)
   - 10.252.1.15/24 (simulation of "internet" of provider2)
 (c) the gateway of provider1
   - 10.251.1.11/24
   - 10.250.1.11/24 (upstream to destination server)
 (d) the gateway of provider2
   - 10.252.1.11/24
   - 10.250.1.12/24 (upstream to destination server)
 (e) the destination-server-firewall
   - 10.250.1.1/24
   - 10.249.1.1/24
 (f) the destination-server
    - 10.249.1.10/24

All machines have the default policy: accept and 
echo 1 > /proc/sys/net/ipv4/ip_forward

On the firewall (b) I did

ip route add default via 10.251.1.11 table provider1
ip route add default via 10.252.1.11 table provider2

ip route add 10.253.1.0/24 dev eth2 table provider1
ip route add 10.253.1.0/24 dev eth2 table provider2

ip rule add from all fwmark 0x02/0x02 prohibit
ip rule add from all fwmark 0x02/0x02 table provider2

ip rule add from all fwmark 0x01/0x01 prohibit
ip rule add from all fwmark 0x01/0x01 table provider1

ip route add default via 10.251.1.11 table main
iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to 10.251.1.15
iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 10.252.1.15

iptables -A PREROUTING -t mangle -p icmp -j MARK --set-mark 0x02/0x02

For debugging purpose I did a logging of martian-packages.

If I ping from my client (10.253.1.2) to the server (10.249.1.10),  the 
packages where correctly natted and answerd by the server. On the external 
interface of the firewall (b) routing to provider2 I can see the reply-packages 
from 10.249.1.10 to 10.252.1.15. Seems to be correct.

But these reply-packets were not de-natted and sent to my client. I can see, 
these packets were de-nattet to
"from 10.249.1.10 to 10.253.1.2"
but they were sent back to the external interface they came in.

If I do a 
"echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter" or
"echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter"
I can see the packages two times on the external interface routing to 
provider2. Once "from 10.249.1.10  to 10.252.1.15" and once "from 10.249.1.10 
to 10.253.1.2".

So why does the kernel send these packages back to the external interface 
instead of sending them to the internal one?

And, very strange in my opinion: If I do the decision based on the IP address
ip rule add from 10.253.1.2/32 prohibit
ip rule add from 10.232.1.2/table provider2
it works fine, no martian packages.

Do you have any idea what is wrong?

Thanks!

Martin






