Received: from mx.apservice.sk (s7.printflow.eu [195.28.87.147])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BAE1E888
	for <netfilter@vger.kernel.org>; Wed, 29 May 2024 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.28.87.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974053; cv=none; b=Xq9i9Od5/IgEHDU6qZlhz1ZA3rN/EwYU8xzw05dL/vzqkO+uzDpmAr4ZvzzwLdBw9N8k/ckzsvbT10G/dRbDmS5J8XRhRzIBjO1Et5//b5WbXlgdDzUK0VSgMd7wF/Z19vYSioFQQpEu7aelQ8I+9gVgFoto1nCt6Z/FyPrx7Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974053; c=relaxed/simple;
	bh=pEoV78oyPROdMxlfeHDSAzuFA74Pj2yT0AuCOaVFyc0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=UX4leJ1cV4qdi460wlym6OjD7MqFAnC4mP5YOG+iNsF78nGVG5VQBuMj/wLa8ZWvVzwVTbtu+aiCivP8qOZQJFz2rAToF24REJSVAbMYn1zlNlSHJTXKNv+4mu9kp3/eWRjWeqI+kUssGzJUXtDC2nnfdoShdqdXTAm+kovv/lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e-posta.sk; spf=pass smtp.mailfrom=e-posta.sk; arc=none smtp.client-ip=195.28.87.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e-posta.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=e-posta.sk
Received: by mx.apservice.sk (MainDeamon@apservice.sk, from userid 30022)
	id 5A70D401B2; Wed, 29 May 2024 11:07:56 +0200 (CEST)
Received: from [192.168.4.105] (bband-dyn225.178-40-189.t-com.sk [178.40.189.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx.apservice.sk (MainDeamon@apservice.sk) with ESMTPSA id 3CBA040184
	for <netfilter@vger.kernel.org>; Wed, 29 May 2024 11:07:54 +0200 (CEST)
Message-ID: <b1c34f18-f564-4eda-a4ce-1af086d5a8aa@e-posta.sk>
Date: Wed, 29 May 2024 11:07:53 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US
From: netfilter@e-posta.sk
Subject: ebtables rule rewriten to nft 'set host' does not work
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I guys I got kind of Man-In-Middle setup, where ubuntu based box is 
correcting coordinates transferred thru wire.

This is old setup coming from age of iptables and ebtables. I tried to 
move to nft command-line, but with no success. ebtables command works, 
but nft does not. Note: box is running nftables with iptable and ebtable 
interface.

When I convert ebtables command into nft rule, this rule never get hit, 
while its ebtables equivalent does.

nft version

# nft -V
nftables v1.0.2 (Lester Gooch)
   cli:          editline
   json:         yes
   minigmp:      no
   libxtables:   yes


script setting nft ruleset via nft and ebtables

#!/bin/bash
IP=*IP*
PORT=*PORT*

nft flush ruleset
nft -f - <<NFT
table bridge nat {
         chain PREROUTING {
                 type filter hook prerouting priority dstnat; policy accept;
                 meta ibrname "*DEV*"  ip daddr ${IP}  ether type ip  
tcp dport ${PORT}  meta pkttype set host
         }
}
....
NFT
# this rule does not work in NFT (yet?)
ebtables -t nat -A PREROUTING --logical-in *DEV*-p ipv4 --ip-protocol 
tcp --ip-dst $IP --ip-dport $PORT -j redirect --redirect-target ACCEPT


resulting ruleset, as you can see ebtables rule is hit, nft is not, when 
I try to match rules word, by work, I usually get error

# nft list ruleset
table bridge nat {
         chain PREROUTING {
                 type filter hook prerouting priority dstnat; policy accept;
                 meta ibrname "*DEV*" ip daddr *IP* ether type ip tcp 
dport *PORT* meta pkttype set host
                 meta ibrname "*DEV*" ether type ip ip daddr *IP* tcp 
dport *PORT* counter packets 14011 bytes 977273 meta set pkttype host
         }
}


Is it supported? If so, what is correct nft rule definition?


Thanks


Oto

