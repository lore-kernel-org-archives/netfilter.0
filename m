Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EA3205E21
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 18:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713638297; cv=none; b=m8umrq4MBphtnsrptdX95MCkpDqD22nb+o67fD+8PFhWMed9XmvcR40JTum018BozX3hxf+XdDr9ZCGNkMHhZK13kolpyGpxsPjm1Rn0NIgNHm4QEIcgcMiaNiWKwgEHScL5mhODT5DTuCFj3KvbocV6FHJMnCbNisWFjiVDsDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713638297; c=relaxed/simple;
	bh=k4LPG86mkxjOS/qKm385tgW8XxEZc+Vha2kH6Txm4iM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWf7qvGgDa9mQvHXnW+sMNFA8QCTr79u0J4MFeu2JyZoCOyk1e0Ez+njHJTlRsDokAwhirAkURqz1FiWvLawfiVZvWD5FjZrnHFs7ExxhmfkVkKz88DeKpd989osA2GF9iFvlLaPKdfm7oz2zz/w9GPP7po8nJ3gLWMyGj+lL0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ItTqxQ/D; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ItTqxQ/D"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VMKyT4d90z9vqS
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713638289; bh=k4LPG86mkxjOS/qKm385tgW8XxEZc+Vha2kH6Txm4iM=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=ItTqxQ/D96yTwDxu48cJpdYNm+BLez3KuwzQUvjY5+Dz7VkluyLLCHQ29r7zb+fGd
	 OvrHzObgX27R9sVk5eXWAw4a0CNtehm0c8klZS4tJf3wATNU/UBS6PerVF2mp9GRVz
	 VttvpeHW8ceX6YILZM7GJUuL4r6mSP6t1dh4i7/s=
X-Riseup-User-ID: 00D5BD79FF5EEC934D6B68BA7D180AB823F80E1CAF692CB52562F36487ED578A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VMKyR1yJvzFv6f
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 18:38:06 +0000 (UTC)
Date: Sat, 20 Apr 2024 18:37:50 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: [Thread split] nftables rule optimization - dropping invalid in
 ingress?
Message-ID: <20240420183750.332ffbad@localhost>
In-Reply-To: <20240420084802.6ff973cf@localhost>
References: <20240420084802.6ff973cf@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

After spending some time looking for more info and based on this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_conntrack_proto_tcp.c?h=v5.8#n700

I think I figured it out:

tcp flags & (fin|syn|rst|ack|urg) != {
		syn,
		syn|urg,
		syn|ack,
		rst,
		rst|ack,
		fin|ack,
		fin|ack|urg,
		ack,
		ack|urg
	} drop comment "TCP invalid"

This checks the listed values against the mask "fin|syn|rst|ack|urg".
The same values and mask are used in the conntrack code, i.e. it drops
invalid TCP packets.

According to my own tests, this works in the ingress hook, i.e. early
drop.

The only question that remains is performance measurement and
comparison, as mentioned.

Please let me know what you think.
