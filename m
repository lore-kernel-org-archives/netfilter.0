From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: log EVERYTHING
Date: Wed, 26 Mar 2003 09:10:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C9C@hslex01.hslbz.local>
References: <3E814345.5060508@shortcircuit.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E814345.5060508@shortcircuit.dyndns.org>
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
To: 'Dan Egli' <dan@shortcircuit.dyndns.org>, netfilter@lists.netfilter.org

> I was wondering if there was a way I could setup my rules to 
> log EVERYTHING, THEN process normally. I.e. if it's an 
> allowed port, log the connection, then pass it through, and 
> if it is a disallowed port, log the intrusion and then reject 
> the packet.
> 
> Is this possible?

Sure.


iptables -P INPUT DROP
iptables -A INPUT -i <inet_if> -p tcp --dport 22 -j LOG --log-level info
--log-prefix "ipt:ssh "
iptables -A INPUT -i <inet_if> -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i <inet_if> -p tcp --dport 80 -j LOG --log-level info
--log-prefix "ipt:http "
iptables -A INPUT -i <inet_if> -p tcp --dport 80 -j ACCEPT

<...More rules like these...>

iptables -A INPUT -i <inet_if> -j LOG --log-level info --log-prefix
"ipt:DROP! "


This will log all packets allowed and then accept them. If There's no
match for a packet it gets logged as "ipt:DROP!" and then will be
dropped (not rejected) by the default policy.

You can also reject the packet by using the following line as the last
rule :
iptables -A INPUT -i <inet_if> -j REJECT [--reject-with <some-type>]
In this case you don't really need the default policy, as no packet will
reach it.


Rob


