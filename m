From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: redundancy with Adsl modem
Date: Wed, 04 Jan 2012 14:55:19 -0600
Message-ID: <op.v7ku2hxax1lyi3@debiandesk2.net>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com> <1325574854.2270.130.camel@andybev-desktop> <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com> <op.v7jefiizx1lyi3@debiandesk2.net> <4F041738.9090908@freemail.hu> <op.v7kb75oyx1lyi3@debiandesk2.net> <4F0493D5.3040001@freemail.hu> <CAMTjHrw4Rrb7c4h5Sv2jRctiUcqWD8O-xZx54M9Dp5jc8qZYdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrw4Rrb7c4h5Sv2jRctiUcqWD8O-xZx54M9Dp5jc8qZYdQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, =?iso-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Andrew Beverley <andy@andybev.com>, Mail List - Netfilter <netfilter@vger.kernel.org>

On Wed, 04 Jan 2012 14:15:12 -0600, Usu=E1rio do Sistema <maiconlp@ig.c=
om.br> wrote:

> yes, I need redundancy. when an line adsl come down all traffic go to
> other line adsl. I couldn't have done this on linux machine. if you
> has any how to about please post here.


One simple way to do this is to use the gateway failover that is built-=
in to Linux.  I haven't done this, since I wanted more in-depth link qu=
ality monitoring, but I understand that all you have to do is to set up=
 a default route for each of your interfaces, and then reduce the gc_ti=
meout value.  From http://www.muug.mb.ca/pipermail/roundtable/2005-May/=
000872.html:

"Enabling failover routing

After you have configured your network, the next step is to enable
failover routing on your Linux box, so that if the first route dies the
router will automatically switch over to the next route. To do so,
you'll need to add the default gateway routes provided to you by your
ISPs for both your network cards:

# route add default gw 61.16.130.97 dev eth0
# route add default gw 200.15.110.90 dev eth1

=46inally, modify the /proc/sys/net/ipv4/route/gc_timeout file. This fi=
le
contains a numerical value that denotes the time in seconds after which
the kernel declares a route to be inactive and automatically switches t=
o
the other route if available. Change its default value of 300 to some
smaller value, say 10 or 15. Save the changes and exit.

# echo "10" > /proc/sys/net/ipv4/route/gc_timeout

Now your Linux machine is ready to serve as a failover router,
automatically and quickly switching to the secondary route every time
the primary route fails."

--=20
Lloyd
