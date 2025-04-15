Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716C119F133
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748684; cv=none; b=eL5eal2cmF131bMwY4ciPA23zIWVBHWdpntcKIbriOLQR6/oWVtlj3vQiioFmit8Pa8/gOXaA6uwDYaMqWwdkCq+5X7EVicjGzpZJkIyU3F6F4baVI+yiLmFy6HNOIoVLFLz2wy39d2ReRcMBYMKDECI9Gwgck7RzvakpQWaR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748684; c=relaxed/simple;
	bh=VLVWZHBkMYuab44P7gvnnuN2EMtWK8DWdVBBV39Qjhs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uUYF9Jj04D0Hp+y8rWfGNNV7dPxcXW8CraR9c8QZv0qucaxaDHISXWgQc6TTEtKIpTShmE3TsQqQ+XGBhgqg3XOrprRNBqIFQu554SDR6e8qkNuKhNnuUaPYUlpnlslVgqxyQp1hU1te/nNSUxk1ZrIqgGtdsZbFYycnauZlE5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=QO7MBeeh; arc=none smtp.client-ip=109.224.244.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="QO7MBeeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744748674; x=1745007874;
	bh=VLVWZHBkMYuab44P7gvnnuN2EMtWK8DWdVBBV39Qjhs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QO7MBeehdgjWz8Qk/ExtvJwQdZe3wtLLbs3DESS8uD57PkRN354pb2g0Bc0Mh6+TO
	 FFLRy8eAIK72OvjVnPFjJxX1BQAvaNMHMSecSGm2rmuks8fsyNTcY7ND/p9pvsBgD0
	 fY39z6H0t/l9Z5GBCgcrG5ZQkCIurpZ57VQ4aYjdzFYjbrMNLA/Nz3BeHR3FiUsHji
	 QTxT+s928aV7Dotuw1scXAgGNhFczp0Ds9VnUIAGX2z+iU3La1QUac7quzye9pwqEm
	 elpLkOX0/ulIi+0F4iyCbE1DNlOWQkY5G8PM3QqOqRFpdrmxY56eiRbsvjW3bhfMyT
	 JZtVS7krGhZYg==
Date: Tue, 15 Apr 2025 20:24:31 +0000
To: Chen Linxuan <chenlinxuan@uniontech.com>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: How to Achieve Functionality Equivalent to iptables -m owner --socket-exist in nft?
Message-ID: <9bsxFpl1jZK-Q-1fvltsQ9TIJQbKJLLZ2BOKaF1HF8AAaaczi4Nazmyc_joMqUNu_Gbnii28h2OAIrFKNJyfOXU-C6si-ocGfhl9nabaQrM=@protonmail.com>
In-Reply-To: <CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com>
References: <CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 101b2adeea43de1c287186c26bc0af5a6d6a06de
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> iptables -m owner --socket-exist

You may be looking for 'meta skuid'; you'll need the user ID that 'owns' a =
'service'. You can `cat /etc/passwd` to find this information. 'meta skuid'=
 will match a packet that is destined to or sourced from a socket that is o=
wned by the user id that you specify.

Try `su -l [username] -c "[executable path]"` to run a program as another u=
ser; if it does not do so already.

Regards,
sunny
