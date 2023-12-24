Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8F823A8
	for <netfilter@vger.kernel.org>; Sun, 24 Dec 2023 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="DXKiivnG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TH8/djW6"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0DB8B5C00FE;
	Sun, 24 Dec 2023 06:31:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 24 Dec 2023 06:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1703417500; x=1703503900; bh=h+6Wa/ciH2
	a+mUcWSQko+2aYziWcWOiXH7/zz4fGxhg=; b=DXKiivnGBek/VqYLjcnInlIGP2
	Yxa//D2OabVwHNOw/P150JuOaBomFLXlJ/JiVWip/1pCBPtyC9xI0ZDJfqH30/Sg
	ED0gMDurHQ5+B22/tvQ5UEvk3bfcC9hQOZMRgIvzxF8SprmUXYSCFoDOH/iQbbBV
	47wmFyhgw9XYazNcP8M6BJu4I4N4SHKWadquklGSnbOsU0ydfbz+RBWuoqZuDIlo
	HEkuaRGt+0hfUr4URKeEVNEoYRRLZM8KwuYyJRS7QeGXqFhnCrg6NdX3SZar31xr
	/Sz7LbXzy5vOLDGZhpuIK6QJXdGD91SD/1zRWdahbTGIykYm6cjWcHfnab/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703417500; x=1703503900; bh=h+6Wa/ciH2a+mUcWSQko+2aYziWc
	WOiXH7/zz4fGxhg=; b=TH8/djW6H1Hl7TLJ0sZpyQnxHWnwcYbm9s81aVtFLy9e
	nGsinWFG1u8B5HRx4o18t7nKVhRJdSlyhy1/Ge8e9afFNUVKx0DDM1R9e4tmxUEN
	tQX5IIC8q41HxcFVkgM0BPboR8ME3YeWIdQ29Lt+b+zjG79bT+SRedSO+V78666S
	io1TM5I/VbJ/EJApMWIW1CQfCHIXT7rHLTJYWtnx5/BdBLG0a6j7/c32A5JmNR+d
	TswSN7vr01G6U+PAFMSpne97UU9GxSGubRei1JzxjjaD1LVNrYt8E181jQ6d6m+l
	EDp8RjCuQpQ/cyxHx7Qd5L9OWUSQ4q3vEfLDxJiSGw==
X-ME-Sender: <xms:mxaIZezUZ9U-fZUxtqxe2B6yITw0jA3eYL-0cjFEa47j4KzYe-Ndgg>
    <xme:mxaIZaTMB2BBUsnV6AOML9um0EQyCWB3JVTx5u2e0ssn88nNeermU_lFvK0W1SkT7
    rVsWqzKGAjlruUurFQ>
X-ME-Received: <xmr:mxaIZQXSvbtDoisS_hgBFB8zxn9X-7epUrf0eyRDy5txWoCdsYXYYKPxN6MbSD7jDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddvuddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffuvfevkfgjfhfogggtsehttd
    ertdertddvnecuhfhrohhmpeetuhhrvghlucghihhsshgvuceorghurhgvlhifihhsshgv
    sehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfeklefhiefffeehfe
    ejffetffejfeehfedvveeghfdtvedvfeffvefgieegvefgnecuffhomhgrihhnpehgvghn
    thhoohdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegruhhrvghlfihishhsvgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:mxaIZUhWArLl8UaDWfcEu_OIx3UevD0LDrH74X21h5KoLHi2s2Hwng>
    <xmx:mxaIZQAxJxsnNCAVC1GMR3StVMlM595ucKow5fczaS2ziEycuOJ-DQ>
    <xmx:mxaIZVJ5nHJPbw7LlxrzprR8CZm-KNc6cCGkuyjiaX8sXIeR14FNaQ>
    <xmx:nBaIZbpK77ZHDNLwE5fzdfKBAgTgiAaOJRn78gIMfpA-u92DA0TegQ>
Feedback-ID: i7911475c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Dec 2023 06:31:39 -0500 (EST)
Date: Sun, 24 Dec 2023 06:31:31 -0500
From: Aurel Wisse <aurelwisse@fastmail.com>
Subject: Re: Vim Syntax Highlighting
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Message-Id: <JC566S.H69G2BBJNXJB3@fastmail.com>
In-Reply-To: <26a7f756-d64f-450a-a290-21d01c9b3bb5@app.fastmail.com>
References: <NH556S.G06QA55ATDUA@fastmail.com>
	<26a7f756-d64f-450a-a290-21d01c9b3bb5@app.fastmail.com>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Dec 24 2023 at 05:22:08 AM +0000, Kerin Millar 
<kfm@plushkava.net> wrote:
> Thank you for this. Would you consider incorporating the following?
> 
> https://gitweb.gentoo.org/repo/gentoo.git/tree/app-vim/vim-nftables/files/vim-nftables-0_pre2020062901-no-expandtab.patch

Sure. Makes sense.


