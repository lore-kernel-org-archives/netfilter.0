From: Claus Regelmann <claus.regelmann@inka.de>
Subject: Filter in POSTROUTING
Date: Thu, 11 Sep 2003 23:03:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F60E30A.F61FD84F@inka.de>
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
To: netfilter@lists.netfilter.org, blueflux@koffein.net

Hello,

There is a figure Oskar Andreassoons IPTABLES TUTORIAL (V1.1.19, chap.
3.1, pg.19)
where both, the forwarded and the local output, join the postrouting
chain.

Why shoudnt it be possible to filter all outgoing e.g. smb traffic from
a local
network at that place with a command like
>iptables -t nat -A POSTROUTING -o ppp0 -p tcp --dport 137:139 -j DROP
>iptables -t nat -A POSTROUTING -o ppp0 -p udp --dport 137:139 -j DROP

The same question applies to the PREROUTING chain for input
>iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 137:139 -j DROP
>iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 137:139 -j DROP

Thanks
Claus

