From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: redundancy with Adsl modem
Date: Fri, 06 Jan 2012 12:16:39 -0600
Message-ID: <op.v7oc11lrx1lyi3@debiandesk2.net>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com> <1325574854.2270.130.camel@andybev-desktop> <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com> <op.v7jefiizx1lyi3@debiandesk2.net> <4F041738.9090908@freemail.hu> <op.v7kb75oyx1lyi3@debiandesk2.net> <4F0493D5.3040001@freemail.hu> <CAMTjHrw4Rrb7c4h5Sv2jRctiUcqWD8O-xZx54M9Dp5jc8qZYdQ@mail.gmail.com> <4F072B63.7060609@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F072B63.7060609@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: =?iso-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>, =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Andrew Beverley <andy@andybev.com>, Mail List - Netfilter <netfilter@vger.kernel.org>

On Fri, 06 Jan 2012 11:12:03 -0600, G=E1sp=E1r Lajos <swifty@freemail.h=
u> wrote:

> If the line goes down between step 2 and step 3 then the reply packet=
 will never get back to B1 and A (because the line is down) !!!
> If the line goes down after step 4 then you can send it out on the se=
cond extrenal IP (B2 - 2.2.2.2) but C will see it as a NEW connection !=
!!
>So I think that your request is impossible on IP level.
> However you can use a proxy or a mail server, etc. etc. etc.

I think any sort of "uplink redundancy" such as "Usuario de Sistema" is=
 looking for must be on the connection level, unless one is connecting =
to a server using some sort of link bonding or multilink protocol, whic=
h has to be supported on the gateway computer.  I have never done that.

My suggestions to Usuario for uplink redundancy assume that if an inter=
face/uplink goes down, the connection *will* be broken, but any followi=
ng connections will avoid the failed interface/uplink.  I think that is=
 the best that can usually be done to provide Internet connection redun=
dancy.  In my scenario, load-balancing is also performed by selecting t=
he interface for NEW connection from the LAN to Internet at random.

--=20
Lloyd
