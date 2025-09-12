Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A741C62
	for <netfilter@vger.kernel.org>; Fri, 12 Sep 2025 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677261; cv=none; b=XSlTG3qXTrtEOZxsXs4qwAGybIf1oeZSjLawPYH/tNtu/q4PllMtjF9525JGUgWGh6QvkHqQ4qJw59M6yzalsRogbsfENCwtVVtbemfDQ2RpdPQB5hPX2ca3b0B2193FsFOL9G9JpqS7wy1aIzvfxL6ltWYBgV5UvVKsimEr01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677261; c=relaxed/simple;
	bh=4HXw6tRv+dRG+RdLqxrGfpS5D+8N/aq3PD+ahcc1zjc=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=P14Ju/3TF3jTiTd6O96a0vAucoPr0QRT5+2n0+0zemVjznLWfiaT17urPDMAiTckZLJPAxwOWjUsDjn1645tjgwdDlr0JALZfdXM3/wzyPFPQoDQy8U0wx0MfLn3LKkYr/gJFj+uUQozMZ2e8kQlYY5ktE1W7L7zeKrZI1DJlQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=placidnetworks.com; spf=pass smtp.mailfrom=placidnetworks.com; dkim=pass (2048-bit key) header.d=placidnetworks.com header.i=juan@placidnetworks.com header.b=dysYNomb; arc=none smtp.client-ip=74.208.4.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=placidnetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=placidnetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=placidnetworks.com header.i=juan@placidnetworks.com header.b="dysYNomb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=placidnetworks.com;
	s=s1-ionos; t=1757677258; x=1758282058; i=juan@placidnetworks.com;
	bh=b6EeiBb2WLF23Ey+Jd+y7ZY+wU+9XqsH7kRRLN7Rt0s=;
	h=X-UI-Sender-Class:Date:From:To:Message-ID:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dysYNombJP1Ez2mlarUWoOs4GNGjFGdMbduuZjfFR5lAx5w7HopvP++UqvDL/bjB
	 B+5sXfAeK8U3nkYchiG+lWWqiW+ppkC+dhNjBmlIs6vHNhYow/5k+pQv2jtKMK633
	 x/7rP98vRaeOA4JqG5xL6p4I9DHpUpg3sNvFxsqgsvRzFS1P/axiH0rRgvDLHDAfY
	 X84IB/tBkjcIr6xGS55nD9ftD9do4xRkh7xAqaHJOhpHUhgg7mfB2ONM9fBpDsyJT
	 u5tLTgWddg1ZEFILdBE0RuS/PEgqd3DZ1BIhb7NDqa4rnz+95+jSrxVqjOwmzfQX3
	 IUECvPiKP58hc68HAA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from
 open-xchange-core-mw-default-12.open-xchange-core-mw-hazelcast-headless.open-xchange.svc.cluster.local
 ([10.73.158.104]) by mrelay.perfora.net (mreueus003 [172.19.143.1]) with
 ESMTPSA (Nemesis) id 0M87fT-1uB87u35Bh-014BNP for
 <netfilter@vger.kernel.org>; Fri, 12 Sep 2025 13:28:03 +0200
