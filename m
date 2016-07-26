From: Andreas Herz <andi@geekosphere.org>
Subject: UNREPLIED conntrack entries won't be discarded
Date: Tue, 26 Jul 2016 13:42:48 +0200
Message-ID: <20160726114248.GR23593@ks3360651.kimsufi.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=geekosphere.org;
	s=gos; t=1469533259;
	bh=7iKgh2X1gEstfJmseBGMLINTwk/iJCjv+RYeolofwfw=;
	h=Date:From:To:Subject;
	b=CUuFAIED3XOEgMibYQQusbqOZYR5miPxF0JfW425odVU2RYwRdkmndKuEzNBT25/P
	 j/q4/z6BeUd8IjQLvaG882VaeMQzHm2sSGHHGR5Mz0nrty8qZNOtQG2Ba/Qa3TJ9jn
	 UejCDVQA3TtTK9srhCNUaXBRnoI5wUKfQdLQwH6ZO38fp8jBwnZXPc31jVfLTC0i+Y
	 9WSR35eY882Bhz9SwGGuy33KSbOYh4YnsJWshc130otsDX917fVlPtLlxuw3Bkaj+3
	 NSdamKPfkUEhAeNoVhp9b7QMsvoEtbuKhjNhszLJEUiQ3IGxmoplrP/kUU5Ly9Wva4
	 290MmWoqGT9pQ==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

we have a system with a huge amount of TCP ESTABLISHED connections but
all [UNREPLIED] that have the 5 days timeout from
nf_conntrack_tcp_timeout_established. Increasing conntrack_max is just
delaying the issue.

I could run a script to get rid of them via cronjob but I found this in
the neftilter documentation:

> The answer is easy: UNREPLIED entries are temporary entries, i.e. as
> soon as we run out of connection tracking entries (we reach
> /proc/sys/net/ipv4/ip_conntrack_max), we delete old UNREPLIED entries.
> In other words: instead of having empty conntrack entries, we'd rather
> keep some maybe useful information in them until we really need them.

(http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html)

But I'm getting:

> kernel: nf_conntrack: table full, dropping packet.

Should this "garbage collection" still work or would it be a good idea
to implement a dedicated and much smaller counter for those connections?

Thanks

-- 
Andreas Herz
