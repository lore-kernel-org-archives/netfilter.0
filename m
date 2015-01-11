From: David Hagood <david.hagood@gmail.com>
Subject: Re: Usefulness of xt_recent's "last seen" and "oldest_pkt" on a tickless
 system
Date: Sun, 11 Jan 2015 17:24:11 -0600
Message-ID: <54B3061B.5000503@gmail.com>
References: <alpine.LSU.2.11.1501111106300.616@nerf60.vanv.qr> <54B29C5A.3010708@gmail.com> <alpine.LSU.2.11.1501111925200.24030@nerf60.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1twLRGysPF7j5srS3jrqUY8JoJmdkkfRuwawRC4S2aU=;
        b=p3PIgv/ejtBPglUvHcvLCkHjsu/Itw0brV5Zf4Mm9hz5ncymL351xGWM0ybKyEEwgz
         W/jWRU/FbF65Fc1FL5AzfVTOipZYQNL+lg7SaoEYL1SECqytU7aektJoS8PXeJusdId7
         AOIZmaGaOahCOlVj3IENHL03+O0yhZeEfQy8v8phRygh7/emZNxOuO2GVB4KJR/1TZ4q
         PMRrfjrKIlTQetMRL4V5t0OOVPBVWj10GKKbV3mULHgAkf54e7pcwG9u84EBlhT7zzah
         Lylu9efdTwcut6lFW4SPz/iYIlgUh10CtC4+75nKsYut1JAwSU9vdoUjEa06ujqRiFuY
         HznA==
In-Reply-To: <alpine.LSU.2.11.1501111925200.24030@nerf60.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

On 01/11/2015 12:49 PM, Jan Engelhardt wrote:
> The jifs/sec is set by CONFIG_HZ, for which a common kernel only
> offers the compile-time choices of 100, 250, 300, 1000, not 2150.
> If you find a value of 2150, you are probably looking at the wrong
> value, or have a heavily modified custom kernel.
Nope. Standard Ubuntu 14.04 low latency kernel. And the value is 
computed by looking at the btime field in /proc/timer_list (not 
/proc/stat - my bad). Moreover, I can tell by causing a packet to be 
logged at a known time in a xt_recent rule, looking at the last_seen 
field, and then computing the ratio of the known time expressed as 
seconds since boot, and in jiffies from the kernel.

>
> TTBONK, there is no reliable way for userspace to tell the value of
> CONFIG_HZ, so yes, _showing_ jiffies in /proc/net/xt_recent is
> useless - but at least you can compare the numbers against each other
> (not that that seems useful, either).
>

Agreed.
