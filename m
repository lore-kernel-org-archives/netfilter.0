Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0DE15ADBC
	for <netfilter@vger.kernel.org>; Wed, 29 May 2024 23:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024675; cv=none; b=afhitbRcEyu9tF4+XViLxzajjqL/vZaFzSPcS5abtQC5JfELiuzM22ZRdG7pJLi7uynQIa5BXG9maIeVLT2Hf+57yN6zyuF0d/OXDlvwp0AiP5QrdI0o51/WVgm0ZP6pvVcuOJ5+4Mw/z4J/L6Vv541Z/W+NVihgYJEndYESAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024675; c=relaxed/simple;
	bh=DtIU54Xk931KKQKOhiXE89+KfYcfDI/uyfeKhlWBBJ0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=fT0TJA/4Dtbm8npkkKe5P6USQpHeV5+FStvuaug35EAc2yRZpTw3b7hPbITJRmEiCn1PfxIxAZtF2kLaNZnSIHSQoLypRrhIAmzkoufP11MZzlEHQgvkY7ZVoBQPfT7iuEqvHmpIRPgJBvHMpmTlTFNjNwYtwTFXqvQJkvjZAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=gAPlzyMM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FoTpQarQ; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="gAPlzyMM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FoTpQarQ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7B8FC13800E2;
	Wed, 29 May 2024 19:17:52 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 29 May 2024 19:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1717024672;
	 x=1717111072; bh=QRwZBKHU059hay4tkcUB3VtoUR5UpVASYtRxrkENhg4=; b=
	gAPlzyMMoncNbBGFdJarO2Arf7bbStJlxDtzqjYeX1GrzMfBQbYzHMyZqvaJnBnU
	js4xsO+3yVl24rFYwdd/ndDI+51jK6gpl/fRX+yy6UOdNb3h8WaQ9Qjf8EZBjazz
	7GNdvVd7SgSHWjv0wHP1oIcG1IM2m4svNfcnC/R/iO9jfLidTtHLSF3OkG8TyC6H
	oJJ/Q6552kcTkDKUcIDVSVb+V2+5j9CdQGbazPWICTAGZxUH8jSULb/+K5c6vajf
	1oNsg5LpU95xTnEvGIfBByjdfd9rUq49PQKKvh903xsjYIz8Ee8LD8Ud21NXbfSq
	mQhzvaC2M5HueRUWRvs0Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717024672; x=
	1717111072; bh=QRwZBKHU059hay4tkcUB3VtoUR5UpVASYtRxrkENhg4=; b=F
	oTpQarQKvivRJzRyGa41I6c77jGFo1KJ21u1os+Hiz8nFV7f9dGxsnEDn5et9cAb
	B/GGj76Hj0w8VYyf7Fe+LnpgQS/2I2+GJv82xzBudR1tnYRZniyi7N5zBo8Nt/70
	zBt5CJcbJlHCpZNO78A+79WnurjMSWwN2H/zUBd9X2D80/exquuc7S+ROevyTGSJ
	B91WkDb66klth0wf8aOvw5J4QVt24KQOLvlHVk/CvHnB9LZnm5MeaLi/uPguGnzz
	jlifhRoxg4zqdZHGUhGqI9h8KrNFc4JVS9XIPNgZ7i1+nup/ECeky9ZgGmi7QOYm
	YMY4DumPPeU0lfdNaWusw==
X-ME-Sender: <xms:oLdXZuly3UpGkg4WMAgR82aE47YpgWXfVepqisu3Xt6DMfpF3E3BTQ>
    <xme:oLdXZl1fSRpUqzRc1aL5LGtkRwU7mpZ3_-YMWLj695x5CTye5k-rlnRNLNQ8jNhvd
    vIEcgEfW2bvpC2T>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekvddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
    hqredtreerjeenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnheptdfgudefhfffveevffefgf
    duhfelvdetueethfekjeevleefieffudelleegteetnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:oLdXZsqAB6QOB7kTYRhkfdwdLjm50OPtHgGTzaegJxRDgxFPwkq4jQ>
    <xmx:oLdXZim-AsA4OQUPafMY5_r9Pa2HYTwaLNRvTmsw16OtFNcC8gsdAw>
    <xmx:oLdXZs2RE1A-CyRsmnaVMZccbGjnaL3UqI4uT_KS4DRGkyCFGp4nrA>
    <xmx:oLdXZpveNV22RqQVurY5Wkgk5sFJhIQYzmN8Pd_fzAV-_MUwqMywog>
    <xmx:oLdXZp8FuoLP-3vUq3HiyNV-UYN1edpYsBPPdwFlJseuUQvWIKLlsg58>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1E4991700093; Wed, 29 May 2024 19:17:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20ad1522-cc15-472e-a163-73934d4deb74@app.fastmail.com>
In-Reply-To: <b1c34f18-f564-4eda-a4ce-1af086d5a8aa@e-posta.sk>
References: <b1c34f18-f564-4eda-a4ce-1af086d5a8aa@e-posta.sk>
Date: Thu, 30 May 2024 00:17:22 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@e-posta.sk, netfilter@vger.kernel.org
Subject: Re: ebtables rule rewriten to nft 'set host' does not work
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 29 May 2024, at 10:07 AM, netfilter@e-posta.sk wrote:
> I guys I got kind of Man-In-Middle setup, where ubuntu based box is=20
> correcting coordinates transferred thru wire.
>
> This is old setup coming from age of iptables and ebtables. I tried to=20
> move to nft command-line, but with no success. ebtables command works,=20
> but nft does not. Note: box is running nftables with iptable and ebtab=
le=20
> interface.
>
> When I convert ebtables command into nft rule, this rule never get hit=
,=20
> while its ebtables equivalent does.
>
> nft version
>
> # nft -V
> nftables v1.0.2 (Lester Gooch)
>  =C2=A0 cli:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 edi=
tline
>  =C2=A0 json:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yes
>  =C2=A0 minigmp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no
>  =C2=A0 libxtables:=C2=A0=C2=A0 yes
>
>
> script setting nft ruleset via nft and ebtables
>
> #!/bin/bash
> IP=3D*IP*
> PORT=3D*PORT*
>
> nft flush ruleset
> nft -f - <<NFT
> table bridge nat {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain PREROUTING {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook prerouting priority dstnat; polic=
y accept;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 meta ibrname "*DEV*"=C2=A0 ip daddr ${IP}=C2=A0 et=
her type ip=C2=A0=20
> tcp dport ${PORT}=C2=A0 meta pkttype set host
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> }
> ....
> NFT
> # this rule does not work in NFT (yet?)
> ebtables -t nat -A PREROUTING --logical-in *DEV*-p ipv4 --ip-protocol=20
> tcp --ip-dst $IP --ip-dport $PORT -j redirect --redirect-target ACCEPT
>
>
> resulting ruleset, as you can see ebtables rule is hit, nft is not, wh=
en=20
> I try to match rules word, by work, I usually get error
>
> # nft list ruleset
> table bridge nat {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain PREROUTING {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook prerouting priority dstnat; polic=
y accept;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 meta ibrname "*DEV*" ip daddr *IP* ether type ip t=
cp=20
> dport=C2=A0*PORT* meta pkttype set host

I note that "meta pkttype set host" isn't valid syntax, though your shel=
l script has it right. Still, this rule has no counter. How can you be s=
o sure that it isn't being hit? Could it perhaps be that it is hit, with=
 processing continuing due to the absence of the "accept" keyword?

--=20
Kerin Millar
