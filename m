From: David Miller <davem@davemloft.net>
Subject: Re: aligned_{u64,be64,le64} defined in #ifdef __KERNEL__
Date: Sun, 29 Aug 2010 21:21:56 -0700 (PDT)
Message-ID: <20100829.212156.229740543.davem@davemloft.net>
References: <1282682582-15980-1-git-send-email-eparis@redhat.com>
	<AANLkTimbQivEd7z1+sdLgChieGrY3c9iQWXVKgcYRAY=@mail.gmail.com>
	<201008300326.30233.agruen@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201008300326.30233.agruen@suse.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: agruen@suse.de
Cc: eparis@parisplace.org, netfilter@vger.kernel.org, eparis@redhat.com, linux-kernel@vger.kernel.org, schwab@redhat.com, tvrtko.ursulin@sophos.com

From: Andreas Gruenbacher <agruen@suse.de>
Date: Mon, 30 Aug 2010 03:26:29 +0200

> On Saturday 28 August 2010 01:51:53 Eric Paris wrote:
>> I liked this version until I realized that userspace doesn't have
>> aligned_u64 as a valid type.
> 
> This looks like an error in include/linux/types.h.  The aligned types should 
> probably not be defined inside #ifdef __KERNEL__.

You can't do this, as it would pollute the POSIX namespace.

If we want a version of this type visible to userspace, it needs to,
for example, have double underscores prepended to the type name just
as we do for things like __u16 and __u32.
