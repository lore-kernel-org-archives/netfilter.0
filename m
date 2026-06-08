Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85814395AD1
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780951714; cv=none; b=ZMbai4LmCx42/0yoyMvfVVdQ74Oyd1Pvptv01FpaZNyamRBT4g2+1OCHN9IJb6xqThb+cVwV18d19zcREVTZkQ3UCVHYl0S505bkpVSuKpRmyL8zc5jI8jPu5F0QGMO8OUSjEyFX1QWNczDaNraqqrOIMproDXjnmC+rrjESd4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780951714; c=relaxed/simple;
	bh=5jr9Hd4pNQGGirD4Xzi50cpThr3niVbZXSNIipF+qzs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lGzkIquCEmQnsSZeppJJbiMseYXFyvSBhv48O8f4tdV876pu1WgCv+46Ax7/5Miy1dyLKOyS7o9slQ95qU3407hDFW7oRJW3jiefeq63HyARqTSDnc2NFT6fVVfzQnOeIMCpFoklcUkk5LNafSoQgcT6rB4gHyk6yVRC6SdBJLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=XGHm4IEx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LC7yo85R; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="XGHm4IEx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LC7yo85R"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id BD6C9EC012B;
	Mon,  8 Jun 2026 16:48:31 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 16:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1780951711; x=1781038111; bh=wzkvCpPqP6Fgr7J45ROD848+1F+8A/aI
	OxTe5VQGFcg=; b=XGHm4IExh+nfZoQiuTtY2Qta1SLOtV5mKjdpfkGOQqJdMium
	Fpr9Gk4C8tF/Kwus3VOR0qw0ZYqhX/gv4Ml7aTuEStWNgl2dLAR9sjvRD1+qjghe
	YbkLlE/F9o1crjtifcMEyrHHGNdomhXPoZ9fHheImCwtQm5QA7GcezIYvrN/91Qp
	LRJx9IgaQeCbHGp8KCj8ZYw+jozo0ge8MdXtxucOfiwmAfKaMdVEknMGG7KWls2v
	f4TQDLVHmw4P+YflBj4wTVPYbtVIMjz1lfF2cQNoD3opR7syS0LilVW41haCZuxQ
	9GrgEwjP/xBWi2e0MO498/c0/zO8sa30emaJ2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780951711; x=
	1781038111; bh=wzkvCpPqP6Fgr7J45ROD848+1F+8A/aIOxTe5VQGFcg=; b=L
	C7yo85RSOmZCNxuxMkhD2bVPal3Cl6IFbZ7JTTHAC9f/RICLB1Ev/Es9hJp+68rE
	0uaoebejYzUuy4BFDywSw8URcAfMkltx9f1TFy/goXU8EViDh45q2rkwnwn1WbFz
	bOLgwp1ojXZb8TrbD8//zf5QfukCLdZwHQXrUc1XcTA57vuntc1/2LGfYvQsQJ/z
	QPqk+ziZKzPOr3xKDb3H5jVJAUnM0rALW5BIp3SPN/Jo7TE2YndTOVEq5H794UoW
	KSghH6IAK5WfegUNBoVBtGFRHt8BAbIgZGyrR8qT7Q9jmDm0ojZKKGKLntjkZCTN
	fK6HEYPo2bha0GBYTV2VA==
X-ME-Sender: <xms:nyonajFfi1Zq7uoEZOyHFKp7q1TSxZ19pXQREgYwim-ujL2zd35GsQ>
    <xme:nyonarJhmCtDksQz4PTJSPIxFivUYbHKZPE-NEI5DclMZ0Gd07Fv-UtpSON-o2_yx
    0ldfmprgLPy2suLePKx5OhqqprjAIEpkGT-6Onwz6EUawSlP2w>
