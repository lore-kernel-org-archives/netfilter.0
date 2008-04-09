From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: xtables combined, thanks
Date: Wed, 9 Apr 2008 13:56:03 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804091350380.4411@fbirervta.pbzchgretzou.qr>
References: <47FC79B5.9080709@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47FC79B5.9080709@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brent Clark <brentgclarklist@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-09 10:09, Brent Clark wrote:
>
> What a pleasure with the xtables-combined-1.5.3+20080329.tar.bz2 ,
> everything installed automagically. It was great.
>
> Im gonna move / use this on to my production FW.
>
> On the side, and to help add some real value to your product, so
> much so that newbies will rather use "out the box / prefer less
> tampering", If you don't mind some advise / suggestion,
> distributionate your xtables. What I mean is, it might / will be
> useful to create deb, rpms etc.

Providing distro-specific packages would be a huge task, so if at
all, I'll leave that up to distributions or contributors. Especially
since it builds kernel modules, you would have to build it against
all kernels/kernel flavors. On opensuse that's easy so I do that, but
for debian for example -> :rolleyes:, someone else please take over :-)
I rather focus on xt-a itself.

Given that patches start trickling into the main iptables package,
something will probably happen automatically, but that's a bit into
the future still it seems - depends on how fast the merge goes.

Leaves xtables-addons; if distros could jump on it themselves, the
better.
