Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E927194A6C
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741429998; cv=none; b=Qd7WwVegGJOwyac00z4CEL5p7NUOE48batk2Pr6IsiOGoAPb1GHcctpxqmRG1bubFymyukdRc5/D0m2GzLS01wyoev2grGwCkbyzO7IHgeM2BmTPQnrNkV/tFvQw0vsVAHyeQQTXuT5zaAniDMXYD5/5XzeAQRZPJ8rzemepHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741429998; c=relaxed/simple;
	bh=84MMMNnzgoo6dyJqpgD4c5eG2Ty7Cleb/MJ9XrMUW9M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=RnGRK5/i3KA/tk/+PvKDBwZGL29wWIqQVxFq2NJxPSNC+Q2TgKzqzyVxXb9+SBpDAK9f9aL0kF/5n76qX5qkt77vIU0XkRqOmbZIxkc0ybxUw5uiLZ3eSJhxaSwZpnbqpZGY13DS3YdnLoY94b7CAighexwqPAZ8TdqN1meDBHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clae.net; spf=pass smtp.mailfrom=clae.net; dkim=fail (0-bit key) header.d=clae.net header.i=@clae.net header.b=CG0pXtqm reason="key not found in DNS"; dkim=pass (1024-bit key) header.d=clae.net header.i=@clae.net header.b=iShLCbHm; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clae.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clae.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=clae.net header.i=@clae.net header.b="CG0pXtqm";
	dkim=pass (1024-bit key) header.d=clae.net header.i=@clae.net header.b="iShLCbHm"
Received: from stella.clae.net (unknown [82.64.199.61])
	by smtp5-g21.free.fr (Postfix) with ESMTPS id D02AC60145
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 11:33:13 +0100 (CET)
Authentication-Results: smtp5-g21.free.fr;
	dkim=fail reason="key not found in DNS" header.d=clae.net header.i=@clae.net header.a=rsa-sha256 header.s=dkim header.b=CG0pXtqm;
	dkim=pass (1024-bit key; unprotected) header.d=clae.net header.i=@clae.net header.a=rsa-sha256 header.s=default header.b=iShLCbHm;
	dkim-atps=neutral
Received: from [192.168.254.101] (_gateway [192.168.0.254])
	(authenticated bits=0)
	by clae.net (8.18.1/8.18.1) with ESMTPSA id 528AWas5506369
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sat, 8 Mar 2025 11:32:36 +0100
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.8 at stella.clae.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clae.net; s=dkim;
	t=1741429957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/p9X6XT1AaHZaTm3oaW9SGqREdQIvhmZBniHqXbwpM=;
	b=CG0pXtqmUARVh6W2Gr+UhaAdarKEBdQqyHjXGP0wn970HAx1WGwDrHShAFlApHCt8k48iW
	id/Rh2TKmqX6hIheWsZo9MwsCkiVnh9V+AIh0s3C7/LZ3TBVG1zAo26SNj4EdCN9SSY2Ve
	wl4U8rxMaJK732Yr0ojW+Q9FxXBD638=
DKIM-Filter: OpenDKIM Filter v2.11.0 clae.net 528AWas5506369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clae.net; s=default;
	t=1741429956; bh=H/p9X6XT1AaHZaTm3oaW9SGqREdQIvhmZBniHqXbwpM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=iShLCbHmlGvpoUpj70eE0QGUiBbGQz1IMhr1SThcOc6ciGkzQxkE9KDE5ZDENL4yk
	 h3MQg/FipfK154EG+qY4NdcSwjgCpv0gGTiU5TvNQuNEnozbXk0x13R3ZcrINqrHGx
	 InIri3lAK4gOykF+otWz10nvxUpD7jgOJOVyxtaI=
Message-ID: <60036f76-c1a6-40de-b3f0-7895908a895a@clae.net>
Date: Sat, 8 Mar 2025 11:33:09 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Translation for iptables raw rules that targert rtsp / Conntrack
 helper,
From: Laurent ARNAL <laurent@clae.net>
To: netfilter@vger.kernel.org
References: <b49757d8-1e9a-4c23-8525-1b0e1846d6e7@clae.net>
Content-Language: fr
In-Reply-To: <b49757d8-1e9a-4c23-8525-1b0e1846d6e7@clae.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I reply myself, as I finally find the good way to handle it.
The correct syntax seems to be:

table ip nat {
         ct helper rtsp-standard {
             type "rtsp" protocol tcp;
         }

         chain prerouting {
             type nat hook prerouting priority dstnat; policy accept;

             tcp dport 554 counter ct helper set "rtsp-standard";


That was not working at first, because I forget the set keywork on the 
tcp dport 554 line.
Also, I use to set protocol udp in the definition helper, but first rtsp 
connection is tcp, so it was failling with error.

Laurent.


Le 08/03/2025 à 10:54, Laurent ARNAL a écrit :
> Hello all,
>
> I've setup nf_nat_rtsp / nf_conntrack_rtsp to handle iptv flow from my 
> internet provider.
> This now work ok, but to make it work correctly, I need a rule like 
> this one in the firewall:
>
>     iptables-nft -t raw -A PREROUTING -p tcp --dport 554 -j CT 
> --helper rtsp
>
> So If Issue this command, everything is working of.
> The matter is that I don't know how to translate it to put in my 
> firewall.nft file.
>
> nft list ruleset give me something like:
>
> # Warning: table ip raw is managed by iptables-nft, do not touch!
> table ip raw {
>         chain PREROUTING {
>                 type filter hook prerouting priority raw; policy accept;
>                 tcp dport 554 counter packets 0 bytes 0 xt target "CT"
>         }
> }
>
> If i put something like
>
> table ip raw {
>         chain PREROUTING {
>                 tcp dport 554 -j "CT"
>                 tcp dport 554 counter xt target "CT";
>         }
> }
>
>
> I've got an error on loading:
>
> nft flush ruleset; nft -f /etc/nftables/main.nft
>     /etc/nftables/main.nft:380:27-40: Error: unsupported xtables 
> compat expression, use iptables-nft with this ruleset
>       tcp dport 554 counter xt target "CT";
>
> I've also try the following syntax:
>
> table ip raw {
>         chain PREROUTING {
>                 type filter hook prerouting priority raw; policy accept;
>                 tcp dport 554 counter ct helper rtsp;
>         }
>
> }
>
> This is loading ok, but have no effect.
> Can someone point me the good way to target the rtsp conntrack from 
> nftables ?
>
> Thanks,
>
>        Laurent.
>
