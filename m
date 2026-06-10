Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17EC403AED
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093118; cv=none; b=RdR6dt7rC0V62GfdYq3338XQY2qtp8FEFMdDbZOg0rHcqnCfOvZ5ndJYdn/taivXRXSnLKYUNWs45R0L/0Q7HOm8g1+D6IKetHcs2h3wCxhnoppAhDn6WnmiC5egCl2XaxLmKnLjlxYi0Bu7kq+7xTTwJYVIIp7HJPzFZsrAt4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093118; c=relaxed/simple;
	bh=7LPV8bMTDviimSOUQ9ra7g0l6RqxaaInORIHO2KJECo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KrZdnfdDgNrnIrBjYWdXgoh6gtzSy7tKn0A6udrxTZnpnWcpbOaEDZZTuMR7CNoPrf5MNSYLiQeMTyrY0BVflRDnKjP/2nTKhxCEiVxqL138AtwX8hBzGc++5aVawd2lEB96x0ku1rMaMfaco/YUkWDCSp169fbYsrbP6g4XRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=AdtMHq2A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A67WZCQI; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="AdtMHq2A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A67WZCQI"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 056FD1400157;
	Wed, 10 Jun 2026 08:05:15 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 08:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781093115; x=1781179515; bh=7np06NRlK8dbHEErGyiklJ65y/ahnr4Y
	Y4VzyFxCknk=; b=AdtMHq2AN5a6MLDzkFPyhBzS8JqS6Im/2jdLbnCH6DnKPANv
	2OOWA20el7ZmM+ydnevWebanTONKJ7gOEqrbbtBup02ifNP83u7+3+XqErHWPwlK
	rW6mzekUlodm6DPt+Yltk07H1dPDcGjM9GZUD10bNBhR2qfCU7wZHF2YI8upSzK8
	f+N+9ov1LkXZANAbI96q6aAQuofsBHxmUweowf39PDBBwpSVCJb5zxnvr448zxBa
	JrBLXFxPGaSTyf1sUeCwBt0SwG3aZirwsNtnWOynTi/YI4FWW3jt44nAy78wmmo0
	ScdJdWqbei+TP603aMY7s3YGAOQP1olCWcyaNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781093115; x=
	1781179515; bh=7np06NRlK8dbHEErGyiklJ65y/ahnr4YY4VzyFxCknk=; b=A
	67WZCQIEY/SHGVgjeSJZMRlQJPThMxHXOcYLwAyofevFfs0ovZkSfz/9dqw/1n0Q
	lihjy138vskCQKyGHTpHdaq086l9zbDsGWnog2850lGCJwJfj84lRMWsRfQ0YtcQ
	ULw+PFhDli7pvCf8zA+w+vrTyLJefh5XsTfJcBX/7abznLiONurx4uy9Ifr9WwWh
	3kKADiII/CCDHE9ukiN11nCShTnkn+VTrr3qpMSo7T57GG/AT5LSYnQkbqketv73
	MYa7MrILYpd4YOJ1G8mANfRpJafbJaFxfz1mk4SbbcApywHSdjJB4MICr8M45ChQ
	K7Byz7KPDIScudIPIyufA==
X-ME-Sender: <xms:-lIpamWh6uP0FBskugsWgpLtawJN9tRO5wceEXFujTrYHVM0RETGIQ>
    <xme:-lIpatZJkhKEt7zgJ2VRhvmQHSvRc7tkllEelQfScd-Uu7qInmtNErtD8A5QDmN6M
    bwlbpJsbkUMDpIWXmlT1Li9cg60xbzerMYkphGJcLHxr6Tiv0pH>
X-ME-Proxy-Cause: dmFkZTGHWBWMOQKxSOzc1X3Rn0aAGXwicY1BCisaXNSRCIafmsl5MR9y4LhnWNrQ5mnKXf
    b8p10MpCCL0JhPyJ/uugPklsbcZcUApKEBSSit0CAzgnKnqyd536Ybg5ziXZGCvAORXUNb
    SHaKtaknK7njuffdnsVG6FfK8QVbaBPJT85vA738nJ3pI5tdnFcHrDv+RBtZ2lpKs5hp9M
    8I0H6pijXG1He+J51DFjihLrzYUe7QlsnTCEHcLlM4xg4HSXhWv3JKAU+I/ahu3bu7v13+
    JbS91EGNb8TxNnMX2soCetKZ6gZB/2SIoQ3g0gprhU1/UuDPFk31PkDZMssMeErFFVXjbH
    NYcTzLsyEatvq3I9ingacZUe+Jcqa9HeFWQNM4ALmkjcLk9y16nfKI0CE4M7VRCMM3W2Tl
    3+0ayvdSO9QJvDZiB2wnV6TZTesIOl60f0uvQ9U/RdlcWeS7kIHuXFQrA/D1P41RYnxOnB
    gDr2GrUjZT2GFvWtEC9gOiTCl1GNrr5t2Bq9jQp9LtfOii4Hd0Q/Tk4YXrdsvvvJKuM5WF
    1MJ2cVKxc6BwoXiKvsFlewUMctV+Y4VPH8r/7Tnz6DbMtHHbjgwMnGM8Lt3QODBKu+u6PA
    AZeRoycsbih2n+qn/Pv57abDe5MDQoOl9wFrzCwIEJRmGMZkEVqM2ZCAEREg
