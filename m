Received: from anxur.fi.muni.cz (anxur.fi.muni.cz [147.251.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A044C81
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.251.48.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949483; cv=none; b=AiMPZ69yZRpQoRPh3Ymi3PQBdnr7/77NeSfjYlWu9MG1Z+WkaV5pFEnkyFKv8AUFADqIDlWhuPF81IC4Vksfqi8ygpkYsYWO9bTZucNNyUGF/bgcz/Q0oRX4hNhh23csr79iO4HKrowSzfy23+afsfz22OK1U722owJh/RZDY9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949483; c=relaxed/simple;
	bh=2J7bjQGEbfM/juWikuUbugDQgqQQVCYeVQJfHTEEJjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeIdq/kf8ZYzXGWmo+dVIPm0lC1HUWNZjGvHNmJ7NE8WXA8rBpCUW/Ndo9lXnxbXpz9i7zsae553WxS8xOqeER+zGBReDmiwChDTlVgxi81sho8vv9tvjxugpokwezkpPbhmasS7vpvObuKamswzDGHqskggFDnySucKdqii8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz; spf=pass smtp.mailfrom=fi.muni.cz; dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b=JwnQ1edi; arc=none smtp.client-ip=147.251.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b="JwnQ1edi"
Received: by anxur.fi.muni.cz (Postfix, from userid 11561)
	id 28A49208DD15; Mon,  8 Jun 2026 22:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fi.muni.cz;
	s=20230215; t=1780949477;
	bh=VuM5uFsSWvkUEUcp55enfgGEorF6JxQ/guXEFrHJjjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwnQ1ediz+ZjFeihST6taRo3YEUOGvfVHzPcM1IHZ/CNgHgzMyq5aUVtt2F2jeGqC
	 1A6X/YH8qy4UNXeisiHsyoDUf0aU+45T1SWOV3kqKapTz0KhIkMSDNsZEpx9+M0chk
	 YfCb2YM7QGheUxGSFWABMVGQn8HGWtQguAZcSMlV61zvrzXIvnwSLbACCBcU/yPL79
	 X++jzrSfNXao8PsOs4eVuiwLIlnh8IZOLN+RfdEjSPcdJVHo40zb+xW8Zm9q8ko1B+
	 xAo1s97XCmL8w3Fo6FJLnD7tFDtHLpO5GWR/+hEQAXmzHbXbhs0fItjtWUzDlcrGW6
	 2ir6k3u8AjogQ==
Date: Mon, 8 Jun 2026 22:11:17 +0200
From: Jan Kasprzak <kas@fi.muni.cz>
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Subject: Re: Logging SNAT'ed connections
Message-ID: <aich5cMiSFlr1pcH@fi.muni.cz>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

	Hi, Kerin,

Kerin Millar wrote:
> Unfortunately, it appears to be a bug affecting ICMP. Possibly here:
> 
> https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189
> 
> For now, I would suggest filtering with something else.
> 
> conntrack -E -o id,timestamp |
> perl -ne 'print if /\bsrc=(\S+).*\bdst=(\S+)/ && $1 ne $2'

Oh, I did not expect it to be a bug.

Anyway, you probably mean src= in both cases. Using backreferences,
I did it this way:

perl -nE 'print if /\bsrc=(\S+)\s.*\bsrc=(?!\1\s)/'

Thanks!

-Yenya

-- 
| Jan "Yenya" Kasprzak <kas at {fi.muni.cz - work | yenya.net - private}> |
| https://www.fi.muni.cz/~kas/                        GPG: 4096R/A45477D5 |
    I don't like Python; its lack of inline, anonymous, multi-statement
    functions makes me sad.                                --Eric Wastl
