From: Dirk Mueller <dmuell@gmx.net>
Subject: ESTABLISHED with [UNREPLIED] state??
Date: Thu, 19 Feb 2004 17:54:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402191754.57501.dmuell@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


Hi, 

I'm experiencing a weird problem here. I start use ip_conntrack for stateful 
packet filtering on a machine that mainly does ftp server. it accepts state 
== NEW connections to port 21, and ESTABLISHED,RELATED to all hiports 
(1024-65535 TCP). 

The machine is highly unstable since then. I notice that the number of 

cat /proc/net/ip_conntrack | grep ESTABLISHED | grep UNREPLIED | wc -l

is steadily rising, and when it reaches something close to 65500 (the 
max_ip_conntrack limit), the machine crashes. 

Can anyone explain me what the purpose of a ESTABLISHED UNREPLIED connection 
is? It doesn't make any sense to me (how can a connection be established when 
its unreplied) ?

Thanks in advance,

Dirk

(PS iptables script available off-list)


