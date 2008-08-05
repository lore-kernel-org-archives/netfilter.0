From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Is p-o-m still the correct thing to use?
Date: Tue, 5 Aug 2008 15:50:43 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0807290646260.21011@fbirervta.pbzchgretzou.qr>
References: <488A7D17.4070506@gmail.com> <s7sl841gefisi4k0lreotlvqbmq9kfl99u@4ax.com> <488EF032.5020000@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <488EF032.5020000@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Mearns <mearns.b@gmail.com>
Cc: Andrew Schulman <andrex@alumni.utexas.net>, netfilter@vger.kernel.org


On Tuesday 2008-07-29 06:25, Brian Mearns wrote:

> Thanks a lot for the help, Andrew. The iptables source I have
> doesn't have a configure script...oh, but it does have an autogen
> script. I guess I was probably supposed to use that first. But it's
> a moot point, apparently, because of xtables, so I will be
> switching to that.

Released tarballs should have configure; for autogen, you usually
need (even more) developer tools than you do without, like
autoconf, automake, and the other autowhatevers.

No moot point; iptables still is, as of today, the name of the
userspace package and control program.
