From: Tom Van Overbeke <tvanoverbeke@ccncsi.net>
Subject: iptables v1.2.4 logs dropped packets that should have been allowed ?
Date: Thu, 24 Jul 2003 11:08:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c351c3$2448f6e0$d90315ac@rsrc.be.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi,


I hope someone can shed some light on a mistery i have:


our firewall (also squid proxy) serves some 50 desktops for web browsing.

Everything works fine, noone complains about sites not being accessible or
sth, but in the firewall logs, i see very regularly 2 types of blocked
packets:


Jul 16 16:49:11 dobermann kernel: -drop_the_rest-IN=eth0 OUT=
MAC=00:06:5b:f7:66:96:00:00:d1:ec:fa:3b:08:00 SRC=213.199.148.12
DST=172.17.2.1 LEN=64 TOS=0x00 PREC=0x00 TTL=54 ID=11706 PROTO=TCP SPT=80
DPT=55475 WINDOW=17125 RES=0x00 ACK URGP=0

DST ip is the external interface of the proxy server. to me, this appears to
be the reply from an attempt of the squid proxy to initiate a connection
with a remote website (because of the ACK).
(in case you wonder why the external interface ip is a private address, this
is because there is another firewall down the road before our company
reaches the internet).
i see no reason why this packet would be blocked, because i can't find the
corresponding SYN packet in my logs.
anyway, The connection between these hosts and ports in this example are
configured to be permitted.


second type of blocked packets:

Jul 16 11:57:47 dobermann kernel: -drop_the_rest-IN= OUT=eth1 SRC=172.21.3.1
DST=172.21.3.209 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=6144 PROTO=TCP SPT=3128
DPT=2408 WINDOW=16056 RES=0x00 ACK PSH FIN URGP=0
Jul 16 13:16:19 dobermann kernel: -drop_the_rest-IN= OUT=eth1 SRC=172.21.3.1
DST=172.21.3.209 LEN=1102 TOS=0x00 PREC=0x00 TTL=64 ID=25203 PROTO=TCP
SPT=3128 DPT=3384 WINDOW=6468 RES=0x00 ACK PSH URGP=0

SRC is the internal ip of the firewall / squid proxy; DST is one of the
desktop pc's used to surf the web.

this packet looks like it's the squid that is forwarding the received web
page back to the requesting client (because of the ACK and PSH bits set).
the source port is 3128, where we have configured our proxy to listen to.


to me this doesn't make sence: it seems almost like iptables has forgotten
about the already established connection and seems to drop the packet
because it can't find it in the connection tracking table.

our firewall is iptables v1.2.4 running on redhat advanced server 2.1.
the firewall was setup via fwbuilder, with connection tracking enabled for
most of the rules (and definitely for the 'allow squid traffic' rule).
cat /proc/sys/net/ipv4/conntrack_max is 32760
cat /proc/net/ip_conntrack | wc -l is 172 (i assume these 2 variables are
related ?).



thx,


Tom.


****************************************************************************
Disclaimer: 
This electronic transmission and any files attached to it are strictly 
confidential and intended solely for the addressee. If you are not 
the intended addressee, you must not disclose, copy or take any
action in reliance of this transmission. If you have received this 
transmission in error, please notify the sender by return and delete
the transmission.  Although the sender endeavors to maintain a
computer virus free network, the sender does not warrant that this
transmission is virus-free and will not be liable for any damages 
resulting from any virus transmitted. 
Thank You.
****************************************************************************


