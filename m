Received: from mx.apservice.sk (s7.printflow.eu [195.28.87.147])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE6E13A26B
	for <netfilter@vger.kernel.org>; Fri, 31 May 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.28.87.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148142; cv=none; b=IgZPlSDqJSGMKq8q9NZut64erAnfVe0yrSTXhrZWBRwMT6ts+gaqNsIKDM4KxLzUvKM2BA85Xgjp/rWgvgt+aIV/bO4R/gxwIxjI3L7kofPmnJ8m3RcemtjChJIxe47rn2TKRJ/pMNGRFaK+SLOZiWIWh+5U1JTj/SJEuaekhN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148142; c=relaxed/simple;
	bh=bAbQycSyW+PhClO3S4SMt9/t663nKro6Lu7hcl76hPQ=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=pqEIveZxHRCZFoswbr9bGCNMFNRXZRAwoImmuHYJ5gzUXjRgf3sRuK6sSEelAcUGB8gA16xA/rYbz1hRSIghXmVs7lewIbObP6ATy0O36RQOEmIMzy/L6UqpHXJRbv2YPD1ALzOJ5p3BMNYtGMnRh/zqegrOoQI7SuZyn5KXlms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e-posta.sk; spf=pass smtp.mailfrom=e-posta.sk; arc=none smtp.client-ip=195.28.87.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e-posta.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=e-posta.sk
Received: by mx.apservice.sk (MainDeamon@apservice.sk, from userid 30022)
	id 0772E401B2; Fri, 31 May 2024 11:35:35 +0200 (CEST)
Received: from [10.1.1.50] (unknown [10.1.1.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx.apservice.sk (MainDeamon@apservice.sk) with ESMTPSA id E999D40184
	for <netfilter@vger.kernel.org>; Fri, 31 May 2024 11:35:32 +0200 (CEST)
Message-ID: <ba8dbc4b-b624-49d5-98f1-f48ac70c2541@e-posta.sk>
Date: Fri, 31 May 2024 11:35:31 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: ebtables rule rewriten to nft 'set host' does not work
Content-Language: en-US
References: <598d0884-79dc-421c-ad0b-85eb3b2bd107@e-posta.sk>
To: netfilter@vger.kernel.org
From: Oto BREZINA <otik@e-posta.sk>
In-Reply-To: <598d0884-79dc-421c-ad0b-85eb3b2bd107@e-posta.sk>
X-Forwarded-Message-Id: <598d0884-79dc-421c-ad0b-85eb3b2bd107@e-posta.sk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit




On 2024-05-30 15:10, Florian Westphal wrote:
> netfilter@e-posta.sk <netfilter@e-posta.sk> wrote:
>> I guys I got kind of Man-In-Middle setup, where ubuntu based box is
>> correcting coordinates transferred thru wire.
>>
>> This is old setup coming from age of iptables and ebtables. I tried 
>> to move
>> to nft command-line, but with no success. ebtables command works, but nft
>> does not. Note: box is running nftables with iptable and ebtable 
>> interface.
>>
>> When I convert ebtables command into nft rule, this rule never get hit,
>> while its ebtables equivalent does.
>>
>>
> -j redirect mangles ethernet destination address to that of bridge
> device.
>
> See this example from nft(8):
>
> # assumes 00:11:22:33:44:55 is local MAC address.
> bridge input meta iif eth0 ip saddr 192.168.0.0/16 tcp dport \
> 80 meta pkttype set unicast ether daddr set 00:11:22:33:44:55


after some tweaking I come up with working version:


table bridge nat {
         chain PREROUTING {
                 type filter hook prerouting priority dstnat; policy accept;
                 meta iifname *NICDEV*  ip daddr *IP* tcp dport *PORT*  
meta pkttype set unicast  counter  ether daddr set *MAC* # for specific 
bridge port
                 meta ibrname *BRDEV*  ip daddr *IP*  tcp dport *PORT*  
meta pkttype set unicast  counter  ether daddr set *MAC* # for whole bridge
         }
}

this seems to do whatt I need. Now questions:
* is this correct long term solution, or should I expect it to break again?
* can MAC be avoided? note: there is similar rule on IP level NATing ip 
daddr to bridge IP
* what does set unicast/host means in this rule
* why 'nft list ruleset | nft' would yeld in complete (no working) rule 
set or even parsing error?

anyways thanks for help

Oto

