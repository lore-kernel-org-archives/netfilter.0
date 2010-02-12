From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Port forwarding with iptables on tunnel interface
Date: Fri, 12 Feb 2010 16:21:10 +0100
Message-ID: <1265988070.2980.90.camel@tesla.lan>
References: <1265912094.2985.44.camel@tesla.lan>
	 <4B745327.9020806@trash.net> <1265916014.2985.72.camel@tesla.lan>
	 <4B74E736.2020307@trash.net> <1265981292.2980.67.camel@tesla.lan>
	 <4B756895.2060106@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B756895.2060106@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

Hello Patrick !

You are very kind to offer your help and advice...

My reply follows your quoted text.

On Fri, 2010-02-12 at 15:41 +0100, Patrick McHardy wrote:
> Guido Trentalancia wrote:
> > Hello again Patrick,
> > 
> > and thanks for your kind reply.
> > 
> > The decapsulated packets are shown in the PREROUTING log output that I
> > attached in another message and that I am quoting here again:
> > 
> > Feb 11 20:50:15 gyokuro kernel: PREROUTING: IN=tunl0 OUT=
> > MAC=45:00:00:4c:d5:6a:00:00:29:04:0d:78:a9:e4:42:fb:c0:a8:01:44:45:00:00:38:55:74:40:00:24:06:62:30:51:58:30:3c:2c:86:f1:01:d7:dc:00:19:a6:fe:a2:4b:00:00:00:00:90:02:16:d0:89:4e:00:00:02:04:05:b4:04:02:08:0a:04:54:f7:3f:00:00:00:00:00:00:00:00:02:00:00:00:00:00:00:00:00:b0:05:08:00:00:00:00:00:00:00:00:00:e0:82:09:00:00:00:00:00:00:00:00:00:00:00:00 SRC=smtppeeripaddress DST=theipaddressoftheiptablesmachineonthetunnelinterface LEN=56 TOS=0x00 PREC=0x00 TTL=36 ID=21876 DF PROTO=TCP SPT=55260 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0 
> > 
> > So, because we have smtppeeripaddress (the host that originally
> > requested a connection on port 25 smtp), then they are decapsulated.
> > 
> > Consider the log output you are talking about is produced with:
> > 
> > -A INPUT -p 4 -j LOG --log-prefix "ipencap (in): "
> > 
> > therefore I was expecting it to only print packets with the IPIP
> > encapsulation protocol and not the decapsulated IP packets.
> > 
> > However, after further investigation I discovered that the problem lies
> > in the tunnel itself and perhaps in the way the iptables machine deals
> > with the packets from the tunnel interface. This is because even
> > connection directed to the iptables machine and not being redirected
> > anywhere are not working.
> > 
> > The point is that everything from the tunnel is allowed:
> > 
> > -A INPUT -p 4 -i eth0 -j ACCEPT
> > -A OUTPUT -p 4 -o eth0 -j ACCEPT
> > 
> > Despite that, I can't see decapsulated packets directed to port 25 (even
> > not considering host redirection with DNAT) using :
> > 
> > -A INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j LOG
> > --log-prefix "SMTP: "
> > 
> > or using:
> > 
> > -A INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j LOG
> > --log-prefix "SMTP: "
> > 
> > The only way I can see decapsulated packets, as already mentioned, is
> > through the PREROUTING log output. And in general I can see IPIP packets
> > using tcpdump or with the above mentioned "-p 4 -j LOG" rule.
> > 
> > How can I debug this decapsulation issue further. There might be
> > something wrong with the tunnel itself, perhaps not related to
> > iptables ?
> > 
> > I configure the tunnel using:
> > 
> > /sbin/ip tunnel add mode ipip local
> > theipaddressoftheiptablesmachineonthetunnelinterface dev tunl0
> > /sbin/ifconfig tunl0
> > theipaddressoftheiptablesmachineonthetunnelinterface mtu 512 up
> 
> So there's no IP address on tunl0?

