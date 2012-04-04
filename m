From: John Haxby <john.haxby@oracle.com>
Subject: Re: Iptables "-m time" option doesn't update when the clock changes
Date: Wed, 04 Apr 2012 14:52:42 +0100
Message-ID: <4F7C522A.7060808@oracle.com>
References: <4F7426FA.2060902@open-t.co.uk> <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr> <4F742BAD.20002@open-t.co.uk> <alpine.LNX.2.01.1203291157170.3606@frira.zrqbmnf.qr> <4F7437C3.5060306@open-t.co.uk> <20120329134557.GK4603@harrier.slackbuilds.org> <4F7A04A8.8020901@open-t.co.uk> <20120402220757.GC3502@harrier.slackbuilds.org> <4F7ADFA2.9040507@open-t.co.uk> <4F7C15E5.3010506@oracle.com> <20120404131451.GI3502@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120404131451.GI3502@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: /dev/rob0 <rob0@gmx.co.uk>

On 04/04/12 14:14, /dev/rob0 wrote:
> The author posted that in early 2007, saying that most/all distros 
> get this wrong. Is that still the case?

I don't know about "most distros" but anything that calls hwclock
--systz one way or another will get it right.  That include RHEL6 and
its equivalents and current Fedora (I'm not sure how far back in Fedora,
but quite a way).

The critical udev rule is likely to be found in
/lib/udev/rules.d/88-clock.rules:

ACTION=="add", SUBSYSTEM=="rtc", ATTR{hctosys}=="1", RUN+="/sbin/hwclock
--systz --rtc=/dev/%k"

The "ATTR{hctosys}" refers to /sys/devices/*/*/rtc/rtc0/hctosys  (or
similar).   If it contains "1"  then you have CONFIG_RTC_HCTOSYS=y in
the kernel config which means that rtc setting works nicely.   I forget
the details, but it's described  in the corresponding Kconfig file.

jch
