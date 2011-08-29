From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: Re: -j DNAT doesn't accept nonnumerical port
Date: Mon, 29 Aug 2011 10:49:27 +0200
Message-ID: <4E5B5297.5070400@mejor.pl>
References: <4E565CC0.6050207@mejor.pl> <alpine.LNX.2.01.1108260952070.6835@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=R5vj7Ht/wtN+Kv+wmSHJXKwLKYH4z143CQpVyYGndCY=;
	b=C3CiQJVAIVlO2y07NaxStbgD6U0IZqyPcQEAN8e16ToUUAoX2VgYNGBXBVyRN0tTwd0XGb2Xa7qjfPgvhXl7hVzYMJRH+TAE/GEFfLrhSsyrKjyGnZCfBFEhj24LtfqX;
In-Reply-To: <alpine.LNX.2.01.1108260952070.6835@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

W dniu 26.08.2011 09:54, Jan Engelhardt pisze:
> At least it is not a regression.
>
> DNAT does not accept names currently, and I can guess this is because
> of:
>
> Port names can contain pretty much any character except \0, so there is
> no way for DNAT, without symmetric delimiters like '[' and ']' for
> example, to know from the user specifying "smtp-imap" whether s/he means
> the single (fictional) port "smtp-imap", or the range 25--143.

This is good reason :) However, it's a little misleading.
Thank you for answer.

Regards,
Marcin.
