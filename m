From: John Lister <john.lister@kickstone.com>
Subject: Re: Selectively routing packets through different links
Date: Thu, 10 Jun 2010 21:14:47 +0100
Message-ID: <4C1147B7.9030805@kickstone.com>
References: <AANLkTikbalU3OXYS8Bqc1ZfP79HjluILJY-5kXMI0UBs@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikbalU3OXYS8Bqc1ZfP79HjluILJY-5kXMI0UBs@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Diego Lima <lists@diegolima.org>
Cc: netfilter@vger.kernel.org

I suspect you need to save the mark in the conntrack table so that it is 
applied to every related packet - I've got a similar configuration 
except I route out of multiple interfaces depending upon load and took a 
while to get working reliably.
Once you set the mark use -j CONNMARK --save-mark and --restore-mark. 
The former after you've used set-mark.
I also use SNAT rather than MASQUERADE in case that makes a difference.

John

Diego Lima wrote:
> Hello all,
>
> I'm trying to send http packets through a link that is not my default
> gateway, using iptables and iproute2 on a Ubuntu 9.10 server (ip
> address: 192.168.0.193 on the lan and 192.168.21.1 on the wan). Its
> default gateway is the address 192.168.0.7 on my wlan0 interface and
> its alternative gateway is 192.168.21.1 on bnep0. Packets from my LAN
> arrive on the same wlan0 interface. Here's what I've done:
>
> 1 - Edit /etc/iproute2/rt_tables and add this:
> 10 bluez
>
> 2 - Add the route and rule:
> # ip route add via 192.168.21.1 dev bnep0 table bluez
> # ip rule add fwmark 10 lookup bluez
>
> 3 - Add the iptables rules:
> iptables -t mangle -I PREROUTING -i wlan0 -s 192.168.0.0/24 -p tcp -m
> multiport --dports 80,443,8080 -j MARK --set-mark 10
> iptables -t nat -I POSTROUTING ! -o lo -j MASQUERADE
>
> The FORWARD policy is currently set to ACCEPT and
> /proc/sys/net/ipv4/ip_forward is set to 1. When I do this I can see
> the packets coming from my local network to to the internet get out
> and I see them on the router 192.168.21.1. I can also see the replies
> on the router and bnep0, but they don't go back to the host on wlan0.
>
> Here is the tcpdump results of a simple wget:
>
> ---
> On the host 192.168.0.201 (the one trying to fetch a page):
>
> 13:04:49.639213 IP 192.168.0.201.37844 > 64.233.163.104.80: Flags [S],
> seq 1417172792, win 5840, options [mss 1460,sackOK,TS val 194061171
> ecr 0,nop,wscale 6], length 0
> 13:04:52.635912 IP 192.168.0.201.37844 > 64.233.163.104.80: Flags [S],
> seq 1417172792, win 5840, options [mss 1460,sackOK,TS val 194061921
> ecr 0,nop,wscale 6], length 0
> 13:04:58.635909 IP 192.168.0.201.37844 > 64.233.163.104.80: Flags [S],
> seq 1417172792, win 5840, options [mss 1460,sackOK,TS val 194063421
> ecr 0,nop,wscale 6], length 0
>
>
> --
> On the firewall 192.168.0.193 (the host's default gw and the firewall
> where I set the iptables/routing rules):
> tcpdump on bnep0:
>
> diego@gilead:/tmp$ sudo tcpdump -ni bnep0 ip proto \\tcp and ! port 22
> and host 64.233.163.104
> listening on bnep0, link-type EN10MB (Ethernet), capture size 96 bytes
> 13:07:56.556892 IP 192.168.21.2.43346 > 64.233.163.104.80: Flags [S],
> seq 182141507, win 5840, options [mss 1460,sackOK,TS val 194109829 ecr
> 0,nop,wscale 6], length 0
> 13:07:58.450327 IP 64.233.163.104.80 > 192.168.21.2.43346: Flags [S.],
> seq 118939367, ack 182141508, win 5672, options [mss 1410,sackOK,TS
> val 3547510252 ecr 194109829,nop,wscale 6], length 0
> 13:07:58.719166 IP 64.233.163.104.80 > 192.168.21.2.43346: Flags [S.],
> seq 118939367, ack 182141508, win 5672, options [mss 1410,sackOK,TS
> val 3547510586 ecr 194109829,nop,wscale 6], length 0
> 13:07:59.328302 IP 64.233.163.104.80 > 192.168.21.2.43346: Flags [S.],
> seq 118939367, ack 182141508, win 5672, options [mss 1410,sackOK,TS
> val 3547511190 ecr 194109829,nop,wscale 6], length 0
> 13:07:59.553165 IP 192.168.21.2.43346 > 64.233.163.104.80: Flags [S],
> seq 182141507, win 5840, options [mss 1460,sackOK,TS val 194110579 ecr
> 0,nop,wscale 6], length 0
> 13:07:59.658279 IP 64.233.163.104.80 > 192.168.21.2.43346: Flags [S.],
> seq 118939367, ack 182141508, win 5672, options [mss 1410,sackOK,TS
> val 3547511511 ecr 194109829,nop,wscale 6], length 0
>
>
> tcpdump on wlan0:
> diego@gilead:/tmp$ sudo tcpdump -ni wlan0 ip proto \\tcp and ! port 22
> and host 64.233.163.104
> listening on wlan0, link-type EN10MB (Ethernet), capture size 96 bytes
>
> 13:09:12.992642 IP 192.168.0.201.43347 > 64.233.163.104.80: Flags [S],
> seq 1388896619, win 5840, options [mss 1460,sackOK,TS val 194128940
> ecr 0,nop,wscale 6], length 0
> 13:09:15.988847 IP 192.168.0.201.43347 > 64.233.163.104.80: Flags [S],
> seq 1388896619, win 5840, options [mss 1460,sackOK,TS val 194129690
> ecr 0,nop,wscale 6], length 0
> 13:09:21.990494 IP 192.168.0.201.43347 > 64.233.163.104.80: Flags [S],
> seq 1388896619, win 5840, options [mss 1460,sackOK,TS val 194131190
> ecr 0,nop,wscale 6], length 0
>
> --
> On the wan router 192.168.21.1:
>
> 13:11:47.844163 IP 192.168.21.2.43348 > 64.233.163.104.80: S
> 3792068799:3792068799(0) win 5840 <mss 1460,sackOK,timestamp
> 194167380[|tcp]>
> 13:11:49.613021 IP 64.233.163.104.80 > 192.168.21.2.43348: S
> 2877038224:2877038224(0) ack 3792068800 win 5672 <mss
> 1410,sackOK,timestamp 3532709843[|tcp]>
> 13:11:49.868738 IP 64.233.163.104.80 > 192.168.21.2.43348: S
> 2877038224:2877038224(0) ack 3792068800 win 5672 <mss
> 1410,sackOK,timestamp 3532710158[|tcp]>
> 13:11:50.473167 IP 64.233.163.104.80 > 192.168.21.2.43348: S
> 2877038224:2877038224(0) ack 3792068800 win 5672 <mss
> 1410,sackOK,timestamp 3532710762[|tcp]>
> 13:11:50.833945 IP 192.168.21.2.43348 > 64.233.163.104.80: S
> 3792068799:3792068799(0) win 5840 <mss 1460,sackOK,timestamp
> 194168130[|tcp]>
> 13:11:50.913043 IP 64.233.163.104.80 > 192.168.21.2.43348: S
> 2877038224:2877038224(0) ack 3792068800 win 5672 <mss
> 1410,sackOK,timestamp 3532711202[|tcp]>
> 13:11:51.733704 IP 64.233.163.104.80 > 192.168.21.2.43348: S
> 2877038224:2877038224(0) ack 3792068800 win 5672 <mss
> 1410,sackOK,timestamp 3532712022[|tcp]>
> 13:11:54.149590 IP 64.233.163.104.80 > 192.168.21.2.43348: S
> 2877038224:2877038224(0) ack 3792068800 win 5672 <mss
> 1410,sackOK,timestamp 3532714438[|tcp]>
>
> --
>
> As far as I can see the packets arrive at my firewall just fine but it
> never routes them back to the host originating the request. Am I
> missing something there?
>
> Thanks and sorry for the long email :)
>
>   
