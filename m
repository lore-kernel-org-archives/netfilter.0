Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E37C23A561
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934269; cv=none; b=HQG618vGqmrxtshtQZa3dP+hHtt3W/BTUAd7QyL6n9oWpB3vsHvuOCflPXbg+5xs9vG+lNowyb5LU80Q5dKnK+1o1WQz8ZhohFUdgwxNr+Ms3BVGjDz2ix/4S70Km4HGhmvFvhIfnA6bSMda34xoZx6WhGlf5MGBXizV596ZsXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934269; c=relaxed/simple;
	bh=xz6SOJAz+CM5aYy3P+S2KWBpEQtFo8cfF+Nk6XsyqFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D6iQzn44KyN9sysJiOwFNGUL7J6QchNrNypMMLz6/dtWHDdgObTI5qv13k8anQ/EfNvrvNkDRsgt96b1E1+NVsIoUBzPDQPSdDcHXHGjdVkawT9IxUJXs6Jz4Fy0HySlIkC+yoNSv9uiOR+OV4WquSEcKz7VAcXoUvQ2gbYvSO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=WL9eJXAd; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="WL9eJXAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1780934265; x=1781539065; i=lars.nooden@gmx.com;
	bh=5p4NtSg19IfL+0+c07WCsxM4RMHvNZCpukb1Y9sY+Jc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WL9eJXAd1JjWec2sHUP+BP4lr1c/JS1v8yx5QDBfXnqCT6LHjBKTnDz7gQFo7qqH
	 UkPPL3ljJSACS1HsD116nrqyUWCD1ybYom6AnVCPs7Yu8zlHsq35TkkQul7UhCuA3
	 ulg6crYisRESsAw/rGIO9uX+YbiBKQwv+u/m4qAMTQO3zHQX6XCPCaOmi5TVE6cB0
	 hQ4Y7qVjmdSj918gVY5KyfrXqZiDZmOL1uRjKbAHEpPzzr8QWcWGQ/sPYdJiUuLEo
	 W/PAdD6QI3mvYdTmDGvHzWG90YllHKJT/O+MciO3YvIAUUqWlM5J/R+a2rUbFLe8z
	 jbWEIZuAfucC/pkxvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mr9Fs-1wzbZf2JEM-00kEkl for
 <netfilter@vger.kernel.org>; Mon, 08 Jun 2026 17:57:45 +0200
Message-ID: <6141c93d-ca25-4b3f-8a6b-b048f2ec595f@gmx.com>
Date: Mon, 8 Jun 2026 18:57:44 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on rate limiting on nftables
To: netfilter@vger.kernel.org
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
 <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
 <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
Content-Language: en-US
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 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 ag==
In-Reply-To: <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xqjazdsl2/4pUjyCWItSDHvFZz5R9ABx9Ak1s3yxQWKejR47RZY
 TGtTzAg8sOd1tXD03zEy6mfEc/pKX5cBqe94PdqoMcMV+01rwgLW4uR9nZdkqZBeWYLVUtU
 9TMDC/gqeIV+VjLHJ+o50mILzHV8UBww9pCnkoW3WlWiVpOi4Dd2PgTttRXxS6FMMDe4/3j
 jIgwMqOX3Y//m91nVYP7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8BDNcGjqCDw=;nyv9BHRZkqUVgPr4JhAioP+XO6B
 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

On 6/8/26 18:01, Andre Rodier wrote:
> Also, a connection attempts on a
> different port should immediately raise attention, as it is involving
> more than a basic SSH scan bot.

Shifting ports might quiet the logs somewhat, but your SSH port will be=20
found both quickly and easily by bots.  That has been the case for a=20
long time:

  https://bsdly.blogspot.com/2013/02/theres-no-protection-in-high-ports.ht=
ml

It is difficult to fit nftables into mitigations for those probes=20
because modern scans usually come from a wide spread of addresses and=20
networks.  In the case of SSH, using SSH keys (or even SSH certificates)=
=20
and turning off password authentication clears out a lot of the bots,=20
but that has been mentioned already.

/Lars
