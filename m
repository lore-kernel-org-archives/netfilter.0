Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD517BA5
	for <netfilter@vger.kernel.org>; Sat,  1 Feb 2025 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738405888; cv=none; b=UFJ2RqclsMKVv2Xr2x6dAvJsBAXpRNxz8k/9QpqwA4bzyRSKNIS4dW/yFQHLCNRk+CleTt/cIxOpRHXHDlf3JlqQjYQbe7cVfjhjTtAkqZE/qFPhcyQPJTSnk89FXMMPp7/NN7r7MKg8GxPs0qjCL4TNYVQae+PEt2hemvppa4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738405888; c=relaxed/simple;
	bh=qOQugjKsfUEYLxCquboeW8Q59nRNSW2/Jx3URzHEzko=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gjBzbYfU1Q0ozPf7NPJDZmMLWJ6JaKewrMDwGoh1i8Y5CRlSk4xPaGgKxvYfMtp25E5iiOcjMbKwlBc629ZhaGFBE8JjsjwRRJzVb1gQ8FDDDXroCdUv92wgoBc9RA++F1zbRlkzvxtZsXUE1Fy8kpoePseB07p11n30f9OrYxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sent.com; spf=pass smtp.mailfrom=sent.com; dkim=pass (2048-bit key) header.d=sent.com header.i=@sent.com header.b=FcSw9QMe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j1fPPQCB; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sent.com header.i=@sent.com header.b="FcSw9QMe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j1fPPQCB"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 69CEB11400AC;
	Sat,  1 Feb 2025 05:31:24 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-10.internal (MEProxy); Sat, 01 Feb 2025 05:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738405884;
	 x=1738492284; bh=2VF++h2YTkUlw6o9GHaM7zuwUaFtjIfY5avjZgB/jIY=; b=
	FcSw9QMe7la2lYnMTDnNLcT2ufdDLBaxiOnTkmNIOmnzcsEeNGHDQrV9uvqzLRVm
	kjWRYZesyvvcRlSva4YBNQmlmFpIG8uaHeFP6/PCvKaaHiq489iSht6TA+Et6pXY
	jG0+zvFsv3iZBFv0XveytjmcITF5qFn4WmPQ31SkHWZSqQx75Ycr0uQQjDl04IzV
	qqoaCrImEGGMe+frTXwyBXBj9NyU4HKwM1VO83BgQGMw2gYhQAn8cphRNIn4UgGV
	xIl0WdHl+z/3nQsAWJk4eWkmlZTLsCxSrHb7PqFrS8S5sVNZz+RQKiR5XeQpPIjR
	8aNMI86zX1iYApZbZg3RXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1738405884; x=1738492284; bh=2
	VF++h2YTkUlw6o9GHaM7zuwUaFtjIfY5avjZgB/jIY=; b=j1fPPQCBtDMxHYzMN
	jYrR3Ul7jEJ5Aq9qWcnrsZybqCwzjbLYlmtQCSug7fKjiVcgm2XYgdv8cgUqNKgC
	QPVmySuvva3xc3xOVEpC2UjI1IX+0kOM3wsTvN6+SVM+lPzF8Q+Me/fZjhB7I5BZ
	PgHyKS3L3Bfs68nkikf3qW4NSRd+Kj9IRKuWj973QLtbNZxZPexjFzwpXlbfF/n+
	m776f9rAqVnZ8TNPm1ISXrUzOJB5Z+tFKOz1pUuZAPjGVAslv/oC0qcnlu7tRwjf
	+/fUjjtLd1iU28cN/inPoVOXqDip+1CojZNUCqaV2OTHc3dDYsMOIoQuMFALREL+
	cFYjQ==
X-ME-Sender: <xms:-_edZ9tQHZ_FfO7zVdw5XwVMoKtLlW289d9vEMXqLUnYURXdTSGJqg>
    <xme:-_edZ2dL-tFYaEjV2X_kiuDXmS469Ol_iLL2Ktc0WBxgsdFMokCxfy0hHE-aaT6Np
    qQ3g8FhzFX_EacY8TE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggff
    fhvffkjghfufgtgfesthejredtredttdenucfhrhhomhepfdeuvghrthhoucfhuhhrthhh
    fdcuoegsfhdvtddvheesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeektdeghe
    ehuedvveevteetuedvffeikeegfeetuddtudelffdvtdfgtefgtdffieenucffohhmrghi
    nhepshhtrggtkhgvgigthhgrnhhgvgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsfhdvtddvheesshgvnhhtrdgtohhmpdhnsggp
    rhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhsthhsse
    gsihhnrghruhhsrdguvgdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-_edZwz9pBOnpczKHL6OhvTrSwf-GX5wWVwCBGKSMqNNycbFHDsr0A>
    <xmx:-_edZ0Pyi4yp9mtj9YbmxepBI6frjopdpt2NuyXDTRAcD7L6Au-gmg>
    <xmx:-_edZ98cRj_5FM7XqfasWu3gqBIrUAbFAr9Yf0KZJZl2W5VQmPWeKQ>
    <xmx:-_edZ0VBRW-rgIy6vnfMvfu3eLteQmDx3e9TOE7BddXEimYzRBTElA>
    <xmx:_PedZ_nih8XFs4ueL_xBmGx0C9Hh7vQqx2uhPBae8cYyJWIME_r10klp>
