Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C52EAB6F
	for <netfilter@vger.kernel.org>; Wed, 15 Apr 2026 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260737; cv=none; b=shUKNDiE2iiWgBgkXUi+AVdOy+qVtEG/f38jYjWZ0lNPQq7igpYAyANvCcMFnNQRc+qGIoiePce6QY4p5J+JAOe4VhHlmBhZTDtTK1uEwrB/RL8XWgK5g4/Qk25bU3wXV3u3BSg3JL94YFyXvYlXSZhUhqh/flFg98IKbUdf9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260737; c=relaxed/simple;
	bh=4WAw3ZWuFfOpbf1k0x843MIcZemE0bkXIRP/xY81BNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsSc+sAP3Ew0fofkSIMKYVBXcE8hHe7cj/x4Di9dbkjKAgNvTNkKa6Y2q/FI4ZdbzwmBWh8FDVPCPqKo6N17bl0d6QRyxx3uPxdMr53aP3JfwONBekrADuFonVjPN+gLDaUea9Za1U5ZeUQC1cmvRbvpoK2us92Uztu6GtGhomg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 05D3460490; Wed, 15 Apr 2026 15:45:33 +0200 (CEST)
Date: Wed, 15 Apr 2026 15:45:33 +0200
From: Florian Westphal <fw@strlen.de>
To: Subham Pal <subhampal789@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Renaming nft sets & maps
Message-ID: <ad-WfRHR_DNTBCoN@strlen.de>
References: <CAHeizqEmito55KBs=J0Mymi6nd12D-9aVw7+1+UY-LDYWEMqQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHeizqEmito55KBs=J0Mymi6nd12D-9aVw7+1+UY-LDYWEMqQA@mail.gmail.com>

Subham Pal <subhampal789@gmail.com> wrote:
> IPset gives an option of renaming sets. Is there any similar facility
> to do that in nft with sets and maps?
>
> I couldn't manage to find any.

In ipset its normally used for atomic updates, but nftables
sets are always updated atomically.
