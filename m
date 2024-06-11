Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641D57CAE
	for <netfilter@vger.kernel.org>; Tue, 11 Jun 2024 19:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718133643; cv=none; b=VacFI00KpmPKiYKr3xYq7OEr8kDtLmiuZnn8nRlxQUGmgj0Mq6fAV187Za5pZjSeiAf/V7bWh9y81/r+wUh1XhfVb34+Sx4nZCOF6lvo9emL3jHOfNyCJOGBvjGtCBX8as9B28r2ePQjEnjqGUXBTQEuhAiCJWj86cwuFQeH0LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718133643; c=relaxed/simple;
	bh=CvkQpBG1EFo4n0eSuT7Gt7Bs+zt4nmUIUCdBWCXRB0g=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uV7WBqin8VSrXLJMwUmJpmceY54OwflpsTIUs02ppWYh1lLtb7IzCTRhdCi2vJL7E1q+6tNSVyoU5mUXNvVJ72mLjg/PNwJwpsKUF6yoNUByoj+c2gYFZfHG/k27EoxIWTuLlMMpm+LX5NpuG/RnpKxzIqm/hbvHUtycvilykUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ogf19now; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ogf19now"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VzJFz0sq9zDqQG
	for <netfilter@vger.kernel.org>; Tue, 11 Jun 2024 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1718133143; bh=CvkQpBG1EFo4n0eSuT7Gt7Bs+zt4nmUIUCdBWCXRB0g=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=ogf19nowKwim7prw6+Ioz+LZ+gtN9AspeT2QJOUcptxyjyJDDLj3NER5Lgfrg7yvj
	 XAUbbbM7J96AY8gcKD699Zc4J+PD0PaJYW1ajeDXkffuuqa1SPw4OSIBUgvRdL49CX
	 u59kwzXm3VjmTBubrnnpif1YT4KO1ymd2iugH27Y=
X-Riseup-User-ID: 012B60D68C26C19D089F428ECC33D0979B428C1B967349C07C42E8465D02186D
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VzJFy19rLzFtT2
	for <netfilter@vger.kernel.org>; Tue, 11 Jun 2024 19:12:21 +0000 (UTC)
Date: Tue, 11 Jun 2024 19:12:14 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nft not logging some layer 2 frames?
Message-ID: <20240611191214.5cfadb52@localhost>
In-Reply-To: <ZmiWl7L5dA2HgYVL@calendula>
References: <20240524155729.4fd15210@localhost>
	<70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
	<20240527171718.7db995bf@localhost>
	<371a8e68-4a89-41e3-880a-14e0a6371fdc@del.bg>
	<20240528150131.3ced9e3a@localhost>
	<ZmiWl7L5dA2HgYVL@calendula>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks, Pablo.
Where can one look up the meaning of the MACPROTO number?
