Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3C10785
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 01:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054812; cv=none; b=k1oJiv+ZGNpS3aTwH1ZD4HX+gAp5Xd9xQCD7rpqxU96KUJ2Jryy8h3claWrB8IpI/p74/2kNNuM4/HJx+Cn1IzR4afUyd23xan0J4IZZjWRKM+t05Wh8sMUIjXANqR3xhDZByVApS2n7GBBYei0WDewUgKMBNHlnRv4Moe5De7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054812; c=relaxed/simple;
	bh=bdt7sTgQ95DXqJusUBNfNUS3k3K/uaJh+QOirPXtN9Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=B6kXRln9A1pGsrbZYxK7jcZNozfVJ8Jeh3zjnVfzWMl82TnRe8dEVdAM7pT3v/Pfv41JVfSUX5mdAVoWqFq0m3Pz3XI22FgI5e7OGAelM4Jwdlpa/QW21FoSW+m6fSsxQ2NDuKaGEwh5xqF7qw8SThuW71J4e4dX6jxMScUHZes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=TOfhnldN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OSKZoPZs; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="TOfhnldN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OSKZoPZs"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B66A4EC0190;
	Tue,  9 Jun 2026 21:26:50 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Tue, 09 Jun 2026 21:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781054810; x=1781141210; bh=wokT6RSj8D5rV4QmIG6O+3ykVj9J3ljY
	rnE8sHwme1U=; b=TOfhnldN3RT3+b5IRMqd1vM94snfY/V1UFVU5heWzGmggKmF
	Bi/YT5NJhA6DLwvEXgimMpDfd7QvllUAl9EAEWGiYjgKvLTVa0lNB8Xw/6sCFVyG
	hG+7fQmLKdrSZP+PC2nuI3q+vEVrLJoXUrdYsP74QRVQF04+cWZI1SopKNokLi6F
	Bio/L/mFH4qlEKC+jhhkz/ocNQBK/imhl/2H4mTpmugQvRbL6WqzMfAUfWWK6ihh
	61L7dASh01IZI26TEC7vKVeyiw5jAmzBraednTyeVJlozjEvTNRt9u79gXnlaeNi
	h/jLBy1YwNUqQGT4fxH6spfyG9kwOi4qYWZQWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781054810; x=
	1781141210; bh=wokT6RSj8D5rV4QmIG6O+3ykVj9J3ljYrnE8sHwme1U=; b=O
	SKZoPZsg2KycCXPqS9CY5dtvbR6a9YP37R/NeMm4mmxzqqwM8mth1Mu0jd3RPuly
	7kBHrm8P0/LqmtIlfZMemqr1IJ+XRynFOvh6KmHxVGFYSr6+j9jOrMGobkQ2EIyI
	1jYLxQLKjBu9ThESOigPBChXwDxq31fsSgzzENJrzl81zbjb15wHuxMJqHbVOfe8
	xK1QrmUbwBiQcAngn7Nu1Vn/A/O2w+USyfLAwCE74pZUrRCXxPoFJtXTVBeZ8YJH
	5MczWfWTd9vGYgfzAVX57Snaxdz0ZKxm6Gzx89YAz6HqDTPrlJvwsHErCTZJuZ4v
	Eo59DPY2vqyD39XqSaemA==
X-ME-Sender: <xms:Wr0oasYqbi-bdBgpshQURU0jGHZ8dzljYtUIHUyRiJwImkRe_Mb1xQ>
    <xme:Wr0oaiPubCoe1fQPUsPxbOjToTP0MFG7xCYduFIStAaMT7ckJuDrgiQPCm0JfxTxs
    iF-4EivzLhr3srJHYCF-CmnwGdjzau1qseiBk5yLFNjwkG9KhLccw>
