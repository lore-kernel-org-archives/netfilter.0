Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11843303A0D
	for <netfilter@vger.kernel.org>; Thu,  2 Apr 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144186; cv=none; b=dfz6Rhlh7eAz6skc9Xh6Nu/9S7vQNESVZJ4S8pmDyY0BV8fvunt/vVQ2+3EMn9YCfNEgxuUmxssLiFyMw0UBbMd/b9bOiNL6DfBMFMCK82CA8QqDySLWrjeU70Y283g+06dIt+fy8ZOwThkXJBxOtR7MPcTB7lkfe2MEt+aWmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144186; c=relaxed/simple;
	bh=/JJBjwIgnYYj/LtE3jXANIWU4u1+R6cxc+7gwt+vOk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwOQztIMde8zJnzaX8vJh6a+7gZaCoB+DeR6Xvt1GowZhSM0KrqNuPgPoIsuNzE6Xwo2SE9TSa5XrjxOx9IAfpfRhQmcO2E/mJ7pnkhybUW4BndP6LQeNAzQmvPQU2SNJjwHepbeRWBSMZYiGRfbyCWe19UScKubI8gCLvOnEh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Pibug0PR; arc=none smtp.client-ip=195.113.20.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="Pibug0PR"
Received: by nikam.ms.mff.cuni.cz (Postfix, from userid 2587)
	id 72C26280F79; Thu, 02 Apr 2026 17:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1775144181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ocl8r83gBkhGRh9SlbVaFvFAL2wXkoVXqKSH92eV3+g=;
	b=Pibug0PRoYiopGPnMOZL/XUkcrTjM+7i3z2BdDa7+sE1DUalMfkr1EIzm99ysU/Wm4p/Ed
	A93M/NYmaVRsYFxIdHA7PGKuSIEuAh3jUl9Vfw+L0tm7x+Y3EA3hdCSb/yRQwHz71Ta5to
	BnkoDONwca59SMjAeOwLrETyE8kH4mY=
Date: Thu, 2 Apr 2026 17:36:21 +0200
From: Martin =?utf-8?B?TWFyZcWh?= <mj@ucw.cz>
To: Jeremy Sowden <jeremy@azazel.net>
Cc: netfilter@vger.kernel.org
Subject: Re: ulogd: logging IPv6 flows
Message-ID: <mj+md-20260402.153542.1404.nikam@ucw.cz>
References: <mj+md-20260401.114453.17525.nikam@ucw.cz>
 <20260401190727.GA5449@celephais.dreamlands>
 <mj+md-20260402.123615.46599.nikam@ucw.cz>
 <20260402153503.GB5449@celephais.dreamlands>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402153503.GB5449@celephais.dreamlands>

Helo!

> The problem is that GPRINT (and OPRINT) used not to handle IPv6
> addresses correctly.  I fixed this a couple of years ago and the fixes
> were released in 2.0.9 (which is currently in Debian Testing and will be
> in Forky); however, the version in Trixie, as you are aware, is 2.0.8.

I will backport the version from Forky and check if it helps.

Thank you very much!

				Martin Mareš
