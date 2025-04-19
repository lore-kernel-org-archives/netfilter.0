Received: from smtp-outgoing-1601.laposte.net (smtp-outgoing-1601.laposte.net [160.92.124.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEE258A
	for <netfilter@vger.kernel.org>; Sat, 19 Apr 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745052628; cv=none; b=SjuQLeuctdI6tsGWeuxwvM4YmxiH7uEsgNwPOeKyneVPhMWkSXgFRYCMO7keIK7dB7rKcHoOTL9fMFefuX30gkBAR8Rpiwcr8jvrZUfeU7YSL03POVBhWxNNKoCz3DtvnRnaD4XjYtQZHKklo6Xjmjpn7DVcFD485usmnLq42WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745052628; c=relaxed/simple;
	bh=RB3Rx87XQ5t81u3FmfD5xBVIoaVzIlEATZM4ww2JYsc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gM+HRTzrRgubC+vh9GBAYc0pG822OBS2OUfOZYZsBvr+5mudYgASnhFsRhK2bl/1kamVGQBv8alUSysO8Tk5XPdX8np5v0+M1jI4ME9PiiE4KzW0AA9s8xTtoizv8FDVvKIYorpSccwmWsT9QEoSOtkvsk966ZZ3PGUpApNgljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=WgGKrw9h; arc=none smtp.client-ip=160.92.124.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="WgGKrw9h"
X-mail-filterd: {"version":"1.9.1","queueID":"4Zfj1X0WgtzKm44","contextId":
 "c846e96e-87f1-463c-9817-c5cac5a84abe"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4Zfj1X0WgtzKm44;
	Sat, 19 Apr 2025 08:50:08 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4Zfj1W6VTQzKm43","contextId":
 "1da4045d-a240-4b04-8ddd-555bff31fbdc"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from B550-AORUS-ELITE-AX-V2 (lfbn-ren-1-301-157.w2-10.abo.wanadoo.fr [2.10.138.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4Zfj1W6VTQzKm43;
	Sat, 19 Apr 2025 08:50:07 +0200 (CEST)
From: Kevin Vigouroux <ke.vigouroux@laposte.net>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Subject: Re: Can the PCP field be set in the netdev table?
In-Reply-To: <20250418001543.GB20519@breakpoint.cc> (Florian Westphal's
	message of "Fri, 18 Apr 2025 02:15:43 +0200")
References: <877c3kvzyk.fsf@laposte.net>
	<20250418001543.GB20519@breakpoint.cc>
Date: Sat, 19 Apr 2025 08:50:07 +0200
Message-ID: <878qnwlk68.fsf@laposte.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1745052622; bh=RB3Rx87XQ5t81u3FmfD5xBVIoaVzIlEATZM4ww2JYsc=; h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type; b=WgGKrw9hr9ijgpN8+ukvG8Dd3Y9W03YgwCWpMaWtjC7BcwwceSV5IbwA/20ToxseCrHheRFGgTwiadpnjfkgiuzO0AJ8g61C3XGAvI5ss00xBR2ndSFSe4KyihzG5phGuK4fiNMGwwBgpZgVcmrSx5+/QYaa06L1BJwBUPyZovrIsXeJvu5NASIh2DN43nB9U8tXduLP8YqL2E6NqY7rBRCH4lUfmTkMGcy2qTeotlSQyavqtiiS1otZwWanW8he+jYO1MdF1U4o1i7HAuxoazyNwkRCLYErq8gXHbYPyGZsplPlLmriDN4Pk2FBnfLoTm7p8gySo55ApcJH1C5sYw==;

Hi!

I tested the patch and it seems to work. Disabling HW offload does not seem to
work. I performed my test by sending ICMP packets between two stations connected
by a switch on a dedicated VLAN. I noticed that tcpdump does not detect that the
PCP field is modified on the sending station. On the other hand, the network
capture on the receiving station shows that the PCP field is modified.

--
Best regards,
Kevin Vigouroux
