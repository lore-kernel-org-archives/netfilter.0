From: John Lister <john.lister@kickstone.com>
Subject: Re: Load Balancing issue
Date: Mon, 11 Apr 2011 13:31:35 +0100
Message-ID: <4DA2F4A7.4030902@kickstone.com>
References: <4DA2CB4D.2070402@pierce.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DA2CB4D.2070402@pierce.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Evan Pierce <evan@pierce.co.za>
Cc: netfilter@vger.kernel.org

Have you saved/restored the marks in the conntrack table? Otherwise they 
will be lost for all subsequent packets.. eg:

-j CONNMARK --save-mark

John


On 11/04/2011 10:35, Evan Pierce wrote:
> I have read/googled/looked at but somewhere I feel I have a missed
> understanding.
>
> I have a firewall with three interfaces.
>
> interfaces are as follows:
>
> eth0: 192.168.11.11/255.255.255.0 - internal network
> eth3: 197.213.0.42/255.255.255.248 - external 512kb line
> eth4: 192.168.1.2/255.255.255.0 - external 4mb line behind adsl nat router
>
> All I want to do is to get all port 80 and port 443 traffic to go up the
> 4mb adsl line and the rest can go up the 512kb line.
>
> I have the rules as follows:
>
> ip route add table 4 default via 192.168.1.1
> iptables -t mangle -A PREROUTING -p tcp --dport 80 -s 192.168.11.0/24 -j
> MARK --set-mark 4
> iptables -t mangle -A PREROUTING -p tcp --dport 443 -s 192.168.11.0/24
> -j MARK --set-mark 4
> iptables -t nat -A POSTROUTING -o eth4 -j SNAT --to-source 192.168.1.2
> iptables -t nat -A POSTROUTING -o eth3 -j SNAT --to-source 197.213.0.42
> ip rule add fwmark 4 table 4
> ip route flush cache
>
>
> I can see the packets get marked via
>
> Chain PREROUTING (policy ACCEPT 6559 packets, 1226K bytes)
>   pkts bytes target     prot opt in     out     source
> destination
>    147  8744 MARK       tcp  --  any    any     192.168.11.0/24
> anywhere            tcp dpt:www MARK xset 0x4/0xffffffff
>     29  2191 MARK       tcp  --  any    any     192.168.11.0/24
> anywhere            tcp dpt:https MARK xset 0x4/0xffffffff
>
>
> A tcpdump shows the traffic successfully leaving port on the 4mb line
>
> root@firewall:~# tcpdump -i eth4 host www.iol.co.za
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth4, link-type EN10MB (Ethernet), capture size 96 bytes
> 11:02:47.832883 IP 192.168.1.2.48529>  196.38.8.254.www: Flags [S], seq
> 357065168, win 5840, options [mss 1460,sackOK,TS val 2871645712 ecr
> 0,nop,wscale 7], length 0
> 11:02:47.846045 IP 196.38.8.254.www>  192.168.1.2.48529: Flags [S.], seq
> 190124381, ack 357065169, win 5792, options [mss 1452,sackOK,TS val
> 1415257200 ecr 2871645712,nop,wscale 7], length 0
> 11:02:50.833491 IP 192.168.1.2.48529>  196.38.8.254.www: Flags [S], seq
> 357065168, win 5840, options [mss 1460,sackOK,TS val 2871648712 ecr
> 0,nop,wscale 7], length 0
> 11:02:50.846079 IP 196.38.8.254.www>  192.168.1.2.48529: Flags [S.], seq
> 190124381, ack 357065169, win 5792, options [mss 1452,sackOK,TS val
> 1415260200 ecr 2871645712,nop,wscale 7], length 0
> 11:02:52.015010 IP 196.38.8.254.www>  192.168.1.2.48529: Flags [S.], seq
> 190124381, ack 357065169, win 5792, options [mss 1452,sackOK,TS val
> 1415261370 ecr 2871645712,nop,wscale 7], length 0
> 11:02:56.834029 IP 192.168.1.2.48529>  196.38.8.254.www: Flags [S], seq
> 357065168, win 5840, options [mss 1460,sackOK,TS val 2871654712 ecr
> 0,nop,wscale 7], length 0
> 11:02:56.846155 IP 196.38.8.254.www>  192.168.1.2.48529: Flags [S.], seq
> 190124381, ack 357065169, win 5792, options [mss 1452,sackOK,TS val
> 1415266201 ecr 2871645712,nop,wscale 7], length 0
> 11:02:58.015083 IP 196.38.8.254.www>  192.168.1.2.48529: Flags [S.], seq
> 190124381, ack 357065169, win 5792, options [mss 1452,sackOK,TS val
> 1415267370 ecr 2871645712,nop,wscale 7], length 0
> 11:03:08.834078 IP 192.168.1.2.48529>  196.38.8.254.www: Flags [S], seq
> 357065168, win 5840, options [mss 1460,sackOK,TS val 2871666712 ecr
> 0,nop,wscale 7], length 0
> 11:03:08.846185 IP 196.38.8.254.www>  192.168.1.2.48529: Flags [S.], seq
> 190124381, ack 357065169, win 5792, options [mss 1452,sackOK,TS val
> 1415278200 ecr 2871645712,nop,wscale 7], length 0
> 11:03:10.015725 IP 196.38.8.254.www>  192.168.1.2.48529: Flags [S.], seq
> 190124381, ack 357065169, win 5792, options [mss 1452,sackOK,TS val
> 1415279370 ecr 2871645712,nop,wscale 7], length 0
> 11:03:32.834205 IP 192.168.1.2.48529>  196.38.8.254.www: Flags [S], seq
> 357065168, win 5840, options [mss 1460,sackOK,TS val 2871690712 ecr
> 0,nop,wscale 7], length 0
>
>
> and seemingly returning however the traffic is never passed through the
> firewall back to the source machine as shown by a simultaneous tcpdump
> of the internal network:
>
> root@firewall:~# tcpdump -i eth0 host www.iol.co.za
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
> 11:08:44.378983 IP 192.168.11.11.53455>  196.38.8.254.www: Flags [S],
> seq 727724538, win 5840, options [mss 1460,sackOK,TS val 2872002247 ecr
> 0,nop,wscale 7], length 0
> 11:08:44.508787 IP 192.168.11.11.45208>  196.38.8.254.www: Flags [S],
> seq 687092256, win 5840, options [mss 1460,sackOK,TS val 2872002377 ecr
> 0,nop,wscale 7], length 0
> 11:08:47.379042 IP 192.168.11.11.53455>  196.38.8.254.www: Flags [S],
> seq 727724538, win 5840, options [mss 1460,sackOK,TS val 2872005247 ecr
> 0,nop,wscale 7], length 0
> 11:08:53.379575 IP 192.168.11.11.53455>  196.38.8.254.www: Flags [S],
> seq 727724538, win 5840, options [mss 1460,sackOK,TS val 2872011247 ecr
> 0,nop,wscale 7], length 0
> 11:08:59.460167 IP 192.168.11.11.53790>  196.38.8.254.www: Flags [S],
> seq 742925249, win 5840, options [mss 1460,sackOK,TS val 2872017328 ecr
> 0,nop,wscale 7], length 0
>
> So something must be wrong in my firewall rules here is a dump of
> iptables -L -v
>
> # Generated by iptables-save v1.4.4 on Mon Apr 11 11:28:27 2011
> *mangle
> :PREROUTING ACCEPT [42735:22614277]
> :INPUT ACCEPT [9112:1223454]
> :FORWARD ACCEPT [32568:21304980]
> :OUTPUT ACCEPT [6367:1574752]
> :POSTROUTING ACCEPT [39211:22923589]
> -A PREROUTING -s 192.168.11.0/24 -p tcp -m tcp --dport 80 -j MARK
> --set-xmark 0x4/0xffffffff
> -A PREROUTING -s 192.168.11.0/24 -p tcp -m tcp --dport 443 -j MARK
> --set-xmark 0x4/0xffffffff
> COMMIT
> # Completed on Mon Apr 11 11:28:27 2011
> # Generated by iptables-save v1.4.4 on Mon Apr 11 11:28:27 2011
> *nat
> :PREROUTING ACCEPT [1419:138894]
> :POSTROUTING ACCEPT [124:10161]
> :OUTPUT ACCEPT [279:27787]
> -A PREROUTING -d 197.213.0.43/32 -p tcp -m tcp --dport 80 -j DNAT
> --to-destination 192.168.11.17:80
> -A PREROUTING -d 197.213.0.43/32 -p tcp -m tcp --dport 443 -j DNAT
> --to-destination 192.168.11.17:443
> -A PREROUTING -d 197.213.0.44/32 -p tcp -m tcp --dport 80 -j DNAT
> --to-destination 192.168.11.19:80
> -A PREROUTING -d 197.213.0.44/32 -p tcp -m tcp --dport 443 -j DNAT
> --to-destination 192.168.11.19:443
> -A PREROUTING -d 197.213.0.42/32 -p tcp -m tcp --dport 143 -j DNAT
> --to-destination 192.168.11.11:143
> -A PREROUTING -d 197.213.0.45/32 -p tcp -m tcp --dport 80 -j DNAT
> --to-destination 192.168.11.11:80
> -A PREROUTING -d 197.213.0.43/32 -p tcp -m tcp --dport 60200 -j DNAT
> --to-destination 192.168.11.14:60200
> -A PREROUTING -d 197.213.0.42/32 -p tcp -m tcp --dport 5900 -j DNAT
> --to-destination 192.168.11.61:5900
> -A PREROUTING -d 197.213.0.42/32 -p tcp -m tcp --dport 3389 -j DNAT
> --to-destination 192.168.11.19:3389
> -A PREROUTING -d 197.213.0.43/32 -p tcp -m tcp --dport 22 -j DNAT
> --to-destination 192.168.11.11:22
> -A PREROUTING -i eth3 -p tcp -m tcp --dport 904 -j DNAT --to-destination
> 192.168.11.11:904
> -A PREROUTING -i eth3 -p udp -m udp --dport 904 -j DNAT --to-destination
> 192.168.11.11:904
> -A PREROUTING -i eth3 -p tcp -m tcp --dport 5900 -j DNAT
> --to-destination 192.168.11.17:5900
> -A PREROUTING -i eth3 -p udp -m udp --dport 1194 -j DNAT
> --to-destination 192.168.11.11:1194
> -A PREROUTING -i eth3 -p tcp -m tcp --dport 80 -j DNAT --to-destination
> 192.168.11.11:80
> -A PREROUTING -i eth3 -p tcp -m tcp --dport 443 -j DNAT --to-destination
> 192.168.11.11:443
> -A POSTROUTING -o eth4 -j SNAT --to-source 192.168.1.2
> -A POSTROUTING -o eth3 -j SNAT --to-source 197.213.0.42
> COMMIT
> # Completed on Mon Apr 11 11:28:27 2011
> # Generated by iptables-save v1.4.4 on Mon Apr 11 11:28:27 2011
> *filter
> :INPUT ACCEPT [85:8370]
> :FORWARD ACCEPT [1:48]
> :OUTPUT ACCEPT [115:19331]
> -A INPUT -i eth3 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -i eth4 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 222 -j ACCEPT
> -A INPUT -p udp -m udp --dport 1194 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 1194 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 1723 -j ACCEPT
> -A INPUT -i tun+ -j ACCEPT
> -A INPUT -i eth3 -j DROP
> -A INPUT -i eth4 -j DROP
> -A FORWARD -s 69.93.127.55/32 -j ACCEPT
> -A FORWARD -d 69.93.127.55/32 -j ACCEPT
> -A FORWARD -s 192.168.11.19/32 -j ACCEPT
> -A FORWARD -d 192.168.11.19/32 -j ACCEPT
> -A FORWARD -s 192.168.11.11/32 -j ACCEPT
> -A FORWARD -d 192.168.11.11/32 -j ACCEPT
> -A FORWARD -s 192.168.11.12/32 -j ACCEPT
> -A FORWARD -d 192.168.11.12/32 -j ACCEPT
> -A FORWARD -s 192.168.11.21/32 -j ACCEPT
> -A FORWARD -d 192.168.11.21/32 -j ACCEPT
> -A FORWARD -s 196.38.244.20/32 -j ACCEPT
> -A FORWARD -d 196.38.244.20/32 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 995 -j DROP
> -A FORWARD -p tcp -m tcp --dport 465 -j DROP
> -A FORWARD -p tcp -m tcp --dport 587 -j DROP
> -A FORWARD -o eth3 -p udp -m udp --dport 137 -j DROP
> -A FORWARD -o eth3 -p udp -m udp --dport 138 -j DROP
> -A FORWARD -o eth3 -p udp -m udp --dport 139 -j DROP
> -A FORWARD -o eth3 -p udp -m udp --dport 445 -j DROP
> -A FORWARD -o eth3 -p tcp -m tcp --dport 137 -j DROP
> -A FORWARD -o eth3 -p tcp -m tcp --dport 138 -j DROP
> -A FORWARD -o eth3 -p tcp -m tcp --dport 139 -j DROP
> -A FORWARD -o eth3 -p udp -m udp --dport 445 -j DROP
> -A FORWARD -o eth4 -p udp -m udp --dport 137 -j DROP
> -A FORWARD -o eth4 -p udp -m udp --dport 138 -j DROP
> -A FORWARD -o eth4 -p udp -m udp --dport 139 -j DROP
> -A FORWARD -o eth4 -p udp -m udp --dport 445 -j DROP
> -A FORWARD -o eth4 -p tcp -m tcp --dport 137 -j DROP
> -A FORWARD -o eth4 -p tcp -m tcp --dport 138 -j DROP
> -A FORWARD -o eth4 -p tcp -m tcp --dport 139 -j DROP
> -A FORWARD -o eth4 -p udp -m udp --dport 445 -j DROP
> -A FORWARD -p tcp -m tcp --dport 110 -j ACCEPT
> -A FORWARD -i eth3 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i eth4 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i eth0 -o eth3 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i eth0 -o eth4 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i tun+ -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i tun+ -j ACCEPT
> -A FORWARD -s 10.9.0.0/16 -j ACCEPT
> -A FORWARD -s 10.8.0.0/16 -j ACCEPT
> -A FORWARD -d 10.9.0.0/16 -j ACCEPT
> -A FORWARD -d 10.8.0.0/16 -j ACCEPT
> -A FORWARD -d 192.168.11.19/32 -j ACCEPT
> -A FORWARD -s 192.168.11.19/32 -j ACCEPT
> -A FORWARD -s 196.11.134.22/32 -j ACCEPT
> -A FORWARD -d 196.11.134.22/32 -j ACCEPT
> -A FORWARD -s 192.168.11.11/32 -j ACCEPT
> -A FORWARD -d 192.168.11.11/32 -j ACCEPT
> -A FORWARD -d 109.74.204.69/32 -j ACCEPT
> -A FORWARD -s 192.168.11.19/32 -p tcp -m tcp --dport 80 -j ACCEPT
> -A FORWARD -s 192.168.11.150/32 -p tcp -m tcp --dport 80 -j ACCEPT
> -A FORWARD -s 192.168.11.61/32 -p tcp -m tcp --dport 80 -j ACCEPT
> -A FORWARD -s 192.168.11.11/32 -p tcp -m tcp --dport 80 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 80 -j DROP
> COMMIT
> # Completed on Mon Apr 11 11:28:27 2011
>
>
> I have read the rules and reread and reread and I cannot find where-ever
> I am making this obvious mistake. OS is ubuntu 10.04
>
> Any ideas?
>
> thanks
> Evan Pierce
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

