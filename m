Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538AC18BBAF
	for <netfilter@vger.kernel.org>; Thu, 12 Sep 2024 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726136971; cv=none; b=h1OB4O8rqXW0MkuBf6usoJGpx7MY2zZSD3y7BgyKs+LlNh+o9TorA7S/tiyivfZefyzTtFAemPkpjgkUtwC6GIOx4FxgCmIxsSVqE+s6BbFdV7vo7hUZMdpV+lCC+o+lV1RL3ANnCrX767cDVAfVWypfRgwer5PoOagAS+jJVs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726136971; c=relaxed/simple;
	bh=xvAgZ5e+JVvTw+Yfk7gAh5k+APl5Sqt917zFUUu83MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSyzHYDbnNceE7y02kHc33dE4AiK6t17uBuRzsG1cxSg84BFxJ7PD0UzX/EErew2AIL1DzW/1QDpAnarxAO8zS/l7QyL7BjDYc3B/RXEDAKgv63Kt/NUA3KxohekRtrDCz8TEsejbLDcMY2TMtASjyfaOC0GgJ/NEyTpycp9xBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=44022 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1soh4l-008OuQ-ON; Thu, 12 Sep 2024 12:29:25 +0200
Date: Thu, 12 Sep 2024 12:29:22 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Lars =?utf-8?Q?Nood=C3=A9n?= <lars.nooden@gmx.com>,
	Linux Netfilter Users List <netfilter@vger.kernel.org>
Subject: Re: Wiki entry on Element timeouts in NFtables
Message-ID: <ZuLCghrK5pp1kWjL@calendula>
References: <3235fb97-5759-4250-9129-ba8006ffd53d@gmx.com>
 <7a0d6545-4f06-4279-8c36-29c6ae2f56cf@app.fastmail.com>
 <ZuK1yDMm2tXj7yRm@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuK1yDMm2tXj7yRm@calendula>
X-Spam-Score: -1.9 (-)

On Thu, Sep 12, 2024 at 11:35:04AM +0200, Pablo Neira Ayuso wrote:
> On Sun, Sep 08, 2024 at 01:07:44AM +0100, Kerin Millar wrote:
> > On Sat, 7 Sep 2024, at 7:23 AM, Lars Noodén wrote:
[...]
> > Thirdly, if the set was specified to support stateful elements but has no defined 'timeout' value, the behaviour will be as if 'expires' had not been specified at all and the element will be added a permanent one, if it did not already exists. I consider this behaviour to be a bug because the outcome does not match the user's intent. I think that the kernel should instead raise EINVAL on the basis that the user is requesting for the element to be ephemeral but the request parameters make the request impossible to satisfy.
> 
> flags timeout provides a hint to the kernel that element with timeouts
> are possible, but default behaviour is "element times out" if not
> specified. Forcing the user to provide a timeout does not sound very
> flexible to me.

Sorry, wording is not correct:

... are possible, but default behaviour is "element never times out" if not
specified....
