Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F41F152B
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738269582; cv=none; b=rNKTPUMLk7f/cngFInX3CzykjRbHE4g/efGLjHGmpzxk5EYGOtzeqDwsUW9Dsm5TH6A7l1tf+WIXcFRZ/H6blF+j6yzmMK4jQXU7s9vHcjrsy/uxKOL5El95IhK6UGw4DicjAvNbHfWOCGGm+jAS3thDVVK8lXYEmtNEsNpQ9nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738269582; c=relaxed/simple;
	bh=jZVqmvE43I1vvwR5gReANwG1UshSoxgzD7BQGh52TcA=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qxqV25IBzBOgOHZbcPnzxk+9gQTl/6C16RSQwEB1DHT5nyDu/bxpCqNB4BFq9xX37cx4kwjCSEVViu+hn66tTQv02Pzu9k4VZxzBRR/1zGc1N20MEtc4FZuhyIFzm7spLzcPJmnG14qB++Gqtz0Kcxy7XecP23ZrgYIAyYV6VZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=NARMPR8f; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=nEsKn5Pd; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="NARMPR8f";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="nEsKn5Pd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=kbUVI9SHYAZJta4J3CR58zSWPRc9R9EcgDk4xKZzqHA=; t=1738269578; x=1739479178; 
	b=NARMPR8f8jSL7Bbk3WZfYPYzcJCFLx3nCjyTUx7+DgKqSNinbrQOAGIYh0cl2ATqABQJjjxX4Hz
	Fv5D8zp+zX5pX6Is2WKfAPR8tlu9Rm6P50LSyDbVa5+mvlVzMvTdoXER7aaz0C0yJsm0v0ERPOQiI
	JYxPT+5VFe0Ef99pJjk=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=kbUVI9SHYAZJta4J3CR58zSWPRc9R9EcgDk4xKZzqHA=; t=1738269578; x=1739479178; 
	b=nEsKn5PdfDyViG4MJ6ir5bPMMqC4BcLIXEHmmbR2XtKCrnVIcIU2H4zfC9PyFBEwj6QHU/uP35G
	Nf582YPiWDw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tdbEa-001X6m-22
	for netfilter@vger.kernel.org;
	Thu, 30 Jan 2025 21:33:56 +0100
Date: Thu, 30 Jan 2025 20:33:53 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: Netfilter not dropping packets as it should
In-Reply-To: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
References: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
Message-ID: <A7C91E02-4420-41B8-806B-0A3C14922208@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30=2E janu=C3=A1ra 2025 19:35:28 UTC, Binarus <lists@binarus=2Ede> wrote=
:

>Please consider the ruleset that's at the end of this post=2E It doesn't =
make any sense, but it lets everybody reproduce the problem easily=2E

IMO, try to set in prerouting hook:

    nftrace set 1

And then try to connect to SSH and post output of:

    nft monitor trace

While i don't know how netdev table steps in play, we
then will not need to guess=2E=2E=2E


--=20
Slavko
https://www=2Eslavino=2Esk/
