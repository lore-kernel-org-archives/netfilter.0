Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B013BAE7
	for <netfilter@vger.kernel.org>; Thu, 12 Sep 2024 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133714; cv=none; b=ZZTKZMnwOi+OsCsbovMru5vv6HTgp+5K4itbY+poSOrEfStVx52Ii2wmf30Q1TgdShU1cBPNUXq5rQJaUpnx01VyDW4tZzW+qnCFY9e5XM+eMRWtspPjxjOwJFlrA/FSzuVg6JOrV3vCjeWrYi9rTSMdZvjrqDfh19NubpU/09E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133714; c=relaxed/simple;
	bh=Rlrxzr74Ui3jaG03+dELK12ZNXIS+pefM2sKx37gXtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWGTDV9KeotphDAvwkPi9vz4opOruPMGmSICcaXq2OUxQBIj/DhWmXTK9WwvKK5Ee/d43C8rx2cZNlWMlhCogJD0C2HmVd6kTnX8j5EqDTfduT1JTNRmaRYznMo9V1G012SCsEKoZPwwcv3Jyj9kLjki8fEaOyfBEzhg9mgoA7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=58556 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sogEC-008Kxx-Th; Thu, 12 Sep 2024 11:35:06 +0200
Date: Thu, 12 Sep 2024 11:35:04 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Lars =?utf-8?Q?Nood=C3=A9n?= <lars.nooden@gmx.com>,
	Linux Netfilter Users List <netfilter@vger.kernel.org>
Subject: Re: Wiki entry on Element timeouts in NFtables
Message-ID: <ZuK1yDMm2tXj7yRm@calendula>
References: <3235fb97-5759-4250-9129-ba8006ffd53d@gmx.com>
 <7a0d6545-4f06-4279-8c36-29c6ae2f56cf@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a0d6545-4f06-4279-8c36-29c6ae2f56cf@app.fastmail.com>
X-Spam-Score: -1.9 (-)

Hi,

Just a few clarification.

On Sun, Sep 08, 2024 at 01:07:44AM +0100, Kerin Millar wrote:
> On Sat, 7 Sep 2024, at 7:23 AM, Lars Noodén wrote:
> > I am unclear on the differences between 'timeout' and 'expires' as
> > described in the Wiki entry¹ on Element timeouts.
> >
> > If 'expires' is assigned, but no 'timeout' is given, then what happens?
> 
> One of three things can happen.
> 
> Firstly, if the set was not specified to support stateful elements, the kernel will raise EINVAL and nft(8) will print a rather generic diagnostic message.
> 
> Secondly, if the set was specified to support stateful elements and also has a defined 'timeout' value, the element will be added with the specified 'expires' value, but with no 'timeout' value of its own. Note that there is a distinction to be made between the 'timeout' values at set scope and at element scope.
> 
> Thirdly, if the set was specified to support stateful elements but has no defined 'timeout' value, the behaviour will be as if 'expires' had not been specified at all and the element will be added a permanent one, if it did not already exists. I consider this behaviour to be a bug because the outcome does not match the user's intent. I think that the kernel should instead raise EINVAL on the basis that the user is requesting for the element to be ephemeral but the request parameters make the request impossible to satisfy.

flags timeout provides a hint to the kernel that element with timeouts
are possible, but default behaviour is "element times out" if not
specified. Forcing the user to provide a timeout does not sound very
flexible to me.

In summary, it is the default set timeout that determines the default
behaviour.

> The set declaration shown in the wiki article contains 'flags timeout', which causes it to support dynamic set elements. However, the set has no 'timeout' value. Therefore, the third case of the aforementioned cases would apply.
> 
> > Will the entry expire regardless of whether additional matching traffic
> > comes in?
> 
> The 'expires' value refers to a timer, the value of which automatically decreases until:
> 
> 1) it reaches 0
> 2) a rule is matched which performs 'update @setname' upon the element
> 
> In the first case, the element will be removed from the set. In the second case, the 'expires' value will be reset so as to be equal to the 'timeout' value.
> 
> > Why do the two examples have 'timeout' with larger values
> > than the 'expires' in both?
> 
> I do not know why the author of the article decided to present such an example without further explanation. However, it is perfectly legal to add an element where the 'expires' value is lower than the 'timeout' value.

Correct. This is to allow to restore a listing that have been
previously saved to disk.

> Indeed, consider what happens when listing a ruleset. Unless the -s option is specified, the state of each element will be included in the output. That means that the element states can be persisted and subsequently restored.
> 
> # nft list ruleset > ruleset.nft                      # includes states
> # { echo flush ruleset; cat ruleset.nft; } | nft -f - # restores states
> 
> -- 
> Kerin Millar
> 
