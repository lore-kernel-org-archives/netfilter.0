Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2B219E96B
	for <netfilter@vger.kernel.org>; Wed, 18 Dec 2024 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528310; cv=none; b=OTmX5hxQtz4G8ooCHRuOADVreVZWJ1r5l5nqGoYWWd3OmwsO0ziQ9EOqj27tikHvLZPLdU6hyigSGx3Ez271qtgt6jrEGO80lCLoExpsLkgFft+qWkZ2H87wRdBX4Q+p1yWftstbDjK6QNcucMELMKfOJcqXR3e6KDWJnoQclpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528310; c=relaxed/simple;
	bh=PUGN96RMXk6qDKfWogo1e7SbELWF8jZ4GOy6zNYw1vo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r7xDcyXgMpJqZvN5sSB7r328Eh6V3iLbWSPk78m73VJNOdwSFobXBFZ1NaBCwCBYBl1uXxkXnX23CVb7MCLzYgpFEildLoifwBqePO01OewRvgz2n0FMlYYwjGWl6MpzIFLHeK24m3G9E41uHLH5TS6K/4cqHL/y9dT9NPp42ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=IyYgiI3a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hvrJTnzG; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="IyYgiI3a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hvrJTnzG"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2751125401CA;
	Wed, 18 Dec 2024 08:25:05 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Wed, 18 Dec 2024 08:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1734528305; x=1734614705; bh=wBCQsnhlyJgAa/T1Tk5RKKE5dxUK/KbK
	4vSAMUbr2h4=; b=IyYgiI3at2t+qjS2ubustk/iRiEKJEFMpJ3TI0JcP+9vZWvd
	Za495b7v2GiaqjFdPPHtTSMi/DlMdUXu+xoNH0jm8+ReJ9CnqpQEwAMWehC5YaLO
	LjDIILq39ievY8Mwiu12y5Tobi0RDVsPdqLaJH6xGDvwBs6kSXYzPF03H+FpBI+6
	nhdYbuGx63j1CJjMDdYXuF2t3yXxQWUTuLG9L8FkLJvNwW66pmAq7GkmWuZ1FdEM
	zEQ3oqnElZQbVtC5ihGv7U7OC2dEkzJpAvoJoShM+rRQNhK19fDFOtxA+fO0ATFv
	wgQXAEsSuzFygHMGvf7I0Bgz1XwG/H/syiS3yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734528305; x=
	1734614705; bh=wBCQsnhlyJgAa/T1Tk5RKKE5dxUK/KbK4vSAMUbr2h4=; b=h
	vrJTnzGkPTdtK/dW0D/L37Lz1mAriVDbomvUvB0bi9xjO45socEUWva20bAafdSc
	o0m4LuS2ahi9gFAOHDcMuF8jTT16hyxLr8zXqT45Ckhrdxqfyl/T2Ggf+z+zsTK8
	Ie1LB6ysQBZtb20h8FAYxRz+U4D+sAWnn8mhch48/Kg4Ur/rmDmyaBAkJ8qQyjfm
	CB1zWPPxr9+MuCN8dI+ofIH1/WeIZa5Ls1TMZVY+mSdCQOCexGIyiZzm3smxfBZ0
	WVd+i+o4hBuCCPv72JdxPDM08CdT2BzFXN0GYXBRdsiJKRp95WbkD8y4NZSn1kbl
	QelLcRKNTKmzbN2EyPiPQ==
X-ME-Sender: <xms:MM1iZ6Jvv3JqL3LId0nuA5hrtnAW2ahx9hNd4Cdl5-V11DcmSrGgUQ>
    <xme:MM1iZyIwHIfuD1182w0C9VhkzO1sO4coAF761KNxfDGh3T4XMbEWkjHFqIo4a1tA4
    DRAnuqhj0HNHB8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggfffhvf
    evkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghr
    fdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeffke
    fhvdduvddtheevleelteffjeejgedvieehkedtheejvdelgeetfedvheevgfenucffohhm
    rghinhepnhgvthhfihhlthgvrhdrohhrghdprghlmhgrlhhinhhugidrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehkrghssehfihdrmhhunhhirdgtiidprhgtphhtthhopehnvghtfhhi
    lhhtvghrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:MM1iZ6ti96yuFqMEmPKG5mqF8sqMPY102puch-aACZrhiAw8Tp8Tkg>
    <xmx:MM1iZ_YQgmzDiJVfJ5GEbh2VviNIFvnoCJft_NbdvCt1S-KZP32GqQ>
    <xmx:MM1iZxYBqkHEPvQfl22TpIpFG2ZCuueodHpFjZ76mRdutP-dXyPTZQ>
    <xmx:MM1iZ7DWikegBojtD0QEbl0hEVm0qwo9V7xiXc25CfZqV24CzybmTQ>
    <xmx:MM1iZwwFMh7xwkt9kZRWvvbW8HkXNb8gPweAH1-ZdvVcVQ3tSYju_2Jt>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C0E123C0066; Wed, 18 Dec 2024 08:25:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 13:24:44 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Jan Kasprzak" <kas@fi.muni.cz>
Cc: netfilter@vger.kernel.org
Message-Id: <bcbe13b6-7859-4818-8fae-3cd07ffb2c82@app.fastmail.com>
In-Reply-To: <Z2LJfd2t+8E1cH8R@fi.muni.cz>
References: <Z2K7YwrEyJqzTWtV@fi.muni.cz>
 <4fa1f631-bf9c-4d20-9830-31d3e57297b5@app.fastmail.com>
 <Z2LJfd2t+8E1cH8R@fi.muni.cz>
Subject: Re: nft table flags documentation
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 18 Dec 2024, at 1:09 PM, Jan Kasprzak wrote:
> Hello,
>
> Kerin Millar wrote:
>> On Wed, 18 Dec 2024, at 12:09 PM, Jan Kasprzak wrote:
>> > Hello, netfilter users,
>> >
>> > I am in a (long overdue) process of converting my iptables-based scripts
>> > on my servers to nftables. I am also looking at what setup other users have
>> > - I examined e.g. the configuration created by firewalld, and there are
>> > some parts which I cannot understand from either nft(8) or nftables wiki:
>> >
>> >> $ nft list ruleset
>> >> ...
>> >> table inet firewalld { # progname firewalld
>> >>         flags owner,persist
>> >
>> > - where can I find what these flags mean, and what other flags are supported?
>> > nft(8) lists only a "dormant" flag in the TABLES section, but not owner
>> > nor persist.
>> 
>> https://git.netfilter.org/nftables/diff/doc/nft.txt?id=4955ae1a81b73f9a61b7fbf1a73e11544513548e
>> 
>> For your convenience, below is a textual rendition of the relevant section of the man page, as of nftables v1.1.1.
>
> OK, it seems that I should stop assuming that Fedora has newer versions
> of everything compared to rhel/alma/rocky. Currently both Fedora 41
> and AlmaLinux 9.5 have nftables version labeled 1.0.9, but Fedora man page
> describes only the dormant flag, while AlmaLinux have all three flags.
>
> Thanks for explanation and sorry for the noise.

The reason for this is that AlmaLinux backported the relevant commit.

https://git.almalinux.org/rpms/nftables/commit/3d2e43c

-- 
Kerin Millar
