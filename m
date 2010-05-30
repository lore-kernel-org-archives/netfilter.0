From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Iptables - loading errors
Date: Mon, 31 May 2010 00:19:50 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005310015220.11967@obet.zrqbmnf.qr>
References: <4C02D29C.2010706@cseo.biz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C02D29C.2010706@cseo.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "rd@cseo.biz" <rd@cseo.biz>
Cc: netfilter <netfilter@vger.kernel.org>

On Sunday 2010-05-30 23:03, rd@cseo.biz wrote:

> Hey guys,
> I'm getting errors loading my rules...
> But afterwards, when I list the rules, they look ok.

They are not ok, because at least two of them are missing.
To avoid having incomplete rulesets in memory, ALWAYS use ONLY 
iptables-restore/-save, also because it's a helluva faster than to call 
iptables a thousand times. And -save because it's much easier to
parse than (a) shell, (b) the truncated view you get with -L.

The error messages indicate you have a line wrap somewhere where there 
should not be one.

>
>
>IPTABLES=/sbin/iptables
>
># Flush, Init and Zero the 'built-in' chains
>
>$IPTABLES -F INPUT; $IPTABLES -P INPUT ACCEPT; $IPTABLES -Z INPUT
>$IPTABLES -F FORWARD; $IPTABLES -P FORWARD ACCEPT; $IPTABLES -Z FORWARD
>$IPTABLES -F OUTPUT; $IPTABLES -P OUTPUT ACCEPT; $IPTABLES -Z OUTPUT
>
># Setup user-defined chains
>
>$IPTABLES -X
>$IPTABLES -N ADDRESS-FILTER;
>$IPTABLES -N CBNISP-INPUT;
>$IPTABLES -N REJECT-PKT;
>$IPTABLES -N SYN-FLOOD;
>
>$IPTABLES -A INPUT -j CBNISP-INPUT
>
>######################################################################
># Allow all loopback interface traffic
>
>$IPTABLES -A CBNISP-INPUT -i lo -j ACCEPT
>
># Block all attempts to spoof the loopback address
>
>$IPTABLES -A CBNISP-INPUT -s 127.0.0.0/8 -j LOG --log-prefix &quot;SPOOFED-LOOPBACK: &quot;
>$IPTABLES -A CBNISP-INPUT -s 127.0.0.0/8 -j DROP
>$IPTABLES -A CBNISP-INPUT -d 127.0.0.0/8 -j LOG --log-prefix &quot;SPOOFED-LOOPBACK: &quot;
>$IPTABLES -A CBNISP-INPUT -d 127.0.0.0/8 -j DROP
>
># Block Syn Flood attacks
>
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --syn -j SYN-FLOOD
>
># Ensure that TCP connections start with syn packets
>
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp ! --syn -m state --state NEW -j LOG --log-prefix &quot;SYN-EXPECTED: &quot;
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp ! --syn -m state --state NEW -j DROP
>
># Allow session continuation traffic
>
>$IPTABLES -A CBNISP-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>
># Allow ICMP ping requests from all hosts
>
>$IPTABLES -A CBNISP-INPUT -p icmp -m icmp --icmp-type ping -j ACCEPT
>
># Call the IP and MAC address filtering chain
>
>$IPTABLES -A CBNISP-INPUT -j ADDRESS-FILTER
>
># Allow selected TCP/IP and/or UDP services
>
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 20:22 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 25 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 80 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 110 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 139 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 143 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 443 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 465 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 587 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 993 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 995 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p udp -m udp --dport 53 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 53 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p udp -m udp --dport 123 -j ACCEPT
>### $IPTABLES -A CBNISP-INPUT -p udp -m udp --dport 137:138 -j ACCEPT
>### $IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 1512 -j ACCEPT
>### $IPTABLES -A CBNISP-INPUT -p udp -m udp --dport 1512 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 2222 -j ACCEPT
>$IPTABLES -A CBNISP-INPUT -p tcp -m tcp --dport 35000:35999 -j ACCEPT
>
># Block all other TCP/IP and UDP traffic
>
>$IPTABLES -A CBNISP-INPUT -j REJECT-PKT
>
>######################################################################
># Syn flood filtering chain
>
>$IPTABLES -A SYN-FLOOD -m limit --limit 1/s --limit-burst 4 -j RETURN
>$IPTABLES -A SYN-FLOOD -j LOG --log-prefix &quot;SYN-FLOOD: &quot;
>$IPTABLES -A SYN-FLOOD -j DROP
>
>######################################################################
># Chain used to reject all TCP/IP, UDP and ICMP/PING packets
>
>$IPTABLES -A REJECT-PKT -p udp -m udp --sport 137:138 --dport 137:138 -j DROP
>$IPTABLES -A REJECT-PKT -p tcp -m tcp -j LOG
>$IPTABLES -A REJECT-PKT -p tcp -m tcp -j REJECT --reject-with tcp-reset
>$IPTABLES -A REJECT-PKT -p udp -m udp -j LOG
>$IPTABLES -A REJECT-PKT -p udp -m udp -j REJECT --reject-with icmp-port-unreachable
>$IPTABLES -A REJECT-PKT -p icmp -m icmp --icmp-type ping -j LOG
>$IPTABLES -A REJECT-PKT -p icmp -m icmp --icmp-type ping -j REJECT --reject-with icmp-host-unreachable
>
>######################################################################
># IP and MAC address filtering chain
>
>$IPTABLES -A ADDRESS-FILTER -s 172.168.1.100 -j REJECT-PKT
>$IPTABLES -A ADDRESS-FILTER -m mac --mac 00:21:62:F0:E7:2D -j REJECT-PKT
>$IPTABLES -A ADDRESS-FILTER -j RETURN
>
>
>--------------
>
>I chmod to 755 and execute it ./firewall
>I get...
>[root@xquads ~]# ./firewall
>iptables v1.3.5: Unknown arg `--log-prefix'
>Try `iptables -h' or 'iptables --help' for more information.
>./firewall: line 39: SYN-EXPECTED: : command not found
>iptables v1.3.5: Unknown arg `--reject-with'
>Try `iptables -h' or 'iptables --help' for more information.
>./firewall: line 97: icmp-host-unreachable: command not found
>
>
>
>But when I list rules, everything seems ok...
>
>[root@xquads ~]# iptables -L -n
>Chain INPUT (policy ACCEPT)
>target     prot opt source               destination
>CBNISP-INPUT  all  --  0.0.0.0/0            0.0.0.0/0
>
>Chain FORWARD (policy ACCEPT)
>target     prot opt source               destination
>
>Chain OUTPUT (policy ACCEPT)
>target     prot opt source               destination
>
>Chain ADDRESS-FILTER (1 references)
>target     prot opt source               destination
>REJECT-PKT  all  --  172.168.1.100        0.0.0.0/0
>REJECT-PKT  all  --  0.0.0.0/0            0.0.0.0/0           MAC 00:21:62:F0:E7:2D
>RETURN     all  --  0.0.0.0/0            0.0.0.0/0
>
>Chain CBNISP-INPUT (1 references)
>target     prot opt source               destination
>ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
>LOG        all  --  127.0.0.0/8          0.0.0.0/0           LOG flags 0 level 4 prefix `SPOOFED-LOOPBACK: '
>DROP       all  --  127.0.0.0/8          0.0.0.0/0
>LOG        all  --  0.0.0.0/0            127.0.0.0/8         LOG flags 0 level 4 prefix `SPOOFED-LOOPBACK: '
>DROP       all  --  0.0.0.0/0            127.0.0.0/8
>SYN-FLOOD  tcp  --  0.0.0.0/0            0.0.0.0/0           tcp flags:0x17/0x02
>DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp flags:!0x17/0x02 state NEW
>ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
>ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8
>ADDRESS-FILTER  all  --  0.0.0.0/0            0.0.0.0/0
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpts:20:22
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:110
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:139
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:143
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:443
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:465
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:587
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:993
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:995
>ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53
>ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:123
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:2222
>ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpts:35000:35999
>REJECT-PKT  all  --  0.0.0.0/0            0.0.0.0/0
>
>Chain REJECT-PKT (3 references)
>target     prot opt source               destination
>DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp spts:137:138 dpts:137:138
>LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp LOG flags 0 level 4
>REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp reject-with tcp-reset
>LOG        udp  --  0.0.0.0/0            0.0.0.0/0           udp LOG flags 0 level 4
>REJECT     udp  --  0.0.0.0/0            0.0.0.0/0           udp reject-with icmp-port-unreachable
>LOG        icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8 LOG flags 0 level 4
>
>Chain SYN-FLOOD (1 references)
>target     prot opt source               destination
>RETURN     all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 1/sec burst 4
>LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `SYN-FLOOD: '
>DROP       all  --  0.0.0.0/0            0.0.0.0/0
>
>
