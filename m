From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: Re: FTP NAT fails after kernel upgrade
Date: Mon, 17 Jul 2017 11:00:00 -0300
Message-ID: <e4cfb776-7d73-42d1-4b48-51ade05977be@riosoft.com.br>
References: <bfb77353-7334-1a41-f3c4-b5d260a14a6d@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bfb77353-7334-1a41-f3c4-b5d260a14a6d@riosoft.com.br>
Content-Language: pt-BR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello again.
Sorry for the insistence, but I really wanted to know if I'm doing 
anything wrong about the problem below.

Em 13/07/2017 17:57, Bruno de Paula Larini escreveu:
> Hello everyone.
> I'm experiencing some unexpected behavior after upgrading the kernel 
> from 4.6.5-300.fc24.x86_64 to 4.10.10-100.fc24.x86_64.
>
> I have some rules that make FTP connections go back to my LAN with 
> DNAT, delivering it with SNAT so my FTP server won't try to reply 
> directly to my computer. I'm doing this so users can seamlessly use 
> their service with their laptops inside or outside my network without 
> changing their profiles.
>
> After updating the kernel, I've noticed that users outside my network 
> can use the FTP service normally, but the connection fails for users 
> in the LAN. But it will only fail for the FTP port or any additional 
> ports specified in the options for the nf_conntrack_ftp module, which 
> in my case is "options nf_conntrack_ftp ports=21,2121". If I remove 
> the port 2121 from the option, for example, it will work 
> (authentication only, listing the directory will fail as expected in a 
> DROP policy).
>
> Is there some new way to do what I wanted in these new kernel versions 
> or would it be some bug?
>
> Thanks for the help!

To make easier to understand my problem, here are the rules I'm using:

#!/bin/bash

     modprobe iptable_nat
     modprobe nf_conntrack
     modprobe nf_conntrack_ftp
     modprobe nf_nat_ftp

     iptables -P INPUT DROP
     iptables -P FORWARD DROP
     iptables -P OUTPUT ACCEPT

     iptables -F
     iptables -F -t nat
     iptables -X
     iptables -Z

     echo 1 > /proc/sys/net/ipv4/ip_forward
     echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
     echo 1 > /proc/sys/net/netfilter/nf_conntrack_helper

     iptables -A INPUT -i lo -j ACCEPT
     iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

     iptables -t nat -A PREROUTING -d $public_ip -p tcp --dport 21 -j 
DNAT --to-destination 192.168.0.10:2121

...

     iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
     iptables -A FORWARD -d 192.168.0.10 -p tcp --dport 2121 -j ACCEPT

     iptables -t nat -A POSTROUTING -s 192.168.0.10 -p tcp --sport 2121 
-j SNAT --to-source $public_ip

     iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -d 192.168.0.10 -p 
tcp --dport 2121 -j SNAT --to-source 192.168.0.1

...

Using LOG I can see packets from my LAN going all the way to the 
POSTROUTING chain, so I don't think rp_filter would have anything to do 
with this.
As said before, this only happens with ports added to the 
nf_conntrack_ftp option.

Thanks!
