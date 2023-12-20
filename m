Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E83E466
	for <netfilter@vger.kernel.org>; Wed, 20 Dec 2023 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=awisse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awisse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=awisse.ca header.i=@awisse.ca header.b="Q/8ClqRl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a5XQNVzB"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E32675C0256
	for <netfilter@vger.kernel.org>; Wed, 20 Dec 2023 10:03:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 20 Dec 2023 10:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=awisse.ca; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1703084588; x=1703170988; bh=cQ7UfwdWAyx4ji5afO2P1MMltb04nQQZ
	JxO2yswEaQY=; b=Q/8ClqRlX8HMNxz1RvrXtT5pvVPlrJwJcbyB6+Cf4MstsZbu
	Qtvbxr9k06ea/0ZnnTVcbBSdakORj/XhT+y8KEcObrhXEh/Dzuk7SbU/K7oarxLf
	aiKu9isNnv/9DCNdR7u/B/dikd8zqrABwez6v/O5mfbAUiN5CHLAhKwRMTxxv2Ba
	+/iOeVCTLRoNFY6h5BrbIVOPVE/RlD1V5buerCQiiJCMzz8nFmSMM9/qaZUE8MMt
	I3hocXpQ2tEIFlwNe5I9KYzZR7t44HUSpJdf3HjsfMm7hLzxgCzpooq7lDYVRbXS
	0nUrENW84rv8SbEva4wkuLl0FPZs2ufk4mcfFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1703084588; x=1703170988; bh=cQ7UfwdWAyx4ji5afO2P1MMltb04nQQZJxO
	2yswEaQY=; b=a5XQNVzBsj+RekQPsa6bauaxoqBo7MY3F8BsokUldWpKJyHy+rP
	37W764ct3VcXx2/Gfw5MJOKqQVOKltkODvbUWHvkmvX4pWtmzhwxFU3GQeRXJm0a
	OsqAa/rD4XzcMtkx9oMd+aJhx9Z76IWcIE2Q7Fc7ApkANRiGTRO0VbvQAsd8xkcb
	pHiVWm2JVsBdYf4cKv9aQoJc03kuQPMv+PXPd+rm6CCqFdB+kQt1c9uS53zCVgkd
	owJaDkaUKbGnA/MTqSq6jECb9NZkc89IAyh9yIOa4ocJIx+GdoAcJaZYXzSUPBIC
	6iptl07AqfrqWQjLbRf7ldpEqX3IhTecIDQ==
X-ME-Sender: <xms:LAKDZcjxY90ZbfjPar1jE-wT2dn12RIyIjBG4xbLfnJzmYuVCt84OQ>
    <xme:LAKDZVC-HavF6lUE9Dilb2SbjOCME0KXm_P6nJw-zf3-zAeAkIYRs_b_9dc-C_FCE
    Wuap-iZMLmYv-4CrSA>
X-ME-Received: <xmr:LAKDZUFAxl0h8Pkz7g63KsQk5lznzKMD6zeWAAuEL0SFJFUnfFgwZ_A6pjxfHw9kYzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffuvffkofggtgesthdtredtre
    dtvdenucfhrhhomheptehurhgvlhcuhghishhsvgcuoehnfhesrgifihhsshgvrdgtrgeq
    necuggftrfgrthhtvghrnhepvdefveelkeffleegfefgueeihfehveekuedugeetleffff
    fgfeejffegiedtkedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepnhhfsegrfihishhsvgdrtggr
X-ME-Proxy: <xmx:LAKDZdQt8-m815AtETdsPTdN-6f8YCx2zm7hUSHPTYopU7f5ndN2vA>
    <xmx:LAKDZZy_amu7veFzboY-0XByzYO44EA6P2m17QL4z_ImLTXxYeZY6Q>
    <xmx:LAKDZb5ZUBFs-B96dAbxSHd9v2aF-n6MCdhvWvWX223NiP_VvrkWkQ>
    <xmx:LAKDZStrXSmsA5MiVhfkk3gJDqG_X8otGpBGZjcLnvUj_Jq0KkFw3A>
Feedback-ID: i096949d4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <netfilter@vger.kernel.org>; Wed, 20 Dec 2023 10:03:08 -0500 (EST)
Date: Wed, 20 Dec 2023 10:02:54 -0500
From: Aurel Wisse <nf@awisse.ca>
Subject: Question about the man page
To: netfilter@vger.kernel.org
Message-Id: <UG0Z5S.ENR86OM60VRI2@awisse.ca>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

I am studying the man page in order to learn the syntax of nftables.
I have a question about the sections ICMPV6 TYPE TYPE and ICMPVX CODE 
TYPE.

The keyword for ICMPV6 TYPE TYPE is `icmpx_code`
The keyword for ICMPVX CODE TYPE is `icmpv6_type`.

Is this correct?

Thanks,

Aurel


