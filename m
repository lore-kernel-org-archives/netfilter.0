Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4953F205E01
	for <netfilter@vger.kernel.org>; Thu, 11 Apr 2024 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712865918; cv=none; b=u6MMJ/9ZYbrmBCGZomgiQebkcEHKtP3v+YxKRwGUrrs3NdFBkjBotYQPc5w49guWYCMGgkuHsIfCSc0AnTOHv0ijCAjQfWBcqA27rkwB3fSFSlS/Yv8hFKg6DK0YbFHnvZsCvrgPwKB36+/ID30CjwN2yXlcEXlTYT8GU+eVoH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712865918; c=relaxed/simple;
	bh=iMHNIN5V1b3U9uohQEAMmKwwQhFJ5g/PmDCE+SmPQwQ=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=bNVE57edo2fkJFG1X3yEdSPYoUy6UijvYj23hRG/Zh4xIqlr1FWwYYTuMbY7fyfjGPv/9ATiI/IQ12kDkTPXyI74aUCeva1+eq0xioJUeMJ7BH5LHIRZrWx5+Wh+9ZxOtUr8XzjH90AVWm0GaiNHnx6WVUWXJFgdO6yE+YYIUIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ioFwvR4K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JZ2dhPCl; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ioFwvR4K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JZ2dhPCl"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 55B7613802BC;
	Thu, 11 Apr 2024 16:05:15 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 11 Apr 2024 16:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1712865915; x=1712952315; bh=pLrQOlhmIQ
	JCAaQyz7Xsfzp5VYsKZKmq2gEMUyQV2zg=; b=ioFwvR4K4gu4qp+SdUSrBCY22g
	/HVaz/m4e1P2qoyBtWs1R/5+ct/2djRn7ncUTGibeAyXiwHMnG9FPHYelHwSIn2+
	Pf9DO6nsuR0HXdeuXrnKa73p3z4cNv/AoFB/xPt4TQsMfk78yE2FF9fNb+NTC9Yh
	kf7iCma/pbeaondXl4gFb3H9X9XqNK6NUWn3zHV1WG99ozfAF8c3BPtcB2OBiogR
	QowY+ivjmfbgSfcNGnSpvuyWENfBZo/rGbAkY8dHE+3SKm/eNntQsrT+0JFlZNpH
	bveYyvbbBXfCop440c9zsc1wv9NLY+TIKJg4txg92P8mFhhlFMdfr8lANUfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712865915; x=1712952315; bh=pLrQOlhmIQJCAaQyz7Xsfzp5VYsK
	ZKmq2gEMUyQV2zg=; b=JZ2dhPClcp9FfCypsitSDF3pH0rkBp+r6LrjLb7p92+i
	cnfU5oEvkWfbb1MZLt0XXEoZcxrSVaziUxIT07ZBSdHW+GBA7Swk5kMHhUHZrhfe
	C82t9GR/7E82wyV6DC4vVEBEV31fohUoMyjdhIqJ6c9Bk9S9qbbjFEhFuQC4Y1ET
	xytz18Mj9KQ+wciF074+BoYv2zWh58PFYyugUt3dgVjn1RX0djE5ZzHs+K5tvjCD
	9VMzH+v85JS/4qJv4s1jH72fJhKRqP9XkGcQF/6ECsLpG01sj2hgl4lI23AY2waT
	ijFI27uV2/Iz6roWIvv+hAHyjHk5YgBzkzCN+sIfSw==
X-ME-Sender: <xms:ekIYZhGyjjeSpLEL1iqwrQyPpr4dy3Lb-rrH_KLYD0GYs8-YOg96UQ>
    <xme:ekIYZmUzXwliEc2whyqEi2KlFeQfGCfwYAas8D19p1cRZAOAf2JDyJYXuf6qxE8I6
    mHqoupflO4ydTwx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
    dtredtreertdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnheptdeltdeikeehjeekveevvd
    eftdevuedutdekteevtdeuieffteekledvfeeuffelnecuffhomhgrihhnpehnfhhtrggs
    lhgvshdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:ekIYZjL4MXSAhIyqxiIOUywTGPtmaAyrGxCet3F0QG0tcdb-UI_TmQ>
    <xmx:ekIYZnEFP80VwRnXdcXXF3MYHUl442jsCT_ntwY_0cG4j-td14Gzcg>
    <xmx:ekIYZnWbKEHmXUApKZB8sjVLpcRvFNWTWlqtwXpPFgUvZ8xIZzRdYA>
    <xmx:ekIYZiPrt4D927Q-kitdTofvBw73FRRW4m1uA4Yl7IPXPHLErX624w>
    <xmx:e0IYZuftLK2HdlB6emcGFjPLNsualRJa95tDnrWEcRE0PnQainPLwiVQ>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DACDD1700093; Thu, 11 Apr 2024 16:05:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <34397891-d5b8-45ca-8bbc-190a71b34cc6@app.fastmail.com>
In-Reply-To: <20240411165412.0f0c65ce@localhost>
References: <20240410172343.1f7f5ee2@localhost>
 <f0514bc1-c1dd-4f24-97e5-8c40807dbae9@app.fastmail.com>
 <20240411165412.0f0c65ce@localhost>
Date: Thu, 11 Apr 2024 21:04:53 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "William N." <netfilter@riseup.net>, netfilter@vger.kernel.org
Subject: Re: connlimit from wiki.nftables.org not working
Content-Type: text/plain

On Thu, 11 Apr 2024, at 5:54 PM, William N. wrote:
> Everything is up-to-date and rebooted (many times).

I can only induce the same diagnostic in the case that connlimit support is missing.

# zgrep NFT_CONNLIMIT /proc/config.gz
# CONFIG_NFT_CONNLIMIT is not set

With that in mind, are you able to "modprobe nft_connlimit" at all?

-- 
Kerin Millar
