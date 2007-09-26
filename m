From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Stumped
Date: Wed, 26 Sep 2007 06:34:31 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0709260633120.23333@mail3.jubileegroup.co.uk>
References: <46F9DC83.7000808@spamcop.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46F9DC83.7000808@spamcop.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gerald Vogt <vogt@spamcop.net>
Cc: netfilter@vger.kernel.org

Hi there,

On Wed, 26 Sep 2007, Gerald Vogt wrote:

> Hi!
>
> I want to get iptables running on my Kurobox device (NAS). The kernel
> came without the filtering modules. Thus I recompiled a new kernel
> adding what was missing and installed it and all modules for the
> netfilter. Still I always get
>
> root@LS-GL7D6:~# iptables -L
> iptables v1.3.6: can't initialize iptables table `filter': Bad file
> descriptor
> Perhaps iptables or your kernel needs to be upgraded.
> [snip]
> iptables is from the debian stable packages. The kernel is 2.6.12.6-arm1.

Maybe iptables needs to be upgraded?  ISTR I once came across a situation
where I had to do that after a kernel upgrade on Debian.

--

73,
Ged.
