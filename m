From: <bmcdowell@coxhealthplans.com>
Subject: RE: [despammed] -i and -o options for iptables FORWARD chain
Date: Fri, 2 Jan 2004 09:13:09 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731012C6B04@coxhpexg.coxhp.com>
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


Actually, couldn't this be just a 2.6.x change? (I never saw the rules =
go by...)  I thought I saw a message go by earlier to that effect.  =
Something about the syntax and needing '--physdev' and '-i' both, or =
something?

I could search the archives, I guess, but instead I suggest Gonya give =
that a go.


Bob
-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Friday, January 02, 2004 8:03 AM
To: netfilter@lists.netfilter.org
Subject: Re: [despammed] -i and -o options for iptables FORWARD chain


On Friday 02 January 2004 1:30 pm, Andreas Kretschmer wrote:

> am  Wed, dem 31.12.2003, um 15:36:34 -0800 mailte Gongya Yu folgendes:
> > Hi, I just updated Linux kernel to 2.6.0 with iptables and ebtables
> > enabled.
>
> I'm using iptables on 2.4.x, possible there are differences with =
2.6.x.
>
> > But iptables ignores -i and -o options for FORWARD chain. Wheneneve =
I use
> > something like -i eth0 or -o eth0, the rule is just ignored.
>
> RTFM!
>
> -i is only for INPUT, FORWARD and PREROUTING
> -o is only for FORWARD, OUTPUT and POSTROUTING

Are you suggesting that -i and -o cannot be used in FORWARD?   As far as =
I can=20
see the syntax of the rule Gonya posted is perfectly okay.

Antony.

--=20
Christmas is an opportunity to upgrade to kernel 2.6 while no-one's =
around to=20
notice the downtime.

                                                     Please reply to the =
list;
                                                           please don't =
CC me.


