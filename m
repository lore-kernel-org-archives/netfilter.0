Received: from mail.sdinet.de (hydra.sdinet.de [136.243.3.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F41155726
	for <netfilter@vger.kernel.org>; Wed, 20 Nov 2024 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.243.3.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732136568; cv=none; b=qmPLxyC8DeQKSp/0IEDCMGxlgIXnHdeNwcfYWkMtl548qXBIfirYgMWVs4opFyFqjngrYWV5JNENTUZKGQIcVO42PashSoiKoggZQ/7yQNEgu0jOggBhNvrqNJg+1DDrDLeHsHXZLL6ZOyNJnG48prEOmYpOLlHFTNFqg0DFy0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732136568; c=relaxed/simple;
	bh=TD9U+QjoweNHA1XYYuSZWbi/GTHh77m6WWBTTBx55zw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z2RlELwWC6MJHqSB07PBbxmtSFNR/9kzaTxLnqyNhNx5ebqtqv5oz8xCZVDVRWzxsJvQzhSBakJm37iPhjSteD/1ueM5Q85Mkp7QfO5YY7c0iqa5NVDfK2IwugATe3Bfxgo0fLzgtsTqCX0MwNKVA8I6fYvBqbJwLcoEK83BO4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sdinet.de; spf=pass smtp.mailfrom=sdinet.de; dkim=pass (4096-bit key) header.d=sdinet.de header.i=@sdinet.de header.b=SIDJaOnL; arc=none smtp.client-ip=136.243.3.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sdinet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdinet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=sdinet.de header.i=@sdinet.de header.b="SIDJaOnL"
Received: from aurora64.sdinet.de (aurora64.sdinet.de [193.103.159.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: haegar)
	by mail.sdinet.de (bofa-smtpd) with ESMTPSA id 37DF0340085;
	Wed, 20 Nov 2024 21:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdinet.de; s=mail2024;
	t=1732135994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kGCnIIsprwW3B0vQepCAfcll8+w7As3BfYjogfomqhc=;
	b=SIDJaOnLLSeFfxQfKu2q5G5zX78xYGo9BzP02yTRV/6l29+iLb7bbvnU86wAyeH3Ts11yp
	kPoicMIK5qeei+OxFUzY3mF8zMcTmUw+hNsHoJY/4VsdcRpwpzaRHccziNY8RlZogv/M1A
	I2BqlZMr6zstY04yHQIlgTNFsoIPfGMFx/ZpfrOtv2bCjcvguFrgc0d+D2ujDcpuzElAO/
	ouxpMLrq73uhTUWHK1ShFZ1n2Yl9tRhKI0sf1U9QXh6qa40HNup20Op/M6xGomXZY6TEO8
	TpX6onqph3NNAmFqRNKL68Csdt6RiLdFdmKpz8Mw5XJCZOIJdhk/Rj7D32gG0fzKLoXiOq
	O/i+HYaMPFhuYjaHxJYOvviT/c7mEMyS9f66Qt+Gxgk6bBtPp0cS4zN7zVOGjUrt9Zb0ia
	BYEQ6tsleE+OIhYsMVCXbtUmLG9dW6Nh6GAkVhhfyUnOpzk6NeEFbSJBMfHxIl8Kp40AzK
	H/Fccz+TL1E8Suqqzqt93S6flN0tOBl7e/GouGUCMAqGEx8JmdylOjCmSSSAYu6/88t4LC
	87i1RTIVX0jj8GSPJHfUMccnCm6JjItk+R0tdiN2XlHXj6hM+Hopwjht2u+NqK0ytAM4HB
	tQCQviPdUvss+nszE2JTpXC68hfVH6g35g6nRvkg7R8Rt+Ww7GhZ8=
Date: Wed, 20 Nov 2024 21:52:44 +0100 (CET)
From: Sven-Haegar Koch <haegar@sdinet.de>
To: Marco Moock <mm@dorfdsl.de>
cc: netfilter@vger.kernel.org
Subject: Re: logging to a different place than kernel ring buffer
In-Reply-To: <20241120210636.6df71d81@ryz.dorfdsl.de>
Message-ID: <e0c6b559-4e8c-ae0b-de3d-ede0d92607fb@sdinet.de>
References: <20241120210636.6df71d81@ryz.dorfdsl.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Nov 2024, Marco Moock wrote:

> I want to log denied traffic, but to syslog or a file rather than the
> kernel ring buffer because that messes up the virtual consoles.
> 
> What is a good way to achieve that?

Ulogd2

https://www.netfilter.org/projects/ulogd/

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
