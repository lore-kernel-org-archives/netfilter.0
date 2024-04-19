Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E5B12FB3F
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713542571; cv=none; b=VWBCvvQykmX2Gti1Q0yRU4hASfAX4h20L47qf1/0mUCRXQJos/G7NKzvHfG4rYpW1xNakMbDki8pM8qICoYHYHJe83cQlpvAiO9MtOiuMB/LCPhi9IRtZDPODDKmKwpWVvfBoLOCToZNKGrseXfQ4pZei4SYGInkJbhd1WamoM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713542571; c=relaxed/simple;
	bh=kcxOpw6RMbVXMdiSuJMGEqUNkvM7w+TUcit16v0RQDY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=kqpXzwBiPp1CjYhOrgxcR782imyb07cSQWI2XUyHDrOpBQVqfinEpgkI6QSW5Od2vl4uurMYihS9ftL96pBbkMU51tEce63lu6UKsFY2iu9IIVhEpRHSSXeic9vEc2RQjXPAmUnMZ/Fto2Dyamuc8mIANpOyo+VlV/K69SZQACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=iRS6npbu; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="iRS6npbu"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VLfYg1MJfzDq9c
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713542567; bh=kcxOpw6RMbVXMdiSuJMGEqUNkvM7w+TUcit16v0RQDY=;
	h=Date:From:To:Subject:Reply-To:From;
	b=iRS6npbuL/7yjxJUNTmKJVn/mx3/vIN6cjdZsb2yslz7g0Hqb/84gMDPWHAYDoBvD
	 UfL+RwKnbbU1Vb1KIqWNzIwXOL7LRTNDfDzJsVx6LnKX3bedHL020OKeYqB2dO4zOW
	 wT0D5vXhrKtQHzw6x9aYTmYxQ1ly1YHOadxC6WUk=
X-Riseup-User-ID: 8558869D91A5BF593BE29F02F0568294D4ECC9DD6FAEFBEA647592120AC6E8E1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VLfYd4LQZzFtWc
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 16:02:44 +0000 (UTC)
Date: Fri, 19 Apr 2024 16:02:32 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: How to measure/profile ruleset performance?
Message-ID: <20240419160232.4caca594@localhost>
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

How can I measure the performance of particular nftables
rules/chains/tables with idea to optimize the bottlenecks?

Currently, I am trying to do this by commenting/uncommenting sections
of the ruleset and running iperf3. However, this seems quite
inaccurate, inconsistent and time-consuming.
