Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5262CCDF
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.188.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710755265; cv=none; b=cDu/G6mJqaCXwm7QWBGUydJ0SOYd1ee3p77CYu2MWGzAgB4FVAUbzvqvN/UgN/wYT0DfwJkdPh+gzUwOu18I0cWCQzuyhV5Va3JcYpXeyBXgM6crzne/u/WfBCooC68+FyHGdWYiq0UT0Or8xrdNFpSyadxTPjufE0LKHhlqq24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710755265; c=relaxed/simple;
	bh=2JHVTSAcripI90xX+oKnf6QPqLYa9dqQWrXBWi4MOQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjgGu5s+nM7XIt3yv3rL4WAGmKJ0QWFdEGPh2vbkVKuOe4U9ZRz50l1OmmjaiS5eW9e+BblAGxvsDwaCXZ4oDUzunutPcpYmk68a6mhOPNUgBqTb7QPVDIkKRIlfSgYqu90RXuFNDlgBznBSDXtkCFEetX69iC4hmet3dAt8G/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=217.70.188.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Date: Mon, 18 Mar 2024 10:47:39 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kamil =?utf-8?B?Sm/FhGNh?= <kjonca@op.pl>
Cc: netfilter@vger.kernel.org
Subject: Re: nft ends with error
Message-ID: <ZfgNuzufGo4QrnCI@calendula>
References: <8734wxtz3k.fsf@alfa.kjonca>
 <ZV5sxC/YNUDeFgcE@calendula>
 <8734sq9g14.fsf@alfa.kjonca>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734sq9g14.fsf@alfa.kjonca>

On Sat, Mar 16, 2024 at 07:40:23PM +0100, Kamil Jońca wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> writes:
> 
> [...]
> >
> > Thanks for this reproducer. Proposed fix:
> >
> > https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231122210106.183932-1-pablo@netfilter.org/
> >
> 
> I know that it was several months ago, but it seems your fix works - no
> error message.

Thanks for confirming.

Already upstream:

commit faa6908fad6053ae9549c45b88d0402cc69cf1ed
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Wed Nov 22 20:35:07 2023 +0100

    evaluate: clone unary expression datatype to deal with dynamic datatype

This will be available in the next release.
