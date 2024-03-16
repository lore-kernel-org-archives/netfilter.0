Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5AB1BF27
	for <netfilter@vger.kernel.org>; Sat, 16 Mar 2024 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710613041; cv=none; b=uNra2xwffjoryfIc8WD7Rzqm/uq++lUibO83V4RjBITIxwY22WRzz+UrLC/l10D6SztWJkRekOSONgmvkd57xHQc1rwbPYZJICoNu8hcMvhPaT1PyIIo5RYjNzswuWv/R0TVGOyfExl3PCVc1JSv9YdsqU8ojU8VA/BiCFbhioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710613041; c=relaxed/simple;
	bh=+oCVHauejnErKZHRe8IY9Qi7zYj7VSuguygv1txJkn4=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=VmlKK1DLgxy//DbavCGkQ6wFAt6q6X4ZpA9iPql/i8eWlW3lz8L/4IQ9af5XKWQeHEqBfzvbYTv6h4ZWJmwiEwAf61LMKDpQuZe9WpEQ8VlnJdmEQnekkXq7A0wgTZHXz9ViC2Sq9RQsm0d9LZLGUEH8tTwSJJEL9ieG7A0+NQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b=1rWhIeiF; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=AF7rqDDD; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b="1rWhIeiF";
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="AF7rqDDD"
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
	s=epsilon; t=1710612718;
	bh=PfHmfpOUWy7i1pKpJAJvuOLZ2obn54Q89kGkJ1kpmTE=;
	h=Author:Date:From:To:Subject;
	b=1rWhIeiFrLvNiaX8+8AtMem1LAtDS835KuB5zHo6wf+hKxilFrBZ08S4CIaJkzLeP
	 GJRhzBq34RUSgrPerMrCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1710612718; bh=PfHmfpOUWy7i1pKpJAJvuOLZ2obn54Q89kGkJ1kpmTE=;
	h=Date:From:To:Subject;
	b=AF7rqDDDUfjil+wGjOfjGPiutxtuT7eeqqoTDVqpcpisk20yVD09cdiHW4c7EME0j
	 bQ2a9z6l5hqAFYWSZ/K9GnKj0Zx+qt5/dPnm5OTWSCZTgj2lvNsJGCQPOgBBLPSUKy
	 7LljG/ao1GuDoVwTXtpLTPf91jahlNyzVbRaAwBII2ybGdklRxxkErxyP7F2v
Original-Subject: Cannot get the correct IP version from packet
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.120] (pcale.tana [172.25.197.120])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC083.0000000065F5E0EE.00004277; Sat, 16 Mar 2024 19:11:58 +0100
Message-ID: <10cebf27-05b8-4734-b429-689e8e14b44e@tana.it>
Date: Sat, 16 Mar 2024 19:11:58 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it-IT
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
To: netfilter <netfilter@vger.kernel.org>
Subject: Cannot get the correct IP version from packet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Help me please,

In the queue callback (const struct nlmsghdr *nlh, void *data), I do:

     struct nlattr *attr[NFQA_MAX+1] = {};
     if (nfq_nlmsg_parse(nlh, attr) < 0)
         return MNL_CB_ERROR;

     char *payload = mnl_attr_get_payload(attr[NFQA_PAYLOAD]);
     if (payload)
     {
         int const af = (payload[0] & 0xf);

And here I get af == 5.  It should be 4 or 6.

That's using libmnl0:amd64 1.0.4-3.  What's happening?


TIA for any hint
Best
Ale




