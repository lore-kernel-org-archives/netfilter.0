Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174783AFD12
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 21:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955682; cv=none; b=nmLZvQFA3vMfcpNIoG3jQyK+6hJoOKSg650PDAiOuDKXvb/uvvLzPSr3q3oo4o27AWq/i7X3iBJAkpmNXEM+RcITpq4PvZr7Rjyo3CNJ6Lgh1qYdMXUsmXutoBAvE0bCnrPO5pKKC8xAuvUqL+IT5FcaWr8W19++UWCkMQZdzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955682; c=relaxed/simple;
	bh=KRFm1ESgS9dXedDALRk5FyV3w7fIXk6MXYFV+iZ34TY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tao+JWvczfF5GVAfs2CyaWPJLKqGF/CTR3S4ZXDF4WsDnJJxfrMqJqEg8WyP6C0q0Qjz5EIXS5awSU8+/5G4AYIFWX1IiAA3h8MKdXctQOhhOR4kPhQydedZ+2yys//f3lyATJyB4lqIK+yCoGfs8PP7+2QdP0a7El9+5D0PO8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmqeBN3L; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmqeBN3L"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8cd45d4b7e2so56640076d6.2
        for <netfilter@vger.kernel.org>; Mon, 08 Jun 2026 14:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780955680; x=1781560480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqQXM3rYyyS4p63Kiet3gcvAwBS8hya1zjYsH6RJ7F8=;
        b=ZmqeBN3LRQ1ZjklBEc8kGEOr97bYpB+9kLZNqku/d11Lj0mPH72QSQYOi0nbbhdD7f
         /ZwbtjpHCgcoWn9CczSm6O3EFGtbixmTMygDP8yabpD7A5+TR3IScpaD4zIqFxBwGGsP
         BhZ+dyNLnUmP1t3GkoqqpkYHVce8UuyIz7LQCj0lXtuNYdQtxsPiLBhlePGjxaL5BXQX
         xwCWPKnEPX68vhvYP+KZjyyq6bc9tlN6zIoyfzsoAjgbagSOQc7ilUZywgmYOnV3pMWK
         zdP1vjUgcUU9f9ugLXusGKow+t3vpEhsNQ9SBcugrzk3AbhzSWraYbiBdtYaA5vszsmO
         Hiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955680; x=1781560480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqQXM3rYyyS4p63Kiet3gcvAwBS8hya1zjYsH6RJ7F8=;
        b=cFGZTyxop9WpL6vsJL8E5lT/fein0hGb158lDw18ukFCCn35U5vqEUjVI2/ArbgBNy
         ZOBah7cN0dYSBq6ll1ATf2NhkKhrLjket43bLkLSCJGw3N+AGtJxMrPpjR4u0ooiuRMp
         A3I/W8SyNqoD2MmOpZJYYi9hApClOX+WOllRXLIgygyzBIDDRNKJ4K7p9knARS5uWkjE
         lgqLeCIYI/QeP6YnC0+f0x6wYKPUx4W4qiR3mkty2xoKkkCYYK3GeupHpuNJr/2NAxVn
         SndS1oDTpIXkqX+cQZUPNpcrroJ215Xdnutln8j7BphbL1MXNvcawNNx8QZDoBfaTJyZ
         Nxsg==
X-Gm-Message-State: AOJu0YzyHo3/P80cI8oLg25e/o1ed/w7pF4y0tdjeM5fuahfV280tX0r
	eFaczJoTL6PggSrEhop5K2VRSE8KcvBBImnaZy5SuepPFdZs63/LvjjnxjjtWQ==
