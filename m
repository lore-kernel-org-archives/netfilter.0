From: "Mario Ohnewald" <mario.Ohnewald@gmx.de>
Subject: Re: /sbin/iptables -vnxL OUTPUT
Date: Thu, 4 Mar 2004 14:33:17 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3661.1078407197@www50.gmx.net>
References: <20040303213113.GG757@home.manuelm.org>
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
To: Frank Gruellich <frank@home.manuelm.org>
Cc: netfilter@lists.netfilter.org

Hi,
> > I call this default policy at the beginning of my script (actually
> > SuSEFirewalls script):
>=20
> It doesn't matter, when you call it.  Packets traverse chains from top
> to bottom.  The 'bottom' is the default policy.  (Well, it's listed on
> top, but you know what I mean.)

Oh sorry, totally misunderstood that :/

> > so why am i "-j ACCEPT" accepting it before that?
>=20
> In these scrambled outputs I did not wanted to sort again was a
> match-any-rule with -j ACCEPT in your OUTPUT (it isn't set here).  So
> never a packet reached the bottom (policy) of your OUTPUT.
>=20

So since i ACCEPT the packets before they reach my default policy, i need to
get my traffic liek this?:
iptables -xv -L OUTPUT | grep "state NEW,RELATED,ESTABLISHED" | awk '{print
$2}'


Thanks, Mario

--=20
+++ NEU bei GMX und erstmalig in Deutschland: T=DCV-gepr=FCfter Virenschutz=
 +++
100% Virenerkennung nach Wildlist. Infos: http://www.gmx.net/virenschutz


