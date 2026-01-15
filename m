Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559551B0437
	for <netfilter@vger.kernel.org>; Thu, 15 Jan 2026 00:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438340; cv=none; b=S9KVhev0rKPo4iaW1GFl8UdGrW4TmTsfDGL4ltVUrfduDYiq7YFgEO8r6yYZQ4V/PHUTSjgRWS6PEzZLrgOGQMvSnKkim8RbrPAfSLwJY8UpZSxGGRVQ7svQmHPEARQZZqpC88jNRtx0yl+xjrhZVhHJGl50nORrjEVNndg3PTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438340; c=relaxed/simple;
	bh=MtvdT7qlNv5bQdKPa3zAgPn0NHXhoYDampuUnXvEfm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0IWiIceyfXZ59nBte8JCPb/ff6F5OjLtA4f4zLqoHD0jxozWJ85reA+da7q/Jy0Dz2233/T5v3FV4iqvF4iRsSSsqZeUuuuRSfZG1N8ZTDOPOxgibKhDmEnnDh5Ig3H5CcMf0EezI44b+p/uelVSgfi2e5y9vTAkYY10/qM8/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=SD9muebV; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="SD9muebV"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 8935D6017E;
	Thu, 15 Jan 2026 01:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1768438337;
	bh=6rSklGoxFvhYdCZJz6cb0KBh3KnFSB6QK6eqibbHR+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SD9muebVFigTEs9RIGIOstsDTNAGXUB9m/GpmUqb9q/6XKUJ+GgI6vwlcCLWdsq2w
	 avcn4YeHa+dHjkwrXizX+7KtpgBZ82isU6DBPi/CeDIOdmYJ67IAu/BvaWb8OZJxGO
	 /rhuvkNf+W/+Vd/xBFlY3K3KUv7bY0tJOPmdJSm//6gX2msaXaktpM7Z46sa7OxRCX
	 D2QRzA+uNOXPp2mnB0wmQCNZ8xAjwUk1rdGR7iIUGBS2eKnahZ28BR04q24jAIQfWi
	 2VpM2Cgy7dS/1DWyETXy3+xxwTOZv+v0JwjSHx1CX2iGzjqyZl/+yYNvoBtG392OEs
	 g+UhCIk7WrVtA==
Date: Thu, 15 Jan 2026 01:52:14 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org
Subject: Re: What happens to netfilter during end-of-day?
Message-ID: <aWg6PgmGEA6fbpwG@chamomile>
References: <3460873f-7359-46df-9e26-65c4ce0e38d2@tana.it>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3460873f-7359-46df-9e26-65c4ce0e38d2@tana.it>

On Wed, Jan 14, 2026 at 11:14:49AM +0100, Alessandro Vesely wrote:
> Hi,
> 
> I have a netfilter daemon that makes a looping call to mnl_socket_recvfrom()
> and quickly examines packet headers. It only stops when it's rebooted.
> However, almost every day it receives an ENOBUFS error, just once, around 4
> AM, while running cron.daily.
> 
> I haven't found any useful logs from around the same time that explain
> what's happening. Does anyone have more information?

Where is your program? It sound like it is buggy?
