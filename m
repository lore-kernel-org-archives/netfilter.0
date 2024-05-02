Received: from forward201b.mail.yandex.net (forward201b.mail.yandex.net [178.154.239.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CF267A0D
	for <netfilter@vger.kernel.org>; Thu,  2 May 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714643993; cv=none; b=NfiXn8Dsqh9PX1+WbMwjU/qjm+IJfGQ6GtfYrFIvY3V0Rd3t4unn2S9UQocJA7LWfohx0AqeEa0awFycnwFFH/++Zxha9Nbtd0gRjFJ+vmNI4AurKKpDFqDfn94xIhz94sbhU5ugbXwAURPbyH33VO0PaOXX6gTx0IcNWgM/hao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714643993; c=relaxed/simple;
	bh=BRPX/4F9j7s1ubeV71LRerf0HAOmzoIB6oLXkGHtLcg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=jXs3tZsIVj4iOT9WbW6iHkCYKuAhGAdf1gibIpRqAJeTlCMAfbfoYwUcOlnjmgu2u6zPQtO/yrVgeTHmqo68GMcm4iC9limZHAuOBy4oiwGH69C9zB4IEvxSx8clTCVyCiBUFUw1e/atQCv0UeNa1We0Foi8k3LxnB4vcFrn9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=lCg8Wp84; arc=none smtp.client-ip=178.154.239.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="lCg8Wp84"
Received: from forward101c.mail.yandex.net (forward101c.mail.yandex.net [IPv6:2a02:6b8:c03:500:1:45:d181:d101])
	by forward201b.mail.yandex.net (Yandex) with ESMTPS id BD5196677D
	for <netfilter@vger.kernel.org>; Thu,  2 May 2024 12:52:28 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:2a3:0:640:17ea:0])
	by forward101c.mail.yandex.net (Yandex) with ESMTPS id 2341D60AC3
	for <netfilter@vger.kernel.org>; Thu,  2 May 2024 12:52:21 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id KqPUmboiCCg0-dNzIoWpv;
	Thu, 02 May 2024 12:52:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1714643540; bh=9yilMDBc614oIYLvSliOuSNt83GeXi1n29KKiiCeS5Q=;
	h=To:Subject:From:Date:Message-ID;
	b=lCg8Wp84INC5pxoDrN/lOjGEnEPZ7g57YqVJV1vs/Vmd8hsOya+giXpgGY14gY8dI
	 /dcA7r7WxTYMpSS8XFQLdYCoKyiIt7ZxWYHfQGcOO3GXVc7rYCzCSqREiLjPSDFqjb
	 DA8UDDm1P/fhkpTH6ZK1S2hECeIO1Er2r3f176gk=
Authentication-Results: mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <5f4adebc-51ce-ff05-5296-f6c5718d9f4e@yandex.ru>
Date: Thu, 2 May 2024 12:52:19 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: La Rus <zator@yandex.ru>
Subject: Retrieve L2 header or MAR from packet
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Content-Language: ru
Organization: StarLet Team
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello!
I'm try to study netfilter queue API, I'm need retrive a MAC of a has 
been received IP pakeck.

I use:
nft add rule ip filter OUTPUT ip protocol icmp counter queue num 1

...
if (l_nlattr[NFQA_HWADDR])
         {
             struct nfqnl_msg_packet_hw *hw = 
mnl_attr_get_payload(l_nlattr[NFQA_HWADDR]);
             unsigned int hwlen = ntohs(hw->hw_addrlen);
             const unsigned char *addr = hw->hw_addr;
             unsigned int i;

             $DUMPHEX(addr, hwlen);
         }
...
The pierce of code abohe is not executed.
So, is there what I'm need to check additionaly ?




---
С уважением,
Ruslan R. Laishev
OpenVMS bigot, natural born system/network progger, C contractor.
+79013163222
+79910009922
