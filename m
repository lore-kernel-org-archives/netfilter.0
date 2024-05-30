Received: from mx.apservice.sk (s7.printflow.eu [195.28.87.147])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC5717D8A6
	for <netfilter@vger.kernel.org>; Thu, 30 May 2024 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.28.87.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717080660; cv=none; b=tt6+kNqWwFjXB3gYAw9voP11pXc0pFcWQZBxbul+8/xBcO0vKiI27QM85v3ReZn+MDU6QH/MtMATL/CSzeujCNArc76iIb7PzCk3pw9kit90wfkYiw9DvK4j489nNC1G9WIUAkuIbmzjU0rP009ZEa+q4FPx+n0QQuMwACNopwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717080660; c=relaxed/simple;
	bh=BmY7mXAdC6SryHQVarACZWQLTmod85phHwMZoLYIkAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DH3g4jIxn5Ghl5KdGqnig6G2J7dr6gclO4XfQipnx3ppMVetEtCp7fPAqJUo55MHW9NYYofvXz9VU859nJZ7v0WPmMs5dhoHGI3yOlITGPXmEAGEgXHwW60eL9sJ1CfyH1qGGU22fQMffzPZ8ialq8O8+YwiNJHtR37sxcAdFyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e-posta.sk; spf=pass smtp.mailfrom=e-posta.sk; arc=none smtp.client-ip=195.28.87.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e-posta.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=e-posta.sk
Received: by mx.apservice.sk (MainDeamon@apservice.sk, from userid 30022)
	id 20BBB401B3; Thu, 30 May 2024 16:50:53 +0200 (CEST)
Received: from [10.1.1.50] (unknown [10.1.1.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx.apservice.sk (MainDeamon@apservice.sk) with ESMTPSA id 9AD3940184;
	Thu, 30 May 2024 16:50:51 +0200 (CEST)
Message-ID: <2448325a-0efd-462c-b0ff-8ad132ec1397@e-posta.sk>
Date: Thu, 30 May 2024 16:50:50 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ebtables rule rewriten to nft 'set host' does not work
To: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
References: <b1c34f18-f564-4eda-a4ce-1af086d5a8aa@e-posta.sk>
 <20240530131002.GA2041@breakpoint.cc>
Content-Language: en-US
From: netfilter@e-posta.sk
In-Reply-To: <20240530131002.GA2041@breakpoint.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2024-05-30 15:10, Florian Westphal wrote:
> netfilter@e-posta.sk <netfilter@e-posta.sk> wrote:
>> Hi guys I got kind of Man-In-Middle setup, where ubuntu based box is
>> correcting coordinates transferred thru wire.
>>
>> This is old setup coming from age of iptables and ebtables. I tried to move
>> to nft command-line, but with no success. ebtables command works, but nft
>> does not. Note: box is running nftables with iptable and ebtable interface.
>>
>> When I convert ebtables command into nft rule, this rule never get hit,
>> while its ebtables equivalent does.
>>
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
>>          chain PREROUTING {
>>                  type filter hook prerouting priority dstnat; policy accept;
>>                  meta ibrname "*DEV*"  ip daddr ${IP}  ether type ip  tcp
>> dport ${PORT}  meta pkttype set host
>>          }
>> }
>> ....
>> NFT
>> # this rule does not work in NFT (yet?)
>> ebtables -t nat -A PREROUTING --logical-in *DEV*-p ipv4 --ip-protocol tcp
>> --ip-dst $IP --ip-dport $PORT -j redirect --redirect-target ACCEPT
> -j redirect mangles ethernet destination address to that of bridge
> device.
>
> See this example from nft(8):
>
>   # assumes 00:11:22:33:44:55 is local MAC address.
>   bridge input meta iif eth0 ip saddr 192.168.0.0/16 tcp dport \
>     80 meta pkttype set unicast ether daddr set 00:11:22:33:44:55

explanation seems to make sense. When this project started - some decade 
ago - I used ebtables ...-j DROP what was meant to move 
packet/connection from bridge into routing. Getting MAC address may get 
tricky, but doable, as bridge may have dynamic MAC, fortunaly not my 
case. Still need to get MAC from bridge, to have one script for all 
installations.

I don't know how I may missed that in manual. Unfortunately, copy pasted 
example does not parse.

# nft bridge input meta iif eth0 ip saddr 192.168.0.0/16 tcp dport 80 
meta pkttype set unicast ether daddr set 00:11:22:33:44:55

Error: syntax error, unexpected meta, expecting string

bridge input meta iif eth0 ip saddr 192.168.0.0/16 tcp dport 80 meta 
pkttype set unicast ether daddr set 00:11:22:33:44:55


I will try to poke with it and let you know If I do succeed.
