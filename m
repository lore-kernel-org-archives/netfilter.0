From: "Mario Ohnewald" <mario.Ohnewald@gmx.de>
Subject: Re: /sbin/iptables -vnxL OUTPUT
Date: Wed, 3 Mar 2004 18:13:44 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <18196.1078334024@www39.gmx.net>
References: <20040302170849.GD757@home.manuelm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Hi,
> > I have got a iptables firewall running and i want to monitor my traffic,
> > therefore i played arund with the following command:   /sbin/iptables
> -vnxL
> > OUTPUT | grep "Chain OUTPUT"
> > It worked fine, although, after a while it kept getting the result:
> > Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
> > I reloaded the filter rules, still the same.
>=20
> Please don't wrap outputs.
>=20
> > Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>                     These-----^----------^
> are only the counters of your default policy.  Your traffic is...
>=20
> >     pkts      bytes target     prot opt in     out     source          =
=20
>   destination
> >        9     2051 ACCEPT     all  --  *      lo      0.0.0.0/0         =
=20
> 0.0.0.0/0
> >        0        0 ACCEPT     icmp --  *      *       0.0.0.0/0         =
=20
> 0.0.0.0/0           icmp type 11
> >        2      132 ACCEPT     icmp --  *      *       0.0.0.0/0         =
=20
> 0.0.0.0/0           icmp type 3 code 3
> >        0        0 DROP       icmp --  *      *       0.0.0.0/0         =
=20
> 0.0.0.0/0           icmp type 3
> >     9535  2685876 ACCEPT     all  --  *      *       0.0.0.0/0         =
=20
> 0.0.0.0/0           state NEW,RELATED,ESTABLISHED
>      ,^^^^--^^^^^^^
> ... here.         =20
> >        0        0 LOG        all  --  *      *       0.0.0.0/0         =
=20
> 0.0.0.0/0           LOG flags 6 level 4 prefix `SuSE-FW-OUTPUT-ERROR '
> >=20
> > [snip stuff]
> >=20
> > How come it wont count up the Accepted packaged and Bytes?
>=20
> It would, but as you -j ACCEPT everything before the default policy it
> can't.

I call this default policy at the beginning of my script (actually
SuSEFirewalls script):

$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD             2> /dev/null
$IPTABLES -P INPUT "$DROP"
$IPTABLES -P OUTPUT "$ACCEPT"
$IPTABLES -P FORWARD "$ACCEPT"     2> /dev/null
$IPTABLES -F
$IPTABLES -X
$IPTABLES -t nat -F
$IPTABLES -t nat -X
$IPTABLES -t mangle -F
$IPTABLES -t mangle -X



so why am i "-j ACCEPT" accepting it before that?



Thanks, Mario

--=20
+++ NEU bei GMX und erstmalig in Deutschland: T=DCV-gepr=FCfter Virenschutz=
 +++
100% Virenerkennung nach Wildlist. Infos: http://www.gmx.net/virenschutz


