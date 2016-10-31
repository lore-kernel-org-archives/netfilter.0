From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Forward local traffic to another host with nftables
Date: Mon, 31 Oct 2016 20:24:29 +0100
Message-ID: <20161031192429.GA1658@salvia>
References: <5bcf965b-aa71-eb5d-ed1e-a9a6e2c405f6@bigur.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5bcf965b-aa71-eb5d-ed1e-a9a6e2c405f6@bigur.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0JPQtdC90L3QsNC00LjQuSDQmtC+0LLQsNC70ZHQsg==?= <gik@bigur.ru>
Cc: netfilter@vger.kernel.org

On Mon, Oct 31, 2016 at 08:33:57PM +0300, Геннадий Ковалёв wrote:
> Hello!
> 
> I have linux box (external ip x.x.x.x; internal bridge (br0) ip 10.0.2.1)
> with lxc container (10.0.2.22). I want to translate local http packet with
> daddr to public ip to lxc container. I have put dnat rule to nat chain with
> output hook, and snat rule to nat table with postrouting hook:
> 
> root@sed:~# nft list ruleset
> table ip nat {
>         chain output {
>                 type nat hook output priority 0; policy accept;
>                 oif lo ip daddr x.x.x.x tcp dport http counter packets 7
> bytes 420 nftrace set 1 dnat 10.0.2.22
>         }
> 
>         chain postrouting {
>                 type nat hook postrouting priority 0; policy accept;
>                 oif br0 ip saddr x.x.x.x counter packets 7 bytes 420 snat
> 10.0.2.1
>         }
> }
>
> telnet x.x.x.x 80 terminated with "connection timeout" error.
> 
> I think trace looks good:
> 
> root@sed:~# nft monitor trace
> trace id 51803d41 ip nat output packet: oif lo ip saddr x.x.x.x ip daddr
> x.x.x.x ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 47640 ip length 60 tcp
> sport 54854 tcp dport http tcp flags == syn tcp window 43690
> trace id 51803d41 ip nat output rule oif lo ip daddr x.x.x.x tcp dport http
> counter packets 1 bytes 60 nftrace set 1 dnat 10.0.2.22 (verdict accept)
> trace id 51803d41 ip nat postrouting packet: oif br0 ip saddr x.x.x.x ip
> daddr 10.0.2.22 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 47640 ip length
> 60 tcp sport 54854 tcp dport http tcp flags == syn tcp window 43690
> trace id 51803d41 ip nat postrouting rule oif br0 ip saddr x.x.x.x counter
> packets 1 bytes 60 nftrace set 1 snat 10.0.2.1 (verdict accept)
> 
> And tcpdump. But there is strange third packet with reset flag:
> 
> root@sed:~# tcpdump -nvi br0  port 80
> tcpdump: listening on br0, link-type EN10MB (Ethernet), capture size 262144
> bytes
> 20:11:36.619158 IP (tos 0x10, ttl 64, id 13945, offset 0, flags [DF], proto
> TCP (6), length 60)
>     10.0.2.1.56682 > 10.0.2.22.80: Flags [S], cksum 0x1845 (incorrect ->
> 0xbf55), seq 2932709176, win 43690, options [mss 65495,sackOK,TS val
> 113484097 ecr 0,nop,wscale 7], length 0
> 20:11:36.619188 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP
> (6), length 60)
>     10.0.2.22.80 > 10.0.2.1.56682: Flags [S.], cksum 0x1845 (incorrect ->
> 0x5d91), seq 1462474289, ack 2932709177, win 28960, options [mss
> 1460,sackOK,TS val 113484097 ecr 113484097,nop,wscale 7], length 0
> 20:11:36.619201 IP (tos 0x0, ttl 64, id 57631, offset 0, flags [DF], proto
> TCP (6), length 40)
>     10.0.2.1.56682 > 10.0.2.22.80: Flags [R], cksum 0x7408 (correct), seq
> 2932709177, win 0, length 0
> 
> netstat showing connection like this (don't see outgoing port number, it's
> another try):
> 
> tcp        0      1 x.x.x.x:60404       x.x.x.x:80 SYN_SENT
> 
> There are no iptable_* modules loaded:
> 
> root@sed:~# lsmod | grep iptable
> root@sed:~#
> 
> The same settings with iptables works for me. Where I can find solution with
> nftables?

From https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_%28NAT%29

"You have to register the prerouting chain even if you have no rules
there since this chain invokes the NAT engine for the packets coming
in the input path."
