Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB5246768
	for <netfilter@vger.kernel.org>; Mon, 12 May 2025 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068253; cv=none; b=cyzjPBzn72bgqNettW9Uti7bgb9GA+ZlDo9j3A3inGuIlN6k16rp9c9Cn6thEw6dEjwjyBP88fWOjWYocaP+s/b44iqTw41zJgM1P9SRGPSEzwJftJyNktATS6LHUwsDck3yvRgRWTO/Se3jOone+WREXj20QmBMAbPtzEyLmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068253; c=relaxed/simple;
	bh=EdR4rVAuk2wMy7P0U5fMc6t6VpvJiNKVLAlFoeHyB9k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=JIg2zmfKmBrlJpQZ0JcZx5nLk9nmFe6l5FYgsvzoqdWvf5/BiVefxK/twQ7iQZ5JJ6KwFR1Wq2M/R2Qou3us7NRk9LjGJKl1nXjX34e6SD5rW2Q83FAF1ZKdQlS8Jq7+4CxSlun7vlYH0w4lLt8EYNnrwwvwe/zQKjI0kpXS+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=LAakMtDS; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=gBdpv0/h; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="LAakMtDS";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="gBdpv0/h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:From:
	Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:Message-Id;
	bh=EhW0hQ6NVQ0RbhLfs4ixRtcF10fGEM9CFlZirHG8kN8=; t=1747068248; x=1748277848; 
	b=LAakMtDSoq0WrO6RGMwRZHYUepO/hdukScXl41eojXwUYYz2t2Z3dRQZMCXW22AWe+sxy5IZ0pO
	O9ue5L1yrC/6LcSMP2RS950UMHX0yKFJZsGFYkDwAUQ0Wo698M23sWe/ZkdP+yJNqQmvMqEQmqFP5
	MPCRzXgPmwq6MTg608k=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From
	:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:
	Message-Id; bh=EhW0hQ6NVQ0RbhLfs4ixRtcF10fGEM9CFlZirHG8kN8=; t=1747068248;
	x=1748277848; b=gBdpv0/hwkPavBRAijeUXCNw6/+BU+KPmUmXA5O2Q0YMY8fN4BVmCHUs5lgbb
	UQg5qCKiMrCKMI/QooX+2jBAQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1uEW6S-001L3y-07
	for netfilter@vger.kernel.org;
	Mon, 12 May 2025 18:34:08 +0200
Date: Mon, 12 May 2025 16:34:03 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Repeated SYN+ACK count
Message-ID: <6ABC13EB-FB13-4FBD-9FB8-57D16CCD109C@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

more or less often i see SYN packets, which don't ACK nor RST
my SYN+ACKs, which then retries=2E My idea was to use something
as this in output hook:

    tcp flags syn,ack / syn,ack ct reply packets gt 1 counter

But the counter stays on zero=2E I tested it with hping and spoofed
IP and the tcpdump shows expected count of retries, when i check
conntrack output i see packets=3D1 in both directions, thus i guess
that ACK+SYN retries are not counted separately=2E Am i right?

Please, have i to touch some more settings or just to use another
approach? In iptables i use some connmark magic for that, which i
want to avoid=2E=2E=2E

regards

--=20
Slavko
https://www=2Eslavino=2Esk/
