Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ED183CCB
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720646854; cv=none; b=CmHJs9waaPyKB6z8ThEt2tCkbntXTX5RhGgnDx3VUgduQGpE52tkfOYyCInrFERjnfYbUs5jDeVA2hUnKqhznjtdWVBPEV0hhWDS4ZjhwswZbvrDVIbgbkKqqGmgqtyuQyTNyqF35zGR5mZ449cPr/y2NjD5FyJjDSzpUitiDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720646854; c=relaxed/simple;
	bh=AZhyj9GEoatX6MsJTLeeviVTjfHQG1pCZ9/pGqmNHe4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=ru5JQHpvsTemfu0JaIdg3p/3MGn5vghamtgFwtPxldqpSc1gceblwWY5bfWdQ1cOYEo9ffro+sj2xBydm9cP7SR4QxKXIUvOjJ3xfgLAuuYJ3cGfoI49cw5XAMRc/FzP201PAtAJnZ8L7+ZmBqDQB+9/0oJaDw6I3lIGVMrvHHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=bdKUiDGU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RB5LNtwS; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="bdKUiDGU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RB5LNtwS"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9F0B4114068E
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 17:27:30 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 10 Jul 2024 17:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1720646850; x=1720733250; bh=tQ+Wuu6Tf8
	HcQLrGlD9MImf2mm57Y7occ7dJrZ7r1+c=; b=bdKUiDGUq+agb5h/s0X3eryuof
	WuRXdZDqQcLaQIS2r/mnvau1aExOgxHX8BbxAdVboDmzOUfqOA+u4exgv8MpmIQM
	U71u5ZZybAEn9Qjrh4VyDDuqaxcnBdAGidUwbz2C3p8/WaIpmhkwCFw9xJvlGRnw
	/8OwMtNBgMbGC/cC9czcHCsnbCPlVXHIypQLG6tXD0XJg/ozQeAr50OGu+FqZ3uN
	2hBRQXCcTAaWft22yonrep6hwaH+gmMkahJJqpO0t+vFG2uXA37mNnDRlfbXlxVH
	J4zmGNrKTcfLJANY67tylwkpnoidDk35eALuMS5NZtoL4p1ud2PY32S7380A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720646850; x=1720733250; bh=tQ+Wuu6Tf8HcQLrGlD9MImf2mm57
	Y7occ7dJrZ7r1+c=; b=RB5LNtwS4rj3oqqjRdOF3g+dZb8sJjxhtHPYybG+hEQy
	gv7Xdi3itIWIW1c9kWVtHR6+ZPsCt+p3lZJbU+paK0MGtMNWnnWI3MP+8tDNriFc
	9oXJwqKDYQNjto0j20UMLTOjvQ4WGtrPdZtUo+dtcObt35/ApvY91vZhG9YiK1Rb
	1ihcul5dzwPN5xAOwagU682nnRR3DEWOB2u6rImn7OvMWqjp2u3/4jjPrs/3J8hC
	8H6a0aGwPgnISEHAwvGS5Lln/t6B0V5VZDzF2PGivAoSAIWP3EjW2QV/Mk+i5F9W
	WhjZPKtMfhXKBz4LmJCYs60iJg845GAkIfeEIRQ/BQ==
X-ME-Sender: <xms:wfyOZqGOVM38gVQlDlE3Ix8axIDPYAb5PL_4vYwno8U4JdueFpe-tQ>
    <xme:wfyOZrV8h8e6zZKTnWN3V3dYmUuqKHZl9eDo2VkPFlm0LLC9tLoegMKbYQNgB8K8E
    PgTuBuL77xY7Ovl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedvgddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:wfyOZkIP95Id4FqSSr6r1EmbuklavIVCLyuWRtTFIivXkLBxMbC4sg>
    <xmx:wfyOZkE3ohwQYta0QFzJQpisi9rBs3bSTJFBhQFNT0MOVVDsqRkGyQ>
    <xmx:wfyOZgWx5Xjvu1lNcXkUbHCVcucJMh8fNlzwZFVTwmvsmtOZ1t5Mag>
    <xmx:wfyOZnN5Wd54b8CENKPxV8_TOVZCn2RYmtnEVWR6rIHCxryuxSAM_g>
    <xmx:wvyOZpcSKr9x18VZDaZpgMry0u4BE4eStSmL8F4EOp5O0-ntlag4pCrk>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7037F1700093; Wed, 10 Jul 2024 17:27:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1c12afa3-40fd-48df-9076-92277570ef3b@app.fastmail.com>
In-Reply-To: <20240710183451.0f193976@localhost>
References: <20240702190318.618a3933@localhost>
 <20240710183451.0f193976@localhost>
Date: Wed, 10 Jul 2024 22:27:02 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables rule optimization - evaluating efficiency
Content-Type: text/plain

On Wed, 10 Jul 2024, at 7:34 PM, William N. wrote:
> On Tue, 2 Jul 2024 19:03:18 -0000 William N. wrote:
>
>> [...]
>> Also, it is not clear what is the actual "load" of different
>> instructions in terms of CPU cycles and memory, i.e. one instruction
>> may look as "one" but may actually cost more than another 2, right?

Indeed. It cannot be presumed that all instructions are equal in expense.

>> 
>> What is the proper way to evaluate and optimize rule efficiency?
>
> Are those difficult or somehow inappropriate questions?
> Or is there a better place to ask?

You are enquiring as to how to assess the relative efficiency of the bytecode instructions through the direct understanding of how they are processed by the nftables VM. Said VM is unique and - as far as I know - wholly undocumented. As regards difficulty, the intersection of people who follow the list and possess the necessary expertise can probably be conveyed quite comfortably by a single digit. It is a pity; I would also have been interested to see an informed reply but the absence of one wasn't altogether surprising to me.

-- 
Kerin Millar
