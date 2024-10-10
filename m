Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CC01CF5C5
	for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 20:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728593687; cv=none; b=u8LQNz/feMi9a+Xla22iSUev7oyEjDZDPes8xEBTlR3LYwQWlbBBdS8lvp3Z76mLqb3Riinag/SLnSSJVnDNzf4SuAcwcnRh8LwwgDUe+Jxt/7VW4bLVHDT8uc96MBxKOonaSr7OP0VvcmHGAyHY63ZxL1MSdhWqG/rHa1eXcLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728593687; c=relaxed/simple;
	bh=s0LLfR1EJgCWBLMg/1yjy66eAV997lZ4LuKbdILa7ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpIXQl+fz+dLtRQ6lQ/mynepZL0HzrABClVYCSy2eXgc9tiRyTbBKBTmlNm4TR9+bl4gO7jEDtiFYXLFNoAYqKoZqV8i884+q5m7XZiCn7ZY2d1KJujzxSeXeNMYLo0LgxLyB4bXcUg5Bj+mGwJNcqvim4fzIP3IE9XjeylN+Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=57276 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sz0BC-00EexF-2F; Thu, 10 Oct 2024 22:54:40 +0200
Date: Thu, 10 Oct 2024 22:54:37 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Graham Bartlett <graham.ietf@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: issues when trying to inspect payload > 250 bytes
Message-ID: <Zwg_DT7ADPBWir_A@calendula>
References: <CAO4D2DPQhOPVQXNxgyJBRetFsgFwUj3JGnfa28cnep2MOybb=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAO4D2DPQhOPVQXNxgyJBRetFsgFwUj3JGnfa28cnep2MOybb=Q@mail.gmail.com>
X-Spam-Score: -1.9 (-)

Hi,

On Wed, Oct 09, 2024 at 09:01:57PM +0100, Graham Bartlett wrote:
> Hi
> 
> I seem to be hitting a limit when inspecting past approx 258 bytes
> using @ih, 2064 16 0x2222.
> 
> This returns the error 'Could not process rule: Numerical result out of range'
> 
> I'm guessing that there's a hard limit on inspecting past 250 bytes
> and wondered if anyone knows of any way that I can increase this ?

Did you already file a bugzilla ticket for this, right?

Thanks.
