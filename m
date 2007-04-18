From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Valid packets blocked as invalid?
Date: Wed, 18 Apr 2007 09:30:59 -0600
Message-ID: <web-69045730@bk1.webmaillogin.com>
References: <20070418151941.c689b07c.taeuber@bbaw.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070418151941.c689b07c.taeuber@bbaw.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Lars =?utf-8?Q?T=C3=A4uber?= <taeuber@bbaw.de>, netfilter@lists.netfilter.org

I'm guessing a routing problem here. If you see the log you can see that the 
packet marked as invalid have the same incoming/outgoing interface.

Your diagram, as you said is:

eth2
|
|
+--- gtw 194.95.188.25 --- LAN 194.95.188.192.
|
|
LAN 194.95.188.0/26

The gateway behind eth2 is in the same first network and you don't need a 
route in the box (the eth2 box) for the LAN behind the gateway because is 
managed for the gateway behind eth2.

This is the reason, the packet is not being routed properly.

Hope this help,

Jorge.

On Wed, 18 Apr 2007 15:19:41 +0200
  Lars Täuber <taeuber@bbaw.de> wrote:
> Hi everybody!
> 
> I just subscribed and haven't found any hints on the net.
> 
> We here have some packets dropped as invalid, but I don't understand why 
>they are invalid and which part of iptables/kernel marks it as invalid.
> So I ask for a hint where to look first or how to debug this. I'm a bit 
>familiar with ethereal/wireshark.
> 
> The situation:
> 
> - Linux hippo1 2.6.18.8-0.1-default #1 SMP Fri Mar 2 13:51:59 UTC 2007 
>i686 athlon i386 GNU/Linux
> - openSUSE 10.2 (i586)
> - iptables v1.3.6
> 
> eth0, eth1, lo and
> eth2 = 194.95.188.7 / 255.255.255.192 !!
> 
> 2 different networks are connected to eth2:
> 194.95.188.0   / 26 (directly) and
> 194.95.188.192 / 26 through gateway 194.95.188.25
> 
> routes:
> 
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use 
>Iface
> 194.95.188.192  194.95.188.25   255.255.255.192 UG    0      0        0 
>eth2
> 194.95.188.0    0.0.0.0         255.255.255.192 U     0      0        0 
>eth2
> 
> important iptables rules (in this order):
> 
> $IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # drop packets that do not match any valid state 
> #
> $IPTABLES -N drop_invalid
> $IPTABLES -A OUTPUT   -m state --state INVALID  -j drop_invalid
> $IPTABLES -A INPUT    -m state --state INVALID  -j drop_invalid
> $IPTABLES -A FORWARD  -m state --state INVALID  -j drop_invalid
> $IPTABLES -A drop_invalid  -j LOG  --log-level debug --log-prefix "RULE -1 
>-- DENY "
> $IPTABLES -A drop_invalid  -j DROP
> 
> 
> and now the bad log entry:
> 
> kernel: RULE -1 -- DENY IN=eth2 OUT=eth2 SRC=194.95.188.38 
>DST=194.95.188.233 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP 
>SPT=80 DPT=49272 WINDOW=5792 RES=0x00 ACK SYN URGP=0
> 
> This is answer of a packet that gets through the firewall because of this 
>rules:
> 
> $IPTABLES -A FORWARD -i eth2 -s 194.95.188.192/26 -m state --state NEW -j 
>ACCEPT 
> $IPTABLES -A FORWARD -p tcp -m tcp -m multiport -d 194.95.188.38 --dports 
>80,22,10080,10180 -m state --state NEW -j ACCEPT
> 
> 
> Could someone tell me what happens here?
> 
> Thank you and best regards.
> Lars
> 
> -- 
>                            Informationstechnologie
> Berlin-Brandenburgische Akademie der Wissenschaften
> Jägerstrasse 22-23                     10117 Berlin
> Tel.: +49 30 20370-352           http://www.bbaw.de
> 
> 

Jorge Isaac Davila Lopez
Nicaragua Open Source
davila@nicaraguaopensource.com

