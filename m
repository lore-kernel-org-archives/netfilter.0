From: "Richard Gutery" <rgutery@MentorITS.com>
Subject: RE: (no subject)
Date: Tue, 29 Jun 2004 08:25:37 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1B5A52EE434FEB48AA4803AD84BD3FC30552E8@goliath.tngnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Thanks Anthony that fixed it up. Actually, looking at your suggestion =
makes sense.

btw: is there a 'Good' iptables tutorial site around. I've looked at =
lots of sites but nothing that really jumped out and made good sense.

Again, thanks.

rg

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Tuesday, June 29, 2004 8:09 AM
To: netfilter@lists.netfilter.org
Subject: Re: (no subject)


On Tuesday 29 June 2004 2:49 pm, Richard Gutery wrote:

> Stop macro:
> $IPT -N LD
> $IPT -A LD -j LOG
> $IPT -A LD -j DROP

That has me really confused.   I was expecting you to say that $STOP =
expanded=20
to the word DROP, or some other valid target for the -j option on the=20
netfilter command line.

> $STOP=3DLD (LD =3D Log and Drop)

I don;t quite see how you can use this after -j on an iptables rule,=20
however...

> $IPT =3D /sbin/iptables
>
> I need to totally block all packets to and from this address =
64.246.26.185.
> So BLOCK means BLOCK.
>
> We OpenBSD users usually mean blocking as dropping the silly thing on =
the
> floor. No ifs, ands or buts. Just gone...

Oh, I understood what you meant by "block" - I wasn't sure which packets =
you=20
wanted to block, though, since it wasn't clear whether we were talking =
about=20
source or destination addresses, and forwarding through the firewall or =
going=20
to/from it directly.

> As for the limiting, I simply copied a rule that was already in a
> firestarter script. So if I need to change the rule, I would be more =
than
> willing. Am I to assume that this is a bad rule?

Well, it certainly won't BLOCK (using your definition above) - it will =
rate=20
limit - which means that some packets will still come through.

I suggest the following:

iptables -I INPUT -s 64.246.26.185 -j DROP
iptables -I OUTPUT -d 64.246.26.185 -j DROP
iptables -I FORWARD -s 64.246.26.185 -j DROP
iptables -I FORWARD -d 64.246.26.185 -j DROP

Regards,

Antony.

--=20
In Heaven, the police are British, the chefs are Italian, the beer is =
Belgian,=20
the mechanics are German, the lovers are French, the entertainment is=20
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is =
American,=20
the mechanics are French, the lovers are Swiss, the entertainment is =
Belgian,=20
and everything is organised by the Italians.

                                                     Please reply to the =
list;
                                                           please don't =
CC me.



