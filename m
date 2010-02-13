From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 17:55:43 +0100
Message-ID: <1266080143.2916.65.camel@tesla.lan>
References: <368e93c51002130846j1d3d6db9i6247a729ac326418@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <368e93c51002130846j1d3d6db9i6247a729ac326418@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bojan Sukalo <shukalo83@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2010-02-13 at 17:46 +0100, Bojan Sukalo wrote:
> Thank You Guido, maybe that's the way to go.
> 
> Regarding the masquerade I tried that also. Icmp is enabled and what
> bothers me most it works even from inside to internet. (I can ping
> www.google.com from inside - see the first post in thread).

Oh yes, I did forget that.

> I 'll try to install newer version of iptables. I hope that
> dependencies won't bother me.

Try building it from scratch.

> If I install newer version of iptables do I have to upgrade kernel or
> I can just try and see whether the first update (only iptables) will
> give results?

The kernel is not that old. Most probably you won't necessarily need to
upgrade the kernel as it is 2.6.x. You can try building and installing
the latest iptables (version 1.4.6) and only after that a new kernel
(latest version is 2.6.32.8).

But before doing that, I would suggest you first try another ISP using a
dial-up connection to understand whether the TCP MSS diagnosis is
correct or not.

Good luck.

Guido

