From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Ask an issue about how can I let netfilter-nat work normally, thanks
Date: Thu, 31 May 2012 13:13:10 -0400
Message-ID: <CACuyg27F+d3_zyWz34Fvujc9=ttMX-7feF2=Gj_bLwsgBukZWg@mail.gmail.com>
References: <BAY146-W327D42337C6D284F3060A6900A0@phx.gbl>
	<CACuyg24uZuUda3xEGD1bAVspH1WALoZ9ma+E0UbsNDb8V6Rxvg@mail.gmail.com>
	<BAY146-W53DA36C0BC4E3B216E4365900B0@phx.gbl>
	<BAY146-W5A2226B7A9B278ED0F27A900B0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=RkxkfKTTz+E7z430QzF9ty+qhPtlWM5mbJv5r5oOew4=;
        b=b2FLAMu2evvzHwJzfUCRo9iZG/n9gjBlsMx6+2Hb+QcJl//SGzRBAS5bbzDJ2Wbk/T
         61BtTe7DuvCMMIwQ4bSRLkAN2sbKb1ZDAtYybub7qpyR5z07zmfBp06/xFb1rbNgFiK8
         Xi8RBk3Zvlu8J4GE9W9tHqTfYgCx1gZCZ1P+WaIqtj8hvORJ0+ilIai3nukZUYcJdnwj
         5xQ/neT2DINEL14n132qRT3MWURGfGKB1kWPVZg63n3GdG+Ivstp6T9Ij8n3lbJUsNAG
         OgJ74fI/PDJ6yV2ty/881BuAgQfn7ZLZEoECKfC/3tBC/yw+fE/Q2m39OAjKKt1p0nde
         h9mQ==
In-Reply-To: <BAY146-W5A2226B7A9B278ED0F27A900B0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: miao hongbing <miao_hb@hotmail.com>
Cc: netfilter@vger.kernel.org

Hi,

It would be better if you run tcpdump on the firewall to know if NAT
is working and if packets is being sent by WAN interface.

For example...
Firewall IP: 192.168.0.1
LAN: eth0
WAN: eth1

- Analyzing how the packets are received.
tcpdump -i eth0 host <internal_address> -n

- Analyzing how packets are forwarded.
tcpdump -i eth1 host <target_internet_address> -n
tcpdump -i eth1 udp port 53 -n
tcpdump -i eth1 tcp port 80 or udp port 53 -n

1. Who is your DNS server?
I saw DNS queries to 192.168.1.1, correct? But apparently it is *not
working well*... Take long time to identify the IP address
119.75.217.56 as www.baidu.com. Despite the delay, the address was
translated.

Try to test with google DNS server: 8.8.8.8
You can also install *bind* in the firewall for DNS caching.


2. What are your FORWARD rules?
iptables -nL FORWARD -v

You can send the contents of iptables-save too - It gets easier.

If you do this, it works (only for tests....)?
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -I FORWARD -j ACCEPT
iptables -t nat -I POSTROUTING -j MASQUERADE


2012/5/31 miao hongbing <miao_hb@hotmail.com>:
>
>
> Hi,
>
> Below is my log:
> " iptables -t nat -nL -v" in my router debug board
> " tcpdump -i eth0 host 192.168.0.100 -n", in my laptop computer, pls kindly check it, thanks!
>
> # iptables -t nat -nL -v (in my router board, its IP address is 192.168.0.1)
> Chain PREROUTING (policy ACCEPT 9966 packets, 1438K bytes)
> pkts bytes target prot opt in out source destination
> Chain POSTROUTING (policy ACCEPT 34 packets, 5118 bytes)
> pkts bytes target prot opt in out source destination
> 792 57396 MASQUERADE all -- * vlan1 192.168.0.0/24 0.0.0.0/0
> 0 0 MASQUERADE all -- * vlan1 192.168.2.0/24 0.0.0.0/0
> Chain OUTPUT (policy ACCEPT 34 packets, 5118 bytes)
> pkts bytes target prot opt in out source destination
>
> [root@localhost ~]# tcpdump -i eth0 host 192.168.0.100 -n (in my laptop computer, its ipaddress is 192.168.0.100, connected with the above router-192.168.0.1)
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
> 19:38:15.640847 IP 192.168.0.100.32851 > 192.168.1.1.domain: 36823+ AAAA? www.baidu.com. (31)
> 19:38:20.640079 arp who-has 192.168.0.1 tell 192.168.0.100
> 19:38:20.640478 arp reply 192.168.0.1 is-at 00:90:4c:23:00:2a
> 19:38:20.642144 IP 192.168.0.100.32852 > 61.147.37.1.domain: 36823+ AAAA? www.baidu.com. (31)
> 19:38:25.641916 IP 192.168.0.100.32851 > 192.168.1.1.domain: 36823+ AAAA? www.baidu.com. (31)
> 19:38:30.643776 IP 192.168.0.100.32852 > 61.147.37.1.domain: 36823+ AAAA? www.baidu.com. (31)
> 19:38:30.653020 IP 61.147.37.1.domain > 192.168.0.100.32852: 36823 1/0/0 CNAME[|domain]
> 19:38:30.656650 IP 192.168.0.100.32852 > 192.168.1.1.domain: 29489+ A? www.baidu.com. (31)
> 19:38:35.656382 IP 192.168.0.100.32853 > 61.147.37.1.domain: 29489+ A? www.baidu.com. (31)
> 19:38:40.657240 IP 192.168.0.100.32852 > 192.168.1.1.domain: 29489+ A? www.baidu.com. (31)
> 19:38:45.657177 IP 192.168.0.100.32853 > 61.147.37.1.domain: 29489+ A? www.baidu.com. (31)
> 19:38:45.665321 IP 61.147.37.1.domain > 192.168.0.100.32853: 29489 3/4/4 CNAME[|domain]
> 19:38:45.669434 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6222599 0,nop,wscale 2>
> 19:38:48.668814 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6225599 0,nop,wscale 2>
> 19:38:54.667690 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6231599 0,nop,wscale 2>
> 19:39:06.666439 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6243599 0,nop,wscale 2>
> 19:39:11.666343 arp who-has 192.168.0.1 tell 192.168.0.100
> 19:39:11.666676 arp reply 192.168.0.1 is-at 00:90:4c:23:00:2a
> 19:39:30.662416 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6267599 0,nop,wscale 2>
> 19:40:18.655200 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6315599 0,nop,wscale 2>
> 20 packets captured
> 20 packets received by filter
