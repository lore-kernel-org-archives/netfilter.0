Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84737A481
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090926; cv=none; b=SbLTOTfMzaFrprJhIzHKYBGPk/jClwYOffVjuThBqIo0QRB0/ak65jYC4nZDHmwZc5e+Kqqw8VUHQGeoeOZ/8rbA4HcG0QNA3DWbfPW2B6E83HQKhXCNCQhJsIJUhSq6hRbuzEA5lmihc3Tx10dOKmrZ9P7xEFlvwxuSt1xQntM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090926; c=relaxed/simple;
	bh=3xCpMQLyeCkKpSfYplbDCpNKIJ9pLo6G70XjTrXeAbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6djL13xU95ieZJbm27aLMc1IPM4/36nlyVIB70dthmioirmzzLIKeCJ5FxHB+UEmPBmWWqjPV0IzrPaC9mzmgyIy6+GWmpcKy7EPrg8pzWFRwtDSNJr4VGckeAFlKBK7eThPBfdvqZGn2z81w2dDPCJ1AtebzOOWEHwtcbDMeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=Qp7YH6Dd; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="Qp7YH6Dd"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 255696019B;
	Wed, 10 Jun 2026 13:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1781090923;
	bh=D6gMaYAHhTuVANgpTsODXDNCA1Hk7IewcBXVoR1HDLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qp7YH6DdPszGmI9IblqLD4kzV4fFYS41AMDG5ublEGW4+V1szLxal//GY31UhqUNo
	 mwqj2aOUoW4+baGsQAoEQw1Wykyh03TkU3hVuHBvLwjJwxrWNTSb0JQCRPCAlnMyac
	 V7jdOF1eaYgSzK7feAiMBxZTG5G7erei/EObu11SFOtgiHlQVrGCq8zDikOhvGCwqn
	 QbmEj2nRf/XoeF6c/R0YAg3FyMxSKwtAvHtEJwUgXcxNelwdPgFgayO/WdSda4GeTe
	 N6lgTNQcdZFxBjYx2wMWIEitcGBRrQWTLxn1gO48PhQBNmEn6NFqSUIAvKZIcrT7jH
	 NHsjzFfcqj8wQ==
Date: Wed, 10 Jun 2026 13:28:40 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Jan Kasprzak <kas@fi.muni.cz>
Cc: netfilter@vger.kernel.org
Subject: Re: Logging SNAT'ed connections
Message-ID: <ailKaBvDtEHx_JRu@chamomile>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aibwHhKDBOgr2p7M@fi.muni.cz>


On Mon, Jun 08, 2026 at 06:38:54PM +0200, Jan Kasprzak wrote:
> Hi all,
> 
> how do you log SNAT'ed connections for further forensic purposes,
> when somebody complains about your public IP address and you want to be
> able to find a local user behind NAT?
> 
> I used to run something like
> 
> conntrack --event --buffer-size 1600000 -o id,timestamp --src-nat >> $LOGFILE
> 
> which did what I want. But now I tried to run the same on AlmaLinux9 host,
> and it seems that --src-nat filter does not get applied - it shows
> even connections which are not SNAT'ed at all, because they are for my
> own IP address:
> 
> [1780936563.343940]	    [NEW] icmp     1 30 src=128.1.227.61 dst=xx.yy.zz.13 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.13 dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
> [1780936563.343994]	 [UPDATE] icmp     1 30 src=128.1.227.61 dst=xx.yy.zz.13 type=8 code=0 id=8724 src=xx.yy.zz.13 dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
> [1780936565.281121]	    [NEW] icmp     1 30 src=128.1.227.61 dst=xx.yy.zz.11 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.11 dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308
> [1780936565.281167]	 [UPDATE] icmp     1 30 src=128.1.227.61 dst=xx.yy.zz.11 type=8 code=0 id=8724 src=xx.yy.zz.11 dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308
> 
> Here xx.yy.zz.11 and .13 are my public IP addresses. Why do these connections
> show up in the conntrack --event --src-nat output? Thanks!

Could you check if this fixes the issue for you?

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610103039.167819-1-pablo@netfilter.org/

Thanks.
