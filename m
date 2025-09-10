Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225A2517AC
	for <netfilter@vger.kernel.org>; Wed, 10 Sep 2025 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757522915; cv=none; b=WEnvt6mvv+TJQ5u+50CpNp0TxRQYtouM0G7sDZ2+h+Lw2OemaUV1UzV9Z2m+s0Se8o10AwKJ1k4w9bpXiOHOLAcvhCvJsRYtiisRzKGANMowCvzHMH4gkfS66PNgbb267dQyWbe82NOJ+aVeYPNVvmzOQ45JXObtgPTWz+QmFxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757522915; c=relaxed/simple;
	bh=cZ76Wyg++G3RqDs2QV2RXjNiU30Mqnw37oy1ciyPjbM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=IFQs1HG9VCRVTMdqg9/NJ9TnmRF3MB0xswVkYXm0wvnbkFUGfubNSOFrIh6GGwgoTcCZFCHJNXSijOR6JdI8YbXDG1Wjo3XwM5do2DXP72escKQaEf7/LAWWP+G5z10TsO+NCAeAmPxRpEGtQZ8SOBqiSqNzIdajPdpYF3TqPnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id A9C285F870
	for <netfilter@vger.kernel.org>; Wed, 10 Sep 2025 18:48:29 +0200 (CEST)
Message-ID: <c64ff2d8-5ca6-4031-bcc8-9ecfee833665@emlix.com>
Date: Wed, 10 Sep 2025 18:48:29 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Andreas Fried <afried@emlix.com>
Subject: "nft reset counters" bug on 32-bit systems
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

on 32-bit systems, resetting netfilter counters sets them to 2**32
instead if their count was not 0:

# nft list counters
table ip foo {
	counter test1 {
		packets 4 bytes 240
	}
	counter test2 {
		packets 0 bytes 0
	}
}
# nft reset counters
table ip foo {
	counter test1 {
		packets 4 bytes 240
	}
	counter test2 {
		packets 0 bytes 0
	}
}
# nft list counters
table ip foo {
	counter test1 {
		packets 4294967296 bytes 4294967296
	}
	counter test2 {
		packets 0 bytes 0
	}
}

This was tested on an arm32 system running kernel 6.1.134 and nftables
1.0.9, but as far as I can see, the code is the same on current master.
Looking at nft_counter_reset(), this is a problem for systems where long
is 32 bits wide.

nft_counter_reset() wants to subtract the current total from the
counter, so it calls u64_stats_add() with a negative "val" argument
(e.g. -total->packets, in our case -4). But that argument is an unsigned
long (u32) being added to the u64 counter. That means that it actually
adds 0xfffffffc to the counter, giving 0x100000000, a.k.a. 2**32.

Seeing that u64_stats are used all over the place, any change might
break all sorts of other things. So I'm hesitating to suggest a patch,
just some observations:

The first solution would be a separate u64_stats_sub() function.
However, that still limits the functions to non-negative arguments, and
negative arguments still do unexpected things to the u64 counter.

It also seems to be OK to change u64_stats_add() to take s64 instead of
unsigned long. On 32-bit systems, it only makes the variable wider, so
there's no problem.

For 64-bit systems, this makes the variable one bit narrower because
it's now signed. This might be a problem, but there is some signedness
confusion going on anyway: The counter in u64_stats_t is a local64_t,
which turns out to be a wrapped s64, rather than the u64 used in 32-bit
u64_stats_t. The "val" parameter of u64_stats_add is unsigned long (i.e.
u64), but that boils down to atomic_long_add, which takes a (signed)
long (i.e. s64) parameter. So it seems like making u64_stats_add()
taking an s64 in the first place won't break.

Thanks for your help,
Andreas

-- 
Andreas Fried
 
emlix GmbH
Headquarters: Berliner Str. 12, 37073 Goettingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of Goettingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner

