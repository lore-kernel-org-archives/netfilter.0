Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D1A50271
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713807178; cv=none; b=NNQDjI+I3ESFxKyB9ml37SsPY7ZDGup+t3CXfEE9wWusp5YpIS0ziccSl8Y2f6Sf6NbGRhZAWden8Abwb5ufgoEvCu8jlrsTGKIdyx99I+sgioC0CEtsyZNiy3mF7mbOg4kRLsIsXAzRG4aZ+5Jmi1rDzHb/vykjPcuONkZ8OBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713807178; c=relaxed/simple;
	bh=3UQga69w4lv4SnqHXpAzQygqZsBuq5atdzmi4DPADos=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hu4coz7r/oQ7+0ipfH8cMKhTECJWN+brN9akNZ9jRi8+D3NdMlIDeOvOGFYSHn+zwhvkGEoQBAZMAW136TmPyvBdW9yTZplrF3KuRMvrF6GKW7xpSW+kWpRrNixh4t7DHvjIxfqWK8+7yXqqty2+WAWd1oLDm+JW10tuUIUNbbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Yki6VlhT; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Yki6VlhT"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VNXQB41LHzDqNq
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 17:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713807170; bh=3UQga69w4lv4SnqHXpAzQygqZsBuq5atdzmi4DPADos=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=Yki6VlhTAOPzkYJzxVgkslKy1ydes1dH9vL3oIuKsrP+b0Y4GHBbSI/HG1nzIW23e
	 LBLUO+EkUOdCr1Rcs1LAMh+6rmvV8M4C9v8ZB4gQUUD1++79EE0KGfQi2Tp60/lmnd
	 cmKPxcstDdBVxfsO1FWVzD/aP2/krBWF1OosdY9U=
X-Riseup-User-ID: 8DB6A17DB76A6880529A285841D9ED3BB9AC8059687CE189DADFC997AAD31E61
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VNXQ91Nv9zFtTQ
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 17:32:48 +0000 (UTC)
Date: Mon, 22 Apr 2024 17:32:35 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: DoS/DDoS protection for end nodes
Message-ID: <20240422173124.592a30c5@localhost>
In-Reply-To: <93219c99-b8a8-4878-87ac-53ee0ef4ff0a@naccy.de>
References: <20240417194340.20430839@localhost>
	<7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
	<20240418121340.58c1fa6e@localhost>
	<07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
	<20240418153254.65058b50@localhost>
	<b513f4de-6717-4306-b56a-70144a59dddc@naccy.de>
	<20240422151227.4b022e75@localhost>
	<93219c99-b8a8-4878-87ac-53ee0ef4ff0a@naccy.de>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks! I will look into that.
