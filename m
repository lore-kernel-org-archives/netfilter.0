Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE5E14B09C
	for <netfilter@vger.kernel.org>; Tue, 23 Jul 2024 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734394; cv=none; b=SfWcpelAMzNNW+52tOATgowiduiudfGI/EBTDaD0D57g6nvuAkgkNNpU0SJ8FVgEvv4ipnTvJZl3/yv6zumPYfYL43UxylT7pKs0O/6biEAvsIbcCwihMXouQX87XZiN+MmlgHCPbLZ5TWOhxeVcd3Q1uB29IQKSP/oMEBpMiQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734394; c=relaxed/simple;
	bh=conz6jUGDjCn15j0rn0wZI67rJTA0Fj6Igezylpn2ZY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=JYCDJFPC5PpcROtxYBm0QVfU4klqiLh6f2bEw403Ad1OMBS8KADNCem4pv/egl4nEGxWiVDLsV/5WMa3Ax6fu4N8mYy6sVSJ49g7snfTBzd8sF2rSY7KCK2RiDEupyUWVoTqxVKEfJTNUPEZFWdBrwR2pYkCXNhFwqayjAuaRaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=kAZi5w2C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L3mIfX9T; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="kAZi5w2C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L3mIfX9T"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 3DC0C1380682;
	Tue, 23 Jul 2024 07:33:11 -0400 (EDT)
Received: from wimap25 ([10.202.2.85])
  by compute3.internal (MEProxy); Tue, 23 Jul 2024 07:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1721734391; x=
	1721820791; bh=mTeoUMiW2uf5IdTSafG+sfkEFeogxXfGPrqi+aTZdZM=; b=k
	AZi5w2C/m5IqunlkJZCGE2jnZFA4KQKdaIvU6NI1AxWwE1v38Nv4mw3vuRwAxAIy
	1G8GihAeDiRn4FOvmYzEQlkP2claLHKFTQooVjBqjgOAEcoerubZdt8pztpvVjwB
	uQf9+yVdW9HY/TzOnFw/HyF93Psirkh0SB3IDTh/sFTQu1lfNKgZQMPVAPqGEaAN
	L1obH19iRWlXa/a0DApTUnbuiN+Xel4n0gm0sjvDm/WXrEMfiVl8G9g4agvCyDwm
	UcS2QGgvOUOhuuZS/yWiVM033md6p133z78VRAPKWdAmULDsTz1gxSmU6C2Tg82n
	KZww5PyP7CRCokpU9GQOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721734391; x=1721820791; bh=mTeoUMiW2uf5IdTSafG+sfkEFeog
	xXfGPrqi+aTZdZM=; b=L3mIfX9TmhbLq1OhGO0vIc6JrGkCBY/+RvUm/V3At9Pz
	fsUvv1cjuw+Jal02Xkl1A2SI3uXkFihm79soV4Z9/rgR3glUiQFr6ptLlHUGRH01
	a7F2IigBRrAD7tSxyznKIN4L5eKv84dvhkLR0psj5yC/6n8ADRUNwMSvl8hRgwXa
	ytouE23kGrYdVa9D+yHCbGmDb4MS/Hs2GEcXeamCAz7vdHGN+lADvM0E2QGK8BQI
	vfGeAWOYHDs58xKITeBAw+Ftv56OeKPWDMoDWE6ozcZiB+L3dagkg20vakPyoUyX
	Sc2YRnx/tr3i2muNm79KRAsMJa6fnbx8yUr50El59w==
X-ME-Sender: <xms:9pSfZon9zOirTgPply6yrhMMkOp2--AmRPAYGe7FYhtMBPPcPHUvow>
    <xme:9pSfZn0lUxvHIF_JVYC5xIZe-KLZ_ywgeRACoLSlI_S44d7iwpJRJURZ7dcDjlTKk
    x_QFUw7T8q_kuiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheelgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfmvghr
    ihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepvdeljeehfeekkeehudekuefhffehudekhffgvdetgedvfeehieetudff
    geehleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:9pSfZmqcsUK758fV-asWyAGFvG048NGj54CFdPNwFMDpr0XF5i7pdg>
    <xmx:9pSfZklBwlpPgYys5hgbmocfkEjt2VmF5ZG38wl7OsC9pt5tV8O3eA>
    <xmx:9pSfZm0m7eRsk15iDiVf4bNwAggh1ggfUVGovTiwafBl4dEJQuwy5Q>
    <xmx:9pSfZrvm4fzsXLccood_KhLZoEqCa4YaVHhra_8MHFCx4mwUelrGKA>
    <xmx:95SfZkC0-8o0t11F43Re0l61kmIlAlYpLq_wZGCLZFnteIySNxUc_3fl>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8B2C01040062; Tue, 23 Jul 2024 07:33:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-582-g5a02f8850-fm-20240719.002-g5a02f885
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <205f7dcd-150c-42a7-83c0-6d4a36a5f2d5@app.fastmail.com>
In-Reply-To: <Zp96TJrXOz3ZIPLK@calendula>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
 <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
 <20240721132337.29d2fbc9@bonifac.skk>
 <4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
 <20240723092439.7b9f7b58@bonifac.skk> <Zp96TJrXOz3ZIPLK@calendula>
Date: Tue, 23 Jul 2024 12:32:50 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>, Slavko <linux@slavino.sk>
Cc: "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Content-Type: text/plain

On Tue, 23 Jul 2024, at 10:39 AM, Pablo Neira Ayuso wrote:
> On Tue, Jul 23, 2024 at 09:24:39AM +0200, Slavko wrote:
> [...]
>> (The host has >6 GB of free RAM, the list has ~1700 items)
>> 
>> Initially i blame IP duplicates in downloaded list of IPs, but that was
>> unrelated to this error. When i remove the first "add" and "delete"
>> lines from script (thus just one "add"), it works. After initial fill it
>> works with all three commands (add+delete+add) on already filled set
>> and even when i flush that set, it still works. Only first fill (after
>> boot) ends with that error.
>> 
>> When i delete and create that set, i got "Out of memory" again, the set
>> is defined as::
>> 
>>     table inet fw4 {
>> 	set myset {
>> 		type ipv4_addr
>> 		last counter
>> 		timeout 2d
>> 	}
>>     }
>> 
>> I tried to add "size" into it, but that doesn't help.
>> 
>> I roughly remember, that i read something about some memory limit in
>> container (i am not in container), but i am not able to find that
>> again to check if that is problem.
>> 
>> Please, what can cause that initial fill error, how i can debug/solve
>> it?
>
> Kernel is likely missing this patch:
>
> commit fa23e0d4b756d25829e124d6b670a4c6bbd4bf7e
> Author: Florian Westphal <fw@strlen.de>
> Date:   Wed May 8 14:52:47 2024 +0200
>
>     netfilter: nf_tables: allow clone callbacks to sleep 

Would it be safe to backport the following two commits to linux-6.6.y in isolation?

3c13725f43dcf43ad8a9bcd6a9f12add19a8f93e (bail out if stateful expression provides no .clone)
fa23e0d4b756d25829e124d6b670a4c6bbd4bf7e (allow clone callbacks to sleep)

-- 
Kerin Millar
