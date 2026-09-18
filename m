Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429E84D2ED5
	for <netfilter@vger.kernel.org>; Fri, 18 Sep 2026 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732256; cv=none; b=eDl+846mOJ9Vpo3ZR0j5MqYRcRILabw0t1NPB02Ohg9taanVgQd7rTbNMoHWSoRy1/ANuZBwHGUuw9DFGsrrGWL6PsmfdU9db0UUlzUPBqPI3ueBeLsqMPTg4zKgP3PjQ2yUOyVkJqAWA2ShbplNNrrO/FKGtKMFnP5hui/YROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732256; c=relaxed/simple;
	bh=QLRyMCFTtdXdTssuGpHScW0LFuAQ4eMDdZJfqvVjX0s=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mTr3dOijtkUmvNHtU+l+3SzysisUDWhvDJo1sIjy3yK3Bv6BFbskjBD5Sai70YvJznYMB0Hxx+Qg81pIn/xGbSRtrObOGBBFlqg4WiBjBXXhtLsLhfbeLP3hXKtT6pkBLUGODFqD2C9IXy5/iBYlPBWz7VP7nOb5qe2iwtzGjaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=Y+SBFhCl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pP5GU/71; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="Y+SBFhCl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pP5GU/71"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.phl.internal (Postfix) with ESMTP id 1125CEC0193;
	Fri, 18 Sep 2026 07:50:52 -0400 (EDT)
Received: from ams-imap-01 ([10.64.2.21])
  by ams-compute-01.internal (MEProxy); Fri, 18 Sep 2026 07:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1789732252;
	 x=1789818652; bh=XjRAeprUZP3rUq5Xl6Z8VB0E5/OA/v27s1ax5GQbFQE=; b=
	Y+SBFhClh0yK4Mft3sArIwisywt5hbpSGsDNLnhIELUXhY9WP1lCDg/noQS62o0b
	HXxt6KN2C+vTtZkei6cIt50/UjOS+uvrV5QwjelKllHfkjmUOys2p9DSYuO6g4bf
	ZsWR8S+wQnCyqRz4moM3aMJvMLvuRXO6rpZ/h1tzaauOgB9zMlvxWwIgOKj9Z0tG
	cs6pd6krJx+tCQMwHZYtiuGYOTa9AZNQwYcilhYUKwO5pHt6y7BMtW9MaZUrtBi6
	aOWWjrpb9sW22oWZ6tKEZFCA4F5XEGxBqLE0zTydU2hWNsu4a2Ksf56y3BcNWviu
	sf79aLvy0Bmh9adDeeZdbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789732252; x=1789818652; bh=X
	jRAeprUZP3rUq5Xl6Z8VB0E5/OA/v27s1ax5GQbFQE=; b=pP5GU/717w6Cq0AcE
	+Opt+/Ff3Pw/WA5+0Lvixa6hqsmv/+iGNykNXfqJa/h2VJXcBSob/yYlzl4RpnNj
	eBL9vA47tJm8IWsW4BSJwZJbsGM5rFR2woK2a+UboZn+Jm3bMHWcmsLnm99/iPUz
	nNkODdQXqcR3vczKPgf12Ys+znJ1YWeGkaYHPIfzkZm677mrnidM0XDmEKfSHXLz
	4H+J9x97jfXTvOLSVzdocxgp/LoADakOuLEOvvVO/+f/r1jEk7IZf4EDl74chdvo
	InoYabzvT+fxpXfWlaFioAnKCO0JXAEvqwWwdY+uRLdjWzDTAA3Aj9hAf2rfohPy
	XiCOg==
X-ME-Sender: <xms:miWtaiuvjoOiV8q_QID4IZ39UJy_x-zjUg_iYQJfiL_A15oKyT1Jcg>
    <xme:miWtaiQLVNZQx6PbUH1R8XpmslDoQu8AE9f4B2bixb4D1RYIIqzT0siCDk85iOFQA
    gPDmFrZspliVPrJ6feMyIXBS5M0yjni5zS3Wl2uuHfYigvxMFnR-g>
