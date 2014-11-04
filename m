From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: System becomes unresponsive due to kernel oops (IP: dev_queue_xmit+0x256/0x3f4)
Date: Tue, 04 Nov 2014 14:00:15 -0200
Message-ID: <5458F80F.7060405@gmail.com>
References: <CADMv6S=oOo9cuGLpBy3Ap10SDa=MvcjaR+v=FCHEFj0ur_aZkw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=V/lbEAKS/0OeIE9QfMa0bCgLf0+ZQla8ugNTtbby7gI=;
        b=N2YVUQYvLCD3kRBQBusBTAmPXwcm5A5I0Bz9DSo2Q16S42JdoxHvGkbQMpphrFhry/
         cJf3D+EopSOsw9DGK6gQXVioNHpxnnAVE3g6bxevc18ynzXRlLcXamG+K5Y9w2PjTnrg
         KQgvkgkasGSq03AMz8II71kWsCJJYCtfw34Ea3dvN0lynd3Vf/Gv4IPbGROrGclK6lop
         3Ysi9b8+a8yFiI6EZorNzMH4RiqxefhbgVP2MQ1lVHk3aQcYeNi2aSFraWQyWuOoDpO+
         agWdufOtY/XC+bPacK6YYL/08MYWNJNNEWJ11y8ENEYPTOHwQWKim4AQCQbwFcJgIV6G
         aLnQ==
In-Reply-To: <CADMv6S=oOo9cuGLpBy3Ap10SDa=MvcjaR+v=FCHEFj0ur_aZkw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: prasad zambare <prasadzambare@gmail.com>, netfilter@vger.kernel.org

On 01-11-2014 11:44, prasad zambare wrote:
> Hi All,
>
>  From past few days I am trying to debug an issue but I am not able to
> get a break through.
>
> Linux system is consistently getting unresponsive with below serial
> console output. The similar serial console output is observed every
> time the issue is occurred.
>
> Steps to reproduce this issue are unknown to me. But, this issue is
> not observed when all parameters related to acpi are disabled from
> BIOS.
>
> I am newbie to debugging kernel oops. I am using Fedora 13 and I can
> not upgrade to latest release. Please let me know what could be the
> problem and how can I resolve this issue. Any pointer or help will be
> of great importance.
>
> Please find the kernel oops message below
>
> Thank You,
> Prasad

If you can't upgrade, are you willing/able to deploy a custom kernel with a 
fix? Otherwise I'm afraid there isn't much to do in here.

Marcelo

