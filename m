Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBCA111A1
	for <netfilter@vger.kernel.org>; Sat,  1 Jun 2024 18:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717266096; cv=none; b=ciF9HXg9+suEVPJW4GLd6LHbvjt1j2x86vZdO+xxdnLeomK5lRFYmqWJOd/UE3swwbyb04gztm6wspsk/nNILu/QAU1hu+EMNyOBWeEp+4GLC0iZRo6QZ/Kzh7QQqjFwmiRGnaLPhWPYixmLMKWp0wW3kTEK+GAlnHIdyGlNiHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717266096; c=relaxed/simple;
	bh=N16tSOVx7LKWPoL362gK1KLevpIXAsr0Ok49Qmy2MVo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=EzdDvjhRCUpYM61LyZ4uBf0Jmezl++XSWMLoK/LoNwLc8OLrG6eXmIQIj8CdBKXXZ+5T2KbPB0GEv5T5wreCIAAJ4ovJWo1Vm/BX6hY2h/V6xt9M+G2M0RXOO1vgK1t5Yp3w3CaMTi/TxWRi2MjJqgXOpRZZ5P2YnFMWxDqrXwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=qcwgRZjt; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="qcwgRZjt"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4Vs7br1RgQz9vFx
	for <netfilter@vger.kernel.org>; Sat,  1 Jun 2024 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1717266088; bh=N16tSOVx7LKWPoL362gK1KLevpIXAsr0Ok49Qmy2MVo=;
	h=Date:From:To:Subject:Reply-To:From;
	b=qcwgRZjtT4FkODCz7dOqba1TtG1JtoEzkUoAAnHgG+a/xpwpeYz+2Q9M1zDWdE4dh
	 GZSP7Ulk6/lCleXnlGJv3vIjzPKBRi2lvfSwtOq5w3rS+BQcmjZGr0Hym9NWD72nhp
	 VxR+LPz/aS/ntsUaP5p6mcjS425B8wAMY7dbEML0=
X-Riseup-User-ID: 7B944951100101E33337497FCE06F1F55A73564F9C26EEDAEB44BAB0282798A8
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Vs7bX4BFwzFvQm
	for <netfilter@vger.kernel.org>; Sat,  1 Jun 2024 18:21:10 +0000 (UTC)
Date: Sat, 1 Jun 2024 18:20:56 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: nftables rule where IPv6 source and destination addr are the same?
Message-ID: <20240601182056.6bd57a96@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I am looking for a way to create a rule triggered when the saddr and
the daddr are link-local the same, e.g.

ip6 saddr fe80::/10 == ip6 daddr fe80::/10 accept

What is the way to do this?

XY: https://www.rfc-editor.org/rfc/rfc4861#section-4.5
