Received: from achilles.binarus.de (achilles.binarus.de [168.119.77.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21676285CB9
	for <netfilter@vger.kernel.org>; Thu, 11 Jun 2026 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.77.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155944; cv=none; b=NrK65Z1hMxcTnf0YCeONzqpBUPGGVHSgCZDpEBRCUNI79U2vWAAvQaHriEcOrL0wuLWCZt2Wc/DEwEMgoEnCBwFI7C2fnvOJQQwCdw2I/TEHqYtVMZv2QA9brm0R4jHksu8Q06L2sc1t9ufIMHhSsYKmGJp+rWlW7117zsBWDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155944; c=relaxed/simple;
	bh=74Sbwth+IpjoT/hJzSH5zqwmi+LanJ9L2GaWDaby210=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q1QYhrPrvbXiaHvoqCix6noyz4d/sPpEJsZXN5witNgG6hxXAgNF8i4tfvGmT6mak/e6SVIUBZIQLpeH3H7xFUBB/WPp/dvO3Z9AHmpTe2+K+29fgMWmj8OpZ1lUIbks5u97Y5S64l5e6ifNPQY6JhcoxxvmxPEx8tepmNZIfuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=a27GjAgw; arc=none smtp.client-ip=168.119.77.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="a27GjAgw"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1781155936;
	bh=74Sbwth+IpjoT/hJzSH5zqwmi+LanJ9L2GaWDaby210=;
	h=Date:Subject:To:References:From:In-Reply-To:From:Reply-To:Subject:
	 Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:In-Reply-To:
	 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	 List-Post:List-Owner:List-Archive;
	b=a27GjAgwY9or0lauBt7fb27Kv1kXPsJE6GDfmAkOgyEdRmT0e2FPHRj2EeLz6kySy
	 1pxv2CKC+oAkIJNTQOCKMWq0mRNvYY/eWlVgJ78EALk7bxEmi7et5jIaALDx03opGE
	 Ke2aGrVUD5S8VMpM0SC12dxFp0Ib/aZ5qDD5+VAt9BbIJIPnleOlsGquw6vaeh1ASs
	 gzAM4zRteAl5/hpexv54/wu99wHqqkAkMJPBNU484s2HMxOZJ3dH0EBb9O4k9HHI4L
	 Pra19byLv8XgKOj+4xRdzK6AsERKEEX1J1KSjEtEpJQkktm0N6oSfnQuZ9XQ2ZXlJT
	 QnTHSnkuVI8rAtrf5wQiD3CTm8N8htZXtR7XSLi9nA/iTJSVSXXTPmHM/Emiq5/D28
	 Ovo4jvEHaulTDRKNdwjm1vQeAuRJAMGMdf3e5E4K0bxRhYsJbumJnV3L/pnM6nk4qm
	 5DiRV+rzGL1OtfJOt1EQomt4gw21JXWtE+buR/xkojDehlNEeiU8DNnqYjgUNWschJ
	 aJO1gIox7zduj/XyJjb2uyEXxhbTxDUGoqzx/3OP0+ZHwc1TcIIYsOUW/fiqJDQ62y
	 kjS/LXBcsWxyNkARhg8YNCE6J3HD7kmXe9T5xBpXzWwGnGlyiB4jpKdPzn1TrN22RR
	 C3+WYRWPz5E8j1rQPnrk/9oc=
Received: from [192.168.20.110] (p5496990a.dip0.t-ipconnect.de [84.150.153.10])
	(authenticated bits=0)
	by achilles.binarus.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 65B5WGlm936887
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Thu, 11 Jun 2026 07:32:16 +0200
Message-ID: <615ebe27-544c-4787-a9fc-068476983c8b@binarus.de>
Date: Thu, 11 Jun 2026 07:32:29 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: "nft list hooks" not working (empty output)
To: netfilter@vger.kernel.org
References: <06c74ee3-64eb-47db-8575-bfe42eb47c4b@binarus.de>
 <ainwA_Lkyr85C6dB@chamomile>
Content-Language: en-US
From: Binarus <lists@binarus.de>
In-Reply-To: <ainwA_Lkyr85C6dB@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

On 11.06.2026 01:15, Pablo Neira Ayuso wrote:
> On Thu, Jun 11, 2026 at 12:24:28AM +0200, Binarus wrote:
>> Dear all,
>>
>> according to the man page for nft, "nft list hooks" should list all functions registered at each hook, along with their priorities, and including the internal nftables functions. I am understanding this in the sense that "nft list hooks" should output something at least when there actually is a ruleset.
>>
>> But on my test system, that output is always empty. Please consider the following excerpt from a terminal session:
>>
>> root@charon /etc/network # nft list ruleset
>> table ip t_IP {
>>          chain input-filter {
>>                  type filter hook input priority filter; policy accept;
>>                  ip protocol icmp drop
>>          }
>> }
>> root@charon /etc/network # nft list hooks
>> root@charon /etc/network #
>>
>> Of course, that ruleset does not make any sense, but it serves its purpose for testing. "nft list hooks" should output something in that situation, shouldn't it?
>>
>> This happens on Debian trixie, kernel 6.12.90, nftables 1.1.3.
>>
>> I also have tried "nft list hooks inet" with the same result.
>>
>> Furthermore, I have created another ruleset with an ingress filter and have tried "nft list hooks netdev", which also gave no output.
>>
>> Any advice or explanation? Where is my misunderstanding or mistake?
> 
> It seems debian kernels do not compile support for this command?
> 
> grep CONFIG_NETFILTER_NETLINK_HOOK /boot/config-6.12.74+deb13+1-amd64
> # CONFIG_NETFILTER_NETLINK_HOOK is not set

I see. Obviously, they now finally have lost it. Honestly, I would never have come to that idea.

Thank you very much for the help!

