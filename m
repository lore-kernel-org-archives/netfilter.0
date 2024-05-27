Received: from cam.del.bg (cam.del.bg [193.254.29.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0E13B299
	for <netfilter@vger.kernel.org>; Mon, 27 May 2024 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.254.29.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716805084; cv=none; b=KJbuEFm0XFVF8q2YaCFoDNqI7xEIa3C8lADPt04y2ieDOhvaBs7wcVtSjVN7p93d7IXeYGnFAZVX99JlSLXB+kBWooBOFdUWYyg7dfhjGVQH4RUg3JdlZZTBxRvIQEu/OlPfAXQSNI+FmkOMuq6DNF6qH2catdWpir7IaJqyvSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716805084; c=relaxed/simple;
	bh=SnjwACppaUo72Q7tkQQsRaIrs7hffSYZszRLc3PfIVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=ATbXXdhikZAQ6TuDLBRRFCehCRaD0tAgOdmXm2PK3qaYndrRwfolHgl77mW3x2T7SpLLWk8KDGOK0vLNtc4rH1Rv59DANsgfng5xNQR9kDjR23uBEQyW5CH/yP18lP+v5bS8IAwTJq5pQvPQMpneoGXr8snJgg+SHQJHcTYTgxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=del.bg; spf=pass smtp.mailfrom=del.bg; dkim=pass (2048-bit key) header.d=del.bg header.i=@del.bg header.b=Q6Zgn0aC; arc=none smtp.client-ip=193.254.29.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=del.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=del.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=del.bg header.i=@del.bg header.b="Q6Zgn0aC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=del.bg;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=DIEshEekeNWEStUohbPk+E3YkZ7X4Naw/4ZbMvz0oEM=; b=Q6Zgn0aC3NClfoS2YsognZs/LO
	UqBuhdvXDEc5ILNuZMJt1ZPElLQHwrFv0cL+1oADsivREK7p2ikPHWSqHiK/uQ/XdKtrXZGjssaqD
	p2XN8go7+VC2e+o/4VvMJbL54q9gk/TbIQ9tj/PP8hILgsO9qPpm5mFoWZHI4G1FjwJhbtmHfLcBX
	hKRxSkNcP9YaYe7G7m8NPHb6lGlaKhzDXj9f7gfbno9P5ZSS7ls3vNb28+42ng9hNtXwvJTkGCJi5
	5w2KQ2koVFI0BsA58WdalroUvn1H1QV8MOrTAaGXgvCpGr4JFHS9HUzX9Wl12FG04tdSDBXGRGjf+
	uE4p+yjg==;
Received: from mail.del.bg ([193.254.29.12]:33160)
	by cam.del.bg with esmtp (Exim 4.89)
	(envelope-from <tm@del.bg>)
	id 1sBXQN-00089Y-Fm
	for netfilter@vger.kernel.org; Mon, 27 May 2024 13:17:51 +0300
Received: (qmail 17556 invoked from network); 27 May 2024 10:17:51 -0000
Received: from unknown (HELO ?192.168.168.21?) (tm@del.bg@185.58.21.156)
  by mail.del.bg with DES-CBC3-SHA encrypted SMTP; 27 May 2024 10:17:51 -0000
Message-ID: <70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
Date: Mon, 27 May 2024 13:17:50 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nft not logging some layer 2 frames?
To: "William N." <netfilter@riseup.net>, netfilter@vger.kernel.org
References: <20240524155729.4fd15210@localhost>
Content-Language: en-US
Cc: Teodor Milkov <tm@del.bg>
From: Teodor Milkov <tm@del.bg>
In-Reply-To: <20240524155729.4fd15210@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.05.24 г. 18:57 ч., William N. wrote:
> On Fri, 24 May 2024 17:42:37 +0300 Teodor Milkov wrote:
>
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 vlan id 99 counter packets 441 byt=
> es 49415 log accept;
>
> Have you tried putting log before counter?

I just tried putting log before counter and still nothing showing in 
logs. But does order really matter?

OTOH, if I let some of the IPv6 traffic hit that final line it gets 
logged just fine.


