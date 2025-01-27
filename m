Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5BF13C809
	for <netfilter@vger.kernel.org>; Mon, 27 Jan 2025 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738009899; cv=none; b=XMBKuWK6ja7gKy8ILTB0bVucAx43FS8ZQGQuJCTFm/QnRMhYXDUql8gJR0u9VQC7YI6Ybb2xCfPdgjr/KRNnwNahArw8h2zP3NuQi26Es2hAXceYh1zU9YCF/nDVHO4uhJPjIW+o2FX3gkjerlP9/ASZ5/cz0ZVMfE9twJeC8oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738009899; c=relaxed/simple;
	bh=YwVSe/YT6G0rYZORCOkvNwZ+Z5jErAIeWZRIabntgOI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J5tgZpPJCboH5JgoZPiD1xQ0h9Y66RnlnVwDS/wqIhoE7+DxcFAXJLvQcshJZtMqNmndPjfixw8tVylBsWdWObvNLjxX7JRqWPB2ni2zyXbX2Gq26EZTvp2VSt91BWABaMjov5lNeRX21tGAHSEhV48aq/CLCqH+zPQCdbQThkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=KUWqItOg; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="KUWqItOg"
Received: by shakotay.alphanet.ch (Postfix, from userid 1000)
	id 68BA612418A2; Mon, 27 Jan 2025 21:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1738009887; bh=YwVSe/YT6G0rYZORCOkvNwZ+Z5jErAIeWZRIabntgOI=;
	h=Date:From:To:Subject:From;
	b=KUWqItOgVSuVLIrsvIWdHG7AimrHdkwxGl//cORDTkI0PIiK1At6m2in+Xa6JtEhr
	 eGtoeUfmFp4Zkd5U7UNNVpLX5dNGE6Yj7Hi5ax8/ougHuFC+E5mNjFSkqAsNvRHPgv
	 vxhVwaZ7axsG0js4bOVLvVzTO2ar32O8xt+pXZ7BUarQqKl5giT48beMIHbeH3N2yA
	 uFE6Ik6yKGZuxJdiPPWLtr5rNxahXYL4mFRNJtsDRqLLbNUbSMFzW2kqdbabKQSsZx
	 +REfJLhpYjJFoaUiJAA/UoRkHj8M+3Lb68L4Vjcl89mCd44iWdKF+dZ0CSCOHZhRSI
	 oER3u7KAAikew==
Date: Mon, 27 Jan 2025 21:31:27 +0100
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: netfilter@vger.kernel.org
Subject: SNAT vs ip rule
Message-ID: <Z5ftHy+Xj99BdvbV@alphanet.ch>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Assume a firewall with three network interfaces:

   - enp2s0.300: 193.72.186.130
   - enp2s0.400: 46.140.72.218
   - enp2s0.202: 192.168.202.2

The default route goes through enp2s0.400, however there is another
routing table with default route through enp2s0.300 (table 193).

There is an ip rule from 193.72.186.128/26 with works correctly
directly on the firewall

    ping -I 46.140.72.218 8.8.8.8 # goes to enp2s0.400
    ping -I 193.72.186.130 8.8.8.8 # goes to enp2s0.300

Now, assume a machine 192.168.202.10, on enp2s0.202, with default route
192.168.202.2.

What I want to do:

192.168.202.10% ping 8.8.8.8

   192.168.202.10 gets rewritten with SNAT to 192.72.186.130

   as from 193.72.186.130, ip rule selects default route via enp2s0.300

It does not seem to work: ip rule is ignored, the SNAT works, but the
datagram src=193.72.186.130 is sent on the default route enp2s0.400,
not enp2s0.300.

So, maybe the ip rule is invoked before SNAT?

With iptables, the only solution that worked was using CONNTRACK, mark
and save/restore and an ip rule on the mark.

Is that also the case with nftables?

Thank you.
