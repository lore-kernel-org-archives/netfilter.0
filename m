Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3931CCB4A
	for <netfilter@vger.kernel.org>; Fri, 15 Nov 2024 14:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731679353; cv=none; b=EB1WDpqvIh5tZ+qmu0xf+AIxn77FngnBHVWRFAVHrPILBLZ81QNbgC9PPxkkoOVvB9gBeThO8JKT8ULZTZEKb2G0sE5dMfoeLJ/Is2HGfucxGfjSCVpqLPLmmAUJRGP3qmpjgcnynrSZ6FHOkvW0nCInzIpjnw5Q8GolCkZoLUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731679353; c=relaxed/simple;
	bh=knBnFSdkPbcLTTLUQO1QlNb7O0gPm27m7zpLQKdAbio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrbaHdRprwPyxFWL1RmU0AObDYjJsdQ3myDQNleBUMr6mSEhDueQ2PNJXHFh6UetRw7mEL4bx08s4s9rxt1JuY9vQsqafd9fLQuWjFLl9TBFCDG2rIgwDq19OYpCKkNoAW+FCtCiJ1EEg8HbmZr926StGh1/ao6qKeuGaNV2p/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=34228 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tBwu2-008NGj-8q; Fri, 15 Nov 2024 15:02:28 +0100
Date: Fri, 15 Nov 2024 15:02:24 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Thomas =?utf-8?Q?K=C3=B6ller?= <thomas@koeller.dyndns.org>
Cc: netfilter@vger.kernel.org
Subject: Re: rule insertion
Message-ID: <ZzdUcFksWgGK4DWb@calendula>
References: <74938b68-c482-4e54-a158-e3f379ba20c6@koeller.dyndns.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74938b68-c482-4e54-a158-e3f379ba20c6@koeller.dyndns.org>
X-Spam-Score: -1.9 (-)

On Fri, Nov 15, 2024 at 02:30:52PM +0100, Thomas Köller wrote:
> When adding a rule to a chain, I can specify the handle of an existing rule.
> The new rule is then inserted after that one. So how do I insert a new rule
> at the very top of a chain, right before the first rule? I tried using the
> handle of the chain itself, but that didn't work.

Use:

nft insert rule ...
