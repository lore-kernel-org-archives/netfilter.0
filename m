Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055BD35898
	for <netfilter@vger.kernel.org>; Sun, 27 Jul 2025 03:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753585233; cv=pass; b=DffZx6uZHQ6+FifKHkyxRd2aqz4q+l/yT9ieVaMowhS6UZBQvvKO6LMN/1OWhOtgjAHRyu9jygiHOrtdWf8gxRR/ioAvlmkLyhx+NJud1N2toPS5JSjY4+W55Y+XYsl6//kvKwEhdntIXSaLCC1ZNnU2mF4HFexlCn/gcRUr4P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753585233; c=relaxed/simple;
	bh=Y58jrg5n9HzuvxAZd6tcdqCgvAQNH7NrK7x73qI0Pv0=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=ZGhRoadfkt3OlTYQ+EEF5lyWI7Zo0QunaX0eSBhTKDlRQTLiEX9kPfd47ysD8bGr5iKghjqTpSIWr/5ywbE2fqYctybCIePfhBxNjlGLam4rWWc1Rr9fXsycRETIXz/3nt7JuAp4r8gsk3X8r0i9Pg+Q2CbKtuoWL49mksPamD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=permerror header.from=eray.ca; spf=pass smtp.mailfrom=eray.ca; dkim=pass (1024-bit key) header.d=eray.ca header.i=bilgin@eray.ca header.b=Z4pPry3k; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=eray.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eray.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eray.ca header.i=bilgin@eray.ca header.b="Z4pPry3k"
ARC-Seal: i=1; a=rsa-sha256; t=1753585229; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ViMiO56XyXum+rpT6qWnx4DkVDLYfzepRB8lyfuKD61Wan4KDB/W+8D4Os5T9Xw3tPMOvaSa4pevCQ3rfq42p0Wdz0YsKQhIh8IVHau1QOqMO9EcF5/Oj3HlHxhla3e/5jXKmd2opK5Iy5vWhwYwCaHAqPxUZqDR8mEpC03cuy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753585229; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=Y58jrg5n9HzuvxAZd6tcdqCgvAQNH7NrK7x73qI0Pv0=; 
	b=eXuPlORjfFbfjfa3I+TuQg0JcmTJQqv8cRFoPt5QMx0gCoNIDPEoGEishm0PSX9SQYM+Q6UgBrrFy6sSDUtPQhibVnnYD02InFjEHr5+foVyKrr86TrvCpi855TFLwRanAdGoPSRFm4rIfS9JvnsM0Oci1O1FF05B/N7IJdDMI0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=eray.ca;
	spf=pass  smtp.mailfrom=bilgin@eray.ca;
	dmarc=pass header.from=<bilgin@eray.ca>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753585229;
	s=zmail; d=eray.ca; i=bilgin@eray.ca;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Y58jrg5n9HzuvxAZd6tcdqCgvAQNH7NrK7x73qI0Pv0=;
	b=Z4pPry3kM+vF8ZK3v8oSGBO4Ca6hI3p1WzCHWUDx2gmOrUblAW/gSHMRZgP7N8+T
	CMM3V+zxtyrWTxYXtJF193Jal9i9UJicRfkOuiLuH2WzeCaiYFch1gtYUFspQbxdzKt
	mj47DPQsFMkZwAzj9zLP6aQK+9UIgsNpKiCKLPfg=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1753585227669818.5908441533121; Sat, 26 Jul 2025 20:00:27 -0700 (PDT)
Date: Sat, 26 Jul 2025 23:00:27 -0400
From: Eray Bilgin <bilgin@eray.ca>
To: "netfilter" <netfilter@vger.kernel.org>
Message-ID: <19849d316fa.2ce380632614151.8846727672667329038@eray.ca>
In-Reply-To: 
Subject: zoombinis
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

i've noticed packets belonging to an established/assured tcp or udp connection will cease matching rules in the built-in forwarding chain over time. i'm not actually sure if it's a function of time or number of packets. the maximum number of matches i've seen for a single connection is 65. this indicates to me that only the first 65 packets pass through the chain. i realize that only the first packet is passed through the nat table but i was under the impression that every subsequent packet exchanged has to pass through the filter table. is this a bug or is it something i don't understand about netfilters??
