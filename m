Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDA8205E00
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 19:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713640633; cv=none; b=U62uUEstKzw0U+9RvNHt/8/7zH+8tt6RiHVBO/LurZlQmg5tv6hXxq6PpIKH1ee3pIhJA9D6Ah0L8LFWdQnEKsZH3FbIhODTWG5IpJa2N8cQFzF8ws/AB4W7m9EBnCsWGhdUuMupZH1JSlCBreYNB8Aqlm9QbWenAWFWVa7S2dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713640633; c=relaxed/simple;
	bh=0XOHkBV9Q62qE3ulxuhM7el0CICwq4sGUyxWTioL/AQ=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=PVVLPVPwGkBVOuNqEGMq32L/n8VhBgf/pQ0o7R1z7y8uk6tWaUba95c6AN7plTeP6+k7qJSmR/+tYMcrg2czWyJZuF5tmezJnNiNwNpnI2mDMXGpD1Fw5wJZ1XLKpv50tjDpcQ2J52Rq9kEesAxqutaANIUHd/Fs3hYt2RLapno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=asOAcAw1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CK1aikH3; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="asOAcAw1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CK1aikH3"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 77AC91380149
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 15:17:10 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sat, 20 Apr 2024 15:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713640630; x=1713727030; bh=5k5s35hmez
	4SiZlCsaa8YsG6vfG7Dqz/5QktsQ2NnlY=; b=asOAcAw1hnOroi1vkG+3w2+LCA
	3koT4mlOF2f509z1fZFKAOi/RAHoytSjykhqF7iuh6KQOdxpqjXE4E5lRtuLa+w2
	UP4tt8DuOdFYrDlc4RgDL/qYMmZQGxxmqelw2E4p+TVzVYri1MOk9SAxBuZoO4S+
	wD35cVKPts8QY+hlRSQyJz0gEjMfpvqfRZ07C/LYgvVfa3k1W5JTtuuj9+nyYmCi
	U+eBfLRV90d5pVi35u5/gC7B0dPY1s8KGE+Y6gDoCecOUlXTY37MzaO22nXznYUX
	IraHo6Z3aDoIz4Zi6tlSW7XJ/bBZ4TVmNrcHr8R+JHfpQJenI+ifLAox3ykw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713640630; x=1713727030; bh=5k5s35hmez4SiZlCsaa8YsG6vfG7
	Dqz/5QktsQ2NnlY=; b=CK1aikH3q7PlP9gIlpKsCMTAg7xSm8sdnsbRweVKFbEJ
	tQ+wchuN7xSzTJu/8YuVGCcvyy+cvWum55vPnGVpQSVCMpqdL/UcfYBylF5z/3M5
	ucMYBpGkSOXBO6JqWqTvy79aPaxPYEbiip6f74tvDpocpklxNMLk/HPoJ8i09Fez
	PEXBp//w7ejuUlCGRyB+rUTYx9JsCgByb65cBjhifSu+5vezTb6uSKVRZ0RkbUfL
	MTDIdmrtzqIvcep3Gnn2NcMJH1sw2I3VTnmikiN9nDkOuMzwH4oA6jQl8fJk/Isw
	mv6EXtEEenlXgrWFUPA2WyDRXicRXMaYb+KznGhffg==
X-ME-Sender: <xms:thQkZmS9oJdD4TzTV0zDogVhwfjLgTU-xzn6TxjSWl2jONLB0ZpNyA>
    <xme:thQkZryXvpGcBjQtJ5yvIsGSORbU-JUdOqD_NrRX7Vn9VrcBPejTILu1o0SIXFnOE
    yoX0NFuLwW4XKbr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
    dtredtreertdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepuedtgfettdehiedtudfggf
    fhudfgjeejieekfeeiffevudelgeevkedtgeeggeetnecuffhomhgrihhnpehkvghrnhgv
    lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:thQkZj3bKStUqPbqBTUExxfgQT2yzb82tBNeLOOmkpzDEZepsJN19g>
    <xmx:thQkZiCT6kIo0JpGucpOX57LlwL5REf5DA_ITn3uBeN7D3J2lRTtOg>
    <xmx:thQkZvgo09v6eZDAPaH0rXG1UbiVnx5F1DR9JKXNX5NDWnQsGJbHTg>
    <xmx:thQkZurdPaX7-wA8XZYJoMVpfBcM5qoVXYm083XqRV81SkFOkfgiwA>
    <xmx:thQkZvJCrkpXpBGjgGR7y6JSSWz7G9RqMw-fqgs1O1MvfJJcUVACNFza>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1ABC01700093; Sat, 20 Apr 2024 15:17:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <31f21bca-c442-40f9-a1a3-d9cfe9778570@app.fastmail.com>
In-Reply-To: <20240420183750.332ffbad@localhost>
References: <20240420084802.6ff973cf@localhost>
 <20240420183750.332ffbad@localhost>
Date: Sat, 20 Apr 2024 20:16:49 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: [Thread split] nftables rule optimization - dropping invalid in ingress?
Content-Type: text/plain

On Sat, 20 Apr 2024, at 7:37 PM, William N. wrote:
> After spending some time looking for more info and based on this:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_conntrack_proto_tcp.c?h=v5.8#n700
>
> I think I figured it out:
>
> tcp flags & (fin|syn|rst|ack|urg) != {
> 		syn,
> 		syn|urg,
> 		syn|ack,
> 		rst,
> 		rst|ack,
> 		fin|ack,
> 		fin|ack|urg,
> 		ack,
> 		ack|urg
> 	} drop comment "TCP invalid"
>
> This checks the listed values against the mask "fin|syn|rst|ack|urg".
> The same values and mask are used in the conntrack code, i.e. it drops
> invalid TCP packets.
>
> According to my own tests, this works in the ingress hook, i.e. early
> drop.
>
> The only question that remains is performance measurement and
> comparison, as mentioned.
>
> Please let me know what you think.

The rule looks good. Borrowing from the conntrack code was a bright idea.

If using the ingress hook in this way is to make any measurable difference to your load average at all, my expectation would be for it be observable in the event that you are subjected to a concentrated flood of invalid TCP packets. You could use hping3 to conduct a series of stress tests.

-- 
Kerin Millar
