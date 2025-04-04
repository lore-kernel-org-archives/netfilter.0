Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A62A1A3172
	for <netfilter@vger.kernel.org>; Fri,  4 Apr 2025 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779533; cv=none; b=iAEGQTsEpkW4+ONqsta1x/meYs2H3jYugpGkSyoZoeAW7xWMdSHTFN5ag83MbXn/GWZmVrm3csM0d+NYs2qDao8JfsDjl4CptPPyj9s4NAC35K4XR/SUqUHkdXeoka4ts0Pz4fEJoLGI+I8CB8prR/IBp8sh+vpPnT43/H4TTUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779533; c=relaxed/simple;
	bh=sIlpWO2Kg675VcexPXLQa9joR/OyUONzjq6mExW+5t0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SAEPrvJv8nLY0+7f/hjy3ZQpv9vAhIM14zmOFPFqNsQJtQXzNZwsBe9sPkcH8OqJTki3gHYxP5XIUvIwrxMxsY4Xs5dwpPytF0BtGmaBsOLFCO5d5yVFkUy4OyjmdX4f77SEbeGW9ZxIwx6WIfWGXsxlRXSaiV7sgCS/qGxMcls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=V1btHcDv; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="V1btHcDv"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZThsf0HYlz9sdJ
	for <netfilter@vger.kernel.org>; Fri,  4 Apr 2025 17:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743779526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=sIlpWO2Kg675VcexPXLQa9joR/OyUONzjq6mExW+5t0=;
	b=V1btHcDvA7vIMrwQ44bdj5fDkgzc4q+dBo1kkSIbqutkvKfDAAnikH/Pguz9WFblMqc5YW
	nZihiBJM+VMeSXT+2rlzTiLpmjXIQefHKDEmnnQUAccclVMLVg+oum0lTyzMaDu5OS62D9
	oWIfi0YTYw3vBqja2x3ivxBsmgu2xtpLY1blp/YCq+4ahlfurNi/nZgEv2E6WWip4d7vqN
	gW9fytghCcYBA34EZhldTsCsrUzNP+ylyoFQ4qaVG8/JJZUjf4rBvm081vs7WmzWAqIcsx
	v0HxPC57HqO4bTELlWkQsQ13PCnAQeZdUZelSfpgEylcpRCx9CZufo3lwcIN2w==
Date: Fri, 4 Apr 2025 17:12:03 +0200
From: Anthony Ruhier <aruhier@mailbox.org>
To: netfilter@vger.kernel.org
Subject: Replace flow offload by flow add in wiki
Message-ID: <yw2rcklool64bepdn3kue7yj7xryymdmhjoe72hqujj4xaads4@yzo7qkb452oc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MBO-RS-ID: 8da1c2a6b3c579a8244
X-MBO-RS-META: be7arc4ze7k6otj65njxewao973x8rdp

Hi,
I was setting up flowtables offloading in my nftables rules, and I got confused
by the wiki page.

In https://wiki.nftables.org/wiki-nftables/index.php/Flowtables, the example
given to offload a flow is using the `flow offload` rule.

If I understood correctly, `flow offload` has been deprecated in favor of `flow
add`. Is it possible to replace any occurrence of `offload` with `add` please?

Also in this example, I got confused with the presence of the conntrack state
rule:

> tcp dport { 80, 443 } ct state established flow offload @f counter

From
https://thermalcircle.de/doku.php?id=blog:linux:flowtables_1_a_netfilter_nftables_fastpath,
checking that the state is established seems unnecessary, as `flow add` will
match only if the conntrack state is "confirmed". If it's correct, could it be
removed for clarity? And even better, add an explanation over when the rule
would be matched.

Thanks,
--
Anthony Ruhier
