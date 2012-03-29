From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Iptables "-m time" option doesn't update when the clock
 changes
Date: Thu, 29 Mar 2012 12:00:56 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1203291157170.3606@frira.zrqbmnf.qr>
References: <4F7426FA.2060902@open-t.co.uk> <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr> <4F742BAD.20002@open-t.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F742BAD.20002@open-t.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Arcus <shop@open-t.co.uk>
Cc: netfilter@vger.kernel.org


On Thursday 2012-03-29 11:30, Sebastian Arcus wrote:
>>>
>>>Everything works fine - except that when the clocks change from
>>>winter time to summer time (in UK) - the rule keeps on working on
>>>the old time.
>>
>>This is documented behavior, see manpage (preferably that of a recent
>>release).
>
>Thank you for that. According to my manpage:
>
> "--localtz
>   Interpret the times given for --datestart, --datestop,  --timestart and
> --timestop to be local kernel time. (Default)"
>
>It sounds like the rule above should be using the local time (default). It
>still doesn't explain why it is stuck on the time before the clock change
>though?

As it says in a *recent* version:

  --kerneltz
         Use  the  kernel  timezone instead of UTC to determine whether a
         packet meets the time regulations.

[= note that the default is UTC]

 About kernel timezones: Linux keeps the system time in UTC, and  always
 does  so.   On boot, system time is initialized from a referential time
 source. Where this time source has no timezone information, such as the
 x86 CMOS RTC, UTC will be assumed. If the time source is however not in
 UTC, userspace should provide the correct system time and  timezone  to
 the kernel once it has the information.

 Local  time  is  a  feature on top of the (timezone independent) system
 time. Each process has its own idea of local time, specified via the TZ
 environment variable. The kernel also has its own timezone offset vari-
 able. The TZ userspace environment variable specifies how the UTC-based
 system time is displayed, e.g. when you run date(1), or what you see on
 your desktop clock.  The TZ string may resolve to different offsets  at
 different  dates,  which  is what enables the automatic time-jumping in
 userspace. when DST changes. The kernel's timezone offset  variable  is
 used  when  it  has  to  convert  between  non-UTC sources, such as FAT
 filesystems, to UTC (since the latter is what the rest  of  the  system
 uses).

 The  caveat  with  the  kernel timezone is that Linux distributions may
 ignore to set the kernel timezone, and  instead  only  set  the  system
 time.  Even if a particular distribution does set the timezone at boot,
 it is usually does not keep the kernel timezone offset - which is  what
 changes  on DST - up to date.  ntpd will not touch the kernel timezone,
 so running it will not resolve the issue. As such, one may encounter  a
 timezone that is always +0000, or one that is wrong half of the time of
 the year. As such, using --kerneltz is highly discouraged.
