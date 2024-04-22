Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC615218E
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713796932; cv=none; b=MdVdYTbdQ29tLjP1Qm+qLhvm4p4XEkPiEZ4MJ8aTmlCNSbvT+li/DTWxQHstK8Rl3loTyMlMF11pofyBeZeKmblqU2UorFHTG3R952JOuK1oQQdyerknikvkH9ysXffdE7H2IfL0R9evbxdWoEJTskOCr+wVB2F2xPRgsd4uDTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713796932; c=relaxed/simple;
	bh=K5P7whjFWiQTuBno8rBGnJV9nFOp+wUyplHoHXUK3ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gJQuLVxs4owytm2JpXmlwVQA4lELPVaW4OAYKPw+f6xqnKKtYv7Ed+zxEz3X8pz3ys0LbuRmTIh/7/oTNfH4Pg/UbJjBK5NhsxiqyH5zTzB6VwWc1PO5oXorlycs8jLVelz8ZP/wpsfceKKOj63XCnSzlh3FU6SlsWeyDrrohL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naccy.de; spf=pass smtp.mailfrom=naccy.de; dkim=pass (2048-bit key) header.d=naccy.de header.i=@naccy.de header.b=pOYrFZ4g; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F5EnaGTB; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naccy.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naccy.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naccy.de header.i=@naccy.de header.b="pOYrFZ4g";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F5EnaGTB"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id C01D413812F7;
	Mon, 22 Apr 2024 10:42:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 22 Apr 2024 10:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=naccy.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1713796926;
	 x=1713883326; bh=+yIi3brrbrnVbSZ624NDO1b6aPUk48Zqa+/88LWMnhM=; b=
	pOYrFZ4gJ1YUaF0BaHkjCK5FdNQ7nPkQmJORMnoQZlS7eCmxD1gBn1hd1UH5WbFc
	OAtOXCsuNhVX031/lL0OfF88PBGYDW77S80/Lcfua4mdhHkOWmzQHjpgAVo7PprA
	VYaObPJ2A9K4bVuhA6dIiK3VD9GZNkzs1J1H4CtJSlDIsKkucLiRcbSQyf3he3RU
	G1TUqJ4Ihr3UIcu7lQcTevU3QcO5S/OGgrSIQhqHZVS5wrIM3c2wzjPJ28WVf5Hy
	+ChhJqZIHh8z5nqSINCKER+biuZRgXUlqSetuEeUEIA1Qscc6aN9paIzJgdto36g
	wIgE5NBCRltyC3iZW+hasg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713796926; x=
	1713883326; bh=+yIi3brrbrnVbSZ624NDO1b6aPUk48Zqa+/88LWMnhM=; b=F
	5EnaGTBjzDPyI79p88EVT6WPxCKdIXFQ+E4OXE0RYlFnDOJ3YBxyODdfynkESlNd
	IRt6eJR4m+SBo41AS3fzeX+kIZpHGu15mqLh0bBtF8ZjSALj41HBr8cf9D3v7XTi
	aJGo9n8YDunbcyLipzmNVO17qcfrnrJsRJ58D5xbJnnt+qmAjrISkq8j67mgeGo0
	euhoo0NE6f3ICy1zB5PXSxc/HAvamZiJx9VvENZuAtPps1OVK7/8U5HnMoM74lOL
	ei32aM3XL9AQciP8xO8z3Am8I7+6zk35UtIWJf9i+BTrJyp5QQM20vTa2wwC1urp
	1zC7a4B4VTr46xx6xEeiQ==
X-ME-Sender: <xms:PncmZgFCJf6P9R0JAJCU2G6XYaNK86SC309k6qksJ8JqJsuhuu_TTA>
    <xme:PncmZpUcDK4sy_7IjO8E_LOkNg7wXLzvA4m87gFbYZ578ivfQjUshcNQ45l50NPBA
    -Y1JWVAoUfE96fkm5w>
X-ME-Received: <xmr:PncmZqJhkoORPg3IPu-9jdORNTjOfcNrEHwMmM82jJwFyrZtlEXdtfjcXWaBka_1kN80S8eoXcfCmkgqpcUXk7I1gno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekledgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthejredttddvjeenucfhrhhomhepsfhuvghn
    thhinhcuffgvshhlrghnuggvshcuoehquggvsehnrggttgihrdguvgeqnecuggftrfgrth
    htvghrnhepjeeftdevffetgeejhfeihfelleeuuefhteegueevgfeuveevhffgudffgefh
    feeunecuffhomhgrihhnpehgihhthhhusgdrtghomhdphihouhhtuhgsvgdrtghomhdpgh
    hithhhuhgsrdhiohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehquggvsehnrggttgihrdguvg
X-ME-Proxy: <xmx:PncmZiGKRksGAXxUny-3E8qtopewEyMI6uW-5VyMrczbKRzxr6_pFg>
    <xmx:PncmZmU60p0Kzie6Vlzd1mWgc5Yiq8iOipbythwpeIHLAuUtEJ6GJg>
    <xmx:PncmZlM3_P4D1K3a5hvCzQW8ekd4SuoGpH8JWnB6a25QDNpAp2ZZGw>
    <xmx:PncmZt2xOZhfQ7LyxEVuRI1QbRczNqD2huKcVLoWRGpqIUK3Mk_udw>
    <xmx:PncmZjhPwtLVGHu31GlnFcw4XC37pb37fesTuV6X5wXMvfn_wHitz3FM>
Feedback-ID: i14194934:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Apr 2024 10:42:05 -0400 (EDT)
Message-ID: <b513f4de-6717-4306-b56a-70144a59dddc@naccy.de>
Date: Mon, 22 Apr 2024 16:42:04 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DoS/DDoS protection for end nodes
To: netfilter@vger.kernel.org, "William N." <netfilter@riseup.net>
References: <20240417194340.20430839@localhost>
 <7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
 <20240418121340.58c1fa6e@localhost>
 <07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
 <20240418153254.65058b50@localhost>
Content-Language: en-US
From: Quentin Deslandes <qde@naccy.de>
In-Reply-To: <20240418153254.65058b50@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/04/2024 17:32, William N. wrote:
> On Thu, 18 Apr 2024 16:11:13 +0200 Florian Kauer wrote:
> 
>> So the basic idea is to maintain the iptables and/or nftables
>> interface and "just" translate them to BPFs in the back. So no need
>> to write C if you don't want to.

That's the idea. bpfilter is the back-end working transparently to
convert nftables (or iptables) rules into BPF program(s). Florian
Westphal expressed interest a few months ago to offload nftables
rules into XDP using bpfilter, so I implemented it. 

While nftables doesn't support bpfilter officially, my fork [0]
enable the --bpf flag to send the Netlink requests to the bpfilter
daemon instead of the kernel. nftables support is still early, but you
can filter on IP and ports, and bpfilter will create and attach
an XDP program to your system.

> Then nftables can be used against DDoS with the BPF performance, right?
> 
> Has this made it to the mainline kernel or it is still something
> experimental?
> 

The project is still under heavy development, but there was a lot
to do in the background. There are a lot more changes planned in the
coming months to extend its capabilities.

See:
- https://github.com/facebook/bpfilter
- My talk at LPC 2023: https://www.youtube.com/watch?v=J5Hm6PrJWI4&t=27649s
- (Growing) documentation: https://facebook.github.io/bpfilter/index.html

Feel free to reach out if you want to know more :)

[0]: https://github.com/qdeslandes/nftables/tree/bpfilter_support

Regards,
Quentin Deslandes
