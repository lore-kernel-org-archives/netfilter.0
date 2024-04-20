Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A1EEAD0
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713603097; cv=none; b=RPDvAHPx8mceOHIb8hkSOjWYPPVWa36FNSG+ucdiORaFNA+ca7ixjxcQCFT/2E2lTuU7x4tQ8bGKUtTQmonlBAqmSH8HcnxO3lqZV2vrS646zDnJYMMysUmK6nBTqGCQbqUGh4/hMQtBMKmBG9kXjlRX91LjhoCJ5OTOM2z/Tns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713603097; c=relaxed/simple;
	bh=Q76bFNXHk+lJ8t8zMGyIo2by2KXIJct9OdJkpbl6+ko=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTxOjyDExe0oMZoHdhMRBn1l5lwMA/nbIdK/V6NEuDgeLQM8aZPFspPEVT+a2tdtfVOFBjBeUvIkV64WGkb2GUAyQmYiIrMVtlo9NwQQ3cZjmQXddXc6zGMKBrW5753LdTEH5S28EoFzMwCwFRnR6qcgdbEoPbSntO8Ck0Cv640=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=CGvsYpH9; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="CGvsYpH9"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VM4xg72sbz9tKX
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713603096; bh=Q76bFNXHk+lJ8t8zMGyIo2by2KXIJct9OdJkpbl6+ko=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=CGvsYpH9s7V6eABuaYuWWP3a7F9IpJqRs8AcrsBaKuDk4eVEq+6Fx8neN1PCUFoU3
	 q2TPpMrOc/cv2szmw+WX44M3P5BT2LqcAapweTOKFe6+viuhzXFJTlAD1d5hbw7qKu
	 wb5WbqjjycdzTJr70BVYxe7iKczcZCj7jwRKPqNo=
X-Riseup-User-ID: 34596AFA9811114A580EB89688C484B139F93B30F487FB00C929944387A6D9A1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VM4xQ6QkkzFsf8
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 08:51:21 +0000 (UTC)
Date: Sat, 20 Apr 2024 08:51:11 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-ID: <20240420085111.5473c9b8@localhost>
In-Reply-To: <3732a410-afc7-4b42-85b1-6952ece01db4@app.fastmail.com>
References: <20240416174748.5612bd27@localhost>
	<20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
	<20240419105542.74aaac89@localhost>
	<3732a410-afc7-4b42-85b1-6952ece01db4@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Kerin,

First, thank you very much for your attention, again.

On Sat, 20 Apr 2024 03:36:00 +0100 Kerin Millar wrote:

> (This might have been better off as a new thread)

I thought about that but I assumed it is closely related, i.e. similar.
Obviously, I was wrong. So, I have replied to your current post in a
separate thread (with further questions):

https://marc.info/?l=netfilter&m=171360276907019&w=2

> Given the number of bugs I just discovered in the course of
> experimenting with all this, maybe it is just as well.

Could you link to the bug reports please?

