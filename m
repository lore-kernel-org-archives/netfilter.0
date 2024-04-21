Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8841CAA1
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 17:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713721814; cv=none; b=f5hrIT+KdpOsO/HHl8KWQzPN9Byv0hevGSt7KzSnchqNB7VVJBw/rvzmWkIFae9XNn47BH/m81EgxhbxyaO5ZFE/kf/XUQw4Va6fnxUWMxCVS9pLtegB8Drqq2V1PMVB2QYrrQ+9Rd8JcOiN+diYjDD7jOQ0A8VqBmYDQsd5RAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713721814; c=relaxed/simple;
	bh=Uvit9jlDd/caSyTjezID8W8znscoye8/6qwXImIa+bU=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZovWY8THAqj9ML0VXOYr6y9rNghIftaV4dSHDho5JeuX6lqzx/QFz+igVWFYsWKD2vwh6kl+7epMUd9YMtywbCVpGU0dE6bM/5uU60I7Dd3QoN3xJrXzKoYWB+8GmqZ+LyqOEMYZpubLDBPLQXzmdpSNx3ZqNIsQIUKObKvjS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=BClaJZUB; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="BClaJZUB"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VMwrh54Bnz9tJ3
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 17:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713721812; bh=Uvit9jlDd/caSyTjezID8W8znscoye8/6qwXImIa+bU=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=BClaJZUBsIh1Md7x/8ai/7PqeZxrenDzyti/ncbebV2pcIKNkA3OhMI5l2B72peuN
	 aVqGiaM30ujqN8pw4MLatPsJXSL6/vyiIiip9n4QXLmSlB0v7nZkZ7Ss0vIMEmSY0R
	 x6ZhtPapjbOl2XuAnVvwegQR2E46xolGoDC6KVt0=
X-Riseup-User-ID: 0EFAB45BB1E5A17D2386AC771E61CCF085741B67ADF1DD8E4769AAE01E02E8BB
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VMwrd6Pn6zFt7t
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 17:50:08 +0000 (UTC)
Date: Sun, 21 Apr 2024 17:50:00 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: [Thread split] nftables rule optimization - dropping invalid in
 ingress?
Message-ID: <20240421175000.5fa666d7@localhost>
In-Reply-To: <rNVqfcHpj4XyJlxISjkKDdyRHbyPqlyF8MOHq07xz1_V3vc99maPQTsAuxgA2PZNbvff2dUfl2s0YdJBI4muw8A7FiMeKu2KvnjK0fG7kYo=@proton.me>
References: <20240420084802.6ff973cf@localhost>
 <20240420183750.332ffbad@localhost>
 <rNVqfcHpj4XyJlxISjkKDdyRHbyPqlyF8MOHq07xz1_V3vc99maPQTsAuxgA2PZNbvff2dUfl2s0YdJBI4muw8A7FiMeKu2KvnjK0fG7kYo=@proton.me>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 21 Apr 2024 03:45:31 +0000 Eric wrote:

> I'd be very interested in seeing some statistics on how many actual
> invalid packets you see on a live link.  Stick some counters in there
> and collect dropped versus passed packets...

This particular system is a desktop one (rebooted often), so that kind
of stats won't make any sense.

> My naive guess would be there are only tiny percentage of rejected
> packets.

Without a particular attack - quite possible. However, it is always
good to learn what is better/worse/futile.
