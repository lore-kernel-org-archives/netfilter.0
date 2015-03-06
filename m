From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: time module rules using localtime
Date: Fri, 6 Mar 2015 22:17:41 +0100
Message-ID: <20150306221741.f0a45821a3a95aad7ca62c23@lucassen.org>
References: <20150305211842.6d3ae8ddd23917c1f7638085@lucassen.org>
	<201503052105.09192.neal.p.murphy@alum.wpi.edu>
	<20150306100555.ea9eedc0a33b0b7b0bbd6da0@lucassen.org>
	<201503061414.58895.neal.p.murphy@alum.wpi.edu>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201503061414.58895.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Fri, 6 Mar 2015 14:14:58 -0500
Neal Murphy <neal.p.murphy@alum.wpi.edu> wrote:

> > I read that as well, but AFAIUI this program is deprecated and a
> > "hwclock --systz" will do the job:
> > 
> > man hwclock:
> > 
> > --systz  Set the kernel's timezone and reset the System Time based
> > on the current timezone.
> 
> By gorry, I do sometimes learn new things on certain days! That looks
> to be just what we need. I'll set it to run on 8 March and 1 November
> this year. (Our switch to DST happens in less than two days.)

Please let us know your findings. So, AFAIUI you should run today:

hwclock --systz

and test if the --kerneltz rules still work as expected. Then, just
after switching to DST, run "hwclock --systz" again and check if the
rules still work at local DST time. If it doesn't work as expected, try
to comment out the time rules, unload xt_time, reload it and uncomment
the rules and check if it's ok.

We can retest on March 29 here in Europe :)

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
