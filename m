Received: from ln11.myplesk.cc (ln11.myplesk.cc [45.43.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321031EA87
	for <netfilter@vger.kernel.org>; Sat, 21 Sep 2024 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.43.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726953581; cv=none; b=o9gnBNEqvVNFsH6aKIflWjIngdSdU1p7+DeSm//2VqIFhE0ysAircYw9vdTd9VaTwucMahKJkcycd2kDfmSo1vnmtQLS3PCjNgTVAyifvvL/z6LVT/tZiIwo73GyrUkKeXp9/Y86Z7cZ8sWCr45OcjyTePNE3hLFo+9yPAb6s9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726953581; c=relaxed/simple;
	bh=lyD1sEPBaFvrufXdbQUxRhEnwhzJNXaiRe451F6V3jY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=oMSGzQC57roue++wslyY0alPDoyxXpDTCWLBUY2OXdEPc92QuIlWMQTMkSWWCxDEgoEr8c54M33dbfpEVHehEJgyHyG9QHPpevuzpuisbuTrBjeh9+H9xc7hKR05NN7/LtZeRw9gL1Xictd5lad3tinSVofboojIstMUMfWj7hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fotes.com; spf=pass smtp.mailfrom=fotes.com; dkim=pass (1024-bit key) header.d=fotes.com header.i=@fotes.com header.b=tIrhPFVK; arc=none smtp.client-ip=45.43.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fotes.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fotes.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fotes.com header.i=@fotes.com header.b="tIrhPFVK"
Received: from [192.168.18.40] (c-73-143-216-242.hsd1.ma.comcast.net [73.143.216.242])
	by ln11.myplesk.cc (Postfix) with ESMTPSA id 39C6369000C8
	for <netfilter@vger.kernel.org>; Sat, 21 Sep 2024 17:10:25 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fotes.com;
	s=default; t=1726953025;
	bh=euq6HJu8fvs+gS8xXdcR5JcOS+txHBIR11Ib2nH6FJs=; h=To:From:Subject;
	b=tIrhPFVKz+xjMtieZG9KFecPIiUhuun8VnqzEwmzomuUZHVnYSt3SRAzihgEL0+jC
	 MFwDnNzoLUD48IW3P695EXjS1WUp5C+Nz/YYp5sSUxg7DzLnukcZr0KgT9zMLo/mMO
	 +1iaNZf/ZmF9wxTbMVsGOwtIgdWw4NHKdmH9ewyo=
Authentication-Results: ln11.myplesk.cc;
        spf=pass (sender IP is 73.143.216.242) smtp.mailfrom=thomas@fotes.com smtp.helo=[192.168.18.40]
Received-SPF: pass (ln11.myplesk.cc: connection is authenticated)
Message-ID: <8bbeaf6e-1f07-430d-bbac-67d32b73c6e9@fotes.com>
Date: Sat, 21 Sep 2024 21:10:23 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Netfilter Project <netfilter@vger.kernel.org>
From: =?UTF-8?B?VGhvbWFzIFNhZMWCb3dza8Ot?= <thomas@fotes.com>
Subject: Nomnclature - Roman
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <172695302592.2538071.10119629678441928804@ln11.myplesk.cc>
X-PPP-Vhost: fotes.com


Hello Netfilter Project,

Filtering is never a fire wall.  On the network side it is different 
than software.  We need to further distinctive as all the terms are 
wrong in the last two decades.

It is technically a filter frame.

I can assist in naming convention, but I would like to see the reference 
to fire wall removed.  It is a separate parentage of line, fibre, hub, 
route, and other service.

Thank you,

Thomas








