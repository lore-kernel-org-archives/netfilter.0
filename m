Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6AF83A07
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713547791; cv=none; b=AWSYHj/8wjKQrejucTf6lxvFKpZvzMPA1TrwU3LuspcWD1WZjx851hYaCoveHwvghar2S8Gb1L97e+zkti4hQppFBcPJ2EcEUJSPcc/nGJeA7yC2G7Pi6Lc4vt62MYJvdfOAi0tRGqW10YqbFvMCv1KnsArKpK1HlYvHHLc8vDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713547791; c=relaxed/simple;
	bh=ferlkb3NeFH2WJG01pKefz8nnJPCo9GIIHRDvLYJUM4=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jlQeifeP/4fapqMI57jyGzFqArBW2k/3yrp4xF6JsjF4oHCBHfB8akuAzLQElYicxs7ETi/upup9vNlY+3A/6ZT092cNEZIJj0MN8oZDbsMoWQRD1bOn0Qq9tPLwnlppNZ3Q9LnjoQQTkYGt95w4NXL5jfYPQCvPvHZIIuxDj1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=DkayBYpx; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="DkayBYpx"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VLhTz63lmzDqpP
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713547783; bh=ferlkb3NeFH2WJG01pKefz8nnJPCo9GIIHRDvLYJUM4=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=DkayBYpxZHTjOIPqTD//s2eJi9cjJv9wTiRnpwqsChNDmi8aPXzSxJf+aE3qVDsJ8
	 VRAt0sE/GKFj9XXBknH+prhRGc9B1wS3GeIqKC++ZNK/ftB64fIVTuyeJlUK5rsA1V
	 T0MXnrIy82AWCrH/dNCaa3XXCwQ+EwZfAyrXf2sM=
X-Riseup-User-ID: 343E3A483DA170C55F69FD15B0E97E38C5350BA64B3046E2AEE85BC8B2470379
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VLhTw5yRyzFtX3
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 17:29:37 +0000 (UTC)
Date: Fri, 19 Apr 2024 17:29:19 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: How to measure/profile ruleset performance?
Message-ID: <20240419172919.6ed7c1e9@localhost>
In-Reply-To: <7370616d-a6cbfe24-6b0a-4c74-8621-7fdc357facb2-at.encryp.ch-74726170@at.encryp.ch>
References: <20240419160232.4caca594@localhost>
	<7370616d-997afb3d-332c-4a26-afe9-e2a7c4e80c19-at.encryp.ch-74726170@at.encryp.ch>
	<20240419162811.43288975@localhost>
	<7370616d-a6cbfe24-6b0a-4c74-8621-7fdc357facb2-at.encryp.ch-74726170@at.encryp.ch>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

What do you mean by:

On Fri, 19 Apr 2024 16:30:45 +0000 Serhii wrote:

> to squeze packets on a line rate speed.

> to generate high packet rate.

Is that possible with Linux software tools?
