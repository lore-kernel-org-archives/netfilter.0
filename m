From: miao hongbing <miao_hb@hotmail.com>
Subject: RE: Ask an issue about how can I let netfilter-nat work normally,
 thanks
Date: Thu, 31 May 2012 11:59:07 +0000
Message-ID: <BAY146-W5A2226B7A9B278ED0F27A900B0@phx.gbl>
References: <BAY146-W327D42337C6D284F3060A6900A0@phx.gbl>,<CACuyg24uZuUda3xEGD1bAVspH1WALoZ9ma+E0UbsNDb8V6Rxvg@mail.gmail.com>,<BAY146-W53DA36C0BC4E3B216E4365900B0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY146-W53DA36C0BC4E3B216E4365900B0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: betolj@gmail.com
Cc: netfilter@vger.kernel.org



Hi,

Below is my log:
" iptables -t nat -nL -v" in my router debug board
" tcpdump -i eth0 host 192.168.0.100 -n", in my laptop computer, pls kindly check it, thanks!

# iptables -t nat -nL -v (in my router board, its IP address is 192.168.0.1)
Chain PREROUTING (policy ACCEPT 9966 packets, 1438K bytes)
pkts bytes target prot opt in out source destination 
Chain POSTROUTING (policy ACCEPT 34 packets, 5118 bytes)
pkts bytes target prot opt in out source destination 
792 57396 MASQUERADE all -- * vlan1 192.168.0.0/24 0.0.0.0/0 
0 0 MASQUERADE all -- * vlan1 192.168.2.0/24 0.0.0.0/0 
Chain OUTPUT (policy ACCEPT 34 packets, 5118 bytes)
pkts bytes target prot opt in out source destination 

[root@localhost ~]# tcpdump -i eth0 host 192.168.0.100 -n (in my laptop computer, its ipaddress is 192.168.0.100, connected with the above router-192.168.0.1)
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
19:38:15.640847 IP 192.168.0.100.32851 > 192.168.1.1.domain: 36823+ AAAA? www.baidu.com. (31)
19:38:20.640079 arp who-has 192.168.0.1 tell 192.168.0.100
19:38:20.640478 arp reply 192.168.0.1 is-at 00:90:4c:23:00:2a
19:38:20.642144 IP 192.168.0.100.32852 > 61.147.37.1.domain: 36823+ AAAA? www.baidu.com. (31)
19:38:25.641916 IP 192.168.0.100.32851 > 192.168.1.1.domain: 36823+ AAAA? www.baidu.com. (31)
19:38:30.643776 IP 192.168.0.100.32852 > 61.147.37.1.domain: 36823+ AAAA? www.baidu.com. (31)
19:38:30.653020 IP 61.147.37.1.domain > 192.168.0.100.32852: 36823 1/0/0 CNAME[|domain]
19:38:30.656650 IP 192.168.0.100.32852 > 192.168.1.1.domain: 29489+ A? www.baidu.com. (31)
19:38:35.656382 IP 192.168.0.100.32853 > 61.147.37.1.domain: 29489+ A? www.baidu.com. (31)
19:38:40.657240 IP 192.168.0.100.32852 > 192.168.1.1.domain: 29489+ A? www.baidu.com. (31)
19:38:45.657177 IP 192.168.0.100.32853 > 61.147.37.1.domain: 29489+ A? www.baidu.com. (31)
19:38:45.665321 IP 61.147.37.1.domain > 192.168.0.100.32853: 29489 3/4/4 CNAME[|domain]
19:38:45.669434 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6222599 0,nop,wscale 2>
19:38:48.668814 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6225599 0,nop,wscale 2>
19:38:54.667690 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6231599 0,nop,wscale 2>
19:39:06.666439 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6243599 0,nop,wscale 2>
19:39:11.666343 arp who-has 192.168.0.1 tell 192.168.0.100
19:39:11.666676 arp reply 192.168.0.1 is-at 00:90:4c:23:00:2a
19:39:30.662416 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6267599 0,nop,wscale 2>
19:40:18.655200 IP 192.168.0.100.32803 > 119.75.217.56.http: S 2547361769:2547361769(0) win 5840 <mss 1460,sackOK,timestamp 6315599 0,nop,wscale 2>
20 packets captured
20 packets received by filter





> Date: Wed, 30 May 2012 12:59:03 -0400
> Subject: Re: Ask an issue about how can I let netfilter-nat work normally, thanks
> From: betolj@gmail.com
> To: miao_hb@hotmail.com
> CC: netfilter@vger.kernel.org
> 
> Hi,
> 
> Show us your NAT rules...
> iptables -t nat -nL -v
> or
> Firewall dump with iptables-save
> 
> 
> Use tcpdump to see if the IP translation occurs.
> tcpdump -i <if_net> host <ip_address> -n
> 
> 
> 2012/5/30 miao hongbing <miao_hb@hotmail.com>:
> >
> >
> > Hi Sirs,
> >
> > I am Steve Miao from China, currently we use broadcom's WiFi chipset, the chipset version is 5356 the software version is linux-2.6-router-5.70.48.10.
> >
> > We meet an issue about fast-nat, we plan to remove fast-nat and use common netfilter-nat base some reasons, when we removed fastnat by disabling CONFIG_BCM_NAT(the option of kernle's menuconfig) or let "ipv4_conntrack_fastnat=0", fast-nat is disabled succesfully, but netfilter-NAT can not work normally, the phenomenon is: we can ping any website, can not surf it. that means ICMP can work normally but TCP/UDP can not.
> >
> > Could anyone pls tell me how I can let netfilter-NAT work normally? if you know it pls kindly let me know.
> >
> > Thank you very much!!!
> >
> > Regards,
> > Steve --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html 		 	   		  