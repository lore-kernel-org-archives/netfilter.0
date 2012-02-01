From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: ipset & iptables
Date: Wed, 01 Feb 2012 17:32:48 +0100
Message-ID: <1328113968.13053.18.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have problems matching an ipset set using iptables. My configuration
is as follows:

# uname -r
2.6.39.1

# iptables -V
iptables v1.4.12.2

# ipset -V
ipset v6.11, protocol version: 6

The following 3 commands are executed immediately after each other:

# ipset create TEST hash:ip
# ipset add TEST 127.0.0.5
# iptables -A INPUT -m set --match-set TEST src
iptables: No chain/target/match by that name.

# lsmod|grep set
ip_set_hash_net        15884  3 
ip_set_hash_ip         13584  2 
ip_set                 19151  2 ip_set_hash_net,ip_set_hash_ip
nfnetlink               3191  2 nf_conntrack_netlink,ip_set

# ipset list TEST
Name: TEST
Type: hash:ip
Header: family inet hashsize 1024 maxelem 65536 
Size in memory: 8264
References: 0
Members:
127.0.0.5

I don't get it: ipset says the set exists and has a member (if that
matters anything), but iptables doesn't see it. What am I missing?


--
Rob


