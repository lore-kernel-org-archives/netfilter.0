From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Multiple PPTP clients behind NAT
Date: Mon, 13 Sep 2004 07:23:37 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040913052338.F38007C50@sterenborg.info>
References: <20040913022208.11511.qmail@web52510.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040913022208.11511.qmail@web52510.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org wrote:
...
> I recompiled Kernel 2.4.26 with the patch
> patch-o-matic-20031219 from www.netfilter.org and I recompiled
> iptables v1.2.11 

You may need a newer POM to match your iptables version...
(Why would you use a 9 months old POM when a new one is available ?)

> I have the required modules loaded:
> ip_conntrack_proto_gre
> ip_conntrack_pptp
> ip_nat_proto_gre
> ip_nat_pptp
> iptable_nat
> ip_conntrack
> ip_tables
> iptable_filter
> 
> However, the iptables rules stated in
> http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extr
> a-pptp-conntrack-nat are incomplete. Therefore, I cannot establish

iptables -j ACCEPT -m state --state RELATED,ESTABLISHED
iptables -j ACCEPT -d my_pptp_server -p tcp --dport 1723 -m state \
  --state NEW

These are the ones you are referring to.
1. These are for redirecting incoming pptp traffic to your pptp server.
2. They are missing a chain and you want to use the FORWARD chain.

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i <if_lan> -o <if_inet> -s <net_lan> -p tcp \
  --dport 1723 -m state --state NEW -j ACCEPT
iptables -t nat -A POSTROUTING -o <if_inet> -s <net_lan> -p tcp \
  --dport 1723 -j SNAT --to-source <ip_inet>

Probably you also need rules like these :

iptables -A FORWARD -i <if_lan> -o <if_inet> -s <net_lan> -p gre \
  -j ACCEPT
iptables -t nat -A POSTROUTING -o <if_inet> -s <net_lan> -p gre \
  -j SNAT --to-source <ip_inet>

> multiple connections successfully. The scenario is as
> following:
> 1. I can setup two connections at the same time (the
> signalling seems working) 2. However, only one client is able
> to ping the machines in the server network 3. If two machines
> try to ping at that same time, one of them will fail (the data path
> seems not working) 

You really mean ping ? Are the PPTP servers firewalled ? (Not in your
ascii art.)
We don't really know your config. Not sure why this happens.


Gr,
Rob


