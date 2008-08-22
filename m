From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Packages which should be DNATed are dropped incidentally
Date: Fri, 22 Aug 2008 10:05:09 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808221003130.8475@fbirervta.pbzchgretzou.qr>
References: <20080822142507.db9f6ccf.metsch@ins.uni-bonn.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080822142507.db9f6ccf.metsch@ins.uni-bonn.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bram Metsch <metsch@ins.uni-bonn.de>
Cc: netfilter@vger.kernel.org


On Friday 2008-08-22 08:25, Bram Metsch wrote:
>
>At our site, we have a mailserver inside a DMZ. This DMZ
>employs private IPs (range 192.168.193/24), so we configured additional offical
>IPs on the external interface of the firewall:
>
>(excerpt of `iptables -L -n -v -t nat`)
>Chain PREROUTING (policy ACCEPT 2468K packets, 218M bytes)
> pkts bytes target     prot opt in     out     source               destination
> 103K 5881K DNAT       all  --  external *       0.0.0.0/0            <external mailserver IP>      to:192.168.193.13
>
>In addition, I let through the required services for this mailserver (also serves as DNS-server, btw):
>
>Chain FORWARD (policy DROP 0 packets, 0 bytes)
> pkts bytes target     prot opt in     out     source               destination
> 2089  110K ACCEPT     udp  --  external dmz     0.0.0.0/0            192.168.193.13      udp dpt:53
[...]
>
>Now, we incidentally watch packets being dropped allthough they belong to valid connections:
>
>Aug 22 13:52:13 localhost kernel: DROP IN=external OUT= MAC=<firewall external mac>:<next router's mac>:08:00 SRC=<remoteip> DST=<external mailserver ip> LEN=109 TOS=0x00 PREC=0x00 TTL=54 ID=60517 DF PROTO=TCP SPT=18995 DPT=993 WINDOW=2282 RES=0x00 ACK PSH URGP=0

Try adding iptables -t nat -A PREROUTING -j LOG --log-prefix "[this did not get nated]"
and compare with the DROP IN=... line when they appear together.
>
>Something that confuses me: If I understand the log line above correctly, the packed is not dropped in the FORWARD chain 
>but in the INPUT chain. However, this would mean that the packet would not have been processed by the DNAT rule.
