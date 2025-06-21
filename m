Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B13814A8B
	for <netfilter@vger.kernel.org>; Sat, 21 Jun 2025 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750466920; cv=none; b=P5QOuY+Uxcj20D5ewfq7HRnPvL2RHcXaJw7Yk+cIocZgxqg3qE/Vn6tXJjL7vWizVpsn3wCjcrE/kujj/fiumNRoT0kruexqgrmvw44gXKGLK6b03Bvl19XEKBF9VUfcDP3l6Bn/0LPsw4JOgjMq2URChSf4sFWw15SJIMBcC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750466920; c=relaxed/simple;
	bh=HJms1qxR1hgQyt7QrD7fYZDAtdvRBBCrfwb3ywDbfVg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BX5/4NOIadJ/TZ5gTss4tqO6Oz9EXrNVGzcN3T+Yp34yTrCW5p375KAIRfbhqmrhgghARKpCz1v9LUFOIhXUUUIhM65PzpVfmQD30WBIiWAhQIWF6x/7Vr/i+WRp2AvaKHaHwA2IOCLGRv1/snY9GEXDWZLt+PQtEurDavdWozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=XM1CCiUu; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="XM1CCiUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750466908; x=1750726108;
	bh=HJms1qxR1hgQyt7QrD7fYZDAtdvRBBCrfwb3ywDbfVg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XM1CCiUulEv24Xu8AwEl1ohhwVxMwnOMVeMjbPS4cyfBULtlFDvz/SXDZnMdcrXZZ
	 157d12tiNTGT+OyX1FkieGTS30H4fLS9uG/o/2ZABDZX7kgpYdtVKqC03jbKEh8BOA
	 dvZl9iBtJ/A0Gnt7wVL5t1oFks2a49bF+QryerWm9+V4gpAxerE9caN4yzCwxNVfeI
	 rDE8IMtDw/9MgKNH7LWqam/2QIjYqgOcjzQhncHs4AHaI/Mb/9sV3DpfLWWv62TFSr
	 UHixsuthLMXz2+f7FM1KgqmVDgAwm5jaH2iAAAqA+RyxkBRbTYxOgCkuHLpwxq/e5P
	 8zZ1XSm2jSa2g==
Date: Sat, 21 Jun 2025 00:48:24 +0000
To: Michael Tokarev <mjt@tls.msk.ru>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: order of netfilter hooks and check for martian source
Message-ID: <7wR-GVqRP8l9UDDo4OaeWZXZOMKF6adK7-bORlkCF2AY4NKDLlPX1R91egntfEvG3tWyXuSY81TpbWsF0zyYk4MhPc81-g7HdntMFp7zPHE=@protonmail.com>
In-Reply-To: <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru>
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru> <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 2525d2fdefa91b05c37d57e5809eba5134841ddb
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

> from hostINT back to extIP, gets routed to gw1 through eth1

Looks like the default route for 'any' source has too much priority; withou=
t looking at the code, it seems that the assumption is that there's no poin=
t checking the other routes, if there is an 'any' route. I suggest removing=
 the 'any' route and relying on SNAT for 'hidden' clients. Add more routing=
 rules if neccessary.

sunny
