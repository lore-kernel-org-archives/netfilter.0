From: Born Without <blackhole@airpost.net>
Subject: Re: ipset net:hash and nomatch option
Date: Thu, 20 Dec 2012 06:33:30 +0100
Message-ID: <50D2A32A.7020600@airpost.net>
References: <50D1F9AF.4080701@airpost.net> <alpine.DEB.2.00.1212192202000.23162@blackhole.kfki.hu>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=jsxE1kPVjIhagFk8waX3pXXm3wo=; b=gyGqem9Cu/q7RqB3Lw
	rj8EA27nBYu94wg8xICJpVgU7h2HbUqJCOfBSySOsXSeJXX9Hw8SNb97Ygb5vyHR
	rtfCnpX6t972Oqc+BHpQG4ed9SGsb7k3Kwc3MgwqAieyHyEy+U7kZRe6B2Pc8Sx6
	tXek5KXYLsQK9ITOi3nWYfYA0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=jsxE1kPVjIhagFk8waX3pX
	Xm3wo=; b=XHy9jySJFhNBdTi+ZNiLM4P5l6Ekra4rbVuhR7tCnVXLdmR2HMkNcJ
	hBpHZJ16HIaru0mOhUILy3RAZx7TNR1j3TlBxVTa11N2FRiYA5hbxkBLhAf292KM
	A65SWvSv/Qf2gUkPRxFoyisyAmrGSR+0mFzTG/ChCe5WiDSChuXs4=
In-Reply-To: <alpine.DEB.2.00.1212192202000.23162@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 19.12.2012 22:08, Jozsef Kadlecsik wrote:

[...]
>> # $IPSET create foo hash:net
>> # $IPSET add foo 192.168.0/30 nomatch
>> ipset v6.16.1: Unknown argument: `nomatch'
>> Try `ipset help' for more information.
>>
>> kernel: 3.2.35 (vanilla)
>
> The feature appeared in 3.7 in the vanilla tree.
>

ic, thank you Jozsef!

(guess one needs to read git logs, not the newspaper in the morning :))
