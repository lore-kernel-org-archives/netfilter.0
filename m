From: Gabriel Paues <gabriel@sics.se>
Subject: Re: alternate tables and ipv6
Date: Thu, 06 Jun 2002 10:20:01 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFF1B30.88B9A6E@sics.se>
References: <20020604122434.A667@rainbow>  <3CFCC1CB.DF79783F@sics.se> <1023312983.28008.25.camel@hoi>
Reply-To: gabriel@sics.se
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Andras Kis-Szabo <kisza@securityaudit.hu>
Cc: Netfilter <netfilter@lists.samba.org>

I guess I have to implement it myself, then...

Be back when I have, with a patch!

Sincerily,
Gabriel

Andras Kis-Szabo wrote:

> Hi,
>
> > iptables -A PREROUTING -i eth0 -t mangle -m tos --tos 0 -j MARK --set-mark 1
> > ip rule add fwmark 1 table host2.out
> > ip route add default via 192.168.2.3 dev eth2 table host2.out
> >
> > All is working fine in the IPv6 case except the last statement (slightly altered
> > for IPv6):
> > #ip -6 route add default via fec0::192.168.2.3 dev eth2 table host2.out
> > RTNETLINK answers: File exists
> >
> > Is this approach incompatible with IPv6 in any way? Is there any problems with
> > using IPv6-addresses and the "table" object?
> I think this is not a Netfilter-related question, but I try to answer.
>
> The basic rtnetlink functions are supported in IPv6 too, but not all.
> Configuration options for IPv4:
> - TCP/IP networking
> -   IP: multicasting
> -     IP: advanced router
> -       IP: policy routing
> -         IP: use netfilter MARK value as routing key
> With this You set the CONFIG_IP_ROUTE_FWMARK flag in the configuration.
> This flag is interperted in the IPv4 code, but its whole function is
> missing from the IPv6 code.
>
> The related files and structures:
> /usr/src/linux/net/ipv4/devinet.c
> static struct rtnetlink_link inet_rtnetlink_table[RTM_MAX-RTM_BASE+1]
> /usr/src/linux/net/ipv6/addrconf.c
> static struct rtnetlink_link inet6_rtnetlink_table[RTM_MAX-RTM_BASE+1]
> And severeal other functions and structures in the routing code.
>
> When you try to add a rule with a 'table' object, the 'ip' command -
> maybe - simply discards the 'table' tag.
>
> Regards,
>
>         kisza
>
> --
>     Andras Kis-Szabo       Security Development, Design and Audit
> -------------------------/        Zorp, NetFilter and IPv6
>  kisza@SecurityAudit.hu /-----Member of the BUTE-MIS-SEARCHlab------>


