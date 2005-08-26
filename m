From: johnh@primebuchholz.com
Subject: ACK FIN Getting Dropped with RELATED, ESTABLISHED?
Date: Fri, 26 Aug 2005 13:23:17 -0400
Message-ID: <OFFA704CE1.E968EF7E-ON85257069.005EE7AF-85257069.005F847E@primebuchholz.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Greetings All,

Lately, packets such as the following are getting dropped:

Aug 26 13:17:38 firewall kernel: IPT PUB_IN Packet Died: IN=eth1 OUT= 
MAC=00:01:02:03:04:05:06:07:08:09:0A:0B:0C:0D SRC=aaa.bbb.ccc.ddd 
DST=www.xxx.yyy.zzz LEN=52 TOS=0x00 PREC=0x00 TTL=53 ID=9386 DF PROTO=TCP 
SPT=80 DPT=39729 WINDOW=24616 RES=0x00 ACK FIN URGP=0

Even though the PUB_IN table contains:

iptables -A PUB_IN -m state --state RELATED,ESTABLISHED -j ACCEPT

host www.xxx.yyy.zzz is the firewall snat'ing a connection from an 
internal squid proxy.

I checked /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close, 
which was set at 10, so I tried turning it up to 1000, to no effect.

Ideas?

Thanks,

-John
