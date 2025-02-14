Received: from cerberus.halldom.com (cerberus.halldom.com [79.135.97.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24C21946AA
	for <netfilter@vger.kernel.org>; Fri, 14 Feb 2025 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.97.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739560706; cv=none; b=rT9c1FBnCCaropaFt+XEytV74TIky8aaeaOWUzeTjHBvCzoBPB0v9Cl+CmQsS36QQ3sfOkPbphRqTXvLPJYdsdV1BiU8j0r1cwug1DPlO9Z/tX6H4JDp1XzUcqdG2LoDPnboSpSHeQZnAWyOSkPw3qjqZc2H/IL8AXuV3FWyFe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739560706; c=relaxed/simple;
	bh=k20lexgIQvmrJqj+u3TxqWaChJ34q/xrOb1SO/OsEy0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ks8f9CNnJiOWK5YENB3FWAgKuWGdKaRbXI3vtMoobYxIcIA9UwhXSbx4AtkQTdnBc687AZvwlbBtguCn5u0Vu6wnnuTIYR0voRZzIR+HeslQJXqGjMY1SWilhoNEoVxjA68hB021/srhZBGsxeRQFw5oH9B8EM8ohMbvKApe8xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gmch.uk; spf=pass smtp.mailfrom=gmch.uk; dkim=pass (2048-bit key) header.d=halldom.com header.i=@halldom.com header.b=hZxTSICy; arc=none smtp.client-ip=79.135.97.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gmch.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmch.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=halldom.com header.i=@halldom.com header.b="hZxTSICy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=halldom.com
	; s=key20240618; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XL+YUZK2m5/3Q36XOxJ2HRhg3dkok/qsdikR54HE0Dk=; b=hZxTSICy+LaNvx/nEVUx4RG8iD
	lfTZmde8kMTZSfbuEsgxnsKgb1yhc283MOddWEsAKJVlvGrxQpT4Hh2R75Vx8YqVDXcJISAPBoVCu
	ncjtoC6Fg4+Bc3VJ6KRopuNvST/l449Gnnx8T2AH32Mr7CsoHMDwAf77WSQkdmFyquCFbtMFRoy5N
	qq0IRLTV22QbzC5CNI3vExeLDK581O4Ub+PgczCkTcGKEnwZlHIbQ7LrhYqx99/SgKocz421eHtv2
	GklN++4iFxkjYhxvoJ0ucD+MglLBqIe2XSMptNm1683pgdSThbXwJdoXEFWE0YLji5bNGtELTruIP
	Xj5BO+Og==;
Received: from ceres.halldom.com ([79.135.97.244]:63225)
	by cerberus.halldom.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <netfilter@gmch.uk>)
	id 1tj0jZ-00000000NIy-0PKk
	for netfilter@vger.kernel.org;
	Fri, 14 Feb 2025 18:48:17 +0000
Message-ID: <79155174-f4f8-4368-8fde-cbab6b30091e@gmch.uk>
Date: Fri, 14 Feb 2025 18:48:16 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: netfilter@vger.kernel.org
From: Chris Hall <netfilter@gmch.uk>
Subject: NAT and ICMP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


I have a firewall/router using nft.  It connects to the outside world 
with a single globally routeable IP address ('Real-IP').

I want to use the Real-IP both for NAT and for the firewall/router itself.

My understanding is that for tcp and udp:

   * for private source IPs, I can configure SNAT to use one port
     range, say 16384:65535.

   * and I can, elsewhere, configure the firewall/router to use a
     different range, say 0.16383, with no NAT required (inbound
     or outbound).

But for ICMP queries, I cannot find equivalent settings to manage the 
"Query Identifier".

It has occurred to me that the trick might be to SNAT all outbound ICMP 
queries, something like:

   .... ip protocol ICMP ip saddr 203.0.113.1 snat to 203.0.113.1
   .... ip protocol ICMP ip saddr 10.0.0.0/8  snat to 203.0.113.1

where 203.0.113.1 is the Real-IP. I'm guessing NATing the source address 
to itself is OK... yes ?

------------------------------------------------------------

Separately: where should I look to find the degree of conformance to the 
various "NAT Behavioural Requirements": RFCs 4787, 5382, 5508 and 7857 ?

------------------------------------------------------------

Thanks,

Chris

