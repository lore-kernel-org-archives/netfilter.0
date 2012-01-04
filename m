From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: redundancy with Adsl modem
Date: Wed, 04 Jan 2012 19:00:53 +0100
Message-ID: <4F0493D5.3040001@freemail.hu>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com> <1325574854.2270.130.camel@andybev-desktop> <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com> <op.v7jefiizx1lyi3@debiandesk2.net> <4F041738.9090908@freemail.hu> <op.v7kb75oyx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v7kb75oyx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: Andrew Beverley <andy@andybev.com>, =?ISO-8859-1?Q?Usu=E1rio_do_S?= =?ISO-8859-1?Q?istema?= <maiconlp@ig.com.br>, Mail List - Netfilter <netfilter@vger.kernel.org>

Hi Lloyd,

Thank you for your comment ! :D
I have never used this monitor, but I am going to try it... :D

2012-01-04 15:08 keltez=E9ssel, Lloyd Standish =EDrta:
> I'm sure your iface match is very useful in many circumstances. =20
> However I would like to point out that link status monitor=20
> (http://lsm.foobar.fi/) actually evaluates the link quality by pingin=
g=20
> an IP (perhaps several hops past the gateway IP), keeping track of th=
e=20
> number of lost and late-arriving packets over the last 60 seconds.  I=
f=20
> the number of late or dropped packets exceeds a certain (configurable=
)=20
> number, then the link is reported as "down".  The main advantage to=20
> this (and the fact that it happens outside of netfilter) is that the=20
> firewall can be automatically reconfigured to exclude the failed link=
=20
> from routing.  When the link quality is seen to have improved, the=20
> failed link can be included again in the routing decision.

I think that both of these approaches has pros and cons.

Maybe you also know that (in Linux) the kernel chooses the output=20
interface depending on the routing table and not the source IP...
So if the ping is not bound to a specific interface then it is "useless=
"...
(There is an oping utility that can be set up to use a specific interfa=
ce.)
I do not know LSM but I hope that it is also aware of this.

Besides this, pinging is not always accurate and may lead the=20
application think that link quality is dropping down...
Just imagine that the pinged host(s) can be under a DOS attack and the=20
reply times can go high...
(Not to mention that the pinging generates traffic and that requires=20
resources. Probably not too much resources at all :D)

Other question is that how often/rarely do you ping? If often then it i=
s=20
too much traffic. If rarely then do you REALLY KNOW that the interface=20
was all the time up?

To repeat myself: I do not know LSM :D

It seems to me that LSM is some kind of line quality checking software.=
=2E.

OTOH my match checks the interface state when the packet is in the queu=
e...
With that info you can mark the packets and let the kernel decide about=
=20
the routing depending on the mark..

But my match does not know anything about the "quality" of the=20
connection just about the state of the interface...

Returning to the main question:
If an interface goes down then the associated connections will most=20
likely break down...
Without knowing the required "high-availability" services, for example=20
you can use "fallback_relay" in postfix; multiple remote lines in=20
openvpn, etc. etc. etc.
So maybe the redundancy is not the right word for the main requirement.=
=2E.
I would ask myself: Do I really need redundancy or do I need alternativ=
ity?


Swifty