X-ME-Proxy: <xmx:-lIpal7z9NFUpTg9zMuS4OrShVPkMDPHqxuWgIc8QHdSwVtaw4lTGw>
    <xmx:-lIpajCUK2Ec6k47857WGjQhJy3wSKrcRa9YkRb24TM0dDUfsB5tQg>
    <xmx:-lIpakZCxDBNKW-UrUlcnMK7RrY3zx_ObJPGELDchxacmK5MEysN5w>
    <xmx:-lIpambc0UYPqgzF6PZJESQqTGJBdRIUWWt4kot31Nvo3Hd8NW1Y4A>
    <xmx:-1Ipas0Zva_L4Hq9dtXolB0qAFt0okCF4vTDRZdYJB6kfEEQpQUUfSFV>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9FC862160098; Wed, 10 Jun 2026 08:05:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0ZtpkyXIlXs
Date: Wed, 10 Jun 2026 13:04:54 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>
Cc: "Jan Kasprzak" <kas@fi.muni.cz>, netfilter@vger.kernel.org
Message-Id: <74dd050a-3587-4fdc-b06f-c82a9fd398e4@app.fastmail.com>
In-Reply-To: <ailH6MomrFCvxH8Q@chamomile>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
 <ailH6MomrFCvxH8Q@chamomile>
Subject: Re: Logging SNAT'ed connections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 12:18 PM, Pablo Neira Ayuso wrote:
> On Mon, Jun 08, 2026 at 06:53:30PM +0100, Kerin Millar wrote:
>> On Mon, 8 Jun 2026, at 5:38 PM, Jan Kasprzak wrote:
>> > Hi all,
>> >
>> > how do you log SNAT'ed connections for further forensic purposes,
>> > when somebody complains about your public IP address and you want to be
>> > able to find a local user behind NAT?
>> >
>> > I used to run something like
>> >
>> > conntrack --event --buffer-size 1600000 -o id,timestamp --src-nat >> $LOGFILE
>> >
>> > which did what I want. But now I tried to run the same on AlmaLinux9 host,
>> > and it seems that --src-nat filter does not get applied - it shows
>> > even connections which are not SNAT'ed at all, because they are for my
>> > own IP address:
>> >
>> > [1780936563.343940]	    [NEW] icmp     1 30 src=128.1.227.61 
>> > dst=xx.yy.zz.13 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.13 
>> > dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
>> > [1780936563.343994]	 [UPDATE] icmp     1 30 src=128.1.227.61 
>> > dst=xx.yy.zz.13 type=8 code=0 id=8724 src=xx.yy.zz.13 dst=128.1.227.61 
>> > type=0 code=0 id=8724 id=2525400839
>> > [1780936565.281121]	    [NEW] icmp     1 30 src=128.1.227.61 
>> > dst=xx.yy.zz.11 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.11 
>> > dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308
>> > [1780936565.281167]	 [UPDATE] icmp     1 30 src=128.1.227.61 
>> > dst=xx.yy.zz.11 type=8 code=0 id=8724 src=xx.yy.zz.11 dst=128.1.227.61 
>> > type=0 code=0 id=8724 id=2574615308
>> >
>> > Here xx.yy.zz.11 and .13 are my public IP addresses. Why do these connections
>> > show up in the conntrack --event --src-nat output? Thanks!
>> 
>> Unfortunately, it appears to be a bug affecting ICMP. Possibly here:
>> 
>> https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189
>
> Maybe then this helps?
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610103039.167819-1-pablo@netfilter.org/

I have not yet tried it but shouldn't the helper function be checking against the protonum field? Also, the referenced commit appears unrelated to the fix. I think it should refer to b4c3a23c884c.

--
Kerin Millar
