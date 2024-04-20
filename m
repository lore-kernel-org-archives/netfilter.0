Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1BF9DF
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713602932; cv=none; b=T7WlMS+Q5BUHNhjW6hM2xyigVxprMRRVmmMG09Hpecs6ea/Knh1R/ixnm98hDWLQu6rKxZhv3pVA3cW6k1gzPPMAAHKl1yB8aS7Q+8LYdujLbGBxFvUMO47POGN39d3XgtKJmkvDaFtycI2AsCCnwHjn1i38efBBRtSCEr0eVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713602932; c=relaxed/simple;
	bh=Oxzlavgw6x2WjcDEyidI4zeugHY9PfG/zNie3+EKKRI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=cqrqSE4PntojbjkLqusKZcxrFkw50FBgAzLMGih83BCkq+QXWwygHReoYPSLTp/w0ZVyLuWAAuhZGuGVQW291FnV0dch7XKh8Mx1YkJnPsIW7NDgKw/U6J6jHCm9FGXPg4isGefHzCtLOrZubLNPisqGBc8X9+VSG8rT8+CbNrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=D9s5OfMY; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="D9s5OfMY"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VM4tT5KGqz9vkQ
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713602929; bh=Oxzlavgw6x2WjcDEyidI4zeugHY9PfG/zNie3+EKKRI=;
	h=Date:From:To:Subject:Reply-To:From;
	b=D9s5OfMYTO8dtvuMw0fRUrEbjLC1nQx+zLs8WWQ23wMdkPZBqc9NtMJDf5AMKdz6l
	 WBqfTuCLus4Vx3Mrlm0L4uHu2guZijQw6wcXmJQGvhuNmY99vIGW4WRFLVq9Znb43X
	 94NPA3C7QYVdv8LgrZJTHijB4gyeJH40+/6xUMNs=
X-Riseup-User-ID: 06AD7F0CA89150ABBCCD383BB162169E5CABBFC0B450075EBF19EF1B161A5291
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VM4tF0jlczFrsK
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 08:48:35 +0000 (UTC)
Date: Sat, 20 Apr 2024 08:48:02 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: [Thread split] nftables rule optimization - dropping invalid in
 ingress?
Message-ID: <20240420084802.6ff973cf@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

As per advice by Kerin Millar, this is a continuation of another
discussion [1] which resulted in a different topic.

On Sat, 20 Apr 2024 03:36:00 +0100 Kerin Millar wrote:

> To begin with, I would recommend that you jettison these rules
> outright. It is probable that they would otherwise end up being
> useless. But why? [...]

Actually, I have read about all this in older posts here. I should have
probably clarified better the forest, not just the trees.

The rules I mention (along with a few others) were inspired by a few
sources - some using iptables (where INVALID may be different in its
code definition from nftables and thus need such rules). That said, I
have actually tested and am aware that e.g. Xmas is an invalid TCP
packet that will be dropped by conntrack anyway. Similarly, the others
too.

However, in the setup I am trying to implement, I am attempting to be
"clever" and optimize things by dropping bad traffic earlier, so I am
doing it in the ingress hook where, AFAICS, conntrack is not available.
Why ingress? - Because I am following the general principle that
attacks should be stopped as soon and as far as possible, rather than
allowing them go further inside (in this case - next hooks). And even
though the next hook (prerouting) can drop e.g. Xmas of FINSYN as
invalid, I assume it would be a waste of CPU cycles to allow further
processing of such traffic. So, I thought: why not prevent the
unnecessary load on stateful conntrack? - Hence the whole idea to drop
early.

OTOH, adding more rules to ingress adds CPU cycles itself.

Which is more optimal - dropping early or not piling up extra rules in
ingress? Looking for an answer to that, I have done this:

As per earlier advise from you in a different context, I checked this:

# zgrep BPFILTER /proc/config.gz 
# CONFIG_BPFILTER is not set

If I am reading this correctly, it means there is no BPF JIT
optimization. Is this normal? Is BPF still experimental and for that
reason not available? I don't know, which is why I asked and still hope
for an answer:

https://marc.info/?l=netfilter&m=171345423924347&w=2

Why am I referring to BPF? - Because I suppose having it available
would make the difference between the "drop early" (in ingress) and
"drop as invalid" (in prerouting) cases negligible.

Now, the question comes down to: How big is the actual difference? Is
it negligible right now (without BPF)? - I really don't know. Hence
this other thread:

https://marc.info/?l=netfilter&m=171354240711565&w=2

Any info and advice is very welcome, as the whole thing discussed here
is very unclear to me.

--

[1] https://marc.info/?l=netfilter&m=171358042732609&w=2
