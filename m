From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: 3rd NIC & SNAT Question
Date: Mon, 5 May 2003 23:02:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002501c31349$9a34ae70$0401000a@sterenborg.info>
References: <200305011113.36865.franco@gasperino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305011113.36865.franco@gasperino.org>
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
To: franco@gasperino.org, netfilter@lists.netfilter.org

> connections in the /proc/net/ip_conntrack file. How can I 
> force the last SNAT 
> rule below to only nat the 10.0.0.0/24 net and not touch the 
> 100.100.101.0/24 
> net?
> 
> Public External Net: 100.100.100.0/30
> Public External Address: 100.100.100.2
> Public External Interface: eth0
> 
> Local Private Net: 10.0.0.0/24
> Local Private Address: 10.0.0.1
> Local Private Interface: eth1
> 
> Local Public Net: 100.100.101.0/24
> Local Public Address: 100.100.101.1
> Local Public Interface: eth2
> 
> iptables -A INPUT -j ACCEPT
> iptables -A OUTPUT -j ACCEPT
> iptables -A FORWARD -j ACCEPT
>
> iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -j SNAT --to-source 
> 100.100.100.2

What if you make this :

iptables -P FORWARD DROP
iptables -A FORWARD -i eth1 -o eth0 -s 10.0.0.0/24 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -s 100.100.101.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.0/24 \
 -j SNAT --to-source 100.100.100.2


Rob.


