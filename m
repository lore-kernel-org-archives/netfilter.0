From: Michal Kepien <lordpopcorn@poczta.onet.pl>
Subject: Re: Firewall Setup on RH 9
Date: Fri, 04 Jul 2003 23:54:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <n6tbgvkvn94tuq3f8m01d5rah2n97tgnol@4ax.com>
References: <016201c33fa7$5c755eb0$660210ac@christo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <016201c33fa7$5c755eb0$660210ac@christo>
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
To: Christo Bezuidenhout <christo@it4africa.co.za>
Cc: netfilter@lists.netfilter.org

>2. Both NIC1 and NIC3 Should be able to Connect VIA NIC2 to Internet.=20
>NIC1 Should be able to connect to NIC3 but NIC3 must not be ABLE to
>Connect to NIC1 's network

NIC1 ---> eth0
NIC2 ---> eth1
NIC3 ---> eth2

NIC1's NETWORK: 192.168.0.0
NIC3's NETWORK: 192.168.1.0

NIC2's IP (external): 123.45.67.89 (an example - replace with real)

---START firewall-rules---
#!/bin/bash

# Enable forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Flush all rules, user chains and packet counters
iptables -F
iptables -X
iptables -Z

# Set default policies to DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Create a custom chain, which will handle suspicious packets
iptables -N drop-and-log
iptables -A drop-and-log -j LOG --log-level info
iptables -A drop-and-log -j REJECT

# Enable loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

######## INPUT rules ########
# First, deny packets from NIC3 to NIC1
iptables -A INPUT -i eth2 -s 192.168.1.0/24 -d 192.168.0.0/24 -j DROP

# Then, enable all other packets (needed for Internet access)
iptables -A INPUT -i eth0 -s 192.168.0.0/24 -d 0.0.0.0/0 -j ACCEPT
iptables -A INPUT -i eth2 -s 192.168.1.0/24 -d 0.0.0.0/0 -j ACCEPT

# Next, protect from IP spoofing
iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 0.0.0.0/0 -j
drop-and-log
iptables -A INPUT -i eth1 -s 192.168.1.0/24 -d 0.0.0.0/0 -j
drop-and-log

# Also, accept packets from the Internet
iptables -A INPUT -i eth1 -s 0.0.0.0/0 -d 0.0.0.0/0 -m state --state
ESTABLISHED,RELATED -j ACCEPT

# Finally, log everything else (and drop it)
iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -j drop-and-log

######## OUTPUT rules ########
# We don't need to deny the packets from NIC3 to NIC1 once more as
# every packet goes through the INPUT chain _first_

# Accept re-masqueraded packets for both networks
iptables -A OUTPUT -o eth0 -s 0.0.0.0/0 -d 192.168.0.0/24 -j ACCEPT
iptables -A OUTPUT -o eth2 -s 0.0.0.0/0 -d 192.168.1.0/24 -j ACCEPT

# Deny stuffed routing
iptables -A OUTPUT -o eth1 -s 0.0.0.0/0 -d 192.168.0.0/24 -j
drop-and-log
iptables -A OUTPUT -o eth1 -s 0.0.0.0/0 -d 192.168.1.0/24 -j
drop-and-log

# Accept the packets going into the Internet
iptables -A OUTPUT -o eth1 -s 0.0.0.0/0 -d 0.0.0.0/0 -j ACCEPT

# Log everything else (and drop it)
iptables -A OUTPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -j drop-and-log

######## FORWARD rules ########
# Enable incoming packets re-masquerading
iptables -A FORWARD -i eth1 -o ! eth1 -m state --state
ESTABLISHED,RELATED -j ACCEPT

# Enable outgoing packets masquerading
iptables -A FORWARD -i ! eth1 -o eth1 -j ACCEPT

# Log everything else (and drop it)
iptables -A FORWARD -j drop-and-log

# Configure the routing
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 123.45.67.89

---END firewall-rules---

This should do it. I've tested the script and it didn't cause any
errors, but this doesn't mean it _has to_ work as it is supposed to
(I've got a different configuration and so I couldn't test it for
real). Perhaps you may need to adjust the above script a bit for your
specific configuration. I'm also only a human and may have forgotten
something.

Just run the script from anywhere (e.g. './firewall-rules') and the
rules should be set.

BTW - why is there no packet tester in iptables (like the 'ipchains
-C' command)? This little thing was _so_ useful...

Michal Kepien

