From: MT <info@open2web.com>
Subject: Nefilter problem
Date: Fri, 20 Jun 2003 19:31:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030620193111.32225411.info@open2web.com>
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
Content-Type: text/plain; charset="us-ascii"
To: NetFilter <netfilter@lists.netfilter.org>

I have a RH 7.1 box which has iptables v1.2.5. I've set up my rc.firewall script based and started testing it. Lo and behold I couldn't ssh into the box, although I could ssh out. Nor could I ping the box either. After many attempts and playing around with the code, I boiled it down to the following:

#!/bin/bash

CONNECTION_TRACKING=1

# Remove any existing rules from all chains
iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

# Set the default policy to drop
iptables --policy INPUT   DROP
iptables --policy OUTPUT  DROP
iptables --policy FORWARD DROP

# Don't set nat and mangle tables to DROP unless
# you know what you're doing
# nat
# iptables -t nat --policy PREROUTING  DROP
# iptables -t nat --policy OUTPUT DROP
# iptables -t nat --policy POSTROUTING DROP

# mangle
# iptables -t mangle --policy PREROUTING DROP
# iptables -t mangle --policy OUTPUT DROP

# Remove any pre-existing user-defined chains
iptables --delete-chain
iptables -t nat --delete-chain
iptables -t mangle --delete-chain

###############################################################

# Set traffic on the loopback interface to unlimited

iptables -A INPUT -i $LOOPBACK_INTERFACE -j ACCEPT
iptables -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT

###############################################################

# allow incoming pings from trusted hosts
if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A INPUT  -i $INTERNET -p icmp \
             -s $MY_ISP --icmp-type echo-request -d $IPADDR \
             -m state --state NEW -j ACCEPT
fi
 
iptables -A INPUT  -i $INTERNET -p icmp \
         -s $MY_ISP --icmp-type echo-request -d $IPADDR -j ACCEPT

iptables -A OUTPUT -o $INTERNET -p icmp \
         -s $IPADDR --icmp-type echo-reply -d $MY_ISP -j ACCEPT

###############################################################
exit 0

As it stands, I still can't ping the box. As soon as I bring down the firewall I can ping again.

Here's what lsmod yields:

Module                  Size  Used by
ipt_state                576   1  (autoclean)
iptable_mangle          1728   0  (autoclean) (unused)
iptable_nat            13904   0  (autoclean) (unused)
iptable_filter          1728   0  (autoclean) (unused)
ip_tables              11168   6  [ipt_state iptable_mangle iptable_nat iptable_filter]
ip_conntrack_ftp        3376   0  (unused)
ip_conntrack           13360   3  [ipt_state iptable_nat ip_conntrack_ftp]
via-rhine              10784   1  (autoclean)
ide-cd                 26976   0 
cdrom                  27456   0  [ide-cd]

I hope this is enough information. Thanks.

Mark

