From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: How to drop an idle connection with iptables?
Date: Tue, 22 Nov 2011 21:27:48 -0600
Message-ID: <op.v5do5sdcx1lyi3@debiandesk2.net>
References: <21022AAE83454AF0ACBAE718CA7C7A06@luzhongda>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <21022AAE83454AF0ACBAE718CA7C7A06@luzhongda>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org, =?utf-8?B?6ZmG5Luy6L6+?= <zhongda.lu@dev.bessystem.com>

On Tue, 22 Nov 2011 06:22:56 -0600, =E9=99=86=E4=BB=B2=E8=BE=BE <zhongd=
a.lu@dev.bessystem.com> wrote:

> Follows:
>      Does anyone know about how to drop an idle connection when timeo=
uts?
>      Thanks for any feedback in advance.
> Best Regards.
> Lu Zhongda
>

I think you are referring to what is called "dead gateway detection."  =
There are patches for current kernels to allow netfilter to do this (ht=
tp://www.ssi.bg/~ja/#routes).

I think these patches allow the kernel to determine when the nexthop ro=
uter is down, but I don't think they will detect failure beyond that (s=
everal hops out).  However, I did not try the patches.

In my investigation of the alternatives for detecting a bad uplink and =
adjusting the routing accordingly, I found an open source program, lsm =
(Link Status Monitor, http://lsm.foobar.fi/), which actually does confi=
gurable ping traffic analysis (to any IP) to determine when an uplink s=
hould be removed or replaced.  I am not sure, but I think this level of=
 control is not available through the kernel patches linked to above.

lsm detects failed links and executes an user-supplied script on each f=
ailure or recovery event, passing parameters with info on which interfa=
ce was involved and whether it is "up" or "down".  You can rewrite your=
 firewall script to accept these lsm-supplied parameters to readjust an=
y load-balancing routing, send emails to announce the event, etc.  This=
 will become clear when you check out the lsm package.

If more than one interface may be down at the same time (which is my ca=
se), the "state" of the interfaces will need to be saved.  This is beca=
use lsm only notifies when a single link changes.  I suggest using a bi=
t field saved to a file, using bit-wise operators.  That's what I did, =
using bash.

(Since lsm keeps state information about all the monitored links, it wo=
uld be interesting to modify lsm to pass a "state" bitfield as one of t=
he parameters upon every state change.)

Good luck!
