From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: aligned_{u64,be64,le64} defined in #ifdef __KERNEL__
Date: Wed, 6 Oct 2010 08:05:52 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010060804580.8631@obet.zrqbmnf.qr>
References: <1282682582-15980-1-git-send-email-eparis@redhat.com> <201008300326.30233.agruen@suse.de> <20100829.212156.229740543.davem@davemloft.net> <201008301258.33113.agruen@suse.de> <alpine.LNX.2.01.1008301502280.19931@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1008301502280.19931@obet.zrqbmnf.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: Andreas Gruenbacher <agruen@suse.de>, netfilter@vger.kernel.org, eparis@redhat.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, schwab@redhat.com, Harald Welte <laforge@netfilter.org>, Andi Kleen <andi@firstfloor.org>

On Monday 2010-08-30 15:02, Jan Engelhardt wrote:
>On Monday 2010-08-30 12:58, Andreas Gruenbacher wrote:
>>
>>> If we want a version of this type visible to userspace, it needs to,
>>> for example, have double underscores prepended to the type name just
>>> as we do for things like __u16 and __u32.
>>
>>How about something like this?
>
>
>I like that approach:
>
>>From 3bec018a4835d4fdbe35595366a51bd09e3cc1d0 Mon Sep 17 00:00:00 2001
>>From: Andreas Gruenbacher <agruen@suse.de>
>>Date: Mon, 30 Aug 2010 12:51:01 +0200
>>Subject: [PATCH] Define __aligned_{u64,le64,be64} types with 8-byte alignment
>>
>>--- a/include/linux/if_ppp.h
>>+++ b/include/linux/if_ppp.h
>>@@ -114,14 +114,14 @@ struct pppol2tp_ioc_stats {
>> 	__u16		tunnel_id;	/* redundant */
>> 	__u16		session_id;	/* if zero, get tunnel stats */
>> 	__u32		using_ipsec:1;	/* valid only for session_id == 0 */
>>-	aligned_u64	tx_packets;
>>-	aligned_u64	tx_bytes;
>>-	aligned_u64	tx_errors;
>>-	aligned_u64	rx_packets;
>>-	aligned_u64	rx_bytes;
>>-	aligned_u64	rx_seq_discards;
>>-	aligned_u64	rx_oos_packets;
>>-	aligned_u64	rx_errors;
>>+	__aligned_u64	tx_packets;
>>+	__aligned_u64	tx_bytes;
>>+	__aligned_u64	tx_errors;
>>+	__aligned_u64	rx_packets;
>>+	__aligned_u64	rx_bytes;
>>+	__aligned_u64	rx_seq_discards;
>>+	__aligned_u64	rx_oos_packets;
>>+	__aligned_u64	rx_errors;


Dave, you liked this too, but I don't see it in net-next yet. Was there 
some sort of holdup?

Jan
