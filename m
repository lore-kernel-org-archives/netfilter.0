Received: from mx.apservice.sk (s7.printflow.eu [195.28.87.147])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B612C12BE91
	for <netfilter@vger.kernel.org>; Thu, 30 May 2024 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.28.87.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067193; cv=none; b=jtAgAC7yT3iSj7NvcK2DRO5+Ua+GAZci4TtoYuYBl50Clf8sFXehNGxekMT2CsErcnbHCsYXK1wnGoB1DVZQ9B+9P8bZXZ+xdvxPuGH2U+I7FSbQgVDKVMNY0ohVv7lR4uvmACfyM0sudM/5gMfmYaAV7Q51JeC86sBcVa+d//E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067193; c=relaxed/simple;
	bh=Z68pk/oG8GgbTPNIPTRNSzueNhn1dnWB9zH3Krg3cjc=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=MZ/DXgvv+EzCNyetEuWKu8Y8AnqL05fRPV+8PzEA8rbivAZ4rmGW7rjOjslCoOqpHI7TUSlK0zhLuVKTgxcr7i3Noe99qP7UeCeX/CiSrOMfztj5ZG6Bt+pzbGAdirobfZPmn7yIBtdW9d23NZu12Iyl4hiHBOrH5V7QrImhbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e-posta.sk; spf=pass smtp.mailfrom=e-posta.sk; arc=none smtp.client-ip=195.28.87.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e-posta.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=e-posta.sk
Received: by mx.apservice.sk (MainDeamon@apservice.sk, from userid 30022)
	id 4DAD0401B2; Thu, 30 May 2024 13:06:28 +0200 (CEST)
Received: from [10.1.1.50] (unknown [10.1.1.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx.apservice.sk (MainDeamon@apservice.sk) with ESMTPSA id 3AE1840184
	for <netfilter@vger.kernel.org>; Thu, 30 May 2024 13:06:26 +0200 (CEST)
Message-ID: <62990481-29d3-4d22-9a65-28ceee7e4a27@e-posta.sk>
Date: Thu, 30 May 2024 13:06:26 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: ebtables rule rewriten to nft 'set host' does not work
Content-Language: en-US
References: <a7c35e53-7b4a-4af0-a31d-044737e32a26@e-posta.sk>
To: netfilter@vger.kernel.org
From: netfilter@e-posta.sk
In-Reply-To: <a7c35e53-7b4a-4af0-a31d-044737e32a26@e-posta.sk>
X-Forwarded-Message-Id: <a7c35e53-7b4a-4af0-a31d-044737e32a26@e-posta.sk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit




On 2024-05-30 01:17, Kerin Millar wrote:
> On Wed, 29 May 2024, at 10:07 AM,netfilter@e-posta.sk  wrote:
>> Hi guys I got kind of Man-In-Middle setup, where ubuntu based box is
>> correcting coordinates transferred thru wire.
>>
>> This is old setup coming from age of iptables and ebtables. I tried to
>> move to nft command-line, but with no success. ebtables command works,
>> but nft does not. Note: box is running nftables with iptable and ebtable
>> interface.
>>
>> When I convert ebtables command into nft rule, this rule never get hit,
>> while its ebtables equivalent does.
new wording: nft based rule is not executed as expected - it does not 
drop bridged connection into box
>> nft version
>>
>> # nft -V
>> nftables v1.0.2 (Lester Gooch)
>>
>>
>> script setting nft ruleset via nft and ebtables
>>
>> #!/bin/bash
>> IP=*IP*
>> PORT=*PORT*
>>
>> nft flush ruleset
>> nft -f - <<NFT
>> table bridge nat {
>>           chain PREROUTING {
>>                   type filter hook prerouting priority dstnat; policy accept;
>>                   meta ibrname "*DEV*"  ip daddr ${IP}  ether type ip
>> tcp dport ${PORT}  meta pkttype set host
>>           }
>> }
>> ....
>> NFT
>> # this rule does not work in NFT (yet?)
>> ebtables -t nat -A PREROUTING --logical-in *DEV*-p ipv4 --ip-protocol
>> tcp --ip-dst $IP --ip-dport $PORT -j redirect --redirect-target ACCEPT
>>
>>
>> resulting ruleset, as you can see ebtables rule is hit, nft is not, when
>> I try to match rules word, by work, I usually get error
>>
>> # nft list ruleset
>> table bridge nat {
>>           chain PREROUTING {
>>                   type filter hook prerouting priority dstnat; policy accept;
>>                   meta ibrname "*DEV*" ip daddr *IP* ether type ip tcp
>> dport *PORT* meta pkttype set host
> I note that "meta pkttype set host" isn't valid syntax, though your shell script has it right. Still, this rule has no counter. How can you be so sure that it isn't being hit? Could it perhaps be that it is hit, with processing continuing due to the absence of the "accept" keyword?

Thanks for response

1. you are right after adding counter I can see rule get hit, but does 
nothing (next same table rule is executed, even it should be not, and 
coordinate corrector is not connect if ebtables rule is not used.

2. 'meta pkttype set host' is only way i could make nft ruleset to 
parse. Now when I try 'import' back rule as 'exported' thru nft list 
ruleset, that is use: 'meta set pkttype host' i get error: 'Error: 
syntax error, unexpected set', so seems export + import would not work here.

3. just tried to export to json format. nft rule and ebtables rule 
differs. ebtables rule got one "xt": null in place of 'daddr' and 
'dport' and other one in place of 'mangle'. Seems rules are not same 
even when their list output is almost same. is it possible nftable 
actually add rule on IP level instead of ethernet? In any case (and more 
importantly) does anyone know how to fix it?

