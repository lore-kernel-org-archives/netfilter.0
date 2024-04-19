Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C561DFC7
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713531284; cv=none; b=sm3JMPLlIXObsSrdocglpxyIiR7FjtHx5XcLNJ5gl8aT8X84Zecq+yT/0HNA77UkAhMLrHr9Gck3RNbRkPHFrDykIpQB4NEp7QofIS9Hdpx256AnZi757oD6IJlAj5YYHatZnpd/h3oLchuDbDUoSXu8s+HgD9d2iGRwF56VUHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713531284; c=relaxed/simple;
	bh=ilZsLOfd3xYq9+dDI1vXZq5FN5k63dlzjbDCJmvrKQA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UO66FS3oSnzvAmzSVT7EjVDiHrfY1100wNgur21jKOLMkEzDj7P/WSQnpsjjqxYcpl7rwOcs9PMHrLi4HQBTc90TEOaAmjwnWVTAQQBKHczN3VA4LbtssMT1eLgm8wpS+h4S3b79iqz61OJZyPe9RUsvoJw/So8poxN+QeHy+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Am0MsL+P; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Am0MsL+P"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VLZNf1bPLz9vBH
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713531282; bh=ilZsLOfd3xYq9+dDI1vXZq5FN5k63dlzjbDCJmvrKQA=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=Am0MsL+PfrT0FaKQlIJmK0n7wCdMvSB2DsIi704KBRq8Hvwr+JO2wTHNrnVecd23t
	 Rxb5ZSR/TzBdoLFe+Lmw4pM4VUtgZpgB9Mf7AZCgwDmgWsUhnuhlbzegLjvMQvVS+y
	 X5iqVxCYal2mP6WytNYk/8TCt4sTzIyCfny9aA44=
X-Riseup-User-ID: 53C1FD5C05A32D984C21ADF6A83A3E699492692B9FCAB7767C7B45D78DF2F345
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VLZNd2nRDzFrx3
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 12:54:41 +0000 (UTC)
Date: Fri, 19 Apr 2024 12:54:31 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-ID: <20240419125431.148d4270@localhost>
In-Reply-To: <7370616d-56c4511e-0a47-40c5-8f38-4d70a6aad4b1-at.encryp.ch-74726170@at.encryp.ch>
References: <20240416174748.5612bd27@localhost>
	<20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
	<20240419105542.74aaac89@localhost>
	<7370616d-56c4511e-0a47-40c5-8f38-4d70a6aad4b1-at.encryp.ch-74726170@at.encryp.ch>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Apr 2024 11:01:59 +0000 Serhii wrote:

> Have you tried vmap?

OK. I tried.
Can't get the syntax right though. How do you do this?
