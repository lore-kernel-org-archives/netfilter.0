From: Whit Blauvelt <whit@transpect.com>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Mon, 24 Mar 2008 23:57:54 -0400
Message-ID: <20080325035754.GA16404@transpect.com>
References: <20080325012807.GA15637@transpect.com> <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr> <20080325024424.GA16089@transpect.com> <alpine.LNX.1.10.0803250354390.9368@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.1.10.0803250354390.9368@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

On Tue, Mar 25, 2008 at 03:57:49AM +0100, Jan Engelhardt wrote:

> How does it break? Do the counters increase in the nat table at all?
> Do the chain and/or rule counters increase if you add the same rule
> without action? (I.e.:
>
> 	-t nat -A POSTROUTING -o eth4 -m whatever
> 	-t nat -A POSTROUTING -o eth4 -m whatever -j SNAT --to xyz

No the counters don't increase. Again, ipv4 Netfilter SNAT does not work if
ipv6 is enabled on the system. It works perfectly if ipv6 is disabled - no
other changes. Do you have any theory about that, at all? It may well be
downstream of the failure to handle /proc assignments correctly for > 4 NICs
on the ipv6 side - understandably most people aren't network admins on my
level running boxes with > 4 NICs so that wouldn't bite that often. That
wouldn't make it not a bug, though.

>> It is a stock kernel, if by that you mean a stock distro kernel -
>> Ubuntu's latest, 2.6.22-14-server.

> Stock vanilla kernel.org kernel.

Why would I want to do that? If you read my orginal post closely, I have no
need for ipv6. It's fine with me to run without it - which works perfectly.
But what I want to do is understand where the fine bug is ... perhaps to
report it to those responsible. Now, it looks pretty obviously like there's
a serious bug in Netfilter here, because how else could anything about the
state of the ipv6 configuration affect the success of ipv4 Netfilter SNAT?

Now, if you can explain, theoretically, why I'm wrong about that, why the
state of the ipv6 configuration should be critical to ipv4 Netfilter SNAT
operation, I'm quite curious. But if you have no idea why the ipv4 Netfilter
SNAT rule fails if-and-only-if ipv6 operation is also enabled on the system,
then please let's see if someone who knows the innards of this stuff better
than either of us can help illuminate the puzzle.

Whit
