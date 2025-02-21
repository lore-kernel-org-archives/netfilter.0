Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8654D6088F
	for <netfilter@vger.kernel.org>; Fri, 21 Feb 2025 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740102035; cv=none; b=RgDIkfgNFzNUFqhLqzdb8D5Wk5nKKGcI2rSgxKLqy0QqjlxstN18iXgD/5zVmHAStvP1sS1nj/rA0/0huSVar55BfkaIckFX/W+iJTxG0FpFRyoAFu1vlssWnd0Shh3ax7XUnzb2wIYPhMkNBdMgOXLuKZvi7oomQ/3Y7ISq5us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740102035; c=relaxed/simple;
	bh=AKwVLiex+6XQqnF36Uw5Ou7ydJIjEk4nsT4PxLJJVLU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q9gkV6cLxw7n3lCEp8NyZCOjLZ19vBRbk2cY/cRz61fKCi2Dv7cDDXJJh+cpwOUq3vUd/mA7vuO5gHtGlMaHXQeXY1KBFTCZotgWkhKOWyJQTVGKMCSnhqdfEnAniDUUK8Jxt40oSMoKUlfog1V10jWE8bGsWnHg5h6+EB+mvTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=BuBqJRlW; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="BuBqJRlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1740102030; x=1740361230;
	bh=AKwVLiex+6XQqnF36Uw5Ou7ydJIjEk4nsT4PxLJJVLU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BuBqJRlWCT+jVPZ+LxIyqkGKDrKdbKBmM1Lw3KWI2AnqqbslRyVF0tJxmcrbWg8j/
	 nkbhmh/yshBxv6s5lsKX4u1hKui2pELkep/PqT4YWz9ymWYBUmNVGBG4c1Zx4zZMib
	 qsYaWkW+sUetAQ2RwpKwjuFXMg5lWw6e32qpUFVXrgb5un/WvSp1HZ4+VffetjXWax
	 yujXJQ/C+EAwYLJ1VT0Ccy4FiQs9xNG/B8uCJ6cQMGheVQgSnzgHcdGoXF8M7+bSu9
	 4MeqTNiLyHvUy8338A87Cy6Foo4y8UITNn8vGYHYclhSgFfHI6RM8WVB+PPtCSlPGM
	 SQQc50c1EGFyg==
Date: Fri, 21 Feb 2025 01:40:26 +0000
To: Chris Hall <netfilter@gmch.uk>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: NAT and ICMP
Message-ID: <5qXZ-gCtoc-Nzftexrd7inGHcMz4qtb6okI1P5NLG_PI5Q00-j585YCYbvypcqr8ZMVxTtTDRWhto4Wk3PqLmB0mWsZEOUgUwYC2weWv0g4=@protonmail.com>
In-Reply-To: <4hsquyHJcCy4nfOS75I-ZTDKSl8H5iO2rcJKyfAAuexJ7Kakp2TR4Z9UK0DYtTHmPmOLNKO7OKAFKw9X46HC9Y5Juh8NK-4A9zKnfjajs1s=@protonmail.com>
References: <79155174-f4f8-4368-8fde-cbab6b30091e@gmch.uk> <4hsquyHJcCy4nfOS75I-ZTDKSl8H5iO2rcJKyfAAuexJ7Kakp2TR4Z9UK0DYtTHmPmOLNKO7OKAFKw9X46HC9Y5Juh8NK-4A9zKnfjajs1s=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 2e8c94cd992d112b629698539f87aec6484d0911
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> You could browse the likes of VyOS source code...

I was mistaken regarding VyOS; it looks like it pulls your Debian configura=
tion across to the new system: therefore it isn't of much help in deciding =
on how to NAT.

If you're interested; you could purchase a subscription, or try their 'cont=
ributors get it free' program. The OS they provide might contain some bette=
r hints.

sunny
