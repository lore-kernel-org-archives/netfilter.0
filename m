From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Usefulness of xt_recent's "last seen" and "oldest_pkt" on a
 tickless system
Date: Sun, 11 Jan 2015 11:23:48 +0100 (CET)
Message-ID: <alpine.LSU.2.11.1501111106300.616@nerf60.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hagood <david.hagood@gmail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>


>are just a count of the number of jiffies since boot. However, on a 
>tickless kernel, there is really no well defined number of jiffies per 
>second as far as I can tell

You might want to have a look at
static void tick_do_update_jiffies64(ktime_t now) in
kernel/time/tick-sched.c ;-)

