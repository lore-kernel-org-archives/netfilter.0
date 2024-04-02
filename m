Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCEB39AD5
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712043010; cv=none; b=Uk7iy3tMPhXB0zK4ODbaq9g5hucPa+0uzec15bQZYkf8zSeo6Bpix8KgmlctFy9Kr85gir5951+bQQVIbHBYviIJgrrGoiFHHrgEwg+mDRgce2HxxTqIWt32N8A3mlpjk/nQ7S4HKYfkWbiW476Kkz46xV8EaWrMTH564dfUvqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712043010; c=relaxed/simple;
	bh=wOBUil83MHOGw4/x+zLh/3rKIW0iDfmYMDN+hFn9e0E=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VStKugkX6VFYgFoVYRVvV4jZ5oYDr0pV/dh62TCcOopGG/d+SSetwD5HMA7toivT9f0KglM1CJ9VcE24QR8zcNJCEEgS0PwZzWwM/oI1wRkdkErOrA7Jn+iAfOde77PLO8BR0iiRF/BegYBSShJ/qLzJ5ZYOpb3M7qzyQuFbiYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=kUXciO9m; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="kUXciO9m"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4V7zzs4LXGzDqns
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712043001; bh=wOBUil83MHOGw4/x+zLh/3rKIW0iDfmYMDN+hFn9e0E=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=kUXciO9mrtMpM9BZtiNFqB9QE7yTVnHaLOYiJvx6IDJdGXqEO39E1G/eXO18TIjac
	 QpEYECnmpNJyUGEWWJP8CyTqXn85gtY0jAbnDokJG64BEfA93TpkwmjfMLcTwk7Xf9
	 9knoCFRRzavGiP4Zo2rJt48WtscLZHN6Gf206/es=
X-Riseup-User-ID: EC15CAB29204FE9B412970039994168BE77494D151FE8FE0FC6F2AC77D7588FB
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4V7zzr1VQ6zFtsG
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 07:29:59 +0000 (UTC)
Date: Tue, 2 Apr 2024 07:29:48 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables: How to match ICMPv6 subtype in a rule?
Message-ID: <20240402072948.2193d20c@localhost>
In-Reply-To: <Zgs8XGAVd7R_TKh9@calendula>
References: <20240330194139.561b5a24@localhost>
	<f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
	<20240331170259.068a0db3@localhost>
	<20240331193407.3e40cb6ed1c4b6e9fb038c1b@plushkava.net>
	<Zgs8XGAVd7R_TKh9@calendula>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Is it possible to have proper symbolic naming ('describe') of codes
depending on type too? (as per RFC 4443)

I also notice there are some types that don't even have a corresponding
name (e.g. 139, 140).

ip6tables-translate does not translate codes either.

Has that been reported/considered?

Speaking of all that:

I have managed to "translate" the whole Appendix B of RFC 4890. However,
I am not quite sure how complete the appendix itself is, because:

- it does not address the recommendations given regarding hop limits
- I have found one bug (so far) in that same appendix

I wonder if it would be appropriate to contact the email addresses
given at the end of the RFC itself. What do you think?

Considering the importance of correct secure handling of ICMPv6, it
would be great to have an example on wiki.nftables.org showing a proper
implementation of RFC 4890.
