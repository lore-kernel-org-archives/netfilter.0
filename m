From: Born Without <blackhole@airpost.net>
Subject: Re: [patch v3] doc: add nf_conntrack sysctl api documentation
Date: Mon, 21 Jan 2013 08:37:30 +0100
Message-ID: <50FCF03A.8000402@airpost.net>
References: <1358499908-1268-1-git-send-email-jiri@resnulli.us>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=MljrBo67dwP75cYNdnWl8uT6uiE=; b=Lea7TxRVtGTSCYWP98
	aTzyvFg3+ILB8WglSr8LFGD92Ui6ZptcEBvIKE3QLzdPILDWyv+OYIbttfJTjj8x
	2SCby702ZSg5okHVFGtK9rZkXgrYn3hYE+QegYtGhzhiJRm8ZpYWKFpvmUaoRxCn
	Dwjyan4rTGSb9lCavFE9PoS4g=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=MljrBo67dwP75cYNdnWl8u
	T6uiE=; b=bzHnfC37sCAUTWgaIeG+h1IuYyy2LJRBdnhs5+NYUY/xXEjT/CoVoG
	hq1hyIHnGmJIQhnTGba7IdiJk/DNPOQdru6VMb27nhPnTgu7DZxzpJfMjOZ+tlpL
	HqO2C3cEvneHd+DZGYEkm6Y/FXajYjIB5+7k3/DGl+kTCuMcvrQBA=
In-Reply-To: <1358499908-1268-1-git-send-email-jiri@resnulli.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jiri Pirko <jiri@resnulli.us>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 18.01.2013 10:05, Jiri Pirko wrote:
> I grepped through the code and picked bits about nf_conntrack sysctl api
> and put that into one documentation file.
[...]

Thank you very much for your time and effort!

