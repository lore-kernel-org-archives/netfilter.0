Received: from md.angrycow.ru (md.angrycow.ru [31.131.2.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF77A15B
	for <netfilter@vger.kernel.org>; Tue, 12 Mar 2024 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.131.2.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261648; cv=none; b=GeboGUbnZ45m6qq7WeOMyqzCrFNS0LcK9i1R+i+lkKvf24nzoMBDPSYaSnbbqNBO6nrm9zxvY/+Nyn4JbPp4vnm/UvcBLQqlLmaxbL0m5dTw2+A1USZXsNVDC7Rr0SIqnigSvsvl3/gJzjV4itVt98q8qKO8GSAQ4J27PHMsPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261648; c=relaxed/simple;
	bh=z5OlU82rIL70CropVIEHIZx7Trw3Jb6hiiwcYFGX4js=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type; b=W1c3Fx+bTDswyJiCxHZooQrj2BWh0/Zkdr51NTxuYNX/YDPVmQvDcKbIGJg23D7EYsCJWcrUT9YSTs6iTRjbO+Sr5oxsY8RrCEu+7WeX8vjlfik2G9B6XpT6MJnk/1TBlUqGr5K+0eAQSU6OwUTazVrlBjH4JzHmw+hLYUCNDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nethence.com; spf=pass smtp.mailfrom=nethence.com; dkim=pass (2048-bit key) header.d=nethence.com header.i=@nethence.com header.b=Fm6BEyc6; arc=none smtp.client-ip=31.131.2.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nethence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nethence.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nethence.com header.i=@nethence.com header.b="Fm6BEyc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nethence.com;
	s=aug2022; t=1710261317;
	bh=z5OlU82rIL70CropVIEHIZx7Trw3Jb6hiiwcYFGX4js=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Fm6BEyc6wUvmWVI2qdMPutlabXkvo/j2AzSLQGp2tCOqae8QPSSKlY5PYqGO4b2AB
	 S53IsgB3l3fRG+wF4VHSuJRBdDQ6L763xrLgdBty5A2EB1QqP6DcFoHo18x9B/VjjE
	 H8ldIGDso4dh4ZE9mW5trS/xxeA4alAPEZGzSfF3wLo5/85AzJmaB3DwAxxpoO2SAd
	 xZtdA1Mj0PzHCTySsdoMeifITmlfsFsIkvxlZSu+9iAk2X8dEaXB9dMYbijMOP9Dkj
	 DVMHEJUCSDnmJ221IvI0fXj6PPrcHU9+rMrjk8x/XZDmG+5HbmJppSWFMRM7hQBdkB
	 t/Om71X+oE7zA==
Message-ID: <cf1d3838-f258-4c9f-afb6-d408d7490350@nethence.com>
Date: Tue, 12 Mar 2024 19:35:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: SNI filtering
Content-Language: en-US, fr
To: Tim Lewis <elatllat@gmail.com>, netfilter@vger.kernel.org
References: <CA+3zgmt6ZK+VR5iAb5GKV+vgu5eeDHBFUb=9p+_-kQUziVawfw@mail.gmail.com>
From: Pierre-Philipp Braun <pbraun@nethence.com>
In-Reply-To: <CA+3zgmt6ZK+VR5iAb5GKV+vgu5eeDHBFUb=9p+_-kQUziVawfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>

On 3/11/24 21:56, Tim Lewis wrote:
> May we have an example of Server Name Indication (SNI) filtering on
> the nftables wiki? When using an environment without the variable
> position support of iptables string match, an example, maybe using
> eBPF, for SNI filtering with nftables would be helpful.

Is that even possible with stock nftables?

FWIW I tried xt_tls module with iptables (https://github.com/Lochnair/xt_tls).  The original filter rule shows up as such

         Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
          pkts bytes target     prot opt in     out     source               destination
            27 15363 DROP       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:443 TLS match host some-domain.com

while the resulting nftables filter rule shows up as such

         table ip filter {
                 chain OUTPUT {
                         type filter hook output priority filter; policy accept;
                         meta l4proto tcp tcp dport 443 # TLS match host some-domain.com counter packets 10 bytes 5690 drop
                 }
         }

but that's just firewalling.  For interception, it doesn't work (https://github.com/Lochnair/xt_tls/issues/35).

-- 
Pierre-Philipp Braun