X-ME-Proxy-Cause: dmFkZTFf9Pae/az49SNlEn7945wzLAYJ2FanjrPQCRNDbcako8O+Q3RrctsUzmNo1qKKJf
    bgqpngE+KFUqAUXMsfAsR90bi7VmTO8AnIsb+Bgmw4ygToetP5v+4Vxg9cuqSISiQHqSpl
    Pr7a5snBYif94o4QJ7Xq0JYoDURccce+gaf+ZYa0XRvD43ipiBbMD01It9PFQY5ynQXvgh
    /ajiq6gtwgO7rea8uToa9/NaEiZEsB8G2naFKysadHn8IPIz1JJktyomuQBa98XCnXz9X0
    lbiPtL0C5mKajjupHqKC1gRqoCTOhy3cO/HHGto9rkXcI6htLzD+mJmd7vDqVjGP+dwLl6
    MvEKy/fyrALS+cD6sybtqhGHZbicUXtUKEq7EMO3muWJSQIi0y+6ogUUymxVpaiaYJD/w4
    MR++R546t0/gAytn/zzvTX26tKHUXaYH5ESQtGxoOAKUixBbSHeXf7Zyi8H67fp/Gc1zpg
    7g146NLGXimSTPMMEDF6uPVw4iGSe5r3Z3A5kmDkeSPgt2vvW+FaWknkaE201iDl5WtRIC
    wEdXHZ+MCdAltO2Wu/Y3Z/WF4EIJnOajD6eLhCW6Di6AWdnXue+4b2C3GC1NeZJfZtTYKd
    MO2vZyin0GdYeBHeM5VvLwxsUGQ3ebz/cv2qtehgxTgsGzvrnHO3JgBWKdAA
X-ME-Proxy: <xmx:Wr0oanHPUIQwAJ4iX3u0NctwX9d8rCWxIamC67l1o-lyv_9HJLZiDQ>
    <xmx:Wr0oaiQizlIkAjda3jJyN30gd0pYKDEX3kRkzQRTn7pnD2gbXYWz2g>
    <xmx:Wr0oagtfZw_PfrI4cemGlvogatDDXS_v1rnRYQpNwOO9La4Y0kaA7g>
    <xmx:Wr0oahxFIzQkrBo0cru_QEOGjnwd4HqlaHuqJia4Es2nLeBDwRH1Hg>
    <xmx:Wr0oao9cl_DYf0qaJ1wzP9IUFd9YmBLu5lD0b3pKqyxzkzryFRZatDWp>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 90FEC216008A; Tue,  9 Jun 2026 21:26:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbmbupR3g_CV
Date: Wed, 10 Jun 2026 02:26:30 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Randy Bush" <randy@psg.com>
Cc: netfilter@vger.kernel.org
Message-Id: <6fcf67b9-4fee-4b1c-85f1-597afff788ba@app.fastmail.com>
In-Reply-To: <m21pef2ope.wl-randy@psg.com>
References: <m233yv2r20.wl-randy@psg.com>
 <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com>
 <m21pef2ope.wl-randy@psg.com>
Subject: Re: prefix len confusion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 2:01 AM, Randy Bush wrote:
>>> tl;dr:
>>>   o ipv4 ssh dict attacker getting through
>>>   o i am not an nftables guru; but a few of this have stared at this
>>>     for many days
>>>   o do i not understand cidr prefix notation?
>>>
>>> essentially, i am seeing the traditional ssh dict attcak to
>>> 42.642.11.82, when i think i am filtering 42.642.11.80/30, which should
>>> cover 42.642.11.82
>> 
>> Getting through to where? If you mean to an instance of sshd(8) that's
>> running on the nftables box itself, such is to be expected because you
>> have no chain bearing an "input" hook. The input path is currently
>> wide open.
>> 
>> It could also be that you're expecting your "forward" chain to cover
>> your proxmox guests. But if they are bridged, you may need to perform
>> your filtering at layer 2 instead (or also). That would entail
>> creating a table in the bridge family.
>> 
>> table bridge filter {
>>     chain wan-in {
>>         type filter hook forward priority filter;
>>         ...
>>     }
>> }
>
> sorry for being insufficiently explicit
>
> the ssh attacker is getting through to 42.642.11.82, which is a piece of
> hardware, not a vm.  it is the ssh port of a hardware switch whose
> security profile i prefer not to expose to attackers.
>
>     define VULN4 = {
> 	42.642.11.34/31,
> 	42.642.11.36/31,
> 	42.642.11.40/29,
> 	42.642.11.48/29,
> 	42.642.11.80/30   # <<<====
>     }
>
>         ip daddr $VULN4 drop
>
> and nothing to do with proxmox.  that is a separate security boundary
> with its own code.

In that case, the question becomes one of whether your nftables host is responsible for forwarding packets to "42.642.11.82" (as you put it) at all. And, just as importantly, from which source address. Try incorporating the following table into your existing ruleset.

table ip raw {
    chain PREROUTING {
        type filter hook prerouting priority raw;
        ip daddr 42.642.11.82 tcp dport 22 meta nftrace set 1
    }
}


Next, run "nft monitor trace". If you see no output whatsoever, even at a time when packets are definitely being sent to 42.642.11.82:22 then the packets are not passing through the nftables box to begin with. If you do see output, study it, for it will conclusively show how the packets traverse your ruleset and why they are being accepted.

--
Kerin Millar
