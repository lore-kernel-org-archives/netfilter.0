Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9135A171647
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908538; cv=none; b=RSP/+fhfCwI/B/E1orI1u6NSWc7EGzhbs1MiIJB+JrjAWo1mQXAQM3fDn3eP65p/gA3POSRXKInvN30bv1alV8zdq41cDMMT9+HREvjYYnT9YuqjR72/X/SvYg4oe2v6NqilwWvYTo1rUZQxiw46Iyjxf7WYjby0liD1xSBVpow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908538; c=relaxed/simple;
	bh=1TYfFcIvDlcJT9U/ZMlENFwTKzUIgSOgrZbWoUpTRC4=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZnjpcyKI7CZAxA4CaNRPYn5UjNtzH/m98rqqBSOpXxq41zHVmliN6ldZo8KbG/c5372F75TCgiJK3kACgKOOGvC2VROiplp3PZ5mgeRRUqbROILXZJ8J3v9hw3Nf5TLQG1KGyHh6C5HVbZM9TcF6MdbPDvJ2NQuNgXU5yYsqxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=JdXsGPmt; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="JdXsGPmt"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VpbMh4h3SzDqfW
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1716908530; bh=1TYfFcIvDlcJT9U/ZMlENFwTKzUIgSOgrZbWoUpTRC4=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=JdXsGPmtdPA8agXSAROdNGbb8C8f5yRnSwPIoxZccAfxltDrQi8zqkJxZVtBVi14o
	 vmZgdczTGvIS1IfaBOwYk7knBH0Dr9Y+bkcdtG6vNSVIXnfwpWVrV7sbtAgDPviRrh
	 9TXUaHhhfJicZBLFPb/6l0nZ2SQwzRoYc2d7r25M=
X-Riseup-User-ID: 7BEB68AAE815F412883003FE0851D6E9038B4E9BBBEDFB03776E85B075AB9B23
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VpbMG36V7zFtfb
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 15:01:45 +0000 (UTC)
Date: Tue, 28 May 2024 15:01:31 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nft not logging some layer 2 frames?
Message-ID: <20240528150131.3ced9e3a@localhost>
In-Reply-To: <371a8e68-4a89-41e3-880a-14e0a6371fdc@del.bg>
References: <20240524155729.4fd15210@localhost>
	<70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
	<20240527171718.7db995bf@localhost>
	<371a8e68-4a89-41e3-880a-14e0a6371fdc@del.bg>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Following the example given here:

https://www.freecodecamp.org/news/how-to-use-scapy-python-networking/

I did sendp(frame) while watching 'journalctl -f'. It showed me:

kernel: DEBUG: IN=eth0 OUT= MAC=ff:ff:ff:ff:ff:ff:00:11:22:33:44:55:90:00

Unless I am completely mistaken, this L2 frame was sent and logged.
