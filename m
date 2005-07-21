From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: help for iptables
Date: Thu, 21 Jul 2005 15:04:04 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507211500310.14871@yvahk01.tjqt.qr>
References: <E1A93F9B47A8452B9B3368E37904A84F@mitpl.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1A93F9B47A8452B9B3368E37904A84F@mitpl.com>
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
To: SWAPNIL <postmaster@modular-infotech.com>
Cc: netfilter@lists.netfilter.org


>Router outgoing request handle by "iptables-1.2.7a-2" using following
>command:
>[root@gw-host8 root]# iptables -t nat -A POSTROUTING -s 192.168.1.2 -d
>202.56.54.10 -j MASQUERADE
>
>I have got a query about how to handle incoming requests for local webserver
>using routers static IP address?

You need to reserve a port on the router which will forward to the local 
webserver, e.g.

iptables -t nat -A PREROUTING -s 202.56.54.10 -p tcp --dport 8000 -j DNAT 
--to-dest 192.168.1.1:80



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

