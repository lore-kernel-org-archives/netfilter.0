Received: from mail.muppetz.com (mail.muppetz.com [142.93.19.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BC321A02
	for <netfilter@vger.kernel.org>; Tue, 21 May 2024 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.93.19.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716287286; cv=none; b=Od6Ftn2jgRRaFpTJHH+LXKCG2wgcSI/9c68JJskutyEphXv2UMbBUoqzC1RIEXrxC3SVFCifAxhJ1duT2YSUQ8t9IqK51pLipTrn8QTgCoj/AJ6aroYWQZu88hEt3sVYJ81jR9qwc9IFBlTN+fqvRWlTwojSvhq3uEdzC1WfTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716287286; c=relaxed/simple;
	bh=+s/2l6wVtV+uT04HOZiU/Jq8HogpXFckmNwWEDIbHpg=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=SG+AQKMvBeSLMLuzA1YpbcjCPMUsifmp0UPM83j63EL25hMJAmC5wvWg4CxXleevIr3qXKwThU/UjX4RjOGebmZAfqeqt8goX18tyJylUKlcsJMNJ7pO9E8HQtvbmOjpyFEsFsoe/7VRcclSUS0pGMU4ZRR6/x4jL8wD9vT0a0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=muppetz.com; spf=pass smtp.mailfrom=muppetz.com; dkim=pass (2048-bit key) header.d=muppetz.com header.i=@muppetz.com header.b=PDWCthxb; arc=none smtp.client-ip=142.93.19.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=muppetz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=muppetz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=muppetz.com header.i=@muppetz.com header.b="PDWCthxb"
Received: from mail.muppetz.com (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: tim)
	by mail.muppetz.com (Postfix) with ESMTPSA id 82EAD20785
	for <netfilter@vger.kernel.org>; Tue, 21 May 2024 22:28:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=muppetz.com; s=mail;
	t=1716287282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f74FLMKJdkuM4af/legDxmHbIfdllNP0fpKtGoOf10M=;
	b=PDWCthxbVn2rf6rjr+jyaNu+uQ6oK5tyuXG+7WJOxKiLs67QqhZ30P2NSy029H5oBxQGEO
	WmY0Rb3uOC3+cFhqmdqFtFYmGwTBy5jb51wOpWqXE7UzSfibn5hrDssY881A38pT806b0Y
	sItaJ4jOH5Y497Fu/f3bPF9ge29Qcv/ga3FyUwcYRTnoWNG+e4EY1vZh9re3WitZfVtVnW
	zPl50YEqzFuykyXKapzRu6lYbt2gOQcCL2yQ5xVUwt2ClsR2QOhUqcDzkZzDnL4lJHk6ir
	y3i+BGS9bR5oDGz77d3b52uVPxj5G8/K0oePoxSaN3+QwJJvDieFamRga0QClw==
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 21 May 2024 22:28:02 +1200
From: Tim Harman <tim@muppetz.com>
To: netfilter@vger.kernel.org
Subject: Clash Resolve Counter Increasing
Message-ID: <7550008a3fc0a6c745272eded7fa686f@muppetz.com>
X-Sender: tim@muppetz.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

How can I debug what's causing this ever increasing number of 
clash_resolve counters on my router?

user@host# sudo conntrack -S
cpu=0           found=11145 invalid=48749 insert=0 insert_failed=1691 
drop=1691 early_drop=0 error=1792 search_restart=0 clash_resolve=901502 
chaintoolong=0
cpu=1           found=10492 invalid=48616 insert=0 insert_failed=1748 
drop=1748 early_drop=0 error=1422 search_restart=0 clash_resolve=907423 
chaintoolong=0

This is on a router with a pretty basic NAT setup - NAT anything on the 
LAN (192.168.0.0/16) to a single WAN IP address.  Two Interfaces, eth0 
(WAN) and eth1 (LAN)

The same output a minute later:

tim@ferrari# sudo conntrack -S
cpu=0           found=11150 invalid=48766 insert=0 insert_failed=1691 
drop=1691 early_drop=0 error=1792 search_restart=0 clash_resolve=901897 
chaintoolong=0
cpu=1           found=10497 invalid=48631 insert=0 insert_failed=1748 
drop=1748 early_drop=0 error=1422 search_restart=0 clash_resolve=907859 
chaintoolong=0

So ~300 clash_resolve's a minute.

Kernel 6.6.30

Is there some way I can debug what's triggering the clashes?

Many Thanks,
Tim