X-ME-Proxy-Cause: dmFkZTEAd+q2VcxpfAxou0fFFRXrdYKBBJpKcm4qa6qxBI7ojHCCdHC4qkvWHBYF2JAzns
    5bSazk08Ybg27nvsy0kZed77F1xFiJJAvXb1bnzjl0keVlkqHWOj81w77N2mY8fM8hRpiE
    jt/zoNvxR+CtAXGPYLyNGR5n+XSjAt6NJ0ZKhO9rw1wpB+TlDf1Z+7vyFENPMyUN/3mvzD
    uLek5y4gBU9iJcZkIH7tCybSRBNvvbzKq5hWIFnSlUy3kXtx3KUzZL7yOqw7GZaOax9Kv3
    4CS5mNfQ4AbIKLDh9hYzO4dRk0Qy3YowKKjrePtCUhnJPQ+Z0T8WZcZ/UJy83NA7a3TWax
    vEB4qxgUGAVJj+ZxsZvQhTfVIBY6ilT2kvxBlRYlQVaRADsCRSw+Wtn2AAZrM+EXP/QvQW
    PInliMADfUCLyThkHlu8coMW0vNLqXQ4iFFWNyU2+TYFmuO3FS/I5QsWwNbQa+5MBu00uM
    8FYCfUNk1pFsKu2lUlTsKhv5TkpmJmvyRXweJ5ELzS81lajx5t76F7kIB+AEVlUvOanESc
    rGo6BwdahOesAQPXqyS8xiRacQuLwYM9izFc+sA/Js6fnT5D2RdxECdLS8/zyQZMcndqOL
    i0a6jiJvOWMcgdH6wsHFo6aNTIggpC9I0g4BClDP5iYdZAsWzdf3b5UtKXmA
X-ME-Proxy: <xmx:myWtahY3X_8-hm7L4ivGplWQPwwPOWyVekaTIc1WkvB2cGqYed8Ssg>
    <xmx:myWtamWBKkuW1JBIJiQP9mLJ4OeXt3N59sQjecwDuajFibhXhEsnBw>
    <xmx:myWtarhTPPqbXxmrQobTo-UIyurOONe3OpcIAjcujLmqRyIeObuiFA>
    <xmx:myWtasXgHhrZPZf1EPdhlAdkAKinLkYtXYRTqdxQadyPTHqdjDK61A>
    <xmx:nCWtan6FoJeuSO7zMeEKa3M21oTXILgigMaTp9MCNXj1Bhkh4q5Oj515>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8320EFA0083; Fri, 18 Sep 2026 07:50:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUT0m9N1HW2Z
Date: Fri, 18 Sep 2026 12:50:29 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Henrik Nilsson B" <henrik.b.nilsson@est.tech>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-Id: <31fdb556-e3ba-41ee-88a7-a93e3d772301@app.fastmail.com>
In-Reply-To: 
 <DU0P189MB22277AA490C5FA005F58391AB7872@DU0P189MB2227.EURP189.PROD.OUTLOOK.COM>
References: 
 <DU0P189MB22277AA490C5FA005F58391AB7872@DU0P189MB2227.EURP189.PROD.OUTLOOK.COM>
Subject: Re: Question: is git://git.netfilter.org/* down or have the git repos been
 moved?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026, at 12:05 PM, Henrik Nilsson B wrote:
> Hi all,
>
> Is git://git.netfilter.org permanently closed down or have these git 
> repos been migrated to some other location?
>
> I have been trying for a while to clone the following git repos without success:
> git://git.netfilter.org/libnetfilter_log
> git://git.netfilter.org/libnetfilter_queue
> git://git.netfilter.org/libnftnl

For what it is worth, the https:// scheme works for fetching. 

git clone https://git.netfilter.org/libnetfilter_log

-- 
Kerin Millar
