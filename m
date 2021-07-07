From: Daniel <tech@tootai.net>
Subject: Re: Redirect all traffic or range of ports to an IP
Date: Wed, 7 Jul 2021 18:35:14 +0200
Message-ID: <3c300d1c-91cd-9dea-44f1-0130de4f6021@tootai.net>
References: <f6701047-5ad2-2204-9eee-d8c3ca325574@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1625675715; bh=r01oj76zs6yd3r1ixdCLbFwP6SdFc5RS4d6979tcYag=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=P22WtVGG/GQ6wPMOwcAUftiOJwwXMMDzPoIdtLcgioqXxAbi2Ex0w4YqBDcIlmpSH
         oeLAnofgVgYzNdiphngId1BWEZXn2sX2czPD7N+/s+uKOIUuud6+SVuxVZ4wYM1RUe
         uX8e5tfB48Y7sDHO8cCWODQy5+6o6AIR6W3fYGCU=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1625675714; bh=r01oj76zs6yd3r1ixdCLbFwP6SdFc5RS4d6979tcYag=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=rGxx13DhpTuuepc3pzT/wzXxk6Sx9f3LIIv8IhMlzPeIDs5wfO0MB7LVf+MdkVc7D
         pDTNy5MOIWoVEh+P4wWQ0pPtcLeCe6oqC2gCU2gMLxGtNq52r445FxBnE+eVCIoh+q
         tTPi9ycYxFNU/gz09VXSe02BnmTQ8OqiC2UESy70=
In-Reply-To: <f6701047-5ad2-2204-9eee-d8c3ca325574@tootai.net>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

No one ?

Le 03/07/2021 à 16:13, Daniel a écrit :
> Hi list,
> 
> I face an error while trying to redirect all traffic to an IP. Letś say 
> I want to redirect all incomint udp to 10.10.10.10 internal address.
> 
> My rules are working prefectly when redirecting unique ports. I use 
> those rules
> 
> $fwtables add element ip nat fwdtoip_udp.eth0 { $srcport : $mydaddr }
> $fwtables add element ip nat fwdtoport_udp.eth0 { $srcport : $dstport }
> 
> and then
> 
> $fwtables add rule ip nat prerouting dnat udp dport map 
> @fwdtoip_udp.eth0 : udp dport map @fwdtoport_udp.eth0
> 
> If $srcport=$dstport=1-65534 I get "Error: value must be a singleton" 
> for the $dstport when adding element.
> 
> Is there a way to  use this configuration to redirect all traffic to an 
> IP or should I create other rules ? BTW, problem is also existing if I 
> want ro redirect ports like 20000-30000 for eg RTP.
> 
> Thanks for any hint

-- 
Daniel
