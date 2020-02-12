From: "" <kfm@plushkava.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Wed, 12 Feb 2020 19:01:38 +0000
Message-ID: <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=D
        wQVSWPtzRMxuJ7eeP4EBSwcbP0SqbjEc4N4lk03Vdk=; b=mu8w1yUNBTzf4TZz6
        asa/+yTiA/mZs4LeHLysbSzWJCKphKuHypArjj382BoEuU/X2y5TpgawYWLUS8Yi
        Ccw0W1N6SYKISGBNUiXlCwGExrp4TQw5prlz5FjWSJvCiZV/zR7ntlhWxYnrg8Np
        Xkm1fXgeGS5a+svZ8+gawFaFRow0cwi4+hVwCw7PVCf31L1DpVr8u5w4GBRG0yKw
        LOj958EFG4JgWfn14/yCfqgaYNZyPas7GP9MDOYUgaIBXTtCP8w3atmpllMYA96k
        PPlQFnK8kwQH3PsylqJoA/FJhG3Q5hP1ayCRRId9PSkNsIm2+lmuYi4FERILgeC3
        3Kjrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=DwQVSWPtzRMxuJ7eeP4EBSwcbP0SqbjEc4N4lk03V
        dk=; b=h0hzv7c9sKXAYhCRrZ7WSf34u/M+7/QblWyHhbCOwaEM6uxV/fg/nFB6W
        VlbC/eRDjpSLz7XvOLB92jwqO2h4+mvri7zAFxhZWKAsRpmRwoISYUZu2Cb7s2k4
        qp4hKYqPRrPT3J3VUbBtkUZD52qtTf3WrKo/XKh2o67C3Pz6pWyXIWe3erfqlkaH
        TrJykCjKLFx645974BHcCipyhW9x5z+RwrXZxxmQecD6XMQR2kT+kSz6/qV5Ri6Y
        Hw805NlfU+KmDzxuTMGqiqM7u2XQ4d/Wa4qdUL3zA5KNKs8ej35Io6xNQqLrbsZn
        TsK04bjVbVJw55r2FfWt1DLxUREhQ==
In-Reply-To: <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/02/2020 18:52, ѽ҉ᶬḳ℠ wrote:
> 
> On 12/02/2020 18:40, kfm@plushkava.net wrote:
>> On 12/02/2020 16:41, ѽ҉ᶬḳ℠ wrote:
>>> Have tried to some online guidance which NFT features require which 
>>> kernel config to be set to get them working and whether jump is among 
>>> such feature set.
>>>
>>> Because hitting:
>>>
>>> Error: Could not process rule: Not supported
>>>
>>> with:
>>>
>>> table inet filter  {
>>>   chain input  { type filter hook input priority 0; iifname pppoe-wan 
>>> jump wan_i }
>>> }
>>
>> As shown, this isn't quite valid nft syntax. Please post a minimal - 
>> but complete - ruleset that reproduces your issue in a form that is 
>> verbatim. Include the wan_i definition, even if it merely an empty chain.
> 
> table inet filter {
>      chain input { type filter hook input priority 0; iifname pppoe-wan 
> jump wan_i; }
>      chain wan_i  { type filter hook input priority 0; }
> }
> 

You may not jump to the wan_i chain because it is hooked. It makes as 
little sense as trying to run iptables -I INPUT -j INPUT.

-- 
Kerin Millar