X-ME-Proxy-Cause: dmFkZTGAY3PxC6obfyp5fgBI0ma1UOqUV7ypxXwWBUZqJ8EsDcUSBrCjbznVFQZDmXSU7L
    R7ONub2ck1Xv1z3kruzoTcRT3iZq4ZeS5GVALcluExRkaGSVKFcTl0UAShtC+npGoWcscb
    F6AtoiJmjg1M77gi+dpxP8ngH4aiS3aPYLX9G2WRcrmNxFKeXxrPMX/aWbRHgFnpIFuiBB
    U2Lu8Q3Pea9ZhEb1UHKjZTd3d7N6I+IobjWVwYg0i7aeiHGljFmMlIzHF2P3Ks8dgAX5/G
    YKjbkE73R4AC+swPiEqfIAqnktFRpM1JPzI+ho6s2PEUSE4BVDkAUfTZ996Hc1QHGJGesm
    gIck2AOq0HiRiC80O3x24VfZwJjHPRH26hewKqLPyA/hi4ETT1U8sK4eVW7YhpnbaXOJmG
    cyZH2987rGEbVv0dC6V0A4jeZMpcH0EaSM66nbTFlg+D6O/MRB7uryf0ImG5fzO1/Phy3j
    aBmoOiXp3XlyrLJeCTSabfY8jjr21TT71LvEEP4Uda2XAF/jJAU1kt6oqe0Pker+y7k7bR
    0d29TkmvuaX4HXG3gveRrxnO2dtGuilEhw5V5UXw7JxGoeUvRKXyB3NbrPq9+iN8zFB5Tc
    7YpVwIVw0UFvXrJx8MTCws11wfYrnWKZyTNl5RTl32PyeI4VHl2+0n3ZvPrA
X-ME-Proxy: <xmx:nyonaq5LcSTe8KrB9whaK31V_GaxJN9orANUOTDVO4fDoaeTXmMgKQ>
    <xmx:nyonaoN4O5Rf4nXZCHTHaZ_NOfMOu-OWQE-G0hammC7SPk-SA_nOPA>
    <xmx:nyonaom08BkMNUoUBYa63LiyKZIG3XqL5C0GcN3MdsL6_bvKm_9e2w>
    <xmx:nyonavTrzTv0g_jNjHI_ka4XJ_InPnILWDg663_v9hSpFSsgvnBang>
    <xmx:nyonalkkWMFfSzXSBUd6BEBMz000hkWLqUZ_zxom9U9IF76l74OH-KdW>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 36A79216008B; Mon,  8 Jun 2026 16:48:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0ZtpkyXIlXs
Date: Mon, 08 Jun 2026 21:47:53 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Jan Kasprzak" <kas@fi.muni.cz>
Cc: netfilter@vger.kernel.org
Message-Id: <3c59323d-449d-4f1c-abf3-2df0ada64cbb@app.fastmail.com>
In-Reply-To: <aich5cMiSFlr1pcH@fi.muni.cz>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
 <aich5cMiSFlr1pcH@fi.muni.cz>
Subject: Re: Logging SNAT'ed connections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 8 Jun 2026, at 9:11 PM, Jan Kasprzak wrote:
> Hi, Kerin,
>
> Kerin Millar wrote:
>> Unfortunately, it appears to be a bug affecting ICMP. Possibly here:
>> 
>> https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189
>> 
>> For now, I would suggest filtering with something else.
>> 
>> conntrack -E -o id,timestamp |
>> perl -ne 'print if /\bsrc=(\S+).*\bdst=(\S+)/ && $1 ne $2'
>
> Oh, I did not expect it to be a bug.
>
> Anyway, you probably mean src= in both cases. Using backreferences,
> I did it this way:
>
> perl -nE 'print if /\bsrc=(\S+)\s.*\bsrc=(?!\1\s)/'

The idea I had in mind was to compare orig.src against reply.dst. Where orig.src != reply.dst, NAT applies. Your approach compares orig.src to reply.src. Those will differ for most flows, whether they were subjected to NAT or not.

I would tend not to use backreferences in that way because it becomes quite easy to make a mistake.

$ printf 'x=123.45 y=123.45\n' | perl -nE 'say "matched: $1" if /x=(\S+).*\by=(?!\1\s)/'
matched: 123.4

--
Kerin Millar
