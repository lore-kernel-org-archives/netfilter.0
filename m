Received: from mta246b-ord.mtasv.net (mta246b-ord.mtasv.net [104.245.209.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9513B2A5
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 21:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.245.209.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728422300; cv=none; b=loMX8kMaxZINandjAXvNwuqkmeVrBellyihO7kcXGGPlVcbrsFXshPf88/zIRuT/3MoxBv3CZiQPWNW8h6a35kM+CGzhqySNSpfzxFO65/lHed3MK3AjN0JSQUcS/2J5gAOG35IuEEsyEGEAUgmbEbE/rGO3lomwYGlTX/Ko5II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728422300; c=relaxed/simple;
	bh=bgWJilBLUhngy+PpfDw8BDg76o5IIGTHth714+RThEg=;
	h=From:Date:Subject:Message-Id:To:References:In-Reply-To:
	 MIME-Version:Content-Type; b=IVsf34J+JUOCYNELAwZtd/0kW6xhYAexoxpyjyr5tar1d9uV+hoVWQp2sQYhnbXmnckaz7vykpgWKwdjXqdNGuT/KOn9y89RrmbzRBngKrJ3ZdhZhxg8Z+GA0aso4EJJpRm/0Y/BfvfHfZypXD/OfOmp5KjCVbrdV2sbsSw4ASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com; dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b=Eqg1Ltsn; dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b=blfcc7wk; arc=none smtp.client-ip=104.245.209.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b="Eqg1Ltsn";
	dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b="blfcc7wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pm20241004; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:Reply-To:To:References:In-Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:Message-ID:
 Reply-To:Sender:Subject:To:CC; t=1728422298; x=1728508698;
 bh=q9aqXh+i8wJDv7/odZhk1Q4onK1rcIIsfWw6WpTt5lU=;
 b=Eqg1LtsngeOtWlueUYfiqMGcpE0Pyd7r+bp4+kmrhO30K40UnuvGRyFJJcvPwhkXFxiV04sFp1Kp
   9V+pyO5SDcWtKTcgUmWuKqeQkhHbxPteACQkmwUWV1r77nWIWBE1ytU9CEdI2Gky/eqE6RdBauRY
   gX4d0L3asV+o064qzHOSVCO1hoG6ZUFQQcFlondqwqEf5lQIpf3uD1zgpGaMJH0/RWCHMgPCa1Qd
   npsgsjGUTTjIy/cL54HuYAXwqEc1Ip359Hf7Hq7bi84Ao3rdkvQnuRWbgGK8db1CEv6W3TC5CLE1
   e8mjCKDJvpMx21JN/1SqOZggPJ+aEgt6O0bUug==
Received: by mta246b-ord.mtasv.net id h0mgpc3864oj for <netfilter@vger.kernel.org>; Tue, 8 Oct 2024 17:18:14 -0400 (envelope-from <pm_bounces@pm-bounces.black-sheep-research.com>)
X-PM-IP: 104.245.209.246
X-IADB-IP: 104.245.209.246
X-IADB-IP-REVERSE: 246.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=black-sheep-research.com;
	s=20220127112152pm; c=relaxed/relaxed; i=martin@black-sheep-research.com;
	t=1728422294; x=1728595094;
	h=date:date:from:from:message-id:reply-to:reply-to:sender:subject:subject:to:
	to:cc:references:in-reply-to:feedback-id:mime-version:content-type:
	content-transfer-encoding;
	bh=q9aqXh+i8wJDv7/odZhk1Q4onK1rcIIsfWw6WpTt5lU=;
	b=blfcc7wkyEaUNkHLkuFr/zka+dC1YY+MWgPTZ/xg9R/mTy6cSbqZHHRS4tz07/9qnD8mEecB7Az
	xMSXYTktYfCX/joKVgyOx1Xi9jUqj8U5X5PK/VB0M6ZB59KfyJEtqV9km8vSyv0wndHkKPjdP3cNX
	p1eqUCbwUbQ4glpPV/M=
From: Martin Brampton <martin@black-sheep-research.com>
Date: Tue, 08 Oct 2024 21:18:14 +0000
Subject: Re: Problem with ipv6
Message-Id: <98f3cf05-f4fa-4f13-9044-508ccaf17728@mtasv.net>
Reply-To: martin@black-sheep-research.com
To: netfilter@vger.kernel.org
User-Agent: Mozilla Thunderbird
References: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net> <bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com>
In-Reply-To: <bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com>
Feedback-ID: s8569101-_:s8569101:a226829:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: 98f3cf05-f4fa-4f13-9044-508ccaf17728
X-PM-RCPT: |bTB8MjI2ODI5fDg1NjkxMDF8bmV0ZmlsdGVyQHZnZXIua2VybmVsLm9yZw==|
X-PM-Message-Options: v1;1.vvHvx_gL0x7jgtImj5-COw.6AuHrlnzy6mKaQBaMLT20jWY9ROpmIbdc9mRMzQJl4U0XyN9xEAzCNUBXpeexZh04L3S9pkLqK4AEBhatY7rYdn071aolluGqThBbDpAaDqZ9bW7fttxROYugh49NPKMGHZ6rF0DAgN1eQXZItw0YVTlaVsu8NknWHhXEyjkbQTq53mZdzzezmsyxtzzrJK9
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-PM-MTA-Pool: transactional-3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ah, progress! If the policy is changed to accept, things work. Also, if=20
it is kept as drop, but the input ICMP rule is copied to output, things=20
work.

Is this a sensible rule?

  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 icmpv6 type { destination-unreachable, packet-too-big,
time-exceeded, parameter-problem, echo-request, mld-listener-query,
nd-router-solicit, nd-router-advert, nd-neighbor-solicit,
nd-neighbor-advert } accept

On 08/10/2024 21:28, Kevin P. Fleming wrote:
> On Tue, Oct 8, 2024, at 16:08, Martin Brampton wrote:
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain output {
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 type filter hook output priority filter; policy drop;
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ct state { established, related } accept
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request accept
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request ip daddr
>> 127.0.0.1 accept
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 icmpv6 type echo-request accept
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ip protocol { tcp, udp } th dport 53 accept
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 tcp dport 123 accept
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 tcp dport { 80, 443 } accept
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 tcp dport { 25, 465, 587, 993, 995, 4190 } accept
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> What happens if you change this policy to 'accept', and make no other cha=
nges?
>
> At a minimum, you aren't allowing outbound IPv6 ICMP ND packets, which ar=
e required for finding other hosts (analogous to IPv4 ARP).
>

