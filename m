From: Jacob Friis Larsen <jfl@list.idg.dk>
Subject: Tips for script
Date: Thu, 05 Aug 2004 02:04:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4111799E.5060607@list.idg.dk>
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
To: netfilter@lists.netfilter.org

Would this script work like this:
- Allow all outgoing.
- Allow all to port 80, 21, 22, 25, 143

What else does it do?
Any tips?

I got it from http://iptables-script.dk/index1.php

Thanks,
Jacob


#!/bin/sh

# iptables script generator: V0.1-2002
# Comes with no warranty!
# e-mail: michael@1go.dk

# Diable forwarding
echo 0 > /proc/sys/net/ipv4/ip_forward

WAN_IP='x.x.x.x'
WAN_NIC='eth0'

# load some modules (if needed)
modprobe ip_nat_ftp
modprobe ip_conntrack_ftp

# Flush
iptables -t nat -F POSTROUTING
iptables -t nat -F PREROUTING
iptables -t nat -F OUTPUT
iptables -F

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Open ports on router for server/services
iptables -A INPUT -j ACCEPT -p tcp --dport 80
iptables -A INPUT -j ACCEPT -p tcp --dport 21
iptables -A INPUT -j ACCEPT -p tcp --dport 22
iptables -A INPUT -j ACCEPT -p tcp --dport 25
iptables -A INPUT -j ACCEPT -p tcp --dport 143

# STATE RELATED for router
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Enable forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward


