From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: redundancy with Adsl modem
Date: Tue, 03 Jan 2012 19:58:20 -0600
Message-ID: <op.v7jefiizx1lyi3@debiandesk2.net>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com> <1325574854.2270.130.camel@andybev-desktop> <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: Andrew Beverley <andy@andybev.com>, =?iso-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Tue, 03 Jan 2012 09:18:03 -0600, Usu=E1rio do Sistema <maiconlp@ig.c=
om.br> wrote:

> Thanks, I found few documentation about lsm on Internet.
>
> if somebody has some how to about lsm post here please.
>

Hi,

I don't have a "how-to" document, but I can offer some tips on the use =
of lsm.

lsm is a powerful, flexible system, since when lsm detects that an inte=
rface is down, it executes a user-supplied script with a bunch of param=
eters about the interface that changed state (either "up" or "down").  =
That script can in turn run your router script, passing to it whatever =
parameters you want (usually the interface name that changed state and =
the new state). I use the same router script used to initialize the rou=
ter/firewall, but with different parameters.

I found it necessary to save the state of all interfaces in a bit field=
, saved as a decimal number in a file on disk.  That allows your router=
 script to know which interfaces are up and which are down, so it can r=
econfigure load-balancing when lsm notifies that an interface has chang=
ed state..  (lsm, when it "triggers," only supplies information about t=
he interface that changed state.  It does not pass any information abou=
t what interfaces are up and which are down.)

You can use bash's bitwise operators to retrieve and set interface stat=
e information in the bitfield.

=46or load-balancing, I have had excellent results with the "statistic"=
 module in "probability" mode.  With that module, all you need to do to=
 take an interface out of load-balancing (so it will no longer be selec=
ted for NEW connections) is to set it's "prob" value to zero, and readj=
ust the prob values of all the other uplinks.  The routing tables and p=
olicy routing rules do not need to be changed.

--
Lloyd
