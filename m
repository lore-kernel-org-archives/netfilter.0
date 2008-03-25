From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Tue, 25 Mar 2008 02:58:25 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr>
References: <20080325012807.GA15637@transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080325012807.GA15637@transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Whit Blauvelt <whit@transpect.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-03-25 02:28, Whit Blauvelt wrote:
> I for some reason took a look in
> /proc/sys/net/ipv6/conf. (Ubuntu insists on running ipv6 by default.) There
> was an anomoly: The new machine has 6 NICs, and while ipv4/conf had eth0
> through eth5, ipv6/conf only had them through eth3 - just the first 4.

Just what _do_ you actually have in /proc/sys/net/ipv6/conf?
Just 4 entries seems a bit spartanic, since there are also
the "all" and "default" entries:

# ls /proc/sys/net/ipv6/conf/
all default lo rtl0 sis0 tun0 vmnet1

NAT-out device is sis0. Even if I add in a number of dummies,
all remains normal:

all      dummy0  dummy2  dummy4  dummy6  dummy8  lo    sis0  vmnet1
default  dummy1  dummy3  dummy5  dummy7  dummy9  rtl0  tun0

It still works with opensuse plus 2.6.23. Well, I suggest you
try a stock kernel.

> Finally, is the Ubuntu Server project being boneheaded to even have ipv6
> enabled by default, if it's still this far from being ready for prime time?

I would not say IPv6 was not ready.

> Servers should be rock-solid at basic functions like SNAT out-of-the-box,
> IMHO.
