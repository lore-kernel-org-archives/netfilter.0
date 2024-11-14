Received: from cyan.elm.relay.mailchannels.net (cyan.elm.relay.mailchannels.net [23.83.212.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFC21AED3F
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 23:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.83.212.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731626288; cv=fail; b=ck8eMjdkJskqt5+7bUp0Sw0baJj11PZxQdyu+Kmei1rFhu1T+eQV8hCxtIJd8EhNiNA1IbGNjPQUpNQx+6VzN2+oM6K+Nf6C7yLVT32jMW3u5aQDqGICWeSBVNk3rbU249kSBSWEvJ+OEyS3EuCu3peJ+JFJqRNWaMtDeEJYqZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731626288; c=relaxed/simple;
	bh=0FVFTTPwP8Nyd/nRcv8/L9MeHyLc3ZEDcgOgy2oSA0Y=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=krjRSQ+d4BjPEQ/j8qDfMXvHYh3hrryCW9rNXlBHGantwF2pPJnFeYYSt4tQSw2sqffm3iD8GZYSSw2pS0dU1mtwF1ClEjd8Zvzp2hpPAsKYSgpWpIus+gU01ib+1whvv6UdoyOEt4M/ZbSioNdHzJzHmu+JCCNtAg1UERMTcjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=street-artists.org; spf=pass smtp.mailfrom=street-artists.org; dkim=pass (2048-bit key) header.d=street-artists.org header.i=@street-artists.org header.b=m1pm82BC; arc=fail smtp.client-ip=23.83.212.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=street-artists.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=street-artists.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=street-artists.org header.i=@street-artists.org header.b="m1pm82BC"
X-Sender-Id: dreamhost|x-authsender|dlakelan@endpointcomputing.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F0F3AC3450;
	Thu, 14 Nov 2024 22:40:42 +0000 (UTC)
Received: from pdx1-sub0-mail-a262.dreamhost.com (100-112-46-30.trex-nlb.outbound.svc.cluster.local [100.112.46.30])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 32A2FC2D7E;
	Thu, 14 Nov 2024 22:40:42 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1731624042; a=rsa-sha256;
	cv=none;
	b=xqceafl4M0VDiqVuWLKWZBEJTrJSdMyrgnXGVeGtsCSTdCZxOCEDx0hUQG8YTmWUAQgWFY
	PwlkhcjANfxv6GfRCFlIqAZNGcgCAwCm2WKz/hzmCoNMJ267Kb90b+2SKewpWaIwrYEDdb
	vBOEcxIULVyMDlj+EE1vsc+x8nm1SGOxU3L59PsRfDmbhjsJ957N/moMeyee71bMzOYIg8
	q/7+/dKMP+QihztmA2VYwF4J8swhyzm2HIlBILaQnMdPtqb8U0KYSdsCsZGgTbHiJzsGWu
	GD3W5+h/Fe0Lf/u6gxl5DIFfvKnwe5174TOToOm8upRWvdfWTeYAD29PirsZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1731624042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=nxsqKvBe8hLsSsTPjaoKj6Za1i5n0TwqA/+fOtn5FOk=;
	b=1rKtWCarHA7BfmFlaZzS6K477AW1SgEPCOhcr+tBuyl2slTl4yJOvzQa7XnPKRgfaz9SS/
	xr6WOSAQmCxsmTeC9L2PfBK7RXVwkGhaQf32Y7A+gSCvcsvu33SsoJXQAGLb/5dmBp2IjJ
	IhnemaTUBcpJOzS8fiGCP0lczXq29gibvOsjkKrWNgyLlDRpt0Ls1HgW1UXBY48CSrJbfB
	jMdrloyLMXfLs5ComRVpJCsfOJUTCMR2QeR2ByZslXK2sOsBMbPwxYpj+GtGVmsQTOVa4h
	CtAHc2Am+vdowyZhvo9ne4GIzFhnDv1UWUGK3BI8iaC9j3YzJ7A5HgrO1kvVuA==
ARC-Authentication-Results: i=1;
	rspamd-7456989c76-xdrhh;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dlakelan@street-artists.org
X-Sender-Id: dreamhost|x-authsender|dlakelan@endpointcomputing.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dlakelan@endpointcomputing.com
X-MailChannels-Auth-Id: dreamhost
X-Abaft-Shade: 7e4224cf4a3a9b3d_1731624042453_798733935
X-MC-Loop-Signature: 1731624042453:2141009575
X-MC-Ingress-Time: 1731624042452
Received: from pdx1-sub0-mail-a262.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.112.46.30 (trex/7.0.2);
	Thu, 14 Nov 2024 22:40:42 +0000
Received: from dummy.faircode.eu (23-114-244-112.lightspeed.irvnca.sbcglobal.net [23.114.244.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlakelan@endpointcomputing.com)
	by pdx1-sub0-mail-a262.dreamhost.com (Postfix) with ESMTPSA id 4XqFVK5cX7zC2;
	Thu, 14 Nov 2024 14:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=street-artists.org;
	s=dreamhost; t=1731624042;
	bh=0FVFTTPwP8Nyd/nRcv8/L9MeHyLc3ZEDcgOgy2oSA0Y=;
	h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	b=m1pm82BC11L3jcxcJMtW/toC9n3cRRbEHFLkkDqkLXdRjcBsOuYS3aWzSZ5aLG5o0
	 NnkvbYY0knBqMxn1gY0Rm83oUN92EFfTYEyRMy0T/9Abrc/vaoysBnh6ELJsuKHPiL
	 I+xXZYd0NoVM8SEC7pzKGmOeE+fk0PMZ3SyokN5XaHDEfiZFwacQDdJBrnnfwAQnKu
	 o6twiw+4wSmGtoJL6mcA2sXfv4YPaCJ03W7I516El9ViE0HzXQIl9qYjPcyCKDDK2X
	 Wlb95ba1YX6T2hmdVKQXdZl8yQ9ZsFJPNZojmlhjdjN2+6hr0S2EPUR5ilT2wL7PDu
	 5iRq2PFOjnWdQ==
Date: Thu, 14 Nov 2024 14:40:39 -0800 (PST)
From: Daniel Lakeland <dlakelan@street-artists.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Thomas Koeller <thomas@koeller.dyndns.org>,
	netfilter@vger.kernel.org
Message-ID: <eb826e10-f764-4ec5-be30-2142a500807b@street-artists.org>
In-Reply-To: <3eb90ede-c19c-409e-a882-e068efeda7e7@app.fastmail.com>
References: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org> <35678cc4-98df-4929-a22d-b50ba1b2a7c5@app.fastmail.com> <ebdf9189-3a2e-4501-aa07-a29fbc4d713f@app.fastmail.com> <ZzZh1TM96YVgTl8y@calendula> <3eb90ede-c19c-409e-a882-e068efeda7e7@app.fastmail.com>
Subject: Re: Dropping of the end of a chain
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <eb826e10-f764-4ec5-be30-2142a500807b@street-artists.org>


Text something like this might help?

"If chain A calls into chain B and B executes goto C then when C is finishe=
d execution does not return back to continue in B but rather returns all th=
e way to A as if B had decided whatever C decides. If B chooses to jump to =
C however, when C is finished, B will continue forward from the location wh=
ere the jump occurred."

The labels make it unambiguous but also adds complexity to follow.

Nov 14, 2024 2:07:23 PM Kerin Millar <kfm@plushkava.net>:

> On Thu, 14 Nov 2024, at 8:47 PM, Pablo Neira Ayuso wrote:
>> On Thu, Nov 14, 2024 at 04:26:42PM +0000, Kerin Millar wrote:
>>> On Thu, 14 Nov 2024, at 3:51 PM, Kerin Millar wrote:
>>>> On Thu, 14 Nov 2024, at 2:01 PM, Thomas K=C3=B6ller wrote:
>>>>> The nft manpage states that if the end of a chain invoked via 'goto' =
is
>>>>> reached without a verdict, 'evaluation will continue at the last chai=
n
>>>>> instead of the one containing the goto statement'. I cannot make sens=
e
>>>>> of this; what is the 'last chain'?
>>>>=20
>>>> To say "last chain" is highly ambiguous. I suggest that it be rewritte=
n
>>>> as "evaluation will continue as if the invoking rule had instead
>>>> specified 'return' as its verdict." Such would be simple, coherent and
>>>> correct.
>>>=20
>>> I just re-read the relevant section of the manual, which is as follows.
>>>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto chain=C2=A0=C2=A0 Similar to =
jump, but the current position is not pushed to
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the call stack, meaning that =
after the new chain evaluation
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will continue at the last cha=
in instead of the one
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 containing the goto statement=
.
>>>=20
>>> I think that the language is reasonably clear as it stands, though it i=
s lacking in punctuation. However, I can see how some readers would be thro=
wn by the use of the world "last", particularly those that do not understan=
d the concept of a call stack.
>>>=20
>>> Perhaps the following would be clearer, without unduly diminishing the =
technical nature of the language.
>>>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto chain=C2=A0=C2=A0 Similar to =
jump, only the current position is not pushed to
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the call stack. Consequently,=
 once the evaluation of the new
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new chain has concluded, eval=
uation shall continue as if the
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the invoking rule had instead=
 specified 'return' as its
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 verdict.
>>=20
>> This extract is very similar to what there is in the iptables manpage:
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto chain=C2=A0=C2=A0 Simila=
r to jump, only the current position is not
>> pushed to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the call stack. This speci=
fies that the evaluation
>> should
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue in the specified =
chain. Unlike jump,
>> return will
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not continue evaluating in=
 this chain but instead
>> in the chain
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that called us via jump.
>=20
> To my mind, there are some issues with the above.
>=20
> Firstly, "this chain" might be ambiguous. Such a phrase could be construe=
d as being a reference to the just-mentioned "specified chain" in the prece=
ding sentence. The likes of you or I already know that such an interpretati=
on would make little sense but this may not be apparent to the first-time r=
eader. Ideally, there should be only one possible interpretation.
>=20
> Secondly, proceeding to use "return" as a noun rather than a verb could b=
e construed as implying that a return verdict statement must be involved, w=
hich is untrue. Also, return where? Compare and contrast to something like =
"Unlike jump, if the specified chain is returned from, evaluation will not =
continue in the calling chain but instead [...]"
>=20
> Thirdly, to say that the "return will continue [...] in the chain that ca=
lled us via jump" implies that a jump verdict statement had to have been in=
volved, which is untrue. It fails to account for the control flow of the fo=
llowing ruleset, for example.
>=20
> table ip filter {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain INPUT {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # This chain was never jumped to.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 type filter hook input priority filter; policy accept;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # There is still a difference caused by using goto rathe=
r than jump here.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 iifname "eth0" goto input_eth0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 iifname "eth1" goto input_eth1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # There are no return statemen=
ts.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input_eth0 { }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input_eth1 { }=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> }
>=20
> Fourthly, referring to a chain - any chain - as "us" is not something tha=
t I would expect to see in a technical manual.
>=20
> While by no means perfect, the wording that I proposed tries to explain t=
hat, if the specified chain returns - whether implicitly or explicitly - th=
e behaviour is as if processing a return verdict statement in the calling c=
hain. The idea was to encourage the reader to cross-reference the descripti=
on of return, which accounts for both scenarios:
>=20
> - returning from a chain that was jumped to
> - returning from a 'base' chain and thereby being subjected to the policy=
 specified by a hook
>=20
> Put another way, it tries to leverage a definition that already exists el=
sewhere. Although, the description of return also uses the same phrase that=
 threw the OP. There is only so much one can do, I suppose.
>=20
> --=20
> Kerin Millar
