Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801CD4071FD
	for <netfilter@vger.kernel.org>; Sat,  6 Jun 2026 18:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780771743; cv=none; b=uDQzC0BhhNRYER8TeAHaaCLEF95XMl9SBI4SdIvXdoq/WcT4EuRPZtaCHhc8TK9yGoMol0bZs9GAdBpWL5rK4gXd2Cl84EjbZ9tgVDkPaZr9Kyth3HV9q6TxzW5Xv/UH/vhhcZH8NJPGwDUaAAA+CbMNqpbPYzlt+RW3StvgMf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780771743; c=relaxed/simple;
	bh=w5ZQ8QeBJvD61/idbjgCsAWGZ6XlFDfHLoANFqIUb3w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=a9ooFECfE/oFYmqz75GQGB2QEkAlfUaoJGeZNnUngA2QnwIbzlPz+b+q0R03SWViau89/ICNAlkMZJUfDeigFRLOdUq/wcbQETogwMgVDMZ+1yNtnIkWtQX51ZdFEJgn8ECdAPMXUHVGioIz+aRDArAr2ivoqjHwZgsAw2pkbMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=CGqcqVFH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gaKKExVC; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="CGqcqVFH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gaKKExVC"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 8C37BEC00D7;
	Sat,  6 Jun 2026 14:49:00 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Sat, 06 Jun 2026 14:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1780771740; x=1780858140; bh=w5ZQ8QeBJvD61/idbjgCsAWGZ6XlFDfH
	LoANFqIUb3w=; b=CGqcqVFH/p2G0NaaiAL+TDJGAfPMYNye5/Hov6nGaFwq2FgJ
	j779II0yEMzKcgGwlLWIeu5dG6bNmNUPLR5d6QSxazOo5A86SjLbEipdufmA+FBC
	0zuG3szk/cIyRdaG5eyo2QW5OxFB3YuebVgXUUljK9qxNWQEwPuYWwM5vlwF1iX6
	cFZWMLScMY3ldgswDUsMmNBK1ClWHxdqugC9Le8wyCub8FINvjIpMI+7UqGitYGN
	uBVFbf3DHEOJoGmsd/NIEokOIWRyd1BCfDHfwR/fc7LvOFXZR6dCasYy7k0com0Y
	zAk86unxqInS9oZncs1ug+8HbAouXVxsh3PkjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780771740; x=
	1780858140; bh=w5ZQ8QeBJvD61/idbjgCsAWGZ6XlFDfHLoANFqIUb3w=; b=g
	aKKExVCBCt8qWRg7ze+OVRUjF0SsWXqZ2PLUCCqIvDnlZtTi7IQkb7L0RjHuqqcq
	C4J9VG/7LtXoKIs+YnllbgaebmYHMD/vW9R1Rbv6tgBfilVvDdDUuLLgx3MYRkbw
	t2TjhT5oz+iefV83tgRbQY+FIob07MfMCsz6UlJzjSS/jVYNgSYxxJvxtz4Qn6k2
	hBvl19B5cw+hH2aHCK6jQ8T7douBGAe/B9/iFf9eVeOVYWwcDxoZBt9LtrY7xDiS
	eIhajLk9Zt5dxt40UrPVXs44pZNC87ndBAwO1P/Wt+bvwauPafTFSUvMP6tLLh1b
	aseJ/LS4puqrdlOj1rqxw==
X-ME-Sender: <xms:m2skas0DhD9F4Opb_HDYoNSXCfm7BogqQ4-bY12tpk5sOgVAVVaPQA>
    <xme:m2skah6gKslf-ZtZFC9xPO1ndPAToLdjUv6dl0NLyIrISjgfn8mYvgSFwhmAnDK-G
    tqQt6Np-kAhBJ6O-tpd5BrOm4hOOmloWyNFESxLGjEdybj6OsLQ>
