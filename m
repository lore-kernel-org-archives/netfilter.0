From: sean darcy <seandarcy2@gmail.com>
Subject: sets must have more than 2 elements , and can't "include" a set
Date: Thu, 9 Jul 2020 12:27:04 -0400
Message-ID: <re7ggq$e6l$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Fedora 32 : nftables-0.9.3-3.fc32.x86_64

I'm having trouble debugging a netdev script. I'm getting an error 
including a set definition. So I tried a short test script that shows 
another problem:


flush ruleset

  define whitelist_ips = {
     127.0.0.1 ,
     10.0.0.0/24 ,
     1.1.1.1
     }

table netdev netdev1 {
        set whitelist {
                 type ipv4_addr
                 flags interval
                 auto-merge
                 elements = $whitelist_ips
         }

         chain ingress1 {
		type filter hook ingress device enp1s0f1 priority 0; policy accept;
                 #accept whitelist
                 ip saddr @whitelist accept
         }
}

This works:

nft list table netdev netdev1
table netdev netdev1 {
	set whitelist {
		type ipv4_addr
		flags interval
		auto-merge
		elements = { 1.1.1.1, 10.0.0.0/24,
			     127.0.0.1 }
	}

	chain ingress1 {
		type filter hook ingress device "enp1s0f1" priority filter; policy accept;
		ip saddr @whitelist accept
	}
}

But if I take out one whitelist element:

cat 5tmp
flush ruleset

  define whitelist_ips = {
     127.0.0.1 ,
     10.0.0.0/24
     }

table netdev netdev1 {
        set whitelist {
                 type ipv4_addr
                 flags interval
                 auto-merge
                 elements = $whitelist_ips
         }

         chain ingress1 {
		type filter hook ingress device enp1s0f1 priority 0; policy accept;
                 #accept whitelist
                 ip saddr @whitelist accept
         }
}

It doesn't work, with odd error messages:

nft -f 5tmp
5tmp:17:15-22: Error: Could not process rule: No such file or directory
         chain ingress1 {
               ^^^^^^^^
5tmp:20:17-42: Error: Could not process rule: No such file or directory
                 ip saddr @whitelist accept
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^

And if I try to use include for the whitelist:

flush ruleset
include "./w1"
# define whitelist_ips = {
#    127.0.0.1 ,
#    10.0.0.0/24
#    }
............

cat ./w1
define whitelist_ips = {
     127.0.0.1 ,
     10.0.0.0/24 ,
     1.1.1.1 }

I get odder error messages:

nft -f 5tmp
In file included from 5tmp:3:1-15:
./w1:18:15-22: Error: Could not process rule: No such file or directory

In file included from 5tmp:3:1-15:
./w1:21:17-42: Error: Could not process rule: No such file or directory

Which may be related to the first problem.

Any help appreciated.

sean



