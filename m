Received: from outbound5a.eu.mailhop.org (outbound5a.eu.mailhop.org [3.124.88.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20435202643
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 19:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.124.88.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731438303; cv=none; b=H6Xw0jdmJiSARGebrHQ7+y3LVtu/GKGjdQQC7lgX2ZaDH85AckTeIvQSnJuy/vya7o5nbLXIftbkhRjxtU2K1vpr80W1yWUFO0OOeTJbMGOtBiY6RNEWKytQVVR6R/iTyqgH+Pf03zIUoMp2L2p8Ud7kaOlVRlbNo+ShyL+f13A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731438303; c=relaxed/simple;
	bh=OXrn9vvPGBOdHzkBfWxxniti22Bf5SAfbeW73lCgs8s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=HGhHpw+yOcGX1jQ9WsI5+vm4+zh0xamjxZ8JDH70Ej8NimRl6B/NMal5nBiWgdOvhx91+5r9ueE+r4QZuCCxfIDLK1N64ZWtZAzd8MG2lM0un5U+etEu/5aXM7ltTHQBaT4eG1RDFfUiR8JAwXW4/jPatd8QhtvxU8VvRn+eO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org; spf=none smtp.mailfrom=koeller.dyndns.org; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=ivr6P/t4; arc=none smtp.client-ip=3.124.88.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="ivr6P/t4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:content-type:in-reply-to:references:to:subject:from:
	 mime-version:date:message-id:from;
	bh=6jky3Z6LtC9sRWOW+oFSQ+tVRxy6M7L629Ui2zYX3yM=;
	b=ivr6P/t4cunOfuIOU9M5PMa3kDVZ8B7PzErPrDt7+tlHAtbtTZAVKsGGVNDYmrsltn+Kjik4gwkuU
	 pP23YhJAb5RUAC3ZfRWIdUSn3eY5Q6wXGogAfmwvrKmbFXKjuHQdl6qWCozZwrPAT4Bprr0JPakiwc
	 gjlCNfRWsO/Ifsh1ze2OuFZx++B8BjtxOmczcUUtgNiN4a6sV+KK7/Jo/2tezIeq8hEx9wdYHgJsuq
	 XV++8slQHoorZHzfNgbjzy+4VBLrktuLyGdwNxXHeCwNszlj/9LInepqE0ESbLYc/MG74P7cQ7HkVb
	 vSV01C0tu6PB3PHUtIooHPjvtvMpw9A==
X-MHO-RoutePath: dGtvZWxsZXI=
X-MHO-User: 03440c1d-a129-11ef-b223-25ccbfd3c7c9
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.koeller.dyndns.org (ip1f123f5c.dynamic.kabel-deutschland.de [31.18.63.92])
	by outbound3.eu.mailhop.org (Halon) with ESMTPSA
	id 03440c1d-a129-11ef-b223-25ccbfd3c7c9;
	Tue, 12 Nov 2024 19:04:59 +0000 (UTC)
Received: from [IPV6:fd46:1ffa:d8e0::1] (sarkovy.koeller.dyndns.org [IPv6:fd46:1ffa:d8e0::1])
	by mail.koeller.dyndns.org (Postfix) with ESMTPSA id EACAC968AF6
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 20:04:58 +0100 (CET)
Message-ID: <ea13484a-ed25-4812-b6b9-928ba19531e4@koeller.dyndns.org>
Date: Tue, 12 Nov 2024 20:04:58 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Thomas_K=C3=B6ller?= <thomas@koeller.dyndns.org>
Subject: Re: connection tracking state in rules
To: netfilter@vger.kernel.org
References: <c7d037d9-2261-4627-8e46-bd960f1ab6d3@koeller.dyndns.org>
 <ZzOdbYay4hhiwqbZ@calendula>
Content-Language: en-US
In-Reply-To: <ZzOdbYay4hhiwqbZ@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 12.11.24 um 19:24 schrieb Pablo Neira Ayuso:
> Because there is currently no support for connection tracking at
> ingress.

O.k., I guess this is probably obvious to people more familiar with the 
kernel's netfilter subsystem. For the benefit of all others, it might be 
desirable to have it documented somewhere in the nft man page (or did I 
just miss it?).

So, does this mean that I cannot use conntrack state in netdev tables, 
since these only allow for the filter/ingress combo? What I wanted to 
achieve was to create a firewall that just protects one particular 
interface, the one connected to the internet at large. Netdev seemed 
like the way to go.