X-ME-Proxy-Cause: dmFkZTGL0hGoFfzmghY/Bu4+NISy0GApZ1i+9XaNIvw8RQQ9mB4/kAHcooeJ2arYfvY1oT
    hHJkMqV5yAQnCSS357DW/6m/FR8M57sZBb4FwI/Qf68OXoiA2V3qdhMRFnV890xuzb39tx
    FYRJo5VSwA3cekwvwEUf0qKYwMNkbtp664Zxz0bS0tXxHv1d+k29MmpYaLwtVM4LPplV5/
    XhWgpVAt37+rjhCh8ptz6HQBwWXf1svvpVReSBxfk6ADhhtVL47PM6Zu+pQAKGZsDFkn2D
    tHnsFhx/gCVlGcI2qZH9rJggn283v0kpqdAMuDRu27sS9uXFH0sbgDfZ6ZVmzlJuze+eNJ
    FMSaucBPVms9O4hpwWYCjcfmSmqz+CL5dvex7Ugwbb8lq4dnn7jONaioqKE3jPcnYbEGk5
    XbL+q33ER/v/S2RSwgyhEi1L/v9WGOgLKHeNJScq0DQWz67Wq/uuD7M4WVlYVl6nod018Y
    P1cgCSCXmXD+WkJB7uaT8fbp+XuDxLKWtM0N1SUdgW7JzoCccBCj9jLV7EdSaqKrk1jS2G
    wupSR4f/mqaPY4Ve6oel+XlpLdWgc9O5i/759V/Qa/tjyq15FDrjOFhqLL8b4V98iXxUPV
    7W3RNh00t5gjN/6PAKDHJSXBOkZR8lVoohZuhxgJncM1v45KXJPPCu/qyG+A
X-ME-Proxy: <xmx:m2skaqreKY8aJEbilpG1wbC4zc5KHmEDJlENMya3LTNI2nPr3nc3TA>
    <xmx:m2skas91MOFcwkXBKetPFgs80WmSZ3ukH_YHkApLQvS6tRCnOsZlhg>
    <xmx:m2skauXV4mMJ86yN9fFcQz1OLU555UkUmyEX-UkwigzCXKR3BzZeZA>
    <xmx:m2skaiDIrspFtPzGc67hAM6aFqALRBSw82Ykzg1cSVJyLnAQimnt4A>
    <xmx:nGskakWqHYGaKaw1Vh2m3ts0JmHyO_ROVUya2CS2jjDumunZ31cMXLVQ>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A5C9F216008A; Sat,  6 Jun 2026 14:48:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8Q2qJYAM7bV
Date: Sat, 06 Jun 2026 19:48:39 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Jan Kasprzak" <kas@fi.muni.cz>
Cc: netfilter@vger.kernel.org
Message-Id: <2388d669-3749-4743-b3b8-994ca908d0ff@app.fastmail.com>
In-Reply-To: <ah8ymM00JGqUZZYW@fi.muni.cz>
References: <ah7ylcA705Ai0HQi@fi.muni.cz>
 <93605739-24d5-4402-9212-b06ffefe9b46@app.fastmail.com>
 <ah8ymM00JGqUZZYW@fi.muni.cz>
Subject: Re: conntrackd master-master IPv4/IPv6 configuration order
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Yenya,

On Tue, 2 Jun 2026, at 8:44 PM, Jan Kasprzak wrote:
> Hi Kerin,
>
> thanks for your insights. Some follow-up question:
>
> Kerin Millar wrote:
>> # To be run by the script that commits the IPv4 states into the kernel
>> conntrackd -C /etc/conntrackd/conntrackd-v4.conf -c
>>
>> # To be run by the script that commits the IPv6 states into the kernel
>> conntrackd -C /etc/conntrackd/conntrackd-v6.conf -c
>>
>> The same goes for the -f (flush) and -R (resync) options.
>
> I have been thinking about going without takeover actions altogether.
> What could possibly go wrong if I commit the state from an external
> table to the standby node kernel periodically? For example, to run
> conntrackd-v[46].timer systemd unit on the standby node[s] all the time,
> committing the data to the standby node every few (tens of) seconds,
> and should the master node go down, use the data from the last commit.

You could set "DisableExternalCache on", which would allow for the received replicated states to be committed to the kernel conntrack table in realtime. I have never used such a configuration myself. However, I can say that there are some caveats to be aware of. One is that you may need to size the conntrack table accordingly. Another is that the write path becomes more costly, since it reaches into kernel space all the time (event type filtering may help to mitigate this).

--
Kerin Millar
