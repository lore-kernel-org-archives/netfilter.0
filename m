From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: redundancy with Adsl modem
Date: Wed, 04 Jan 2012 08:08:19 -0600
Message-ID: <op.v7kb75oyx1lyi3@debiandesk2.net>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com> <1325574854.2270.130.camel@andybev-desktop> <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com> <op.v7jefiizx1lyi3@debiandesk2.net> <4F041738.9090908@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F041738.9090908@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Andrew Beverley <andy@andybev.com>, =?iso-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>, Mail List - Netfilter <netfilter@vger.kernel.org>

On Wed, 04 Jan 2012 03:09:12 -0600, G=E1sp=E1r Lajos <swifty@freemail.h=
u> wrote:

> I have made some time ago an iface match that can check the state of =
an interface...
> Maybe you can use it. (It is in the xtables-addons)
>Swifty.

Hi Swifty,

I'm sure your iface match is very useful in many circumstances.  Howeve=
r I would like to point out that link status monitor (http://lsm.foobar=
=2Efi/) actually evaluates the link quality by pinging an IP (perhaps s=
everal hops past the gateway IP), keeping track of the number of lost a=
nd late-arriving packets over the last 60 seconds.  If the number of la=
te or dropped packets exceeds a certain (configurable) number, then the=
 link is reported as "down".  The main advantage to this (and the fact =
that it happens outside of netfilter) is that the firewall can be autom=
atically reconfigured to exclude the failed link from routing.  When th=
e link quality is seen to have improved, the failed link can be include=
d again in the routing decision.

--=20
Lloyd
