Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC504405EC
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706791817; cv=none; b=BDrqC/61awIVkxEI2XOrewBpnuBCD4HdfBHtEkWvDKhCaW44DstfX7QDvDVseDarETwUjpq/lQeFSuWiPvlTuv9bCUbvH+FEuZYtye4BAUlzZahlbPzbMZaT4nEZLht7/4QK2yVW8ilvGua7UJlpPLpZzlXBBUSix6aV79qxs5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706791817; c=relaxed/simple;
	bh=Ioa/PKtUpBU8Ee4XSEEaXss2BYmH6LPtfBdB3Tbo9cA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=TBamDp93vAb/1DL+0q13Z3KCsiC3KdiIlQvXwbgF3cAzIam2ij3TtRUEGCCJNBktLPWJ23HDt/67OXvIdXOK5K6IFaSsKbCxHONXz6aUtEjhVNs48kqs51V7zgmEh48MGDk3Okb+eblbQ44IqKiLDoRo9DEY21YPqrwY+l71sjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=Vy0Bzx8C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ukts/uJo; arc=none smtp.client-ip=66.111.4.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="Vy0Bzx8C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ukts/uJo"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C5D115C01A0;
	Thu,  1 Feb 2024 07:50:14 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 01 Feb 2024 07:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1706791814;
	 x=1706878214; bh=xFJJQOnUdcNNhyO74iz06tdkDdhnmCP+obTQZF3aBjM=; b=
	Vy0Bzx8CXoZ2VfJHI6NNmjK+9iL7gVa3fnDQb+zRXTQYfGev2uII1rjqKY0CtFGv
	qHruWKQw6N4PrLc4I8Iz0j7alsXb5ZFC+il8UWvObx2Tw+gvpnrQdotwvBPppq3U
	iA1T1cMitbblQWvytnhgA8m1YTrw6tP2pqaht5VpojFyifk8G0fJn8DMcVCe2fd6
	4YXBlqfaC2Gpd+0k38n0OU7ggpv5akeTWiF7Lj2FpCBKmHxJCmagy5HMuzlaFTIN
	ZotOGMFpnz/XjERIhEMgMU9Y9VcwzjpU38CjLmlcZoSjGGuQ9U5iAEywRR3sbdi4
	XWdbjBM3eSmLXcLkKr1wbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706791814; x=
	1706878214; bh=xFJJQOnUdcNNhyO74iz06tdkDdhnmCP+obTQZF3aBjM=; b=u
	kts/uJoq9iqO9Pul8hAtMLrMX3SmHFOlWcHlM9Wd8Oc+FV4pH1ROY+nqgSuNvFOr
	afVQQmtgiXGOA14PvkhOsSvcIqUQDFl7oC7FTkisZQzL//hCciRKOs/f4s5JKlxK
	PJvwSjqtG+ZhDvDwo3K71mu5V6ykhU/V3YnzJBDVqBgkEEnYkK+EYdIqKNOSaA5x
	WPNG2kDIgjm2JxrsFi/wXdvn0aLbD8Cuh6CokR0rL5WVosjSPkyf/fAZR3a4IdYn
	+dZDwUijSnX9jk7qIP+p5Yvh0wBTojs5Jo98ONPwOY1reSe1VP6Fjyxmh1NsHpvm
	jFJdcAGGpDV7rUC+0DHyg==
X-ME-Sender: <xms:hpO7ZRF8EdXOvaeeD6NAJ1vkwETvzzVfx-xjBwFXNXKA-Hrl7y1Q7Q>
    <xme:hpO7ZWU1i9NYbXVN-5Z2a3DtrO7wTcu1YeiVj0eTgWkyS9NmuGyfnamG73ePGBMh8
    REtcIfthG_YV9GU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduuddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfmfgv
    rhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtf
    frrghtthgvrhhnpeejkeevvedtffduudfftdfhgefhhedvudeiveelueffgfeghfehheeu
    ueduvefgveenucffohhmrghinhepvhgrlhhgrhhinhgurdhorhhgpdhnvghtfhhilhhtvg
    hrrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:hpO7ZTLSuuqboJq3RgqMRnX9egjxlreYk-dBOt7mdFmv6HbG69m-YQ>
    <xmx:hpO7ZXHXXzEHpI7UdZmvq6VsfOwFd_Wjb_2HINHMFUblezN8umbb-w>
    <xmx:hpO7ZXUFzvc_fZzJgD9QhFMG1SnI5e3oLHIooX4ZMySoSWwTQ993Sg>
    <xmx:hpO7ZYdDKeI1jKgRB1DdDAM3t1zbbh7AtHIvXLKXLOGGjpt0EviMnw>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 692A21700093; Thu,  1 Feb 2024 07:50:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <327e8447-e995-465b-9569-1a00fbc9ad68@app.fastmail.com>
