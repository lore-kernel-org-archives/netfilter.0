From: "Michael K" <micke@klintan.se>
Subject: Direct Connect DNAT rules
Date: Wed, 16 Apr 2003 08:51:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c303e4$93366bf0$0200a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a linux fw running SNAT to my lan. One of the lan computers is
running windows and a DC++ client. I wish to add DNAT rules that will
alow my DC++ client to use the active mode. 

If you don't know what DC++ is you will find info here.
http://dcplusplus.sourceforge.net/

Here is my setup.
DC++ Client ip = 192.168.0.2
LAN Interface = eth0
WAN Interface = eth1

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 412 -j DNAT --to
192.168.0.2
iptables -t nat -A PREROUTING -i eth1 -p udp--dport 412 -j DNAT --to
192.168.0.2

#Don't think I need these, perhaps moving them to the forward chain?
iptables -A INPUT -p tcp --dport 412 -j ACCEPT
iptables -A INPUT -p udp --dport 412 -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

Here is a log from tcpdump
# tcpdump -i eth1 host YYYYYYYYYY
tcpdump: listening on eth1
22:36:50.922913 YYYYYYYYYY.1706 > XXXXXXXXXX.net.412: S
1128686762:1128686762(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
22:36:50.923477 XXXXXXXXXX.412 > YYYYYYYYYY.1706: S
2874033958:2874033958(0) ack 1128686763 win 64240 <mss
1460,nop,nop,sackOK> (DF)
22:36:50.925982 YYYYYYYYYY.1706 > XXXXXXXXXX.412: . ack 1 win 64240 (DF)
22:36:50.927488 YYYYYYYYYY.1706 > XXXXXXXXXX.412: P 1:90(89) ack 1 win
64240 (DF)
22:36:51.110195 XXXXXXXXXX.412 > YYYYYYYYYY.1706: . ack 90 win 64151
(DF)

My box is XXXXXXXXXX

And the counters for DNAT rules increases
# iptables -t nat -L -nv
Chain PREROUTING (policy ACCEPT 105K packets, 9703K bytes)
pkts bytes target     prot opt in     out     source
destination
 168  8240 DNAT       tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:412 to:192.168.0.2
 113  7724 DNAT       udp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          udp dpt:412 to:192.168.0.2

My DC++ setup is to report my wan ip-address and use port 412
Still, I can't connect to other users that are in passive mode.

Please help

/Klintan



