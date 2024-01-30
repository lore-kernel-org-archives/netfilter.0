Received: from bar-jono.foobar.fi (bar-jono.foobar.fi [188.127.201.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC66D6BB3D
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.127.201.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706621326; cv=none; b=Sx/QH9oYklUHv2QFWR9vW7/R021oafefqVU/WQX7WDxkDthWXHRjuwm6jkPtRz7q+aVJGAAKSptq5xzoOMQMNC1Zv5ea7/LgmFu8QdN/NFsnmnrozOKpdsra4jL2jin7wSzyweU5o+zls1sLRO6yQXD1C4xc5AOX9P1bEII2cFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706621326; c=relaxed/simple;
	bh=XocOo12cOSP5ODLYDLdX1ybjDMsZPWVETwqDHQqoTCY=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nfv/F3tVcas6LWy41a+5bidFSscmKKpUOYnYyFluUZ/MPKdq88lkNiY7DMyHStYNMXNO8M3BM6rjnodt+w5ZEH9w4z5CkTLZC7nrkDJBeQmf1aIdVwFdAn0wF19vxFT/fEM6/gNc9CQwqP3FLEh5k26Dl3uERc8M6KexOES5LTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bbbs.net; spf=pass smtp.mailfrom=bbbs.net; dkim=pass (2048-bit key) header.d=bbbs.net header.i=@bbbs.net header.b=c7fgqAsf; arc=none smtp.client-ip=188.127.201.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bbbs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbbs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bbbs.net header.i=@bbbs.net header.b="c7fgqAsf"
Received: from localhost (localhost [IPv6:::1])
	by bar-jono.foobar.fi (Postfix) with ESMTP id 4TPQp42CCLzB0NgG;
	Tue, 30 Jan 2024 15:22:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bbbs.net; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:references:in-reply-to:message-id:subject:subject:from
	:from:date:date:received:received:received:received:received; s=
	key1; t=1706620971; x=1707484972; bh=XocOo12cOSP5ODLYDLdX1ybjDMs
	ZPWVETwqDHQqoTCY=; b=c7fgqAsf98WXEriN/V9HcBrwnLSTlumSALrhkYqwrZk
	2aXCJPUdDP0Yfs7hd3zEKdhrFVwaVdWD+0lewcXej98XY4a9I5scp5ibVVCrr1NR
	h7hix/YLGCZNlIu5uIGCEvWYM1NX/4uEH71XdC+bfGp+Vcms3fOorOpUf5bJAizP
	Ry0r7DWy1+TBXX6Vam3yjrR3O0CH0HiI0ABBAH6sE+ZL8S6Fn7d2tB30BbnWiMXD
	NZTDwjQBodTfZLjhOIJSj6ETFs6S08LZ/wOyftoO0vIknpFldFqGW8XeZJZtPFs2
	AjlN7pyWaBu/KpOp4O2yYuHcEADg5weWBa3ts/BZx3A==
X-Virus-Scanned: amavisd at bar-jono.foobar.fi
Received: from bar-jono.foobar.fi ([IPv6:::1])
 by localhost (bar-jono.foobar.fi [IPv6:::1]) (amavisd, port 10023) with ESMTP
 id VQ81uFKktmvc; Tue, 30 Jan 2024 15:22:51 +0200 (EET)
Received: from risa.bbbs.net (dg4ybwyyyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:2e00:1900::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by bar-jono.foobar.fi (Postfix) with ESMTPSA;
	Tue, 30 Jan 2024 15:22:51 +0200 (EET)
Received: from localhost (localhost [127.0.0.1])
	by risa.bbbs.net (Postfix) with ESMTP id 4TPQp0657YzcDvht;
	Tue, 30 Jan 2024 15:22:48 +0200 (EET)
X-Virus-Scanned: amavis at risa.bbbs.net
Received: from risa.bbbs.net ([127.0.0.1])
 by localhost (risa.bbbs.net [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCp8LcQbySXe; Tue, 30 Jan 2024 15:22:48 +0200 (EET)
Received: from cobra.bbbs.net (cobra.bbbs.net [IPv6:2001:14ba:2e00:1900::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by risa.bbbs.net (Postfix) with ESMTPSA;
	Tue, 30 Jan 2024 15:22:48 +0200 (EET)
Date: Tue, 30 Jan 2024 15:22:47 +0200
From: "Kim B. Heino" <b@bbbs.net>
To: Marc Haber <mh+netfilter@zugschlus.de>, Netfilter list
 <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <20240130152247.0303cee7@cobra.bbbs.net>
In-Reply-To: <Zbj04V-90zpQwEzl@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
	<e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
	<Zbj04V-90zpQwEzl@torres.zugschlus.de>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> This is one of my pet peeves with nft, actually. For iptables, there
> was tooling like ferm which made it possible to write dual-stack rule
> sets very easily. This kind of tooling seems to be completely missing
> in the nftables world. Am I missing something here?

Foomuuri [https://github.com/FoobarOy/foomuuri] makes it easy to write
dual-stack firewall rule set in text format. Not really ferm-like, but
might be what you are looking for?

Full disclousure: I'm the author of Foomuuri.
