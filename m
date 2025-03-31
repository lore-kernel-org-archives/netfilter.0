Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51E1DF748
	for <netfilter@vger.kernel.org>; Mon, 31 Mar 2025 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439913; cv=none; b=fEW6Jf5Gdi16/g6ajX18GGGa19rWbttWiU/rQZYkNqK9d7sw6suIvfGH0DXa5pT/iNw+apdwMmoTi2eE3rzF5rMxhxL1dTEzI9bOFKGndnBv0MuaXP9NrcwaQD4j4s84Iq/BJjc4ysT0TuyJjOvT93SLOcLgC88VbDURo6fNGog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439913; c=relaxed/simple;
	bh=IsmfPYZ7y6n3oe9adDqJfaYy9iLlHNHpJxQQVYjdYAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgisoRxLoctZc5FYmtwgdvpCK5ijrjuOf+gciYM3ht2ydMOfAbAkDwV8pB3oaboAEJuqiK2/E0yGlP0yCj6dhGE7FXfnVsXgsI0FgvBjXFwlHAKgWoNk6WX8XIDhzqSPu96qWSFgpfBir3CPdgay/uqfvZF08fzt4GdgYeHEZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=SuV8MMLR; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=SuV8MMLR; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="SuV8MMLR";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="SuV8MMLR"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 8F4F2603BD; Mon, 31 Mar 2025 18:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1743439908;
	bh=IsmfPYZ7y6n3oe9adDqJfaYy9iLlHNHpJxQQVYjdYAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuV8MMLRPEf7S/+pi2UhjAtbjDXJpkGj7AFs40u8ZjbZqmgjOQ4ynWElwl8JOWeVV
	 umcY76350VGOTYEXue8XR+j0ERVJKLPRuIFnhd0g0amA5d7NKuW2R162p7WCYeJrM8
	 +WPDpDsF507HhP2XAlXAfam0m53SsoZDEe+9H4TEtVevLExg8VAtVmpSs4orAi3cDU
	 kU11nFtyIDDltd7fkhuCjHS9MH+Ss/9YgWK5hndTvLGu/fM8Jq44Loy2tvsDx3FxbX
	 uIaT/wgsTLsr77aukCCoc5P2cMDIbbaX5CmNMMAskzSkNdsQ4gYQZaOUJyLx086tt+
	 +TUcVTC9eXAeA==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 16B87603AB;
	Mon, 31 Mar 2025 18:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1743439908;
	bh=IsmfPYZ7y6n3oe9adDqJfaYy9iLlHNHpJxQQVYjdYAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuV8MMLRPEf7S/+pi2UhjAtbjDXJpkGj7AFs40u8ZjbZqmgjOQ4ynWElwl8JOWeVV
	 umcY76350VGOTYEXue8XR+j0ERVJKLPRuIFnhd0g0amA5d7NKuW2R162p7WCYeJrM8
	 +WPDpDsF507HhP2XAlXAfam0m53SsoZDEe+9H4TEtVevLExg8VAtVmpSs4orAi3cDU
	 kU11nFtyIDDltd7fkhuCjHS9MH+Ss/9YgWK5hndTvLGu/fM8Jq44Loy2tvsDx3FxbX
	 uIaT/wgsTLsr77aukCCoc5P2cMDIbbaX5CmNMMAskzSkNdsQ4gYQZaOUJyLx086tt+
	 +TUcVTC9eXAeA==
Date: Mon, 31 Mar 2025 18:51:46 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Bradley Hook <bhook@kansasdeaf.gov>
Cc: netfilter@vger.kernel.org
Subject: Re: Packets not traversing postrouting chain
Message-ID: <Z-rIIhraCyG8KELs@calendula>
References: <CAPrh4R458ZB8C5-Zm52FsnyGQMQv2EBp-pvkQ2wcZSeHhtoeNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPrh4R458ZB8C5-Zm52FsnyGQMQv2EBp-pvkQ2wcZSeHhtoeNg@mail.gmail.com>

On Mon, Mar 31, 2025 at 11:19:31AM -0500, Bradley Hook wrote:
[...]
> The issue we are seeing is that packets from 192.168.122.252 to
> 8.8.8.8 are not traversing the postrouting chain at all. We can see
> the packets leaving the interface without NAT applied. We can see the
> packets hitting the forward chain with the trace. Other traffic from
> other subnets are being masqueraded just fine. We just aren't seeing
> the packets from 192.168.122.x/24 hit any postrouting rules at all.

Can you check if connection tracking is tagging these packets as
invalid?
