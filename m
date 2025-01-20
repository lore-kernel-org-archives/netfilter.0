Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704914387B
	for <netfilter@vger.kernel.org>; Mon, 20 Jan 2025 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369822; cv=none; b=LRUMu5/ePF16B89vUDQu8BZgrpD6+dG6U5X13jWeKwQ1DGPfxCzkIy7KUqo7ngH7QmF63EALDapKv3h8zn4okA5BjKqcT0BG05nn7RxGGJYfo0q04d3kD32K9gxrzi36qVJQa20xW9meQUlCvt8aRMRd7DFmEJGYodTnqgZ/jU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369822; c=relaxed/simple;
	bh=DQAWrKmOPuEDCGOm5gsqQqWCfAdx2r3B4DmEvha/Lvg=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=GMb/3iqW60vNEuwBk01k9XBKlq+suWFK+UylsvFiieiRvbD+AtPp3rKHkLxnGoaKiG+PZqrWBuIf7wWJeumSGLmD5FLS6BawlMUVC5KluAPz7FY6oCiEnfCfEVvlU5IVfbQ5EgdkEZDtFVCFHRe7faZIQEHbVCkbd5B/vJKnfnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=YiboKnOk; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="YiboKnOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1737369813; x=1737629013;
	bh=DQAWrKmOPuEDCGOm5gsqQqWCfAdx2r3B4DmEvha/Lvg=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=YiboKnOkYxHkOYCMoQx0hVJWIyAS//4QwhY5BD/lc2V+Mz8a4T3HP/Wxa9CRZUHcP
	 2lONtbBlPgck7jkbwjDBQR3qx4Ka07EYn3tVg0RhkbxPLm8Vw75j1AKXP1JC9A1xWh
	 pYnxso0pIAjZG0Mb9agXPPQR6yqX02ZGh9ZD8dA39RlqaPkUXR5EZjh3VYHgSMWKnb
	 dF1OdWa65xiSUoNKvTQCxO70q2/Q7gNBgKyXYSGRywtaw9japizfnR+aI4reYfaSUq
	 li+mW0qQl9XyRay7R9kEp4cgXo3Oonts/OXyipQh6MonfIk/fCReJiDUWvSS2MG6I2
	 JxF6WmMNdzH0w==
Date: Mon, 20 Jan 2025 10:43:28 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Subject: nft includepath directory - directory on a separate partition / disk
Message-ID: <NGp7ElQTtnKdz-MSIDoZoRQE3xU8rW24okI9wqQ4EMlhgg-LcByeweKyN9qzW22oKmfu5xD6F9AekzJx0m-m1qFHM_icQtAbHr35mq0hsLY=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 86d58a118dc223d6efd8d66fcdfb21774db2af13
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I wish to `includepath directory` where 'directory' resides on a separate p=
artition (not a networked directory).

This is in order to satisfy encryption at rest requirements; with LUKS, and=
 PAM.

Are there performance hits, or any special requirement that `/etc/nftables.=
conf` must effectively reside on the same disk (or partition) as `/etc/` ?

Thank you,

sunny
