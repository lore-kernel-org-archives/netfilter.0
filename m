From: Joel Newkirk <newkirk@newkirk.us>
Subject: Re: load-balancing with netfilter: round robin or what??
Date: Mon, 06 Oct 2003 16:34:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065472484.12495.190.camel@alpha.newkirk.us>
References: <1065434375.1604.33.camel@vitoria.intra.cet.pt>
Reply-To: newkirk@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065434375.1604.33.camel@vitoria.intra.cet.pt>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Pedro Salazar <pedro-b-salazar@ptinovacao.pt>
Cc: netfilter@lists.netfilter.org

Ol=E1 Pedro.  (g - I read ahead ;^)

On Mon, 2003-10-06 at 05:59, Pedro Salazar wrote:
> Greetings,
>=20
> I pretend to load-balancing to two servers but apparently I think only
> one machine is getting the requests.
>=20
> These are the rules I run in iptables:

> /sbin/iptables -v -t nat -A PREROUTING --dst 192.168.89.44 -p tcp \
>  --dport 9000 -j DNAT --to-destination 192.168.89.158:80 \
>  --to-destination 192.168.89.159:80

> /sbin/iptables -v -t nat -A OUTPUT -p tcp -m tcp --dport 9000 \=20
> --dst 192.168.89.44 -j DNAT --to-destination 192.168.89.158:80 \
>  --to-destination 192.168.89.159:80
>=20
> As you can see, I have two destinations hosts, 192.168.89.158/31. The
> 192.168.89.44 is the gateway itself that is redirecting requests on port
> 9000 to the two http servers. All of them are in the same network.

But the rule performing the balancing is in OUTPUT table, and so only
affects connections from the NAT box itself...  Also, I think your
double --to construction is invalid, iptables accepts it but it appears
never to work.

Try this rule:

/sbin/iptables -t nat -A PREROUTING -d 192.168.89.44 -p tcp --dport  \
9000 -j DNAT --to 192.168.89.158-192.168.89.159:80

It will distribute new connections 'randomly' across the DNAT ip space,
in this case two IPs.  This isn't 'real' load-balancing, but it's a
quick and easy substitute that is sufficient for many purposes.

j

--- You know you have ADD when...You run Linux just because KDE lets you
have 16 simultaneous desktops.


