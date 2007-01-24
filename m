From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Dropped fin acks (iptables + lvs)
Date: Wed, 24 Jan 2007 23:17:59 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701242315170.32656@yvahk01.tjqt.qr>
References: <163461433411784@lycos-europe.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <163461433411784@lycos-europe.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?Q? Patrik=20Kar=E9n?= <patrik.karen@home.se>
Cc: netfilter@lists.netfilter.org


>I am running iptables and lvs on two boxes loadbalancing http[s] and ssh traffic to two real servers.
>Everything is working just fine from the users point of view. However, 
>I keep seeing a lot of dropped packets of type ack/fin and ack/rst in 
>my iptables log. Seems like the connection tracking isn't working the 
>way I expect it to. The iptables config in short is:

RST-ACK is received as a response to SYN to a closed port, and hence, is 
not part of a connection.

>#This is the rule that should allow established connections, right?
>$IPTABLES -A Firewall-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

>Jan 24 16:46:11 10.0.1.107 kernel: drop: IN=eth0 OUT= 
>MAC=00:15:c5:ee:48:a7:00:04:de:18:18:00:08:00 SRC=<CLIENTIP> 
>DST=<$VIP1_e> LEN=52 TOS=0x00 PREC=0x00 TTL=49 ID=28407 PROTO=TCP 
>SPT=48404 DPT=443 WINDOW=65535 RES=0x00 ACK FIN URGP=0

The FIN-ACK case however looks worth looking into. I'd say do it without 
-m limit and see if _every_ connection ends up that way. Also use 
tcpdump to match sessions.


	-`J'
-- 