Feedback-ID: i9e06489f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8175A2800083; Sat,  1 Feb 2025 05:31:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 01 Feb 2025 21:30:58 +1100
From: "Berto Furth" <bf2025@sent.com>
To: Binarus <lists@binarus.de>, netfilter@vger.kernel.org
Message-Id: <5c0ffbb9-1bb7-403f-af74-dca23f8fefd6@app.fastmail.com>
In-Reply-To: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
References: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
Subject: Re: Netfilter not dropping packets as it should
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Binarus,

A non expert here....so my answer if probably rubbish...but anyway...

I went ahead and loaded your listed configuration into my /etc/nftables.conf file.

I got an error when I tried to load your configuration and as such IP traffic was allowed because there were essentially no nftables rules operating.

The lines that generated an error were as follows..

# nft -c -f /etc/nftables.conf
/etc/nftables.conf:27:26-40: Error: invalid priority expression value in this context.
     type nat hook input priority dstnat; policy drop;
                         ^^^^^^^^^^^^^^^
/etc/nftables.conf:41:27-41: Error: invalid priority expression value in this context.
     type nat hook output priority srcnat; policy drop;
                          ^^^^^^^^^^^^^^^
However when I replaced "dstnat" with "-100" and "srcnat" with "100" the nftables filers were accepted and IPv4 traffic to the unit stopped.

The diffs between what I used and what you posted are as follows

*** /etc/nftables.conf.binarus  2025-02-01 21:25:46.418090954 +1100
--- /etc/nftables.conf  2025-02-01 21:25:22.198057049 +1100
***************
*** 24,30 ****
     }
  
     chain input-nat {
!      type nat hook input priority dstnat; policy drop;
       log prefix "ip4-input-nat:" drop;
     }
     chain input-filter {
--- 24,30 ----
     }
  
     chain input-nat {
!      type nat hook input priority -100; policy drop;
       log prefix "ip4-input-nat:" drop;
     }
     chain input-filter {
***************
*** 38,44 ****
     }
  
     chain output-nat {
!      type nat hook output priority srcnat; policy drop;
       log prefix "ip4-output-nat:" drop;
     }
     chain output-filter {
--- 38,44 ----
     }
  
     chain output-nat {
!      type nat hook output priority 100; policy drop;
       log prefix "ip4-output-nat:" drop;
     }
     chain output-filter {

I hope that helps.

Berto.


On Fri, 31 Jan 2025, at 06:35, Binarus wrote:
> Dear experts,
>
> this is a cross posting, see 
> https://unix.stackexchange.com/questions/789174/netfilter-not-dropping-packets-as-it-should. 
> Since I didn't get an answer there for a couple of weeks, I am 
> repeating the question here in the hope that the problem can easily be 
> reproduced. For me this is a very important key point in understanding 
> netfilter / nftables.
>
> Please consider the ruleset that's at the end of this post. It doesn't 
> make any sense, but it lets everybody reproduce the problem easily.
>
> With this ruleset, all IPv4 packets that come in via enp0s3 are 
> accepted in the ingress hook, but finally traverse a chain with a drop 
> policy. Each of these chains does not contain any explicit rule besides 
> the drop policy, and thus should behave as it would (only) contain an 
> explicit drop verdict for all packets.
>
> Hence, applications on that machine should not see any IPv4 packets 
> that originate from other machines.
>
> But they definitely do. For example, I have an SSH daemon running on 
> that machine. The daemon listens on an IPv4 address only (in fact, I 
> have disabled IPv6 on that machine completely by adding ipv6.disable=1 
> to the kernel command line). Even after I have loaded the ruleset 
> below, I can connect to the SSH daemon via IPv4 from the outside 
> without any issue.
>
> Can somebody please explain why the rules below don't make the kernel 
> drop all incoming IPv4 packets? Did I misunderstand the purpose of the 
> drop policy?
>
> Thank you very much in advance, and best regards,
>
> Binarus
>
>
>
>
>
> table netdev t_NETDEV_enp0s3 {
>    chain enp0s3-ingress-filter {
>      type filter hook ingress device "enp0s3" priority filter; policy drop;
>      ether type 0x0806 arp ptype 0x0800 accept
>      ether type 0x0800 accept
>      log prefix "foo: " drop
>    }
> }
>
> table ip t_IP {
>
>    chain prerouting-nat {
>      type nat hook prerouting priority dstnat; policy drop;
>      log prefix "ip4-prerouting-nat:" drop;
>    }
>    chain prerouting-filter {
>      type filter hook prerouting priority filter; policy drop;
>      log prefix "ip4-prerouting-filter:" drop;
>    }
>
>    chain input-nat {
>      type nat hook input priority dstnat; policy drop;
>      log prefix "ip4-input-nat:" drop;
>    }
>    chain input-filter {
>      type filter hook input priority filter; policy drop;
>      log prefix "ip4-input-filter:" drop;
>    }
>
>    chain forward-filter {
>      type filter hook forward priority filter; policy drop;
>      log prefix "ip4-forward-filter:" drop;
>    }
>
>    chain output-nat {
>      type nat hook output priority srcnat; policy drop;
>      log prefix "ip4-output-nat:" drop;
>    }
>    chain output-filter {
>      type filter hook output priority filter; policy drop;
>      log prefix "ip4-output-filter:" drop;
>    }
>    chain output-route {
>      type route hook output priority mangle; policy drop;
>      log prefix "ip4-output-route:" drop;
>    }
>
>    chain postrouting-nat {
>      type nat hook postrouting priority srcnat; policy drop;
>      log prefix "ip4-postrouting-nat:" drop;
>    }
>    chain postrouting-filter {
>      type filter hook postrouting priority filter; policy drop;
>      log prefix "ip4-postrouting-filter:" drop;
>    }
> }
