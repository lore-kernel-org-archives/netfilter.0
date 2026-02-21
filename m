Received: from mail.localities.work (unknown [89.231.102.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3E821771B
	for <netfilter@vger.kernel.org>; Sat, 21 Feb 2026 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.231.102.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771663722; cv=none; b=lx3xXSQzFfqgGXUFNTdV1MZw0m7ubo+UtIRyPWd1YZdKnh7k6Yjl/DwCtyzr6pNgLI8rrjlfIzomhJfPnWB+x5HhPPKaG7DP7BNr5lxuDkYGDyjxavbHLIXtr69auDOIRaldVQIHlyXDQUcKCI9XfT2MRaht0FgxC8NrdnV3Rf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771663722; c=relaxed/simple;
	bh=APU8M0CX8veN3RJ7bmdNbA4hmZtPikcbM6dU7fdAc98=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKaBDCEj6UjXK9Sn4uRkmgyCnnGUK1dMwmgGG0+FeVMFxnUM+5fRcL+7n5tSODjfSgegroou2VP25dNcazItdTspAzG/qvxYHWj5qYbhI4CP2XOD5xifS/DI0BXA74pJamxuybtlM3osJX3RvSW/HUcOe2FfpBVSqQEP3nySb1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=localities.work; spf=pass smtp.mailfrom=localities.work; dkim=pass (1024-bit key) header.d=localities.work header.i=@localities.work header.b=rgWz6aZO; arc=none smtp.client-ip=89.231.102.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=localities.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=localities.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=localities.work header.i=@localities.work header.b="rgWz6aZO"
Received: from localhost (localhost [127.0.0.1])
	by whale.mine.priv (Postfix) with ESMTP id BCB5E112B03
	for <netfilter@vger.kernel.org>; Sat, 21 Feb 2026 09:48:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=localities.work;
	 h=content-transfer-encoding:content-type:content-type
	:in-reply-to:from:from:content-language:references:subject
	:subject:user-agent:mime-version:date:date:message-id:received
	:received; s=dkim20251117; t=1771663719; x=1772527720; bh=APU8M0
	CX8veN3RJ7bmdNbA4hmZtPikcbM6dU7fdAc98=; b=rgWz6aZO9U/LFfc9256pTl
	BMbW8V2yTLqogKylE5aqEzTi9HbUpynAyjPNtTpsAi1EzgkoSnJ/Qr3XuXmz3pWj
	3kJ/7bte/5L4pABt4OhuvsSXYs9HqcgUfxBgS6ypK9+Plvaa5wa+FvMy3EI+pezx
	m1KYBUpoByQnU6IpQ7Zcg=
X-Virus-Scanned: amavis at mine.priv
Received: from whale.mine.priv ([127.0.0.1])
 by localhost (whale.mine.priv [127.0.0.1]) (amavis, port 10022) with LMTP
 id 8adrYD0bZ2lK for <netfilter@vger.kernel.org>;
 Sat, 21 Feb 2026 09:48:39 +0100 (CET)
Received: from [10.3.0.10] (unknown [10.3.0.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by whale.mine.priv (Postfix) with ESMTPSA id 010FBE2104
	for <netfilter@vger.kernel.org>; Sat, 21 Feb 2026 09:48:39 +0100 (CET)
Message-ID: <61080b94-afdd-48c2-bb7c-74aacf3d9352@localities.work>
Date: Sat, 21 Feb 2026 09:48:38 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dummy net iface?
Cc: netfilter@vger.kernel.org
References: <37d6e23b-a14f-470d-b97b-2466849fc4ce@localities.work>
 <CAPJdpdBYt-VTdjeZ-X8BeLNTuxSmKssacgZEin9jFjypEqkEUA@mail.gmail.com>
Content-Language: en-MW, pl, pl-PL
From: listy <listy@localities.work>
In-Reply-To: <CAPJdpdBYt-VTdjeZ-X8BeLNTuxSmKssacgZEin9jFjypEqkEUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes I did/do have net.ipv4.ip_forward = 1
Then I must be doing something wrong or not doing something.
I run a container which listens on a dummy iface, well, 
'pasta' does it on behalf of 'podman'

-> $ nmap 10.9.4.7 -p 5350
...
5350/tcp open  nat-pmp-status

-> $ nmap 10.9.4.7 -p 5350 -sU
...
5350/udp open|filtered nat-pmp-status

what listens is a dns recursor, then 'firewalld' looks like so:

-> $ firewall-cmd --list-all --zone=mine-fwd-dummy
mine-fwd-dummy (active)
   target: default
   icmp-block-inversion: no
   interfaces: forwarder-dummy
   sources:
   services:
   ports:
   protocols:
   forward: yes
   masquerade: no
   forward-ports:
	port=53:proto=tcp:toport=5350:toaddr=10.9.4.7
	port=53:proto=udp:toport=5350:toaddr=10.9.4.7
   source-ports:
   icmp-blocks:

which results in:
-> $ nft list table inet firewalld
...
         chain nat_PRE_mine-fwd-dummy_allow {
                 meta nfproto ipv4 tcp dport 53 dnat ip to 
10.9.4.7:5350
                 meta nfproto ipv4 udp dport 53 dnat ip to 
10.9.4.7:5350
         }
...

forwarder-dummy is: 10.9.4.7

yet

-> $ nmap 10.9.4.7 -p 53
...
53/tcp closed domain

same for 'udp'
I'm on Centos 9 with 6.12.74-1.el9.x86_64
If I'm missing something - what that might be..
thanks, L

