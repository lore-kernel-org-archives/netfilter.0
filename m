From: Born Without <blackhole@airpost.net>
Subject: Re: Wrapper script for ipset listing
Date: Thu, 10 Jan 2013 22:37:33 +0100
Message-ID: <50EF349D.8060102@airpost.net>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net> <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr> <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu> <50ED13BC.6010005@airpost.net> <20130109115232.GA19321@1984> <50EEB9DC.7070902@airpost.net> <alpine.DEB.2.00.1301101605260.11492@blackhole.kfki.hu> <50EF2F8A.7040804@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=ObClo8oKuISDRxVLno+ttQBneWI=; b=b/5a3HiLoqBMy1OXnD
	OmjLDiUkl5Bj8v8AqiHdL3Btf1fpFmPEPxcS2iAvygGIyjZhnwyCTYFeJjTheF8g
	Ex+umQ7H7ZPv35Z5f6AClsW5+4UclvnAXI9GTTWRCP+8EmT7AvygM7A0SP8tmxWs
	RLLSGReUVW0+ZB61cTYMhx574=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=ObClo8oKuISDRxVLno+ttQ
	BneWI=; b=UD+kA+OTTcVGnOKO41FDvm+ENS6vvqkCvbjd1IikDRHfeoHFzKl80g
	jhWwp8hSTiJSJHSTEdH4IujtHUtYqlwfXdq9tyW1pi6Rk4tcsLx7izt2m/lCiIxI
	4fiyiRiygV9TKkHyrgZS1wdeIeoM5WYZli1AmNTG718A/ZpqBLbh4=
In-Reply-To: <50EF2F8A.7040804@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jan Engelhardt <jengelh@inai.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 10.01.2013 22:15, Born Without wrote:
[...]

 > For version checking I just extract the first digit after 'ipset v'.

Meant digits not digit...

[...]
