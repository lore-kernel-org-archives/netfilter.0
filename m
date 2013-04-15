From: Bourne Without <blackhole@airpost.net>
Subject: Re: EPERM instead of ENETUNREACH for "to unreachable" route
Date: Mon, 15 Apr 2013 16:46:51 +0200
Message-ID: <516C12DB.1090804@airpost.net>
References: <trinity-0ed09791-dae7-40db-b90e-85e114c79679-1366032496429@3capp-gmx-bs01>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=uvIJbHtb5djBrr23NFpoVJiBKmc=; b=d6XYIDFv2o8qEy7iQM
	p2vM2rq7v+1s/+O9YlTUEK+uUhAwt5DVz2YHM8J7RswJEjyH8sZxUqlCjEz2dfoR
	MgFS+9gG6WCCZvMw+Ym5+UR9O0LeO14g9PhWfEmxifb/odQ6I2dJy6EmeMOiTli1
	4aG0Le/CcbLb+2U5SrUji7KpY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=uvIJbHtb5djBrr23NFpoVJ
	iBKmc=; b=WvJ2TknjuuAvM3OzIrQa1Jc7FIwaWxu0psoCuUIiSZdgGOF3F1txmv
	HiYJOkOkJUMW3NM7UIALQJgfQPHKMJN75FIYiaiI5BB868msx+/yMmTqScSMLU5G
	b39lT03FmBviKYJWyDb0aNujpJFwydpmedA8Tg9klYicuCVyBak0c=
In-Reply-To: <trinity-0ed09791-dae7-40db-b90e-85e114c79679-1366032496429@3capp-gmx-bs01>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: markus lottmann <LottvomSchlott@gmx.de>
Cc: netfilter@vger.kernel.org

On 15.04.2013 15:28, markus lottmann wrote:
[...]
> In this setup the command: ping -Q 1 8.8.8.8 yields EPERM instead of the expected ENETUNREACH. Does anyone have an explanation for this? The only thing I found in a web search was that EPERM is returned if an OUTPUT rule in the filter table is dropping packets.

http://marc.info/?l=netfilter-devel&m=136518055130415&w=2

might answer this

