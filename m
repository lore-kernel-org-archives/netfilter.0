From: Born Without <blackhole@airpost.net>
Subject: osf match, --ttl & --log options missing in iptables[-save] [-[L|S]]
Date: Thu, 27 Dec 2012 07:25:13 +0100
Message-ID: <50DBE9C9.8090500@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject
	:content-type:content-transfer-encoding; s=mesmtp; bh=+zq9mwOpYq
	bye1uRHE9ZcRUXEzA=; b=omquau/ameIZ0XrN6wnpQgQMeGAE8eyY6vnyJWSX/V
	xhbWNDvyhcSK+hGj9OSEaYo/lgnzh7bOK2WhXk9NjsUgR2BY9CsnVFaIp4azh8xY
	8WnfsDLEuSEQxs0zVTQW06Wh+NRgbQWZe2pBlOs6N+nejT+O2dLe+KnmFCb0TVqi
	k=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:content-type:content-transfer-encoding;
	 s=smtpout; bh=+zq9mwOpYqbye1uRHE9ZcRUXEzA=; b=VbBgdTq8Xrzvx2voN
	0XLeSpF9ymtuEO9YckIJmeKwUchaVog+sQHtls8G7hRk2DCTyuBs5Fg8t6HvVdz5
	lvya4sW69FfoB7oPKiDFxg3P6q6KV8xq6nQeQMJ3e//a8buPf820myg/r2Fz8vLy
	Phi92DvNWgW0UL1FuD/5s5CLZg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello list!


# $IPTABLES -N FOO
# $IPTABLES -A FOO -p tcp --dport 445 -m osf --genre Windows --ttl 1 --log 1
# $IPTABLES -S FOO
-N FOO
-A FOO -p tcp -m tcp --dport 445 -m osf --genre Windows

kernel: 3.2.35
iptables: 1.4.16.3


iptables -[L|S] and iptables-save seem to miss the --ttl and --log options.
Therefore on restore, those settings get omitted.
Looks like a bug to me!? If so, should I report it to some bug-tracker 
or so?


Best regards
