From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables questions
Date: Tue, 26 Nov 2002 19:08:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211261908.46820.netfilter@newkirk.us>
References: <20021126233326.75120.qmail@web14507.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021126233326.75120.qmail@web14507.mail.yahoo.com>
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
To: james li <shijialeeee@yahoo.ca>, netfilter@lists.netfilter.org

On Tuesday 26 November 2002 06:33 pm, james li wrote:
> hi,
>
> i am learning iptables through the HOWTO. there is one
> command i am not sure. can someone explain it to me
> please?
>
> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
>
> from author  'this rule will allow all traffic from
> our $LAN_IFACE to any other interface to flow
> freely,in other word,in other words allow all traffic
> from our LAN to the Internet'.
>
> is there a default '-o eth+' in the above command that
> is omitted ? should it better be
> $IPTABLES -A FORWARD -i $LAN_IFACE -o $INET_IFACE -j
> ACCEPT
>
> INET_IFACE as (internet_interface)

Not necessarily.  If you only have two interfaces, and use the first rule=
, it=20
will match anything coming in the $LAN_IFACE interface, regardless of=20
destination.  (well, if the destination is local to the firewall machine =
it=20
won't match, because it will be in the INPUT filter chain instead of=20
FORWARD... :^)  If you have more than two interfaces, or situations where=
=20
forwarding back out the same LAN interface takes place (like connecting t=
he=20
LAN to a local server, perhaps) then you might want to have different rul=
es=20
depending on destination, otherwise leaving it out simply means you don't=
=20
care what output interface is used.  You usually would NOT want to match=20
solely on the -o parameter, since that could allow incoming traffic from =
the=20
internet to forward back out in this scenario, but such a rule is also va=
lid.

If you have a DMZ hanging off a third interface from the firewall, then=20
filtering rules pertaining to the DMZ would probably be most easily defin=
ed=20
based on -o $DMZ_IFACE.  (or whatever name you used)

Depending on where the rule is placed (INPUT, FORWARD, OUTPUT, etc) you m=
ay=20
find it useful to apply or omit particular parts of a rule.  For example,=
 in=20
PREROUTING chains (NAT or MANGLE) -o is undefined, so you DON'T want to t=
ry=20
to match it there.  In the FORWARD filter chain the output interface is=20
defined, but often isn't important, more important (IE more useful to=20
filtering) would be the input iface and source/dest IP's in most cases.

j

