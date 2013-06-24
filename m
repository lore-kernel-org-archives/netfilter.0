From: "George Spelvin" <linux@horizon.com>
Subject: Re: v3.10-rc7 oops soon after boot
Date: 24 Jun 2013 05:41:45 -0400
Message-ID: <20130624094145.2576.qmail@science.horizon.com>
References: <51C80D6F.6070907@cn.fujitsu.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51C80D6F.6070907@cn.fujitsu.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gaofeng@cn.fujitsu.com, linux@horizon.com
Cc: bp@alien8.de, kaber@trash.net, linux-kernel@vger.kernel.org, netfilter@vger.kernel.org, pablo@netfilter.org

> Please try the patch below,
> I think this bug is introduced by me :(
> 
> Thanks!

Well, you changed it, but it still crashes.

It's now at del_timer+0x9/0x58, with the code being:

3f 00 55 53 48 89 fb 48 83 ec 10 <48> 83 3f 00 48 c7 47

The backtrace is
 <IRQ>
 ? ulog_send+0x21/0x76
 ? ulog_timer+0x2d/0x39
 ? ulog_send+0x76/0x76
 ? call_timer_fn.isra
 ? run_timer_softirq
 ? __do_softirq
 ? irq_exit
 ? do_IRQ
 ? common_interrupt
 <EOI>

(To give a faster response, I just transcribed a few key
sections.  Is that enough of a clue, or do you need more?)
