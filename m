From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: curious about interface rule
Date: Mon, 20 Oct 2003 23:49:06 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008001c3977d$e62bc440$8b00000a@casa>
References: <Pine.LNX.4.44.0310201956210.2100-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>, iptables mailing list <netfilter@lists.netfilter.org>



>
>   a question i just saw posted on another list -- when you select
> an interface in a rule, like "eth0", does that include all of its
> aliases like eth0:0, eth0:1, and so on?

   Yes, -i eth0 includes ALL eth0 aliases. No matter how many aliases you
have (eth0:0, eth0:1,...,eth0:30,etc), you have only one 'real' interface,
and this is the one you specify in -i or -o (eth0 in our case). It's
absolutely true that you CANNOT use '-i eth0:0'. Iptables does not accept
it.

[root@ns1 root]# iptables -I INPUT -i eth0:0 -j ACCEPT
Warning: wierd character in interface `eth0:0' (No aliases, :, ! or *).

    Note that we're talking on aliases interfaces. In some cases, you can
have 'logical' interfaces which needs other 'real' interfaces to exist. An
ipsec interface for example. You'll have eth2 (for example) which will be
your real 'external' interface, and you'll have a logical interface called
ipsec0. In this case, they are NOT aliases and so they can be used in -i
or -o with no problems.

    If you have some DSL connection which works with PPPoE, you'll have some
ethX interface which is the interface used to reach the DSL modem. When
PPPoE gets connected, you'll have ppp0 interface, which is a 'logical'
interface but it's not an aliases of the initial ethX interface. Thus, ethX
and ppp0 can be specified in -i and -o.

>
>   i would have initially thought yes, but if each of these aliases
> can have a different IP address associated with it, what happens
> when you add a destination IP address selector such as
> "-d 10.1.2.3", which is associated to only one of those aliases?
>

    Specifying IP addresses does not change the fact that '-i eth0' or '-o
eth0' will match all eth0 aliases also. Of course, you can 'workaround' this
specifying IPs just like you told.

iptables -A INPUT -i eth0 -p tcp -d x.x.x.1 --dport 80 -j REJECT
iptables -A INPUT -i eth0 -p tcp -d x.x.x.2 --dport 80 -j ACCEPT

    This will accept connections on port 80 for those packets which are
addressed to x.x.x.2 IP and block connections on port 80 for packets
addressed to x.x.x.1 IP, which should be your aliases IPs. Specifying IP in
the rules for matching interface aliases is a great workaround for the fact
that iptables does NOT handle interface aliases.

    Having different interfaces will allow you to make rules without worring
about IP addresses. Like:

iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 80 -j REJECT


    Sincerily,
    Leonardo Rodrigues