Yes the IP for tunl0 is
theipaddressoftheiptablesmachineonthetunnelinterface that I referenced
elsewhere. Without getting into numbers it's a valid and unique public
IP address. I prefer not to post public IP addresses on the mailing
list.

> > One thing that I have observed is that when rp_filter is set to 0 for
> > the tunnel, then something appears in the log:
> > 
> > Feb 12 14:21:25 gyokuro kernel: SMTP (in): IN=tunl0 OUT=
> > MAC=45:00:00:4c:d2:2a:00:00:2a:04:0f:b8:a9:e4:42:fb:c0:a8:01:44:45:00:00:38:5f:e2:40:00:24:06:57:c2:51:58:30:3c:2c:86:f1:01:a2:12:00:19:eb:82:6c:3f:00:00:00:00:90:02:16:d0:73:a2:00:00:02:04:05:b4:04:02:08:0a:04:b5:33:dd:00:00:00:00:00:00:00:00:02:00:00:00:00:00:00:00:02:f4:0e:24:00:00:00:00:00:00:00:00:00:f0:7b:08:00:00:00:00:00:00:00:00:00:00:00:00 SRC=smtppeeripaddress DST=theipaddressoftheiptablesmachineonthetunnelinterface LEN=56 TOS=0x00 PREC=0x00 TTL=36 ID=24546 DF PROTO=TCP SPT=41490 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0 
> > 
> > Still smtppeeripaddress doesn't get a connection and anyway I am not
> > sure at all that rp_filter should be set to 0...
> > 
> > Any idea ? Thanks for your help !
> 
> Please post the full output of
> 
> ip link list
> ip addr show
> ip route show

ip link list:

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN 
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether 00:02:3f:0b:79:a8 brd ff:ff:ff:ff:ff:ff
3: wmaster0: <UP,LOWER_UP> mtu 0 qdisc pfifo_fast state UNKNOWN qlen
1000
    link/ieee802.11 00:07:40:dd:9c:88 brd 00:00:00:00:00:00
4: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether 00:07:40:dd:9c:88 brd ff:ff:ff:ff:ff:ff
5: pan0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN 
    link/ether 8e:03:0e:7c:f8:28 brd ff:ff:ff:ff:ff:ff
6: mon.wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc
pfifo_fast state UNKNOWN qlen 1000
    link/ieee802.11/radiotap 00:07:40:dd:9c:88 brd ff:ff:ff:ff:ff:ff
7: tunl0: <NOARP,UP,LOWER_UP> mtu 512 qdisc noqueue state UNKNOWN 
    link/ipip 0.0.0.0 brd 0.0.0.0

ip addr show (only relevant entries):

2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether 00:02:3f:0b:79:a8 brd ff:ff:ff:ff:ff:ff
    inet 192.168.3.64/24 brd 192.168.3.255 scope global eth0
    inet6 fe80::202:3fff:fe0b:79a8/64 scope link 
       valid_lft forever preferred_lft forever
7: tunl0: <NOARP,UP,LOWER_UP> mtu 512 qdisc noqueue state UNKNOWN 
    link/ipip 0.0.0.0 brd 0.0.0.0
    inet theipaddressoftheiptablesmachineonthetunnelinterface/8 scope
global tunl0

ip route show (only relevant entries):

192.168.3.0/24 dev eth0  proto kernel  scope link  src 192.168.3.64

tunl0 has 248 entries, I cannot post all of them here and also I don't
want to expose the public IP addresses of my peers for privacy and
security reasons. It's basically 248 entries from the same network of
theipaddressoftheiptablesmachineonthetunnelinterface routed via public
Internet addresses of other machines.

> and all iptables rules.
> 
> You can also  try tracing the packet's flow through the ruleset
> using the TRACE target.

I look forward to hearing from you.

Regards,

Guido


