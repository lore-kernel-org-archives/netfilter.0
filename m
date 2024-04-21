Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA41933D5
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713690659; cv=none; b=bhCYJV5fws/jaH81GhXNg41i9DLufH5kZ3vyrZHPejxDrgAFrpnaMWkoAfeU2W+zjH76Z4TaEEUnqvXMEef8xjNghRY4QHIyQ0W1ACJx/1gQ/gbVpFhut92Z5A3xsEJu9GKNh2GH1V3cAnf0BF6c70s7x6rjl9TXRtDeQESTBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713690659; c=relaxed/simple;
	bh=RN7UT1klCM0p45gfD/1g1YRYOJehyNs7Bf6m1R1NLl8=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lMJ5c4tfvlJzmzw6Ledg12HEAs6jPf890tbhhCxZYcmHsUpDDkFeO14CJHRWyVAV4bJokNcs/0GzVWe8U/jBtKz7rS7883qI1NS266ixmLwK3rEudCManq2WrM4gpiT3Uz1396z/dvE1+r48Wpb9t2XxrnlkjFwmEPMQkVfvKpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=PxGov62n; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="PxGov62n"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VMjKY0NtVz9vvb
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713690657; bh=RN7UT1klCM0p45gfD/1g1YRYOJehyNs7Bf6m1R1NLl8=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=PxGov62nzKAwc1iuUCMSQPTu/IteksNvjJwwIAf5+9Nd3Phm4S9gK0zY+lTrAL1+3
	 QyEx2YUroLuSN0Oasf5PE5nB3jlf8Z9a5O1taL0ld4c8bUg1TQdcIwEA7KYvsclcIl
	 tUq1lnxOaCs/yKCMhgCPz1ZG7eTh44elLhvVCp7A=
X-Riseup-User-ID: 7EFE2520A0DB6B96A15A32A5C4F10811619C867193DB224DC270B97917AEFFDD
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VMjKW4sbGzFs3Z
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 09:10:54 +0000 (UTC)
Date: Sun, 21 Apr 2024 09:10:21 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: DoS/DDoS protection for end nodes
Message-ID: <20240421091021.5f02de6b@localhost>
In-Reply-To: <68460267-05ce-4b2a-881e-963460ba8062@app.fastmail.com>
References: <20240417194340.20430839@localhost>
	<7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
	<20240418121340.58c1fa6e@localhost>
	<07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
	<20240418153254.65058b50@localhost>
	<68460267-05ce-4b2a-881e-963460ba8062@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks for the info.
I guess it is too early for it then.
