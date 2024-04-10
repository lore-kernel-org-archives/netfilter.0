Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C9181D17
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712785334; cv=none; b=EkOCu9VkNE0Shm+2+UvyB1mCjqqdmdbeKkd5Uo3x99lXJcoZX2SnKagD9utunrnLcY3y2Xz0tMp+fvj4Sx/LsJ15RI5k5qhY8k7vdoJaWTAkhaR1hLHnwf//E5dlvXIF0Tv4I8uA1VZMLn1HpUtMTB9lwGC2/c/0vmJtaGW4byc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712785334; c=relaxed/simple;
	bh=GuFKH0dUVduH3gKvvJMtkIGQVSeAXdRbtRRPBZVMyqg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=lfc4nLQ23mqAPR3v+oqo4FG7KcrmyL0ApBPhWezXOFbj6nr8ICHxBdRC3GA9EDPhAY7YXKpQJTfp4KLWBgRcFjQWYo+UvADssW1Zq9ZGxRMBQDr8FdKYG6O4UIXG4zY0IuFIpbxJcss9HDzcllVWp1HN+WgzZboUFkuhnrkhpa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=bWkiWB4s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=w4cO6zUf; arc=none smtp.client-ip=64.147.123.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="bWkiWB4s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w4cO6zUf"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 8F0751C000FE;
	Wed, 10 Apr 2024 17:42:11 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 10 Apr 2024 17:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1712785331; x=1712871731; bh=ns3ayz7u8W
	RgMCFCSxfX8wVTU7YDrMfSgVAMy9AEo9U=; b=bWkiWB4shb0NYX3R4a2FdSbLDs
	3IrxbvrLU+LEED3lgjxWzXZSwbIcB2FZM9miNBSap5q62E0klPd8JRRDl9UdCikF
	/fGLQcM4rJCF8coZpCAyPOJW/8/MgWHpTrvjF3YFycV0XC67t7PL2iIK2dNGUaX/
	/5yDGswR6+g733kWPKGV8UvTxBcHiguFTsarv98iyxS+dC9AMGvsv0i99djpoN2L
	5F5xXtIhk9+7dnf4hWpYxKMgHpDh9m4nuvv2v6rS5koqbk3ozk5a8i4ke0C8s2lb
	voUyaqpz461XM13nqBzmX6m+YTPJlQjBluJvq0o+myLeZnZIOPZSQOYi0qsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712785331; x=1712871731; bh=ns3ayz7u8WRgMCFCSxfX8wVTU7YD
	rMfSgVAMy9AEo9U=; b=w4cO6zUf/RjWiXXafpDeYAjrIEw+pTxyOwh3WDdFd7wQ
	IrD2RyeWCDKFneCQiHzvnThqfGTjXxpPSjhAnKaRGm999L4g+IJ1KgRolKkXVP8h
	uECiEmglV2DNkWYd5JOjFE67kgRS8PGL17NJhfDz9q5XKQw3MzPOc6iZXOdfL2fk
	fLlU6VVRTiWoIgFx6lpX+PFaisWGTzAMZr9QS7hHALAO0cJk6Fm0AP0Y8orM9HJY
	f1pxN6j47SV4UWm9/VY6Fm0qWpxsPy4nQTgITaj1FiKEPeAXVZOxyQ4CxTmWx2zQ
	qepErI+0hYoVB2ogGxTleKX+96WBKOEOgmq2hVjIJg==
X-ME-Sender: <xms:sgcXZijiFn1n0NkubBwOzzMWwz1Nn9TZxXcT-s1Y2spehG_V9rCxhw>
    <xme:sgcXZjBXxEaoQavR1ASxChGlGlr7aRi-Ow2U4ThFbbzYHb3fGxUTNeQbW_19t48uO
    ryNicZw1_JFJwHu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehjedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpedtledtieekheejkeevvedvfe
    dtveeuuddtkeetvedtueeiffetkeelvdefueffleenucffohhmrghinhepnhhfthgrsghl
    vghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:sgcXZqGXjn-wSxPqH2BvbEN19i8onZOHEfMCkqNMFjIW1aMB-l5ypg>
    <xmx:sgcXZrShQBfvV69UnynyQ5a8FuXZlmlgsaSnX1HlOFDcQcmXt6385g>
    <xmx:sgcXZvxVAF5ijtv0ug0oPPZWmnrcezqdbpzjiBuVEBZrcztTy3zKDg>
    <xmx:sgcXZp6gm6AbSe2mmTVNoVzBEYN04x4Af9z3WViQNA1ee_mGO86F_A>
    <xmx:swcXZoqvHmrdCEKE59_UgEyg4Jqg2dBMk4tSaeRegyv6AK9D9uniMUJZ>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B768D1700093; Wed, 10 Apr 2024 17:42:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f0514bc1-c1dd-4f24-97e5-8c40807dbae9@app.fastmail.com>
In-Reply-To: <20240410172343.1f7f5ee2@localhost>
References: <20240410172343.1f7f5ee2@localhost>
Date: Wed, 10 Apr 2024 22:40:53 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "William N." <netfilter@riseup.net>, netfilter@vger.kernel.org
Subject: Re: connlimit from wiki.nftables.org not working
Content-Type: text/plain

On Wed, 10 Apr 2024, at 6:23 PM, William N. wrote:
> Hi,
>
> I am trying this (in Fedora 38 and Debian 12):
>
> https://wiki.nftables.org/wiki-nftables/index.php/Meters#Doing_connlimit_with_nft
>
> and I am getting this:
>
> ./connlimit-example:14:16-62: Error: Could not process rule: No such 
> file or directory
> 		ct state new add @my_connlimit { ip saddr ct count over 20 } counter 
> drop
> 		             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Why?

For the avoidance of doubt, please show the complete ruleset that you are attempting to load. 

Additionally, compare the output of "uname -r" to the contents of the /lib/modules directory. Sometimes, people upgrade their kernels then forget to reboot before trying to load a ruleset that requires for one or more kernel modules to be newly loaded.

-- 
Kerin Millar