X-Gm-Gg: Acq92OErQC62UlitML2ASoW5PspNeDbPFSr6zzNnmnTIYCMogPVaTlmKUCKmko3P84y
	9QIEzoZb7Td+drXoXxWXiW9mJBkHJVVSm9bWk6e0rylNUGi0G8ocoQm+FIoO0ccnA2E7C1rtfSr
	S/B7dFiCcJrTBx9ECgyBPH/TEssWlPjXhgNTiFtZ/JTUwo4a5zO53YOu9FPb6qxoyRRuQvoXt4p
	Lxek7R32fIGwM4LtZEuxACdGGh/Rzm6sEY+7itzouybzsxKkEpyq0m0u/iKrjmRKr7lBlUYYxTV
	z2DAGq1DM5nNld6kRppKE1/g4SgSwt77taZ0EfyxoGPNKjlI4D2P9FDYB5VmPm8u5xjUmI4vn6m
	KluZ+C5134SoeKDlIU5DlfD7uBeLv88faxuvGhb+s+qzNPfvkWmeGG2grkl2jGGftJI/G6C5i5c
	TgMorA87Od1eN8JHX4TwJOebA8b28=
X-Received: by 2002:a05:6214:570e:b0:8cc:ccb:48d9 with SMTP id 6a1803df08f44-8cee63b0a85mr294737236d6.38.1780955680034;
        Mon, 08 Jun 2026 14:54:40 -0700 (PDT)
Received: from playground ([204.111.226.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277070sm176547326d6.48.2026.06.08.14.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:54:39 -0700 (PDT)
Date: Mon, 8 Jun 2026 17:54:38 -0400
From: <imnozi@gmail.com>
To: "Andre Rodier" <andre@rodier.me>
Cc: <netfilter@vger.kernel.org>
Subject: Re: Question on rate limiting on nftables
Message-ID: <20260608175438.34c41f02@playground>
In-Reply-To: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 08 Jun 2026 12:30:55 +0100
"Andre Rodier" <andre@rodier.me> wrote:

> Hello,
> 
> I am testing nftables SSH connections attempts limit, and I read about "meters"
> 
> I would like to know the difference between these two methods of new connections limiting, and to ensure the first one is correct.
> 
> The first option:
> 
> ~~~
> table inet filter {
>   [...]
>   meta nfproto ipv4 tcp dport ssh ct state new,untracked \
>   limit rate over 10/second \
>   counter add @banned_ipv4 { ip saddr . ssh } \
>   comment "Ban SSH bots"
> }
> ~~~
> 
> And the second option:
> 
> ~~~
> table inet filter {
>   [...]
>   meta nfproto ipv4 tcp dport ssh ct state new,untracked \
>   meter ssh4 { ip saddr limit rate over 10/second } \
>   add @banned_ipv4 { ip saddr . ssh }
> }
> ~~~
> 
> Is there any advantage using the second method ?
> 
> Thanks for your insights
> 

The first method, as already explained, effectively drops packets when too many arrive too quickly from all sources. The second tracks individual IPs.

In my F/W, attempts from internet to access ports that are *not* open/forwarded are logged as 'badtraffic' and dropped. Attempts, again from internet, to access open/forwarded ports too quickly (N SYNs in M seconds) are logged as 'badtraffic' and dropped. The limiter looks at all open/forwarded ports.

I also have a script that runs periodically; it gathers the IPs from the 'badtraffic' log entries (and IPs from other sources) and adds them to an IP set if they are not already covered there by a /16 or /24 set and not already present in the IP set. Periodically blocking them allows the rate-limited IPs to expire from the rate limiter. They stay blocked until they fall out of the logs.

This and the other measures I've taken have reduced bandit* traffic from well over 100kbit/s to around 3kbit/s on average. They've reduced guests on my forum from over 400 (up to 5000) to less than 15. Alas, there is one drawback to my methods: I don't know how many false positives they trigger; my limits are probably a little too tight. The rate limiter has 2048 entries. At present, the sets contain 9000 blocked nets and 535k blocked IPs. That's about 1/8000 of the internet, so my methods mightn't be too aggressive.

Neal


* - Yes, I call all of those miscreants 'bandits', for that is what they are.
