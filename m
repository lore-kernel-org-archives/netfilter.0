From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Ping With Iptables.
Date: Tue, 29 Oct 2002 16:34:16 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210291631160.29974-100000@dns.toxicfilms.tv>
References: <F136m4qBbs8ltIzn9rZ00010163@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F136m4qBbs8ltIzn9rZ00010163@hotmail.com>
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
To: =?iso-8859-1?B?SOlsaW8gRHViZXV4?= <hdubeux@hotmail.com>
Cc: netfilter@lists.netfilter.org

Hello,

> I have a Linux Box as a Gateway of my network. And i want do allow internal
> machines to ping the Internet but i also want to block external machines to
> ping my Gateway. Is this is possible plz send me something... Thanx.

#let the internal net ping the world
iptables -A FORWARD -p icmp -s $YOUR_NET -j ACCEPT

#disallow the world to ping the gateway
iptables -I INPUT -p icmp -d $GATEWAY_IP -j DROP

Of course this is very rough, i do not know your rulesets, it is possible
that it can be done better to suit your current chains and rules.

Note, the -I INPUT - if we have other icmp rules, they may ACCEPT the
pings earlier than if we had just appended the rule, hence we're
inserting.



