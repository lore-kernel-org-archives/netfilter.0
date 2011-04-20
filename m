From: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Subject: Problem with SNAT trying to configure a load balancing router
Date: Wed, 20 Apr 2011 13:48:43 -0430
Message-ID: <1303323523.25148.10.camel@uqbar.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:content-type:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=etev+1qZwNN3Nv+cseHy80oG0FPa2RvD0NoSVORwRuk=;
        b=PoEO6yhngL6lmHsaWgIXpG4BPxZRKhM/KzjpyUGddPcGwJ35kHep2ySKQ+QZJyxO10
         LXW5uYgYJ7CcMQh0OAd29K6h5tBCAFkgVL1NJCW7o4h2U3f8hNcNGO6O0Bp0uiXa/s11
         a0U4IX7ZETw3bgq7wYoppe/LRxKrvfLNdK/6w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I had problems trying to configure two ISP links on a Linux router with
Netfilter and iproute2. Both links are 1Mbps. 

The ISP1's routing table is called 'CANTV' and its network interface is
called 'wan'. ISP2 is 'Inter' and network interface 'wan2'. Both ISP
gives me IP addresses via DHCP.

After bringing up both links and some manual fix and addons to routing
tables, rules and Netfilter's SNAT, we have the following:

# ip rule
0: from all lookup local 
32747: from all fwmark 0x2 lookup Inter 
32748: from all fwmark 0x1 lookup CANTV 
32750: from x.x.90.26 lookup Inter 
32751: from x.x.222.247 lookup CANTV 
32766: from all lookup main 
32767: from all lookup default 

# ip route show table main
x.x.192.0/19 dev wan proto kernel scope link src x.x.222.247 
x.x.64.0/18 dev wan2 proto kernel scope link src x.x.90.26 
default via x.x.192.1 dev wan
default via x.x.64.1 dev wan2

# ip route show table Inter
x.x.64.0 dev wan2 scope link src x.x.90.26 
default via x.x.64.1 dev wan2

# ip route show table CANTV
x.x.192.0 dev wan scope link src x.x.222.247 
default via x.x.192.1 dev wan

At this point I have some questions:

1) The routing path "127.0.0.0/8 dev lo  scope link" needs to be in both
routing tables? if so, why? what is its purpose?

2) The main routing table had to have both default routes like above or
this is a mistake in the addition? only one (the "default", i.e.
preferred) gateway or both using multipath nexthop mechanism?

Regardless what configuration is used, some packets leaves one interface
with the IP address of the other, so I hoped this can be fixed with two
NAT rules:

# iptables -t nat -F
# iptables -t nat -A POSTROUTING -o wan2 -j SNAT --to-source x.x.90.26
# iptables -t nat -A POSTROUTING -o wan -j SNAT --to-source x.x.222.247
# conntrack -F
# ip route flush cache

However this only reduces the routing of packets with the incorrect
address but is not completely stopped. I.e. SNAT seems to be not
applying to all the traffic, maybe only to certain combination of TCP
flags. 

What I did used to test the behavior of SNAT was marking all outbound
traffic with 0x01 or 0x02 to let the routing rules decide routing all
packets to ISP1 or ISP2 and look at two simultaneous tcpdump running
instances.

# iptables -t mangle -F
# iptables -t mangle -A OUTPUT -j MARK --set-mark 1 # or --set-mark 2

This marks all OUTPUT packets regardless anything (NEW,
ESTABLISHED, ...)? If so, why not all these packets, after crossing
routing tables and are ready to be sent to wan/wan2 are natted?

I'm doing something wrong or the SNAT code in my kernel exhibits this
wrong behaviour?

Also, ip_forward is 1 and rp_filter is 0.

(Debian Linux 2.6.38-2-amd64 / iptables 1.4.10)

Thanks in advance,
Emilio Lazo Zaia.

