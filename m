Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD58160B96
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712064283; cv=none; b=blc34rq4oJloXgC8GDk/zXZn7oKbBjBw1z+JvDSu1VnHs3zcKY0OYkmUwjOYTXHkwwoPUHoQuOXBWABqLvJu1X4Ng3npg/sfSIGL3NZLkGXznQ1JaCY3uQomVWDyQChwUs873Bq/uSLaMDglkZzDwM+jLvDh2P6yesRoDS96oiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712064283; c=relaxed/simple;
	bh=U/zbVoYB0Bj4a8xq2qORn7qev/keb0FQnkBC4kT4WKI=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TaD+/g6IkAJUaq0pE+yGkGuOD+cfBVV5fHO1D8g/WNzWqF75y8zPi/4URckdkRUWKhPaJ8S4m9EoBxZaBbeTzV7dOGN1psQsh7Xc5Dgs0uabD2JC5iYUtCailGU/YN7j5dsPXp0hke8cSSYl5HcdVIzE+uYowyIy1VDm2FleoCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=MIg+E2bI; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="MIg+E2bI"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4V87s46YVpz9vQN
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712064281; bh=U/zbVoYB0Bj4a8xq2qORn7qev/keb0FQnkBC4kT4WKI=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=MIg+E2bIx44rpW58pUCC4YUvwNXVgCpkWAwNwXYZw1q+slDWo05C7SruFmFrU2J+J
	 jU1dlPJn98Nyr+2K2MZOQ3RSBb6A4ZvjDpzqRb2s9RWVZTkNPAGPv9q3KOw2VcLGSJ
	 hsTBNxyhXY8KXXLsTJObryIBdPtDeIPqka3QLDJw=
X-Riseup-User-ID: B65AB64EFF8DC3627BE0E574E2C96329047E395FCF19676BBE19EE263FE0D619
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4V87s352W3zFtb8
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 13:24:39 +0000 (UTC)
Date: Tue, 2 Apr 2024 13:24:32 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables: How to match ICMPv6 subtype in a rule?
Message-ID: <20240402132432.0a620091@localhost>
In-Reply-To: <ZgvYnXicTY7FQi7E@calendula>
References: <20240330194139.561b5a24@localhost>
	<f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
	<20240331170259.068a0db3@localhost>
	<20240331193407.3e40cb6ed1c4b6e9fb038c1b@plushkava.net>
	<Zgs8XGAVd7R_TKh9@calendula>
	<20240402072948.2193d20c@localhost>
	<ZgvYnXicTY7FQi7E@calendula>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Apr 2024 12:06:21 +0200 Pablo Neira Ayuso wrote:

> What iptables version are you using?

# iptables -V
iptables v1.8.9 (nf_tables)

> $ ip6tables-translate -I INPUT -m icmpv6 --icmpv6-type
> destination-unreachable nft 'insert rule ip6 filter INPUT icmpv6 type destination-unreachable counter'

What you show works for me too, but e.g. this does not:

# ip6tables-translate -I INPUT -m icmpv6 --icmpv6-type ttl-zero-during-transit
nft # -I INPUT -m icmpv6 --icmpv6-type ttl-zero-during-transit

If you replace 'ip6tables' with 'ip6tables-translate' in the RFC
example and run the whole script you will see the rest which don't
translate.

> What bug?

For example, in section "TIME EXCEEDED ERROR MESSAGES", right after the
comment saying:

# Allow incoming time exceeded code 0 messages                          
# only for existing sessions

the actual rules handle 'packet-too-big' (type 2), not 'time-exceeded'
(type 3) with code 0, as recommended in section 4.3.1 and as it claims.
The 'else' condition right after it does not do what it should either.
As a result, type 3 (which is in the "must" section 4.3.1) seems not
handled anywhere.

There is also some meaningless code, e.g. the loop around the
'bad-header'. Etc.
