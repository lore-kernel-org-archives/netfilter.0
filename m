From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: block ports
Date: Tue, 17 Sep 2002 16:30:58 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209171625380.12896-100000@dns.toxicfilms.tv>
References: <200209171745.06648@.>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209171745.06648@.>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: PayalR <payal@hotpop.com>
Cc: netfilter@lists.netfilter.org

> iptables -A INPUT -p udp --dport 21 -j ACCEPT
skip this.

> iptables -A INPUT -p udp --dport 22 -j ACCEPT
this too

> iptables -A INPUT -p udp --dport 143 -j ACCEPT
this too

> iptables -A INPUT -p udp --dport 3306 -j ACCEPT
and this.

ftp, ssh, https and mysql do not use udp for transport.

DNS does, so let it be.

> I am not sure exactly exactly about ESTABLISHED, RELATED which Anthony was
> talking about.
Put a

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
so that
1) Packets traverse a less number of rules
2) Allow eg. icmp related traffic to existing connections (like port
unreachables)

2) Well, if you do not need ACLs in OUTPUT, you may put some sanity
checks there: like -m unclean -m ttl, -m state --state INVALID, etc.
You may add a rule:
iptables -P OUTPUT ACCEPT
iptables -A OUTPUT -s ! <your.real.ip> -j DROP

If you are not forwarding, set it to ACCEPT.

Regards,
Maciej soltysiak



