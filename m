From: Whit Blauvelt <whit@transpect.com>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Mon, 24 Mar 2008 22:44:24 -0400
Message-ID: <20080325024424.GA16089@transpect.com>
References: <20080325012807.GA15637@transpect.com> <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

On Tue, Mar 25, 2008 at 02:58:25AM +0100, Jan Engelhardt wrote:

> Just what _do_ you actually have in /proc/sys/net/ipv6/conf?
> Just 4 entries seems a bit spartanic, since there are also
> the "all" and "default" entries:

I was mentioning where the mismatch was. Yeah the other stuff's there.

/proc/sys/net/ipv6/conf ends up with only:

   all default eth0 eth1 eth2 eth3 lo

while /proc/sys/net/ipv4/conf ends up (correctly) with:

   all default eth0 eth1 eth2 eth3 eth4 eth5 lo

Now, I don't know just which process is (not) doing the populating there,
but that's consistently where it ends up with ipv6 enabled and 6 NICs in the
box.

> # ls /proc/sys/net/ipv6/conf/
> all default lo rtl0 sis0 tun0 vmnet1
>
> NAT-out device is sis0. Even if I add in a number of dummies,
> all remains normal:
>
> all      dummy0  dummy2  dummy4  dummy6  dummy8  lo    sis0  vmnet1
> default  dummy1  dummy3  dummy5  dummy7  dummy9  rtl0  tun0

Not sure what you're thinking there. My problem wasn't with there being too
many devices, but with two of the devices I actually have not being
represented - and with Netfilter not doing _ipv4_ SNAT on account of
something with _ipv6_. Why should Netfilter ipv4 code even _care_ about
what's right or not with ipv6? Do you have any knowledge about
interdependency there? 

> It still works with opensuse plus 2.6.23. Well, I suggest you
> try a stock kernel.

It is a stock kernel, if by that you mean a stock distro kernel -
Ubuntu's latest, 2.6.22-14-server. 

> I would not say IPv6 was not ready.

I have no idea if the failure to fully populate the ipv6 proc eth? devices
was Debian-specific, Ubuntu-specific, a shortcoming of the ifupdown suite
both use, or a bug in the kernel itself. But it seems wrong on the face of
it for ipv4 Netfilter SNAT code to depend on ipv6 in any way. Yet something
about ipv6 on Ubuntu - possibly the failure to set NIC devices beyond eth3
up properly in the ipv6 /proc space - breaks Netfilter ipv4 snat. I'm still
hoping to understand why, in part because there's obviously a serious bug
_somewhere_, and it would be nice to report it to the right place.

Best,
Whit
