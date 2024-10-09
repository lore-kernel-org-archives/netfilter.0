Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2020A1925A4
	for <netfilter@vger.kernel.org>; Wed,  9 Oct 2024 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473184; cv=none; b=dM0g8Fh8TNuKsCfY1OUxMhlpeBHPWCUu+FeLdLNUXwbQ8sxpsEj7pzddQhAa5g+7UrCapS3PoDBSgH8VkDGx9my36Qw1NCX7X6yIqbJe9qItjHYdJfaeF8DWcQ+yvhAF2C7su+JoH08e+bXLdRZVsXotOzt+VQysnfpHyorUJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473184; c=relaxed/simple;
	bh=LESpiESpqStZvR0uYvJggfEsXFYMZAtIT7Yi64sS3h4=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTV2CqFokcD8iICp/Jj7maldKF2I7YmCdVvPqqOfmv2rtjzSv/6OXGmLkuVla2F3BS1/XUw+ydnSPaowfPi3XL3y2xK5neX2yU5vaej2m/Rp/s/t+HcvaOwKKuA4jwNNYSWlaSF+TL/ZpWa6f55H18XihVSM9sLRmAGOJi7jSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=dn2shPqL; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=tekin3FD; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="dn2shPqL";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="tekin3FD"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1728473180; bh=LESpiESpqStZvR0uYvJggfEsXFYMZAtIT7Yi64sS3h4=;
	h=Date:Subject:Cc:References:From:In-Reply-To:From;
	b=dn2shPqLLSLlpwX1ScwbpeAgLleowryVo+7yz6H9vd5wyBm0tVWxCcHeuQjABX5Th
	 iPpcpbxgph7itx6S3Yk1jv7Sd2Hqz76SisPtP9/SPgOQ+Q+/eCv3H2L2iHX6tCkklT
	 91O+sPoiDaYB9vYBS5ymZT+e9tSnJh15sY/z3bwA=
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id CC6046081A01
	for <netfilter@vger.kernel.org>; Wed,  9 Oct 2024 13:26:19 +0200 (CEST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1728473179; bh=LESpiESpqStZvR0uYvJggfEsXFYMZAtIT7Yi64sS3h4=;
	h=Date:Subject:Cc:References:From:In-Reply-To:From;
	b=tekin3FDLsJuDyq+MALyYicVJk3yrUF/tKwDzpRCH8ecWwTepfVGyasHO72+1vJzt
	 ZvjOqGoVKkcb2NQcmXUrygD9bCutnvCh7grmGQlFQD/iY655c7eBy7IFrUP1je6P3f
	 LNOX48Jza+GkFNYHtHuzs87+TzoNh1wfD3QL9E+s=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id 8E82B60818A4
	for <netfilter@vger.kernel.org>; Wed,  9 Oct 2024 13:26:19 +0200 (CEST)
Message-ID: <cc69e5fb-38bb-4931-a9ed-ece328dac4df@tootai.net>
Date: Wed, 9 Oct 2024 13:26:19 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem with ipv6
Cc: netfilter@vger.kernel.org
References: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net>
 <bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com>
 <504b1c67-8335-4839-83fa-ea4e39d745c6@tootai.net>
 <686AF66561802BD5+20241009161103.3330b146@xcws1>
 <dca55817-4379-4efe-b1cb-be24d69dea83@tootai.net>
 <F0981F597924BF0A+20241009171954.65114fbb@xcws1>
Content-Language: fr-FR
From: Daniel <tech@tootai.net>
In-Reply-To: <F0981F597924BF0A+20241009171954.65114fbb@xcws1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP


Le 09/10/2024 à 11:19, Carl Lei a écrit :
> On Wed, 9 Oct 2024 10:46:34 +0200
> Daniel <tech@tootai.net> wrote:
>
>> Le 09/10/2024 à 10:11, Carl Lei a écrit :
>>> On Wed, 9 Oct 2024 09:50:22 +0200
>>> Daniel<tech@tootai.net>  wrote:
>>>
>>>> Le 08/10/2024 à 22:28, Kevin P. Fleming a écrit :
>>>>> On Tue, Oct 8, 2024, at 16:08, Martin Brampton wrote:
>>>>>>             chain output {
>>>>>>                     type filter hook output priority filter;
>>>>>> policy drop; ct state { established, related } accept
>>>>>>                     ip protocol icmp icmp type echo-request accept
>>>>>>                     ip protocol icmp icmp type echo-request ip
>>>>>> daddr 127.0.0.1 accept
>>>>>>                     icmpv6 type echo-request accept
>>>>>>                     ip protocol { tcp, udp } th dport 53 accept
>>>>>>                     tcp dport 123 accept
>>>>>>                     tcp dport { 80, 443 } accept
>>>>>>                     tcp dport { 25, 465, 587, 993, 995, 4190 }
>>>>>> accept }
>>>>> What happens if you change this policy to 'accept', and make no
>>>>> other changes?
>>>> Or simply add new in state
>>>>
>>>> ct state { established, related, new } accept
>>> IIRC many NDP packets have ct state = untracked, so you are
>>> proposing to accept all TCP+UDP connections and still having broken
>>> IPv6.
>> Well, from my understanding, policy accept does the same
> Well, if you meant to keep policy=drop and to add ctstate=new ->
> accept, it won't accept untracked NDP packets, so not going to work.

Yes. What I have

chain output {
                 type filter hook output priority filter; policy drop;
                 meta l4proto ipv6-icmp counter packets 601917 bytes 
34178441 accept
                 oif "eth0" ct state established,related,new counter 
packets 5373812 bytes 64917554996 accept
                 oif "lo" accept
         }

and it does the job

[...]

-- 
Daniel ]
