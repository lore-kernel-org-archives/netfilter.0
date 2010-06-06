From: Thanasis <thanasis@asyr.hopto.org>
Subject: Re: prevent iptables LOG target from flooding dmesg
Date: Sun, 06 Jun 2010 19:55:53 +0300
Message-ID: <4C0BD319.5000907@asyr.hopto.org>
References: <4C0AB6AD.104@asyr.hopto.org> <20100605220334.24df75e5@liberty.rlwhome.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100605220334.24df75e5@liberty.rlwhome.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robby Workman <rw@rlworkman.net>
Cc: netfilter@vger.kernel.org

on 06/06/2010 06:03 AM Robby Workman wrote the following:
> On Sat, 05 Jun 2010 23:42:21 +0300
> Thanasis <thanasis@asyr.hopto.org> wrote:
>
>> ...
>> and dmesg is flooded by DROP log messages etc.
>> ...
>
>
>   1) Do you really *care* about most of what you're logging?
>  1a) If so, why?
>
>   2) Install ulogd and use -j ULOG instead of -j LOG.
>
> -RW
I tried ULOG with ulogd and it worked!
I just had to remove options like:
... --log-ip-options --log-tcp-options
which are not valid for ULOG, but even without them that data is there
anyway.
Thanks ;-)
