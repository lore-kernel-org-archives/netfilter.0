From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: time module rules using localtime
Date: Fri, 6 Mar 2015 10:05:55 +0100
Message-ID: <20150306100555.ea9eedc0a33b0b7b0bbd6da0@lucassen.org>
References: <20150305211842.6d3ae8ddd23917c1f7638085@lucassen.org>
	<201503052105.09192.neal.p.murphy@alum.wpi.edu>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201503052105.09192.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thu, 5 Mar 2015 21:05:09 -0500
Neal Murphy <neal.p.murphy@alum.wpi.edu> wrote:

> I was under the impression that a special tool is needed to set the
> kernel TZ. What I did for Smoothwall 3.1 is set the hardware clock to
> localtime and ensure that the system time is correctly pulled from
> it. Then ensure that features that use '-m time' include the
> --kerneltz option.

I read that as well, but AFAIUI this program is deprecated and a
"hwclock --systz" will do the job:

man hwclock:

--systz  Set the kernel's timezone and reset the System Time based
on the current timezone.

> The bit I haven't done yet is implement a way to detect the local
> time zone, determine the DST changeovers from the TZDATA package,
> then schedule an at job for the two specific times when the kernel TZ
> must be updated. Thus, if the system is running at that time, the
> kernel TZ will be updated. If the system is not running at that time,
> the kernel TZ will be correctly set the next time the system boots.
> (This means that a system reboot will ensure the kernel TZ is
> correct.)

For the moment I simply put a "/sbin/hwclock --systz" in /etc/rc.local
and rebooted the machine to see what happens and the rules using
--kerneltz indeed worked as expected at locatime. I need to reboot
during summertime to see what happens.

> The program to set the kerneltz is 'setknltz' by David Madore. A cron
> job runs at 0159 on 3/8 and 11/1 (for US/Eastern zone). The script
> that is run sleeps for 1.02 seconds, then runs setknltz. Next, I
> believe the rules that use '-m time' need to be reset so they have
> the correct offset from UTC.

We'll see what will happen on next March 29 at 3:00 AM. I have no idea
if the xt_time module needs to be reloaded. I'll let you know within a
few weeks.

> I wrote some of this up on the smoothwall forum:
>   http://community.smoothwall.org/forum/viewtopic.php?p=332138#p332138
> and the fourth post below it. I might not be completely correct in my 
> assumptions, but I'm fairly sure the method will be sound.

I have no idea how American DST changes are regulated, but in Europe DST
changes take place om the last Sunday of March and October, which will
be translated in a simple crontab entry:

0 3 25-31 3,10 0 /sbin/hwclock --systz

(mind: wrong DST during 1 hour per year)

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
