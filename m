From: Andreas Gruenbacher <agruen@suse.de>
Subject: aligned_{u64,be64,le64} defined in #ifdef __KERNEL__
Date: Mon, 30 Aug 2010 03:26:29 +0200
Message-ID: <201008300326.30233.agruen@suse.de>
References: <1282682582-15980-1-git-send-email-eparis@redhat.com> <AANLkTimbQivEd7z1+sdLgChieGrY3c9iQWXVKgcYRAY=@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimbQivEd7z1+sdLgChieGrY3c9iQWXVKgcYRAY=@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org
Cc: Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org, Andreas Schwab <schwab@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@sophos.com>

On Saturday 28 August 2010 01:51:53 Eric Paris wrote:
> I liked this version until I realized that userspace doesn't have
> aligned_u64 as a valid type.

This looks like an error in include/linux/types.h.  The aligned types should 
probably not be defined inside #ifdef __KERNEL__.

The following other headers expose aligned 64-bit types to user space as well; 
copying the netfilter list:

	include/linux/if_ppp.h
	include/linux/netfilter/nfnetlink_queue.h
	include/linux/netfilter/nfnetlink_log.h
	include/linux/netfilter/xt_quota.h
	include/linux/netfilter/xt_connbytes.h

Otherwise, the definition of those types is really simple, and this would do 
in include/linux/fanotify.h until include/linux/types.h is fixed:

	#ifndef aligned_u64
	# define aligned_u64 __u64 __attribute__((aligned(8)))
	#endif

Thanks,
Andreas
