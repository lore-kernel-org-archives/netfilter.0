From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: nf_conntrack_sip and nf_nat_sip not working
Date: Mon, 14 Dec 2009 10:45:26 +0100
Message-ID: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org
Cc: vhuertas@indra.es


Hi all,

I am tired of googling and try all the options I have found.
I have loaded moduls nf_conntrack_sip and nf_nat_sip:

cng@cng:~$ lsmod | grep nf
nf_nat_sip              6300  0
nf_conntrack_sip       17872  1 nf_nat_sip
nf_nat                 17808  2 nf_nat_sip,iptable_nat
nf_conntrack_ipv4      13352  7 iptable_nat,nf_nat
nf_conntrack           67608  7  
xt_helper,xt_state,nf_nat_sip,nf_conntrack_sip,iptable_nat,nf_nat,nf_conntrack_ipv4
nf_defrag_ipv4          1756  1 nf_conntrack_ipv4
binfmt_misc             8356  1

but they are not working.
I am facing oneway audio problem due to NAT because it does not change  
the private IP of the client in its Contact Field of the SIP message  
although that modules are loaded.
Maybe it is because of my iptables configuration (Am I forgetting to  
include some rules?):

#! /bin/bash

# The script is saved in /etc/firewall.bash

# Load modules:
/sbin/modprobe ip_tables
/sbin/modprobe iptable_nat
/sbin/modprobe iptable_filter
/sbin/modprobe nf_conntrack
/sbin/modprobe nf_conntrack_sip sip_direct_signalling=0 sip_direct_media=0
/sbin/modprobe nf_nat_sip

# Remove all rules and chains:
iptables -F
iptables -X

# Accept input connections:
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p udp -m multiport --dport 1025:60000 -j ACCEPT

# Forward:
iptables -A FORWARD -o eth0 -p udp -m multiport --dport 1025:60000 -j ACCEPT
iptables -A FORWARD -p udp -m multiport --dport 1025:60000 -d  
192.168.50.0/24 -j ACCEPT
iptables -t mangle -A FORWARD -m helper --helper sip -j CLASSIFY  
--set-class 1:1

# MASQUERADE:
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.1.3.207

# End message:
echo " [End iptables rules setting]"

Please, I really need help.

Thanks in advance,
Rebeca Martinez
