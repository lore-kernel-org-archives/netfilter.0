Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A09274650
	for <netfilter@vger.kernel.org>; Wed, 22 Oct 2025 22:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761173698; cv=none; b=FjzbAX7aMFUjmwzDv/MJOuD7ZatC6z79wBs1JJGSNBQ/SFtdbBvkutd/uNpsIrMc3TvjKKaUnLkoJMxtYid9GydcSaUbhvznQFW0TUhtNrduMmRRby3Q1YDTInWDrFCfVYAtzafcb1NIcFUPdnjqCvcIW0/DrKlc5BDiJP9aors=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761173698; c=relaxed/simple;
	bh=52EZVnjqEM8nNulGsg3a37xzIbH+lQ/5jFxRXjHxB1w=;
	h=MIME-Version:Message-ID:From:To:Subject:Content-Type:Date; b=g0FgVl7tw79OaKzKoZaT0m6Zmjb4M+RLwowYZHrDkSYWQ8RVHQdynpwDKMwmCIid1LeZUSWbt+FgYt/Q/ZIyyIWNGUu0N/2KPrw3bjHCiSN5Yy2y8KjagvSBRAxVKzdYB4trMoAITJhbOFLakzDdNOSNLoHinUCesHSDWAapnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=caramail.com; spf=pass smtp.mailfrom=caramail.com; dkim=pass (2048-bit key) header.d=caramail.com header.i=louis.t42@caramail.com header.b=ap/XspeB; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=caramail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=caramail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=caramail.com header.i=louis.t42@caramail.com header.b="ap/XspeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=caramail.com;
	s=s31663417; t=1761173694; x=1761778494; i=louis.t42@caramail.com;
	bh=0z0Mpsp33A7qgtv0vqs7q13J+fKk/UJO+RaVLtbpSZ4=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
	 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
	 from:message-id:mime-version:reply-to:subject:to;
	b=ap/XspeBhB0UtwTTxAaw1nGWzZdzAOgNFM1XACbZyhhyGHpG7CxLeuwPek4iOzOZ
	 oNjdNEY0zoHMfXnn6WyqNYA9CefSoqSVwTXWX2mCYCweOxT3ApVp9/J57T4Mzj5Xu
	 uYw1HTFKK3QEwhB91ZyVZgTDj7zh0JvOhYGzQDfLf7mNodv1rVA+5l9D8d/f8wsJL
	 wB3Yx0BLtNfgElNzj9CGI74fAGJWicnxjLDmojCkLNoMS96TmHFo2XzskLZInpkc1
	 NyfhVHWXX04kpoiy11bQ9vNprmAK6d44t7Fdi7AsSyzhZwVQvhOTrbn7d8m8acflX
	 /jWI1ViNUQgkp+rBPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [188.150.236.214] ([188.150.236.214]) by web-mail.gmx.net
 (3c-app-mailcom-bs12.server.lan [172.19.170.180]) (via HTTP); Thu, 23 Oct
 2025 00:54:53 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>
From: louis.t42@caramail.com
To: netfilter@vger.kernel.org
Subject: Nftables ct count over 2 counter continues to trigger with only 1
 connection
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Oct 2025 00:54:53 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:q09yKgpgos8fOKTXTxle1E81vYk6obcwXOyTZe8CBU1c1VvHhHx48ERbPE3i7ZAi/nAuM
 MYJIx5zJJb17ozh9kU0F923SJQ4ovOlHaoOckyvshxyfBa1GaF4h2XCSo8XhyFoigg5s99ocQkBm
 Tx0UX9Eon1pY4/InWV5i/xuLVpeNZNxL5u3BoTg62FSXfm/iguEsfjCZSgz1uLzzVnnCsPmNLNah
 taRneVQ+gasxCUKW3Md3fxgubv5Nao+0DfeebBD/ONhqmR9+vJ51OOcl/HG6EZOB2ocxTOz8vk8m
 wA=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PGY9vc/ePHo=;ALhzMG4bL2H83x5ac/u5Ai08ADy
 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

Hello,

I have read the documentation and asked on Stack Exchange but am unable to find an answer to the following behavior.

Given this table and chain where 123.123.123.123 is my own address:

table ip mytable {
        chain mychain {
                type filter hook input priority filter; policy accept;
                ip saddr != 123.123.123.123 drop
                ip saddr 123.123.123.123 ct count over 2 counter
        }
}

I am establishing a varying number of TCP connections from my own address by connecting via SSH. These show up in "ss -at" and "conntrack -L" as well as disappear once disconnected - all as expected.

With 2 connections open I see "packets 0 bytes 0" on the counter. With 3 connections open I see "packets 6599 bytes 475441".

The question: when disconnecting 2 of the connections (from 3 total back to 1 total) the counter continues to increment. It triggers even when "ss -at" and "conntrack -L" show just one connection with no TIME_WAIT or other entries.

It even continues incrementing after a "conntrack -F" and often feels as though it is a one-way switch once the counter has triggered. Sometimes closing all connections (to 0 total) stops the counter from incrementing.

Is there an explanation as to this "ct count" behavior in more detail?

Thanks.