In-Reply-To: <75cb1437-0fdb-4599-aa8e-9f12fdf6057b@slavino.sk>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
 <20240131221012.289b2a17152cbcae39132ab1@plushkava.net>
 <75cb1437-0fdb-4599-aa8e-9f12fdf6057b@slavino.sk>
Date: Thu, 01 Feb 2024 12:48:31 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Slavko,

On Thu, 1 Feb 2024, at 10:50 AM, Slavko wrote:
> D=C5=88a 31. 1. o 23:10 Kerin Millar nap=C3=ADsal(a):
>
>> This has also annoyed me on several occasions. Though I have been usi=
ng nftables for a fairly long time, I still find it more natural to orga=
nise rulesets based on the conventions of iptables. Old habits die hard,=
 as the saying goes. Incidentally, there is an open bug concerning this.
>
> Perhaps you know that, but IMO it can be useful for some...
>
> IMO the root of confusion comes from fact, that both (iptables/nft) us=
es=20
> the same name -- "table". I don't want to discuss if it was or wasn't=20
> good decision, as it doesn't matter, it is only name.
>
> In iptables table more or less defines chain's hook priority:
>
>     CHAIN =3D> hook type
>     TABLE =3D> hook priority
>
> In nftables one have (can) to define hook type and its priority by sel=
f,=20
> thus that purpose of ipt TABLEs is gone and main purpose of table=20
> changed to define family (and group objects) and name it.

Quite. It's nothing more than an "object" namespace with an associated a=
ddress family. In what way it resembles a table, I do not know.

>
> I fight with that hook's priorities for long time, i was not able to g=
et=20
> it, until symbolic names for priorities was introduced. And after math=20
> can be used in its definition (eg. filter + 5) it is really simple now=
.=20
> Great job.
>
>>> BTW, i am curious, how big difference (in performance/time) is to
>>> search IPv4 vs. IPv6 address in set? Is it worth to consider?
>>=20
>> I do not know but I would expect a lookup to be very efficient in bot=
h cases.
>
> I know only very little how ipsets stores items internally, mostly onl=
y=20
> that it uses hashes and tries, and i know nothing about sets. I know,=20
> that these tries are efficient way to search in large datasets, with=20
> near to constant search time. But if someone complains about performan=
ce=20
> (IP vs. IPv6) of ipsets/sets, there must be difference. The question i=
s,=20
> if it is important/significant.
>
>> I haven't paid much attention to memory usage. Benchmarking performan=
ce is fairly straightforward with the use of the shell, especially bash =
because it offers some useful features such as:
>
> I mean performance in packet flow, how long it tooks to find (or not=20
> find) match or update/add from FW rule with ipset and with set, if bot=
h=20
> uses the same dataset size. If size of ipset/set matter, etc. Will be=20
> measured command time the same for particular action as from packet=20
> flow? That comparison will reveal, if sets are real replacement of=20
> ipsets in all (or most) cases or not. Or will be adding/removing item(=
s)=20
> from command line time the same as from packet flow? (IMO not, as=20
> command invocation plays role too)

I don't think that there is an abundance of material on this topic but I=
 recall seeing one or two articles on the web concerning this sort of pe=
rformance measurement (by well known Netfilter developers/contributors).

>
> BTW i recently realized how important can be command time, first some=20
> attack (which fills ipsets with thousands IPs), then kernel update, th=
us=20
> restart was needed, and it reveals how inefficient way fail2ban uses t=
o=20
> restore ipset bans :-D But that is not nft related (and it was short=20
> time shock)...
>
>> You might find it interesting to look at existing issues concerning t=
he use of sets by visiting the following link.
>
> thanks, i will check them from time to time...
>
>> Of those, #1584 concerns "high memory requirements", where Pablo appe=
ars to be using https://valgrind.org/docs/manual/ms-manual.html to profi=
le memory usage.
>
> I meet valgrind only two or three times, related to some bug finding,=20
> but i got full guide from devs (do that, run that and post that or so)=
,=20
> without understanding what i am doing...
>
> Ipset shows in output (list) how much memory particular set uses, can =
i=20
> get that info from set listing (to compare)?

Try:

nft -t list sets

Alternatively:

nft -jt list sets | jq -r '.nftables[1:] | .[].set | [ .table, .family, =
.name, .size ] | @csv'

The problem is that the size isn't always shown. I complained about it h=
ere:

https://bugzilla.netfilter.org/show_bug.cgi?id=3D1717.

--=20
Kerin Millar
