Received: from smtp-outgoing-1601.laposte.net (smtp-outgoing-1601.laposte.net [160.92.124.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37974210FB
	for <netfilter@vger.kernel.org>; Sun,  4 Aug 2024 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722776954; cv=none; b=YDN0cH//u7mCE069U6cGI3KnT4zXyHBbi8UDaE7yMmAlXHN+I/brlOlNAnyoj6IFveMLYxeBqUGjjz3/TuHfn+N2vsI2i8E0P5GdikLlR6qIOCKEj3U5qhUJG3oHk9rl6H2RH0N1zbBsLQaEz6QjUYB33g6dUJ1I1/D5nmmlziI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722776954; c=relaxed/simple;
	bh=vpSNtVrMFN2Q+24IdNLE0ypfujbMCs1B1Ez9Sn82Byw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q/YpVUzeDyP92k5GGBDkzpfyd3ECJtZqtuTMHjI/OrHRJBvmsC63EdOxiUV5CmVtZB4ucKgas3o6wPF9lYr8UP2LvWDUs4UZNd396UiWM2OXydQTiWcqQaPN2vWrzG0fZ7+uYoSzj2Z++10QNGtakjhugoSqS4L51EN41NXczQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=OM5TvjaS; arc=none smtp.client-ip=160.92.124.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="OM5TvjaS"
X-mail-filterd: {"version":"1.8.0","queueID":"4WcKdh6DG2z16Hmd","contextId":
 "0b294a03-a71f-48f7-b563-eb104bb18561"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0105.laposte.net (SMTP Server) with ESMTP id 4WcKdh6DG2z16Hmd
	for <netfilter@vger.kernel.org>; Sun,  4 Aug 2024 15:08:56 +0200 (CEST)
X-mail-filterd: {"version":"1.8.0","queueID":"4WcKdh5XSQz16HmJ","contextId":
 "80e3f168-a36e-4dae-83fd-51aa696b8abb"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from B550-AORUS-ELITE-AX-V2 (lfbn-ren-1-1305-231.w86-229.abo.wanadoo.fr [86.229.152.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mlpnf0105.laposte.net (SMTP Server) with ESMTPSA id 4WcKdh5XSQz16HmJ
	for <netfilter@vger.kernel.org>; Sun,  4 Aug 2024 15:08:56 +0200 (CEST)
From: Kevin Vigouroux <ke.vigouroux@laposte.net>
To: netfilter@vger.kernel.org
Subject: Can't set meta priority for some packets in netdev family!
Date: Sun, 04 Aug 2024 15:08:56 +0200
Message-ID: <87jzgw4eqf.fsf@laposte.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1722776941; bh=vpSNtVrMFN2Q+24IdNLE0ypfujbMCs1B1Ez9Sn82Byw=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OM5TvjaSKtp7ewKTLROKVV9Jvq2lc9prvkGoQzdtPeO8vu23opPc78ZTv/a6lWCHIzGgMjKvBzDlpNWI7tQWX2jiX+6rpRQWKjf3vPzdcMdH9X7BSKKG2XmZEyPd+Zeq2oaX3yedymU9ghCtKAqu793E0CX6Uba1VGcwupdQ6cyv8hl3Q41Y2fZeC5ySE1MY7LOjSbHN3tlaWHY4kHN0aMt7wVoPoqoa4Wu/DUTBuJY0l4Lc/Fk210K8kF+gX3TMuspvGkzcYWP//AmDKyA++FSqE46jKMRfxQJjJzM99m/bkSELmcH9n1+yFMCRDBfOLrhURyPSF2/F9Vj2k39PAg==;

Hi!

The following rule mangles SSH packets but not ICMPv6 one.

table netdev filter {
        chain egress {
                type filter hook egress device "br-lan" priority filter; policy accept;
                vlan id 10 ip6 daddr fdc0:7ceb:81a6::/48 meta priority set 0:6 counter packets 473 bytes 70912
        }
}

Why?

I also tried to modify ICMPv6 packets explicitly in a netdev family table without success.
However, it works in an inet family table at the postrouting hook. I'm completely lost!!

--
Best regards,
Kevin Vigouroux
