From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Thu, 13 Nov 2008 14:27:23 +0100
Message-ID: <20081113132723.GK26975@bla.fasel.org>
References: <20081113100309.GH26975@bla.fasel.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:subject:message-id:references:mime-version:content-type:
	in-reply-to; s=mx; bh=5RUTSTiQzoamLKx5f5LMPb8blpY=; b=ZM4/rKycLo
	3yJdXu87RQVCxmTlCC76K9eGoCAGh17RQsEYAWq0pHMcnTFOhpnC9xxtiojfg3Bs
	RJ7IU/tSD7UztBTv9a4Z5PzOA5KQ/P7fg07Trkgh6SCt7EwmKVKMGkgGtBtdyNYP
	XvnEbALy4wXMQ3mN2IRdG8tK/jCtYILhE=
Content-Disposition: inline
In-Reply-To: <20081113100309.GH26975@bla.fasel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Here's the answer from the PaX team, for those who might be interested:

* pageexec@freemail.hu <pageexec@freemail.hu> [2008-11-13 14:18]:
> On 13 Nov 2008 at 11:03, Wolfram Schlich wrote:
> > --8<--
> > 2008-11-13 07:38:34 +01:00; hafw2; kern.notice; kernel: ip4t_FW DENY_IN: IN=eth1 OUT= MAC=XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX SRC=XX.XXX.XX.XX DST=XX.XX.XXX.X LEN=48 TO
> > S=0x00 PREC=0x00 TTL=118 ID=23801 DF PROTO=TCP SPT=2608 DPT=21 WINDOW=65535 RES=0x00 SYN URGP=0
> > 2008-11-13 07:38:34 +01:00; hafw2; kern.err; kernel: PAX: execution attempt in: <NULL>, 00000000-00000000 00000000
> > 2008-11-13 07:38:34 +01:00; hafw2; kern.err; kernel: PAX: terminating task: /usr/sbin/conntrackd(conntrackd):6562, uid/euid: 0/0, PC: 0000000000000000, SP: 0000797077f7ea48
> > 2008-11-13 07:38:34 +01:00; hafw2; kern.err; kernel: PAX: bytes at PC: ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ??
> > 2008-11-13 07:38:34 +01:00; hafw2; kern.err; kernel: PAX: bytes at SP-8:
> > 2008-11-13 07:38:34 +01:00; hafw2; kern.alert; kernel: grsec: denied resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 for /usr/sbin/conntrackd[conntrackd:
> > 6562] uid/euid:0/0 gid/egid:0/0, parent /sbin/init[init:1] uid/euid:0/0 gid/egid:0/0
> > --8<--
> >
> > The log messages look somewhat strange, especially the 'NULL',
> > '000..' and '??' parts :) I've always only seen such messages
> > with a more meaningful content so far, thus I'm a bit confused.
> >
> > What might be the reason for that?
> 
> this is a null function pointer dereference problem on the surface and you'll have to
> debug it to get more info. i wonder why nothing shows up in the stack dump however,
> maybe there's more corruption here behind the scenes. once you get the coredumps (and
> i hope you have debug info saved away ;) we can get a backtrace and other things. also
> disable randomization in /proc/sys/... so that results are comparable. best would be
> to find a way to directly trigger this crash, then you could have a live gdb session
> instead of coredump analysis.

I'll take care of these suggestions now and let you know
about any news.
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
