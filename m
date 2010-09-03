From: Xavier Roche <roche*lkml@httrack.com>
Subject: Re: Need for a specific source address selection rule ? (not neccessarily
 netfilter)
Date: Fri, 03 Sep 2010 20:34:43 +0200
Message-ID: <4C813FC3.3050008@httrack.com>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com> <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr> <4C7A6D11.8090306@httrack.com> <4C7A8040.7040002@plouf.fr.eu.org> <4C81321F.4010106@httrack.com> <alpine.LNX.2.01.1009031942001.31358@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=httrack.com; s=mail;
	t=1283538890; bh=cZk0ggAjam4/aC017ldxhLMXN8yG9Tl/ZTpbiA0ylpQ=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=K6ec3iWfGMwrKV6RG0zChBtXO6hcLaHjhu2ZSo78n3ZtistGIm8pJvIjDydNPXY5z
	 GgedYDqqMwMAwYEMQtZSJaHayILLfp9AEwkScK0ELaA+aFEKHj6tJK2qkzOBQjbDdv
	 TqQTibcPxJsUSaxbU9w0wB033yZAjumGVZUoicOc=
In-Reply-To: <alpine.LNX.2.01.1009031942001.31358@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Jan Engelhardt a =C3=A9crit :
>> Pascal Hambourg a =C3=A9crit :
>>> IME, it works for IPv4 but not for IPv6 ; only IPv4 routes seem to
>>> support the "src" attribute, and IME src is silently ignored for IP=
v6
>>> routes.
> That's a bug then, I suppose.

Maybe. But in all cases, the other problem would still remain: the=20
source address.

The src attribute is supported in V4, but only for routing.

Source address remains the same. (reason for the ugly NAT hacks in such=
=20
cases)
