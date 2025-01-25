Received: from sphereful.sorra.shikadi.net (sphereful.sorra.shikadi.net [52.63.116.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F233B28399
	for <netfilter@vger.kernel.org>; Sat, 25 Jan 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.63.116.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737818434; cv=none; b=jScptkmgoV8mmCP3LjJZ64vm5CRWY6+2GMZv/+wvYL+WoyhZBlXg0xAVwwjxkuPM6A1Y5jZLATFfAplimdtWmFHPillSXu3/PTKZGGdT/NHwZ2BDKgrC+gxbEx0vCQQ7M1VaZdNnCFmQOPHdrQ4W3d9Vcpkr5Nh27x8RN5g/b7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737818434; c=relaxed/simple;
	bh=oMle8TDWicxqCuIH8Iiu/HdbfpP/3fl1vk7LZOZZf2Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=iM7cowV4zsk1pTGile30VXpziDDfO0JGNOQrKg14oRDPEGZTPciz7tks2iou1t7cdz81N2AWr9q6WA/6V/0xSsee73jHQ7eRMni8ONyEzDLmt3m6SUdPr26fIqtK8hVWNPi59j0tVn2XpqhP4jBW/nvUBz2EMcz2ZDi2onu4PgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net; spf=pass smtp.mailfrom=shikadi.net; dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b=EE+1nBy1; arc=none smtp.client-ip=52.63.116.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shikadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b="EE+1nBy1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=shikadi.net
	; s=since20200425; h=MIME-Version:Message-ID:Subject:To:From:Date:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=wTkOoZG18R3q9Cu/ik+Lq5JFB6xHHGwS7690hzlDIYU=; b=EE+1nBy1m6aQ0OZf2+Q+mWJSd8
	guRaoGY7EHlVgsvrarmqUCJ+u91C9XNNQpWgJwm28tKylX5FLQLB17OrndlXYy1nnaDxxEXoWejGq
	Z6R/3YQ4hvNK9EkQ0u5hZvsEuHpctolHIVmMF9WG5sRUObwmqgi5gWEYS0mt094O/JLgUyJ9EXEAk
	Pj/A4G0utZRRtxFKfH1k4SJMY1mG7CgRHJ3+AyODMvWsWrpUIesDyatTcqTmy0iYIxGzmEvwWfPdH
	be/9eyj9KU4uU8VL0NonyrNdN90dRnIOB9LjhTXE50GtYpKb8tLhYMqYr0npZE2bQeBbS2YehjuIu
	aKdWablw==;
Received: by sphereful.sorra.shikadi.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <a.nielsen@shikadi.net>)
	id 1tbhxW-0005pk-0y
	for netfilter@vger.kernel.org;
	Sun, 26 Jan 2025 01:20:30 +1000
Date: Sun, 26 Jan 2025 01:20:28 +1000
From: Adam Nielsen <a.nielsen@shikadi.net>
To: netfilter@vger.kernel.org
Subject: DROP rule is ignored for multicast traffic, but only via Wireguard
Message-ID: <20250126012028.2a3f1428@gnosticus>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

I'm having some problems getting iptables to match some packets going
through my machine.

To debug, I created these rules:

    ip6tables -I INPUT 1 -i wg0 -j DROP
    ip6tables -I FORWARD 1 -i wg0 -j DROP

This correctly blocked all unicast traffic coming in on the interface,
but it did not stop any multicast traffic from coming in.

I can use `tcpdump -i wg0` to confirm the multicast traffic is
definitely hitting this interface, yet somehow it seems to be skipping
any rules I have configured.  I have "smcroute" running to configure
some static multicast routing rules in the kernel, and the kernel is
picking up and rebroadcasting the multicast traffic to other machines
on the LAN, despite the DROP rules.

Does anyone know why this might be?

The setup is a Wireguard VPN, with multicast enabled (this is off by
default).  The remote end is sending multicast traffic, which is
forwarded over the VPN where it arrives on the machine in question.

This all works fine, but I am trying to set up some rules to match the
multicast traffic so that I can use the packet counter stats to see how
much multicast traffic is traversing the VPN.  These rules work fine
for unicast traffic across the VPN, but they are reporting zero bytes
transmitted for multicast traffic.

To debug this I switched to the above DROP rules instead as I figured
they should have a more obvious impact, but even these are ignored.
Those rules are inserted first, so they should match before any other
rule is examined, so no other rules should be affecting their behaviour.

I added these rules to another machine and they worked fine, blocking
all incoming IPv6 multicast traffic immediately.  The only differences
with that machine was that the packets were coming in on a physical
interface instead of a Wireguard one, and the kernel is not doing
multicast routing.

This makes me wonder whether it's a bug in the Wireguard
implementation, or is there just something going on here that I'm
unaware of?

Many thanks,
Adam.
