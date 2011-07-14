From: Jenny Lee <bodycare_5@live.com>
Subject: Which one is better to use? "tcp_tw_recycle" or
 "tcp_max_tw_buckets"?
Date: Thu, 14 Jul 2011 15:07:55 +0000
Message-ID: <BAY163-w2797EF3FCFE37602CD0FE7CC460@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hello,

I have a situation where I am running out of ephemeral ports.
 
* iptables-1.4.7-3
* RHEL6 x64 Machine (kernel-2.6.32-71). 
* I have 64K available ephemeral ports. 
* I am using squid.
* Client is using CONNECT (HTTP inside) through squid, doing 500 reqs/second. Squid has many parents.
* Squid outgoing IP is SNAT'ted to 1000 IPs. 
 
Persistent connections and all did not do any good for me. Squid developers were very helpful, implemented many improvements for me but still no use.
 
Apparently this 64K limit per tuple does not seem to work as intended. I have many IPs, yet all hell breaks loose when 64K ports are used up. The max amount of TIME_WAITs from a single IP I have seen is 15K, yet I run out of ports at 64K.
 
 
Prior to ephemeral port exhaustion, I was running out of ConnTrack table entries. This is fixed with:
 
echo 196608 > /proc/sys/net/netfilter/nf_conntrack_max
echo 196608 > /sys/module/nf_conntrack/parameters/hashsize
 
 
I have tried fiddling with all kinds of values (including tcp_tw_reuse with tcp timestamps), timeouts, etc. but nothing helped.
 
I have 2 solutions (tcp timestamps on):
 
* tcp_tw_recycle: This solved all my issues. I have not experienced any visible problems. Client can do > 1000 reqs/sec.
* tcp_max_tw_buckets: Redhat default is 180K. Keeping this at 64K helps. Kernel emits "TIME_WAIT bucket overflow" occassionally. But everythign seem to be working.
 
My question:
 
Which one would be wiser to do: 
 
To keep "tcp_tw_recycle" on, or to keep "tcp_max_tw_buckets" at 64K where I will get bucket overflow errors once an hour for couple of seconds?
 
Thank you in advance.
 
Jenny

  		 	   		  