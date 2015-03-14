From: Ryan <ryan_gerstenkorn@fastmail.fm>
Subject: Re: Outbound SNAT on non-local connections
Date: Sat, 14 Mar 2015 16:18:21 -0700
Message-ID: <1426375101.2661616.240448837.5E6CC314@webmail.messagingengine.com>
References: <1426368540.2642076.240424705.3B907A6A@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastmail.fm; h=
	message-id:x-sasl-enc:from:to:mime-version
	:content-transfer-encoding:content-type:in-reply-to:references
	:subject:date; s=mesmtp; bh=jdspKIdfySZOPRUe8yuppPpAAxE=; b=Ctwt
	ZOqDGZZWhcoRw55XGBmfgvZbfx45hMJ2AMsGBQpwlixiCEgKVl5H4HXoKM4/cSmP
	crI42Da+n74OnIofECsIWmVzqzkmO40ZfS06Gxlm9m63Q3ROt7bd1sMgd5ufJH0g
	p4C50soDz+jHihQSF4UVefPHnTgEWwLatfeHCWc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:x-sasl-enc:from:to
	:mime-version:content-transfer-encoding:content-type:in-reply-to
	:references:subject:date; s=smtpout; bh=jdspKIdfySZOPRUe8yuppPpA
	AxE=; b=aBpcRBsUxQoinv04CS9+1e3y0CvwIW1/eKJuc+1qUenQTYpqTO3H/0Of
	a2Fq288ycBXbQ0ietTTBYr62DdnLF/nc+w5ktu8ngfUleSGwEVprCMufZkwDTpkY
	XUY1QZ1Sr/li1olvYhwl0u7KfW6EAE/VycFyr+5YVln6HzYZofY=
In-Reply-To: <1426368540.2642076.240424705.3B907A6A@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

So just to follow up on my email I did find a solution to my issue by
using the RAWSNAT from the xtables-addons package. This target works in
either raw or rawpost however I also needed to use connection tracking
which doesn't work in raw.  Connection tracking does seem to work in
rawpost but I do not know why as there is no real documentation on
rawpost and it's a xtables specific table.


Thanks!
Ryan G.
