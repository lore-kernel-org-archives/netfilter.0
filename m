From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 19:19:00 +0100
Message-ID: <4B76ED14.7010809@chello.at>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 13.02.2010 00:03, netfilter-owner@vger.kernel.org wrote:
> I'am trying to setup nat on RHEL4 box.
> 
> Kernel: Linux 2.6.9-89.ELsmp x86_64x86
> iptables: 1.2.11
> 
> I have static public ip address on eth0 and 192.168.60.1 address on
> privat LAN (eth1)
> 
> Also I have tap0 (192.168.168.1) interface enabled and working openvpn
> connection to all hosts in privat LAN (including NAT box)
> 
> I have done this numerous times before. Never the less, I have problem
> now and I am stuck.
> 
> Current situation is this:
> 
> Working ping to www.google.com from servers inside. Also working ping
> with -s 1472 with don't fragment set  (full size packet).
> 
> Telnet from inside machine to www.google.com 80 works but I can't get
> any messages after I get connected (Just successfull telnet
> connection)
> 
> Accessing web from nat box is ok.
> 
> I have tried to sniff traffic and I have seen ACK, SYN ACK, ACK
> packets when trying to hit www.google.com from inside. After that I
> have IP bad-len: 0 messages (When I see inside them, these look like
> packets from google with HTML tags but something is wrong with them)
> 
> I found that this can be tcpmss problem and done --clamp-mss-to-mtu
> stuff but that didn't work either.
> Also tried setting mss to low value (250), just in case. Didn't help either.
> 
> What is the problem here? I dont see bugs on iptables version 1.2.11
> that can have this kind of impact on traffic.
> 
> These are my iptables rules
> 
> Quote:
> [root@natbox]# iptables -nvL
> Chain INPUT (policy DROP 1729 packets, 105K bytes)
> pkts bytes target prot opt in out source destination
> 611K 239M ACCEPT all -- eth0 * 0.0.0.0/0 0.0.0.0/0 state RELATED,ESTABLISHED
> 8311 795K ACCEPT all -- eth1 * 192.168.60.0/24 0.0.0.0/0
> 30548 2963K ACCEPT all -- tap0 * 192.168.168.0/24 0.0.0.0/0
> 48001 9271K ACCEPT all -- lo * 0.0.0.0/0 0.0.0.0/0
> 0 0 DROP all -- eth0 * 192.168.60.0/24 0.0.0.0/0
> 0 0 DROP all -- eth0 * 127.0.0.0/8 0.0.0.0/0
> 0 0 ACCEPT tcp -- eth0 * allowed_ssh_ip 0.0.0.0/0 tcp dpt:22
> 149 6297 ACCEPT udp -- eth0 * 0.0.0.0/0 0.0.0.0/0 udp dpt:1194
> 0 0 ACCEPT udp -- * * my_dns_server 0.0.0.0/0 udp spt:53
> 
> Chain FORWARD (policy DROP 28 packets, 1120 bytes)
> pkts bytes target prot opt in out source destination
> 4741 472K ACCEPT all -- eth1 eth0 0.0.0.0/0 0.0.0.0/0
> 398K 177M ACCEPT all -- tap0 eth1 0.0.0.0/0 0.0.0.0/0
> 135 20160 ACCEPT all -- eth0 eth1 0.0.0.0/0 0.0.0.0/0 state RELATED,ESTABLISHED
> 273K 87M ACCEPT all -- eth1 tap0 0.0.0.0/0 0.0.0.0/0 state RELATED,ESTABLISHED
> 
> Chain OUTPUT (policy ACCEPT 544K packets, 139M bytes)
> pkts bytes target prot opt in out source destination
> 
> [root@natbox]# iptables -nvL -t nat
> Chain PREROUTING (policy ACCEPT 18221 packets, 1683K bytes)
> pkts bytes target prot opt in out source destination
> 
> Chain POSTROUTING (policy ACCEPT 19019 packets, 1435K bytes)
> pkts bytes target prot opt in out source destination
> 3612 203K SNAT all -- * eth0 192.168.60.0/24 0.0.0.0/0
> to:my_public_ip
> Chain OUTPUT (policy ACCEPT 18070 packets, 1389K bytes)
> pkts bytes target prot opt in out source destination
> 
> [root@natbox]# iptables -nvL -t mangle
> Chain PREROUTING (policy ACCEPT 96895 packets, 30M bytes)
> pkts bytes target prot opt in out source destination
> 
> Chain INPUT (policy ACCEPT 67263 packets, 18M bytes)
> pkts bytes target prot opt in out source destination
> 
> Chain FORWARD (policy ACCEPT 29470 packets, 12M bytes)
> pkts bytes target prot opt in out source destination
> 15 900 TCPMSS tcp -- eth1 eth0 0.0.0.0/0 0.0.0.0/0 tcp flags:0x06/0x02
> TCPMSS clamp to PMTU
> 
> Chain OUTPUT (policy ACCEPT 60095 packets, 15M bytes)
> pkts bytes target prot opt in out source destination
> 
> Chain POSTROUTING (policy ACCEPT 90014 packets, 27M bytes)
> pkts bytes target prot opt in out source destination
> 

The rule-set looks okay for me.
Does it only happen with google.com, or with all web hosts?

I've seen issues like that on this list, where MSS, or tcp options been
the cause for mysterious connection hanging.
Look how you have set the /proc/sys/net/ipv4/tcp_* options.
Especially tcp_sack, tcp_dsack, tcp_ecn. There's a lot of options there
and they may differ depending on kernel version and distro patchlevel.
Try to disable 'special' options.
Post what could be relevant, if trying does not help.

Also you could try to place a log rule before the filter table FORWARD
chain policy hits. Maybe packets get dropped for some reason i.e.
INVALID state (as you don't log/drop them in your rule-set).

Best regards

Mart
