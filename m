From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: blocking ports outbound
Date: Wed, 12 Mar 2003 16:45:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C41@hslex01.hslbz.local>
References: <3E6F268A.1060807@connectingyou.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E6F268A.1060807@connectingyou.com.au>
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

> I would like to know the rule to block ports outbound.
> 
> I am trying to block port 3128 my squid/proxy port.

Soo, ehm, you want to prevent outbound packets from squid ?
If you don't want that squid is sending packets, then why start squid at
all.

Well, if that's what you really want to :
iptables -A OUTPUT -p tcp --sport 3128 -j REJECT --reject-with tcp-reset
or simply
iptables -A OUTPUT -p tcp --sport 3128 -j DROP


Or don't you want users from the outside (internet) to connect ?

# Drops everything by default
iptables -P INPUT DROP

# Accepts anything coming in on your LAN interface,
# but you may want something more secure.
iptables -A INPUT -i <if_lan> -j ACCEPT


Rob


