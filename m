From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 18:34:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405101834.13336.Antony@Soft-Solutions.co.uk>
References: <1084206191.409fac6f1176a@webmail.floog.net> <1084209288.1804.13.camel@anduril.intranet.cartel-securite.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084209288.1804.13.camel@anduril.intranet.cartel-securite.net>
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
To: netfilter@lists.netfilter.org

On Monday 10 May 2004 6:14 pm, Cedric Blancher wrote:

> Le lun 10/05/2004 =E0 18:23, michael@floog.net a =E9crit :
> > The LAN currently has 5 computers connected to it with static IP
> > addresses:
> > 192.168.1.2
>
> [...]
>
> > 192.168.1.6
> > I will be adding 3 more machines with with static IP addresses:
> > 192.168.1.7
> > 192.168.1.8
> > 192.168.1.9
> > Issue:
> > *.9 needs to remain accessible from *.7 and *.8; however, I need to
> > restrict any connection or accessibility to *.9 from *.2 - *.6.
>
> You can't restrict this kind of communication for it does not go throug=
h
> your box. If you want to achieve this, then you have a Linux box a a
> filtering bridge.
>
> Activate bridge filtering (available in stock 2.6 kernels) using
> Netfilter and you're done.

Just an addendum to my previous response, which was a much simpler soluti=
on=20
than this, but assumed (!) that the 192.168.1.9 machine was running Linux=
,=20
and therefore could have netilter installed on it :)

Sorry for making that assumption - if it's not the case, then a bridging =
setup=20
like Cedric has described is probably your best solution.

[ Note to self: I must remember that people use things other than Linux o=
n=20
their networks :)  ]

Regards,

Antony

--=20
It is also possible that putting the birds in a laboratory setting=20
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