Date: Fri, 12 Sep 2025 06:28:03 -0500 (EST)
From: Juan Carlos Lazcano <juan@placidnetworks.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <1643443761.529082.1757676483522@email.ionos.com>
Subject: Stateless NAT in nftables with maps for performance
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.38.83
X-Originating-Client: open-xchange-appsuite
X-Provags-ID: V03:K1:y60IWhr8z2scx9xKlSRmrK27B7P8Op8y2vCfkH4TvWk4w14/WgX
 u+M6AzOQbcPKcDW3U+rY9hyT3vzeuk8moUW5lt1/wON1ETePZtAtcreImQqBsf0PSUii5jm
 thVQxfqDSVmoPsQAOlrH6ACh4TscD8FC/hwhd1Cwus+iIi2Q6Rx+wfK5Xc28+OmAp6wpvsC
 Y4SxqQQ6Q1V+92sfPvdNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Yszcf9WeQJ0=;Koq7IGG3FP1exr4BLyvycVEqlqF
 sCBnyajXf6l2jQiMnSqxlZXjNwAr3rIT5+IO1p2GbQHtxrR0w23iu4znMyQ7uvravV2oKYKSt
 CGFQBWxFv6sKQ55yYGAvl/CigKMTc2Pz2IONfn9XVkFFddFAqoShcW9Pe7YglwENzd/us7gVO
 sCllnvescrIOeeA3MBjQQz96Ba0K1bjvYLcpPKvVjSJ51o1gEZCST3ynJJHKCh6sjR9w6lyOf
 iYVgMuRHEEBnDFgLgYwb+hiJZfF1N/QtIxGl5VGVxissy+C38/q4KfgFkBivZw8ZYhwAbpEzv
 xzDHnLlO66S9G6v48znMQAI5En62y3ZSNUb86lbDThAOgUIb+oBlH7/DT90Op4TvQoTVV1/Zm
 IUP4O5JjqHqp/JL/GdR16DHvv5k5rr7fEOv20CPN/Oe088sE4Yn/zMMOgcHYcInql9c6sl52u
 7EvBgEQIkenav8rwnmN7w90Cw20c5GWTov+gGtRUH1xxQnc2+0exBfDwNR6m7Yr3xVUW61ZwY
 ybFkzAtdXRG1njhaHygvVnyHmjNU1SnV/3s6nQDn2KlZ5ZlS5sJZH4lLlw7o5xcBFea40EOf7
 IZ2Wyj4DvpXVVR7NFe/ZSYG03iMozkB45tsRozgW95+2lJBWlela5iuPKomsene0x/rPo0Uwb
 VA6OtYYmsLRJSSa3GO0muzxemae81iFVzbGEwuhg4IneKV7bq3rEtRa4SJTAMA5cXG5H3NWNY
 /Uw53wplIMEovssSDu/yirbqTJIVei/yDVENf/SUoSyCJIqQfW/YCjx+wZhYCAmYrBGOB9KkP
 wdpbyAy/hqraVKQmVehKL12RGxocP+tkw5FIrboIfpJjACGz69Xjh+i3/Fsm92wN8OhFaQlqH
 /HuQYegUQevPblcZqi90izMGyOIb9GwxaMlQmTx99AOARMGFT5nq0sKAZt4GRIIq9AGJhaXg2
 toKv195Ojl3sCvF+KOk2hmGLMMFWGjKjJXgRy6lUK35lAz8j0Br4CZ89h74QvDdaPBMw9OKc5
 9LKc0LU+966RL0Wx9Fx/wtkrPnMo2pQAITECRBzNRXxH8+h/QVzntgz/Fp1Og/K+LPKm6CI5F
 dUlGZmXnnhyvsB35+HXxQMhCXKcIGpHn0u8hAJYz42kxyi4OK4fMhKk1REgXp2cto3mtZRtZd
 2yq21+DpJ+VT493BT8GG2fL6zIw8HpEMK+7EwIffJy59ho6Nf7iy2JUdYnO3O4R1SsFkE16dv
 7JNcM8M+AnwKe0s78CFHGvDYBdyMkWgEWWOM/YgjZIxOuKjSb+HpiQJbL+UXGKWaXSOT3+j0M
 XR4LZoMf9x/9VvM5zcsHYl2DN4rNe/T4d+ClXeM6IF+kOqF0hxjd8/t391zDrS6piLZiyUgmj
 qLn+I+E3euyxOFjjOgJpwQxVvl/Gu6H1A+zE3q+X2EhNw5ul5CjgnpB5zP+3QcmLHBlqWp7eH
 Zm2LY3mxUyrBBg5EGL/EYdfv7gcxFNm82MNgJYWuKULablfAzM82wEwja3RwMoXnseJ0rjVWU
 VvfWZuBnnMy0bKloRZnjeWnyqR0y/qMDQHnyH+34Y8JkVu+RxecxK6fNLlsx4FO+xG940IWMg
 ynKe85z6t7OUHc0qBZLCknaWFcDJa4H1Efdm5WH8gOXfy85UG1gQC0iIpBRgrVMYoJF10mZXM
 g=

Hi netfilter community!
I'm trying to orchestrate the generation and maintenance of thousands of dnat & snat rules in a stateless configuration within the prerouting and forward hooks with chain types of filter, and unfortunately am hitting a big performance barrier as a result.  Its fine with a few thousand, but once we get into the tens of thousands of rules, things start slowing down linearly, which is why we would like to switch to maps.  However, I cannot figure out 1) if maps are supported in filter chains within prerouting/forward hooks and 2) if it supports the syntax for stateless nat?

For example:

table ip mytable {
	map dnat_map {
		type ipv4_addr : ipv4_addr
	}
	chain dnat {
		type filter hook prerouting priority raw; policy accept;
	}
}

I normally generate stateless dnat's via:

$ nft add rule ip mytable dnat ip daddr 100.101.84.137 counter ip daddr set 10.11.1.32 notrack comment "comment 1"


But, lets say I want to try to replace this rule with a map.  If i populate my map with a a key pair like:

$ nft add element ip mytable dnat_map { 100.101.84.137 : 10.11.33.32 }

How can I represent my original rule using a map?

I've tried:

$ sudo nft add rule ip mytable dnat ip daddr @dnat_map ip daddr set @dnat_map
Error: unknown raw payload base
add rule ip inode dns-dnat ip daddr @dnat_map ip daddr set @dnat_map
                                                           ^^^^^^^^^

and a few other variations, but I cannot figure out if this is even supported.

Any feedback would be great, I'm running nftables v1.1.5 (Commodore Bullmoose #6) & kernel 6.8.0-79-generic x86_64 on ubuntu 24.04

Thanks!
