Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13F6187843
	for <netfilter@vger.kernel.org>; Wed,  9 Oct 2024 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460774; cv=none; b=nt04OuzJam+kM5DigFGywPi1Pr36p9NCYuGHTRs5v9zIoKtbiiHXJdp2kDTdD6f3z92Mwaxb7c7LRyFP9GdizIm1eIkRO4msPZATPCweO5rhAuLktMthq9rwudutePlK2gB1dd4S5ajdpZwiPD5vbrP2y4FnZcXc90WDI/iM/fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460774; c=relaxed/simple;
	bh=QFxVhZcFLRdgafEk/nFMpSNa+6n+VmX+tbBfu1lWaWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f9FajhqWNQnpqIzKl+6aJdu/hVFHeQadasBZ2Sme84jHWQscYSzMKucPdmIEpjjVfEK3/e9LHAInGcu9SgEiz4u79w/PPNMLNlpGn/qEF0SD52ejaa/GQZUS40FFZ+mF1zaU5cjTkAczf722IYcXI3BbdPxacKBncuvtDl0zp1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=CgHDoFTU; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=CgHDoFTU; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="CgHDoFTU";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="CgHDoFTU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1728460223; bh=QFxVhZcFLRdgafEk/nFMpSNa+6n+VmX+tbBfu1lWaWE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CgHDoFTUAKgat/PHiEKXd1Dxj1O3HwaMViF5fPenOMTD8Zz8/YXSywwK/CfxBNwfX
	 lgNVk3w2kMEpqoGCjNTbreUo+xYjvj2JBFBkUpQxW/o4FJPOKP93l9p5j5q4QRz2UA
	 I1QEmCQQ2ygRIRjIm5V0a4eLVPIN6OgjhlGL2GDo=
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id AC69C6081A01;
	Wed,  9 Oct 2024 09:50:23 +0200 (CEST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1728460223; bh=QFxVhZcFLRdgafEk/nFMpSNa+6n+VmX+tbBfu1lWaWE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CgHDoFTUAKgat/PHiEKXd1Dxj1O3HwaMViF5fPenOMTD8Zz8/YXSywwK/CfxBNwfX
	 lgNVk3w2kMEpqoGCjNTbreUo+xYjvj2JBFBkUpQxW/o4FJPOKP93l9p5j5q4QRz2UA
	 I1QEmCQQ2ygRIRjIm5V0a4eLVPIN6OgjhlGL2GDo=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id 4D51160818A4;
	Wed,  9 Oct 2024 09:50:23 +0200 (CEST)
Message-ID: <504b1c67-8335-4839-83fa-ea4e39d745c6@tootai.net>
Date: Wed, 9 Oct 2024 09:50:22 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem with ipv6
To: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>,
 netfilter@vger.kernel.org
References: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net>
 <bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com>
Content-Language: fr-FR
From: Daniel <tech@tootai.net>
In-Reply-To: <bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP


Le 08/10/2024 à 22:28, Kevin P. Fleming a écrit :
> On Tue, Oct 8, 2024, at 16:08, Martin Brampton wrote:
>>           chain output {
>>                   type filter hook output priority filter; policy drop;
>>                   ct state { established, related } accept
>>                   ip protocol icmp icmp type echo-request accept
>>                   ip protocol icmp icmp type echo-request ip daddr
>> 127.0.0.1 accept
>>                   icmpv6 type echo-request accept
>>                   ip protocol { tcp, udp } th dport 53 accept
>>                   tcp dport 123 accept
>>                   tcp dport { 80, 443 } accept
>>                   tcp dport { 25, 465, 587, 993, 995, 4190 } accept
>>           }
> What happens if you change this policy to 'accept', and make no other changes?

Or simply add new in state

ct state { established, related, new } accept

-- 

Daniel
