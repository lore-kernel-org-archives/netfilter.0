From: "Richard Gutery" <rgutery@MentorITS.com>
Subject: RE: (no subject)
Date: Tue, 29 Jun 2004 07:49:29 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1B5A52EE434FEB48AA4803AD84BD3FC37945@goliath.tngnet.net>
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

Stop macro:
$IPT -N LD
$IPT -A LD -j LOG
$IPT -A LD -j DROP

$STOP=3DLD (LD =3D Log and Drop)

$IPT =3D /sbin/iptables

I need to totally block all packets to and from this address =
64.246.26.185. So BLOCK means BLOCK.

We OpenBSD users usually mean blocking as dropping the silly thing on =
the floor. No ifs, ands or buts. Just gone...

As for the limiting, I simply copied a rule that was already in a =
firestarter script. So if I need to change the rule, I would be more =
than willing. Am I to assume that this is a bad rule?

tx for the assist.

rg

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Tuesday, June 29, 2004 7:31 AM
To: netfilter@lists.netfilter.org
Subject: Re: (no subject)


On Tuesday 29 June 2004 2:19 pm, Richard Gutery wrote:

>  I am form the Microsoft and OpenBSD world and have recently begun =
using
> RH7.3 for my firewall.
>
> I need to block an Internet Address.

What do you mean by "block"?

1. Stop packets from that address getting in to your firewall?
2. Stop packets from that address going through your firewall?
3. Stop packets to that address coming from your firewall?
4. Stop packets to that address going through your firewall?
5. Some combination of the above?

> I have theses two rules in my iptables file:
>
> $IPT -t filter -A INPUT  -p tcp -s 0/0 -d 64.246.26.185  --dport 80 -m
> limit --limit 2/minute -j $STOP
> $IPT -t filter -A OUTPUT -p tcp -s 64.246.26.185 -d 0/0  --dport 80 -m =
limit
> --limit 2/minute -j $STOP
>
> $STOP and $IPT are macro substitutions that works for everything else,
> so I know that's not the problem.

What does the $STOP macro expand to?

Also, the above rules are rate limiting rules - they will prevent =
packets=20
flowing more quickly than you specify - that is not at all the same =
thing as=20
blocking packets completely.

Tell us more precisely what you want to do (see above) and we can =
probably=20
advise on how to do it.

Regards,

Antony.

--=20
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the =
list;
                                                           please don't =
CC me.



