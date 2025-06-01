Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6031B79D0
	for <netfilter@vger.kernel.org>; Sun,  1 Jun 2025 03:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748749522; cv=none; b=o4UIHnBXmIEjVYUDwv1R+2755ecF3nMpsZe+6dDfDRxuFr3Zhzz3SvaahSFMYwt1JgbsBu13/tiLyQyg1iBBPiwJz410D7ouVamGksWYN4lOoFzEHAhuhuYXs+yFqfvwNimKsGe86lzLFZagi7/OShzPrQtxYS403crolcR1sZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748749522; c=relaxed/simple;
	bh=kesnoCNtS9bXOTJNKzE83dnoFkbzwGDdfnYTM1/v7YQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APByb5siWEz0YyK8ffraYKaX5jyjGm0mIKkUqmu95aWxqNL/oryrFgL6UvzW+KPbiG6MjTcGgp2HMsOF7LR91t0y5cDll0KsJasJcFIxSjPxWY5OBxBq7/5cpUtiV9IwYfpOMkLjgzqy7KT5ZwVvsFi9hAmK88lY6X9CwzsKxpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Gb0M2cPv; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Gb0M2cPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1748749510; x=1749008710;
	bh=kesnoCNtS9bXOTJNKzE83dnoFkbzwGDdfnYTM1/v7YQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Gb0M2cPvRPvZmbu098ODcIMzcVfGZj8bntWBd6/avG+bm2zzo3achN/9JFFz19fP0
	 CN4ESb5tqVgPO3ZKvhIdJ0t/PJBYgjOoOLqPWg/skAHkeNhUgRAdYXyOk0DQ01OVuD
	 dq+RbgAlFGvLhhUk04HM0QN9Cn5L8/2tvOcQSWGKfB5fYLtWJZ90lbAnfjjDd7sfKm
	 Z+qLPQ70wmZVi89tWEXvsS5ITxzWlowpJms4zKHEa0PjaYVYZVBtXpvdpjRsill6Xi
	 jTwcZOE9zsNp1I8n8Q4A0oPo1aMqEutHlHASPKEh/poVGVR4d4b+wlNsLT0gFOnMZR
	 6SBfGi67oKmDg==
Date: Sun, 01 Jun 2025 03:45:06 +0000
To: Andrew Latham <lathama@gmail.com>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Command Line Interface Usage and Documentation Query
Message-ID: <feYDoEUUIY1YxRJNvG6oAEAGBJ0QInOm7X2M4KQhe8DdIjXagsrcCatPAt_1FQtMeRpSq6mFJ2i3mlQi3lKNWs0aJTnBORiGSN24IN4Ivqg=@protonmail.com>
In-Reply-To: <CA+qj4S_A3P_17evt12MCF0T99e=oiOQnpeukr7Rs4+Ti3aEr4g@mail.gmail.com>
References: <CA+qj4S_A3P_17evt12MCF0T99e=oiOQnpeukr7Rs4+Ti3aEr4g@mail.gmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 94ab0313d3b7814c1f9a56f694cd8afb137481f0
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> nft --help` lacks

I suggest working on or improving the manual page (man nft).

You could 'redirect' nft --help to instead display the manual page contents=
; centralising 'help texts' is a good idea.

sunny
