From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Tue, 17 Sep 2013 02:38:59 +0300
Message-ID: <52379693.80707@ngtech.co.il>
References: <8761u59uit.fsf@vostro.rath.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <8761u59uit.fsf@vostro.rath.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey there,

What are you trying to achieve exactly?
I tried to understand the network topology and the network issues but
since you did not marked a target to what you want to actually get.
There is an option to actually understand the situation you are in by
just describing the need and the situation and then continue from there.

Hope for the best
Eliezer

On 09/13/2013 08:10 AM, Nikolaus Rath wrote:
> Hello,
> 
> Thanks for working on this great networking stack!
> 
> I'm trying to set up a configuration with SNAT and routing rules, but
> I'm having weird problems that I do not understand:
> 
> I've enabled packet forwarding and SNAT on the "ebox" computer as
> follows:
> 
> root@ebox:~# ip route
> default via 23.92.25.1 dev eth0 
> 23.92.25.0/24 dev eth0  proto kernel  scope link  src 23.92.25.96 
> 192.168.12.0/24 dev rath  proto kernel  scope link  src 192.168.12.1 
> 
> root@ebox:~# iptables  -L -n -v
> Chain INPUT (policy ACCEPT 1314 packets, 1736K bytes)
>  pkts bytes target     prot opt in     out     source               destination         
> 
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source               destination         
>  150K   62M ACCEPT     all  --  rath   eth0    0.0.0.0/0            0.0.0.0/0           
> 86746  200M ACCEPT     all  --  eth0   rath    0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
>   319 22076 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 1/min burst 30 LOG flags 0 level 4 prefix "Rejected forwarding: "
>   393 26172 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-net-prohibited
> 
> Chain OUTPUT (policy ACCEPT 1142 packets, 2412K bytes)
>  pkts bytes target     prot opt in     out     source destination
>  
> root@ebox:~# iptables -t nat -L -n -v
> Chain PREROUTING (policy ACCEPT 36378 packets, 2383K bytes)
> 
> Chain INPUT (policy ACCEPT 19982 packets, 1334K bytes)
>  pkts bytes target     prot opt in     out     source               destination         
> 
> Chain OUTPUT (policy ACCEPT 61430 packets, 4601K bytes)
>  pkts bytes target     prot opt in     out     source               destination         
> 
> Chain POSTROUTING (policy ACCEPT 8333 packets, 564K bytes)
>  pkts bytes target     prot opt in     out     source               destination         
> 69488 5081K SNAT       all  --  *      eth0    0.0.0.0/0            0.0.0.0/0            to:23.92.25.96
> 
>    
> From a second computer "vostro", I can now use ebox as a gateway:
> 
> root@vostro:~# ip route add 190.93.249.164 via 192.168.12.1
> 
> This works fine, now connections to whatismyip.com (190.93.249.164) go
> through ebox.
> 
> However, when I try to be a bit more selective on vostro and use a
> special routing table, things don't work anymore:
> 
> root@vostro:~# iptables -t mangle -L -n
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination         
> 
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination         
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination         
> MARK       tcp  --  0.0.0.0/0            190.93.249.164       tcp dpt:80 MARK set 0x1
> LOG        tcp  --  0.0.0.0/0            190.93.249.164       tcp dpt:80 LOG flags 0 level 4 prefix "marked: "
> 
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination         
> 
> root@vostro:~# ip route del 190.93.249.164 via 192.168.12.1
> root@vostro:~# ip route add default via 192.168.12.1 table tovpn
> root@vostro:~# ip rule add fwmark 0x1 table tovpn
> 
> Now connections from vostro to 190.93.249.164 still make it to ebox, and
> from ebox to 190.93.249.164, but the answers get stuck on ebox:
> 
> Sep 13 04:47:53 ebox kernel: Rejected forwarding: IN=eth0 OUT=eth0 MAC=f2:3c:91:69:db:07:84:78:ac:0d:79:c1:08:00 SRC=190.93.249.164 DST=192.168.17.47 LEN=60 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP SPT=80 DPT=39024 WINDOW=14480 RES=0x00 ACK SYN URGP=0 
> 
> It seems that ebox tries to send the packet destined to go trough the
> rath to eth0 instead, and consequency rejects them because forwarding is
> only enabled from eth0 to rath.
> 
> However, this only happens when vostro has the gateway route set in a
> special routing table rather than the default table -- but how does ebox
> even know about that?
> 
> Can someone explain to me what is happening here and why?
> 
> 
> 
> Best,
> 
>    -Nikolaus
> 

