Received: from xklwu-2.xen.prgmr.com (xklwu-2.xen.prgmr.com [71.19.154.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083CBE4B
	for <netfilter@vger.kernel.org>; Fri, 21 Jun 2024 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.154.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718984731; cv=none; b=IeeVoDbr/Vc3GBB+Bz6v0sWjVs+L/rjttX7nKXux9ZA/037MdrSRIJtB1PP6MnSR14yI5S40AsczdWbpUXiXmL9ISSIx/svI5vsPQ3awuyEbfDKnmU2x1XJSjguCXYl/Er7hAv0DKGoj13FX7d0rDoL8z2A/T/iodH0PzwYTEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718984731; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Message-Id:To:Subject:From:MIME-Version:Content-Type:Date; b=mTb9xaNZ5pViUnKcTJx4T2oSIOZsO16HQLeNj905zg3U1QMkoEbQSSyyaBcbANM384glO83IkipNvOdpcxa9GufaDw1+00mdFRDBf48Ff8HAyVDV/6vIwpud2r7uSr6GBwSutJhygvdDnsA4mQrpJjaz2OUBRrvzICbY63aHcr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zq3q.org; spf=pass smtp.mailfrom=zq3q.org; dkim=pass (1024-bit key) header.d=zq3q.org header.i=@zq3q.org header.b=lmEkXIcZ; arc=none smtp.client-ip=71.19.154.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zq3q.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zq3q.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zq3q.org header.i=@zq3q.org header.b="lmEkXIcZ"
Received: from epjdn.zq3q.org (epjdn.zq3q.org [71.19.149.160])
	by xklwu-2.xen.prgmr.com (8.17.1/8.15.2) with ESMTPS id 45LEwrFL2796804
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <netfilter@vger.kernel.org>; Fri, 21 Jun 2024 09:58:54 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 xklwu-2.xen.prgmr.com 45LEwrFL2796804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zq3q.org;
	s=myselector; t=1718981934;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=To:Subject:From:Date:From;
	b=lmEkXIcZSP2cz8KbBDXCDRVvVJ6r+eqrUJzy68PbbQREFMzhydsWW3Q0QGSqV6nXK
	 OCTFtg/cKmcjqSURSPARxlNN6T+Fp1ag84XlCrQm/myrDRGe80gcSrBO8szNoLoCaI
	 gmKT7JyK+cHuGLKLK4mdLgjSkR3jiYQAOQlzjrCk=
Received: from epjdn.zq3q.org (localhost [127.0.0.1])
	by epjdn.zq3q.org (8.17.1/8.15.2) with ESMTP id 45LEwruk3881596
	for <netfilter@vger.kernel.org>; Fri, 21 Jun 2024 09:58:53 -0500
Message-Id: <202406211458.45LEwruk3881596@epjdn.zq3q.org>
To: netfilter@vger.kernel.org
Subject: subscribe
From: netfilter@zq3q.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3881594.1718981933.1@epjdn.zq3q.org>
Date: Fri, 21 Jun 2024 09:58:53 -0500

subscribe

