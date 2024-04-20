Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C6374F7
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 20:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713643866; cv=none; b=ubBsxob/MDVvOwMVJUammYhPERoFTusDCP5NYLdHjH3O+TFlVaYRZX4Qc1JYWAfq2xboafIGNWhdL3utjSa0mYq6aTPws0R99vJrCYsSI9kalCYyuNQ1GDVhbnurnbQhoLbx6isjlAMP8dYYOF9EbISH2tDiKaVsebc6Z3X5U6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713643866; c=relaxed/simple;
	bh=jYB6OERXHEECAHtyYz5kxzoeAe+94I0jinlGQsE+Le0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=pczlYUHOc6hLIrHAw8fs+CCkjn20Kc8fTLHU+qyTD9FZYW71c35mpzhxgIHrN0vAsaATk6zkHXMQ+XXX6jK6OUN6yCl7OxgXQs/NRsXDmOXsJSwZTuk+hv8jvxLY3PK+WoJK6wHw17xybZWAWqen6+42//i94dkzKFfOeWzS2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=amH63AjJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GKcdU9Pd; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="amH63AjJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GKcdU9Pd"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 2EBFB11400E9
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 16:11:03 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sat, 20 Apr 2024 16:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713643863; x=1713730263; bh=gfj7EvFsph
	pX/nPulh9HbGOBo4B/g2VKt4yepupVMqY=; b=amH63AjJHzTL6FXtkkoaWzn65b
	/BSgeA3BVj84Ims+k2o/LHFzdTeYNFNZJtKH/asX2u6gEQhsrbsQIppkx080OB6O
	L/9wucqJzlyZZFwsVkr81FA3thS8Y9/AXRmGB/SHrEy+fdhoLv8LKzlmVUbrr+11
	qPRZHzqvt775rQ1eKZutUVEQIz3Amta+WgPmq48xBuRnrERLdTqnZpHizu3IHYA/
	nAdTxhl2HugbiPKx88t8yX3TW9wRUDCKRv8irYjOxhtB/drBy23j45c08rhGY+zn
	9fvmQPKahXkb5NMmGy+juuyhky6uDKsBg9ScBt7LwfHJ/3/jqtgnIsjQ5f3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713643863; x=1713730263; bh=gfj7EvFsphpX/nPulh9HbGOBo4B/
	g2VKt4yepupVMqY=; b=GKcdU9PdKAEaXqWwygu2Wslf73HgNuzFN2nfmAexKfLL
	rrYQw6WkPPa6Iujgbho1B48WsVmR6g18S5D06jJjHfZZ/RV5vG7w2KKOkK4CHGPA
	uMo8RmT9zcbhagZsO5u26iyY/3SnhVvg17eGVaxXVwRURp1boVag6UOnJXVmwkMm
	oIv5KZ+lXkyluWiRs58STFBmnJOGowTdm/XCS1ZVNG7Jof1ZE3ZGV4zXPEaFYhhb
	kfsYKPGfFdP4gzWM+HDlzbUFPc9hETRkhlfhYKrDQaxJ8AX2RCwdXbcy6NEQF6qN
	LvUDX9iT3AFkttIXL1d4RpFjXEXiXWtvx/B+/l5CGw==
X-ME-Sender: <xms:ViEkZrxvVPUwWk-nWVwbnM_6bPUzvQAI1XyYdGG3mdjmS9eThx9Fsg>
    <xme:ViEkZjSXnKI5uBhPO41IBopoQsHyQXzIOZZG8wDJLyTOkBBmyCw9ADsxEzAi-qxIA
    iXXc7CCVtkjVyf6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfmfgv
    rhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtf
    frrghtthgvrhhnpedtkefhleeludduheeiudegkeeihfeiveeitdehvdehiefhgfejheel
    gedukedugeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhsohgtrghllhhinhhugi
    gvgihpohdrohhrghdpghhithhhuhgsrdhiohdpghhithhhuhgsrdgtohhmnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshh
    hkrghvrgdrnhgvth
X-ME-Proxy: <xmx:VyEkZlVx1V9XjLP5Ur1ZtJbPAxC6g9nbwnCUNo3p3YnzH3bGzyd-JA>
    <xmx:VyEkZlgL8wZTAeuAw44ZDTao8sz2rxvEQJeePARMqVl8u0Uygm5gDg>
    <xmx:VyEkZtCoEFPq6EGLLcHqySiuVXtk6NU3wOKGI_jq7FMUycz7VCKbiA>
    <xmx:VyEkZuJcadYNmkcYyn1D07mDhVdAGxkXE5WZcHig4jVCj7cY_1wcgA>
    <xmx:VyEkZgqEfUC0r3bsEzzZGNtNzH6_H5VGLrsGDrHr6MDhGs8NMAh-7BJT>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D93681700093; Sat, 20 Apr 2024 16:11:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <68460267-05ce-4b2a-881e-963460ba8062@app.fastmail.com>
In-Reply-To: <20240418153254.65058b50@localhost>
References: <20240417194340.20430839@localhost>
 <7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
 <20240418121340.58c1fa6e@localhost>
 <07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
 <20240418153254.65058b50@localhost>
Date: Sat, 20 Apr 2024 21:10:22 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: DoS/DDoS protection for end nodes
Content-Type: text/plain

On Thu, 18 Apr 2024, at 4:32 PM, William N. wrote:
> On Thu, 18 Apr 2024 16:11:13 +0200 Florian Kauer wrote:
>
>> So the basic idea is to maintain the iptables and/or nftables
>> interface and "just" translate them to BPFs in the back. So no need
>> to write C if you don't want to.
>
> Then nftables can be used against DDoS with the BPF performance, right?
>
> Has this made it to the mainline kernel or it is still something
> experimental?

See:

http://vger.kernel.org/bpfconf2023_material/bpfilter.pdf
https://www.socallinuxexpo.org/sites/default/files/presentations/Scale21x.pdf

Also:

https://facebook.github.io/bpfilter/index.html
https://github.com/qdeslandes/iptables
https://github.com/qdeslandes/nftables/tree/bpfilter_support

The latter two links are for Deslandes' forks of iptables and nftables. I don't know what Meta are using behind the scenes but both appear to be highly experimental.

-- 
Kerin Millar
