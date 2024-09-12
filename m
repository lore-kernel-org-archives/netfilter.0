Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B569190059
	for <netfilter@vger.kernel.org>; Thu, 12 Sep 2024 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133438; cv=none; b=Kz+9AyMgr/nYg+b1tsbLD4ATdPnCk17GmjyXnyrz1rggIR+Cj/AcwQyTVtCCPWdkvCsGf1YFBs/Q3b7yBeI1SBu2P6jo6GoWTjFsI4cN77K0URMDvJdSGpbKJ1rBqrmiUX57a/f5cZc3NbikkSbI97MT1O6pOuOrA577pKG/wLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133438; c=relaxed/simple;
	bh=ti/WnWAsVWs0UEonmc0+K9SeeSGfDt+WjZE4OEpSIOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J74G5QWCLOzetFw+OPimf1nQJzeduZx33C2CozJHPDRSfPAk3DTJ8VWq1f82tvMq/vdHqTQ6cLZEOfTmpCAx3bPdE8kLVRipMuHBNUjL+9Fpn6cXSI2QakPu1qoLewEX8X5n6L3ICBtK6ij3ckUhBs/aXVDTmoPR9dqM6O7/22M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=37600 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sog9k-008KX8-9P; Thu, 12 Sep 2024 11:30:31 +0200
Date: Thu, 12 Sep 2024 11:30:27 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Lars =?utf-8?Q?Nood=C3=A9n?= <lars.nooden@gmx.com>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>
Subject: Re: Wiki entry on Element timeouts in NFtables
Message-ID: <ZuK0s_rVYEgbQGn0@calendula>
References: <3235fb97-5759-4250-9129-ba8006ffd53d@gmx.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3235fb97-5759-4250-9129-ba8006ffd53d@gmx.com>
X-Spam-Score: -1.9 (-)

Hi,

On Sat, Sep 07, 2024 at 09:23:00AM +0300, Lars Noodén wrote:
> I am unclear on the differences between 'timeout' and 'expires' as
> described in the Wiki entry¹ on Element timeouts.
> 
> If 'expires' is assigned, but no 'timeout' is given, then what happens?
> Will the entry expire regardless of whether additional matching traffic
> comes in?  Why do the two examples have 'timeout' with larger values
> than the 'expires' in  both?

From timeout perspective, there are three type of sets:

1) Sets with no timeout. Adding an element with timeout results in an
   error.

2) Sets with:

        flags timeout

   that is, set supports timeouts but no default set timeout is specified
   in the declaration, in that case, if element is added with no timeout,
   then element never times out. On the other hand, elements that time out
   need an explicit "timeout" option to be used when they are added.

   The set listing always shows "timeout" and "expires" in this case.

3) Sets with default timeout, eg.

        timeout 1h

   In this case, an element that is added with no specific timeout
   uses the default set timeout and the set listing only shows
   "expires" to remove redundant "timeout" information, because
   default set timeout is assumed.

   However, it is possible to override the default set timeout, in that
   case, if element timeout is different than the default set timeout,
   then the set listing shows again both "timeout" and "expires".

   Therefore, "expires" with no "timeout" is only possible in this case,
   because "timeout" is assumed to be the default set timeout.

> ¹ https://wiki.nftables.org/wiki-nftables/index.php/Element_timeouts
