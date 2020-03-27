From: Daniel <tech@tootai.net>
Subject: Re: What is the BEST GUI frontend to iptables firewall?
Date: Fri, 27 Mar 2020 10:04:53 +0100
Message-ID: <170b849d-a5cd-aa1c-e7da-4a189e1591be@tootai.net>
References: <65bb6d398e79b3d924f518d20f40b48e@teo-en-ming.com>
 <330d7201-6561-61a9-9095-8bdf8ee1518b@hajes.org>
 <fc1f0389e127ff74ee2b22c003918c73@teo-en-ming.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1585299900; bh=pzL3bej9Xg357yA09Z62ok4hZgo6IclXGhIuLnYsoaE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sczf4NiPpyQw7n2cl2l0x/rkkOjtV/Xgw0uYbtq2TiBqEUwBBnLGHAXmmjgtAJll/
         ZBpzYMPZtZLkXIfYDWkbTCS7At41pCwOREDfSnovPtNM1KdEpVZZrTpTciyGNUAtn1
         TaIzuF3+lV6AIiqHp68vMDY2Nq/f2xhJgJhtEAlc=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1585299899; bh=pzL3bej9Xg357yA09Z62ok4hZgo6IclXGhIuLnYsoaE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ruKcA1wU45XXGDI6a556OFT4FCe2XlWYKjR8iezFYDQKTSwfloHwfpM3fyWjx7u17
         sBQWamrZmVIarhKL106C+wOmbFsvdY/OpgbUuiynd2ZhFnc2ypeFqCjRAv3/oAHIGU
         8gNOWic/MQ8kDKCtcZUTPj4D3vJfTy5z5PwKyHoI=
In-Reply-To: <fc1f0389e127ff74ee2b22c003918c73@teo-en-ming.com>
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming.com>, david@hajes.org
Cc: netfilter@vger.kernel.org


Le 27/03/2020 à 00:11, Turritopsis Dohrnii Teo En Ming a écrit :
> On 2020-03-27 00:21, david@hajes.org wrote:
>> best GUI is prompt/command line ;-)
>>
>> with nftables and native scripting is everything more simple
>>
>> On 26/03/2020 12:35, Turritopsis Dohrnii Teo En Ming wrote:
>>> Good evening from Singapore,
>>>
>>> May I know what is the BEST GUI frontend to iptables firewall? It 
>>> can be very involved and tedious to configure iptables firewall 
>>> using the command line approach.
>>>
>>> Are there any good rankings and reviews on the best GUI frontend to 
>>> iptables firewall?
>>>
>>> I am looking forward to hearing from you soon.
>>>
>>> Thank you very much.
>
> What is nftables?

It's the replacement of iptables

https://wiki.debian.org/nftables

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
