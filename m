Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8231FAA
	for <netfilter@vger.kernel.org>; Thu,  9 May 2024 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258573; cv=none; b=cD8DwR/yO0AjjrGtDtVei9KHrbc5JkPc8bPO9mv4UFjwy7XPOR/5XuKDjIkwPp2iWzouTn0E0q+5dm1aLxpxe3sfMfP7Af3neNtBHplUR9Bjuqe9Y/do0jDvZ8McBK5tcoToU4dMI0rR0rG4hXW39oPkBDrrbvjT2LG6W7ed+64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258573; c=relaxed/simple;
	bh=w4APhs0kgRjkDwm2FJrj9y2CkMBXp1izcEtrykflDRA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shIjAyst2veIwSvqHlplB5FkHh7uUTu2ONbiHbINCs22DRKNANQS/xiNfj7ilAfQR4/cEB6mrhCvezhReXBSSKVtfbFyrzRTSl8mH7lSzCM7e5Ki43OWNVg72eGuuA5LKUkaHujZz4EkVjn7gEay4hIPfCdUBzYbLzh0lVkq1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=qVkZ3jxW; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="qVkZ3jxW"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VZs9d2GcTz9wHQ
	for <netfilter@vger.kernel.org>; Thu,  9 May 2024 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1715258565; bh=w4APhs0kgRjkDwm2FJrj9y2CkMBXp1izcEtrykflDRA=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=qVkZ3jxWqKNS0sgZg9nORKNJ0yeLw/OB2vNpzsPnfU3VY2y0YbkaNtk30Lz+y8taW
	 BeEWKtPeWyxxTlYtFJA1dQSm7liVOVrNR42ZY0hkNwtcYfA7cGD/+L1/K+3yDpYyo5
	 kq4m89P2lDwHTH0t8VEdNwTWxqiL3en19F/AZ2Ag=
X-Riseup-User-ID: 7F18E5675ECA8D2CD4B912A5FED284C8CC226249F7895D53014C2613D359319D
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VZs9b5ZrPzFvRg
	for <netfilter@vger.kernel.org>; Thu,  9 May 2024 12:42:43 +0000 (UTC)
Date: Thu, 9 May 2024 12:42:30 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Sets nesting/reference? Complex concatenations in vmaps?
Message-ID: <20240509124230.6e5fdb9c@localhost>
In-Reply-To: <20240505192531.5e4ed8a8@localhost>
References: <20240505192531.5e4ed8a8@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Regarding vmaps, I found that this syntax works:

icmpv6 type . icmpv6 code . ip6 saddr . ip6 daddr . ct state vmap {
	1 . 1 . ::/0 . ::/0 . established : continue
}

However, just like with sets, this does not work:

icmpv6 type . icmpv6 code . ip6 saddr . ip6 daddr . ct state vmap {
	1 . 1 . ::/0 . @ONE . established : continue
}

Is there really no way to refer to a set from within a concatenation/map?


