Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77AA224B1A
	for <netfilter@vger.kernel.org>; Wed, 16 Apr 2025 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833421; cv=none; b=sVP8mYjX2s1wk7/pUClWhvF5z4+Y9wcJkp11unhBgGpawsLrLDrGZufD71yDG0EQxihRfUZzlUpXP//BgSqtmNRauLbKT0Gc40Xo46eIbWWCakKtKxMdbgbnaOcPTbyZIm4IObMcGsFTJfh0VSwLlzyNHgnkvfYrXVh4wHal6KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833421; c=relaxed/simple;
	bh=AMysd/6vbBI/9BasD1gP2jUm27cltdyMwq1aEJG/ZRY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gw1OcqWaxm4JsqoHnPV2+xa3FbQr05Ii8HgCLf3sjZlSpQjOY8sEfp0D++c3/sRmEdgS0n6Kljr1SSmzy1VrKfUjZq4vch5zWn8esEz7rDxbteBs270PA8XYC/8wKslkdHJ4M+cDOtCsm4mpq8YiSiwZ9XaubRSPVIdjhsbysjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=By/cV7Pa; arc=none smtp.client-ip=79.135.106.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="By/cV7Pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744833417; x=1745092617;
	bh=AMysd/6vbBI/9BasD1gP2jUm27cltdyMwq1aEJG/ZRY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=By/cV7PaefRPFvkTqtwBifiuDxi0s27L12Fz37DFKi4IAbccHbAo4Z1yUlaWQ+39s
	 Gx2A/PvMCsqtkXE4ObxmJ1JQzhXBJft+XGblOf3vsuOKaypz6rL/6ePx5TcKk8hJmJ
	 IGbSabSWw1JOI7u9WRcrgThHDkhFkm7rcjxr1lRmg3s97IDPyjdsUoNU6S9shiGIYe
	 NO33UNBLNdm90QqhJPUgBUkONfLaOxmT8EGNO5q/IMf2iA2B0WClZsYHNbFtz5JVZ9
	 KHjDp8NhbT0su3wm6wIMj9bNrg/iEWlLnbx+bvrTdHXq/oZn2bB0tBM50OARF76vM7
	 p5Sg5de7JDynQ==
Date: Wed, 16 Apr 2025 19:56:52 +0000
To: Chen Linxuan <chenlinxuan@uniontech.com>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: How to Achieve Functionality Equivalent to iptables -m owner --socket-exist in nft?
Message-ID: <weuaFW4cJd3LV86Dm_XEPqzgsdQlndvgmC3sLnNg4KEH6kM_9IuaVzS3EItenqX_y5N0Ke8Q-eVuv8_oQUYikrH1u9XUyF3ZUploTxzY7OI=@protonmail.com>
In-Reply-To: <CAC1kPDPkQXWENzPeCRjmNO1cOFOD90RzPSCEPq-0cNQnfrPx+g@mail.gmail.com>
References: <CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com> <9bsxFpl1jZK-Q-1fvltsQ9TIJQbKJLLZ2BOKaF1HF8AAaaczi4Nazmyc_joMqUNu_Gbnii28h2OAIrFKNJyfOXU-C6si-ocGfhl9nabaQrM=@protonmail.com> <CAC1kPDPkQXWENzPeCRjmNO1cOFOD90RzPSCEPq-0cNQnfrPx+g@mail.gmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 0eeabe04c6c36e71d7201cd16432af038c85176f
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> --socket-exists
> I just want to check is there a local socket associated with the packet o=
r not.

Apologies; I have misunderstood what this flag does.
You could try:
`iptables -A FORWARD mark -j MARK --set-mark $FWD_TAG`
`iptables -A OUTPUT -m connmark --mark ! $FWD_TAG -j LOG --log-prefix OWN_S=
K`

Regards,
sunny
