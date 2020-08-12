From: sean darcy <seandarcy2@gmail.com>
Subject: ingress hook on interface with multiple addresses ?
Date: Wed, 12 Aug 2020 11:41:34 -0400
Message-ID: <rh12jg$1392$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have an interface with 2 ip addresses:

ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
group default qlen 1000
............
2: enp1s0f1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel 
state UP group default qlen 1000
     link/ether 98:29:a6:48:49:8e brd ff:ff:ff:ff:ff:ff
     inet 10.0.0.61/24 brd 10.0.0.255 scope global noprefixroute enp1s0f1
        valid_lft forever preferred_lft forever
     inet 10.0.0.2/32 scope global noprefixroute enp1s0f1
        valid_lft forever preferred_lft forever

When I try to add a chain on ingress hook, nft is unhappy:

nft list table netdev foo
table netdev foo {
	set allowlist {
		type ipv4_addr
		flags interval
		auto-merge
		elements = { 10.0.0.0/8, 127.0.0.1 }
	}
}


nft 'add chain netdev foo dev0filter { type filter hook ingress device 
enp1s0f1 priority 0 ; }'
Error: Could not process rule: No such file or directory
add chain netdev foo dev0filter { type filter hook ingress device 
enp1s0f1 priority 0 ; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Can you have a chain on ingress hook for an interface that has multiple 
addresses ? If so, how?


