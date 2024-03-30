Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B96748E
	for <netfilter@vger.kernel.org>; Sat, 30 Mar 2024 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711827726; cv=none; b=SHbRTd1nRElMK2qoTkYgXFYYIsk04iEyB6wD1ZiqsYAuaESyy+D6vkLbzzDG5KPJePY9ATYCjxeyxS08M+9mhEfDH9W4/6DlC9TAMY+llp7oV/lXtuEWqGzFcJYGVlfT51RealgwmVhB3JI6sJaR4vtUWCcS4sAQhVVp8MqKBAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711827726; c=relaxed/simple;
	bh=pY9jydOgtE/jlcRqPEGG1VIXS6zZy+jVw3R9H31zt6g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=N23bJp06YwUpgs3GNNzCD1ujTstP6GnRZdkLkOOxMQIrdLL7W0a4p3lvrYckinjAis19NlmvCBSwlOieZkYUXc57cZb3Nxi43GMzELOI6a7NxC5BX2zOSpeXCHni4+yP/yklBxrumFxCoGreuFLAeDYX4RKirQ3RKY+f2TZ18jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=KXvHgf0D; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="KXvHgf0D"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4V6SMw4hkCzDqCF
	for <netfilter@vger.kernel.org>; Sat, 30 Mar 2024 19:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1711827724; bh=pY9jydOgtE/jlcRqPEGG1VIXS6zZy+jVw3R9H31zt6g=;
	h=Date:From:To:Subject:Reply-To:From;
	b=KXvHgf0D02jZXQ99mPCn6ZYZ8aj5CASFE6XlVEDKtyIHZ+Z6Q2DJ3R1gG4z3ij/s8
	 tFOenoTRc/H0bmDxQynv1m0X42f0AADVKvnDZWfwcHyFavn5a78muEBztWkbQCf3I4
	 Fv3oG9Ypw6FZOGrKrV3vpyf4k33/lKEVLI1mFdbg=
X-Riseup-User-ID: CD4012E1F18E9B95D61C362D38C61C8A03FC2128D9A250E60CE7D4974491E98E
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4V6SMh2PlzzFtNc
	for <netfilter@vger.kernel.org>; Sat, 30 Mar 2024 19:41:51 +0000 (UTC)
Date: Sat, 30 Mar 2024 19:41:39 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: nftables: How to match ICMPv6 subtype in a rule?
Message-ID: <20240330194139.561b5a24@localhost>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I have been reading RFC 4890 and 4443, as well as nftables wiki and man
page.

It is obvious how to match ICMPv6 types using 'icmpv6 type'. However,
as RFC 4890 recommends, there are situations where only a specific
SUBtype must be accepted, e.g. section 4.3.1:

   o  Time Exceeded (Type 3) - Code 0 only
   o  Parameter Problem (Type 4) - Codes 1 and 2 only

I have been searching for days and I can't find any info about matching
ICMPv6 subtypes. ip6tables can do that (as shown in the example in the
RFC) but no info about nftables. ip6tables-translate cannot translate
subtype rules (it converts them to a comment).

So, what is the nftables syntax to accept only a specific subtype of an
ICMPv6 type?



FWIW, I am on Debian 12:

# nft -V
nftables v1.0.6 (Lester Gooch #5)
  cli:          editline
  json:         yes
  minigmp:      no
  libxtables:   yes
