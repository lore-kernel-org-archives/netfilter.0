From: "B. Ohnsorg" <b.ohnsorg@freenet.de>
Subject: Re: Bug in the wiki
Date: Fri, 8 Jul 2022 08:32:23 +0200
Message-ID: <01db9f19-67d9-b493-4443-c59102cd70ca@freenet.de>
References: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
 <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com>
 <CAEXMXLRqUgFmME_8OKpAWRog3dqRCG+veHbJsZPKh9xOZ98D=Q@mail.gmail.com>
 <16130a18-e4c1-a1b7-1414-7025389efca0@fhmtech.com>
 <CAEXMXLSGWtT_6JrCEFhRgvG4-Ssj1jnVUs_r4JjoFzwjiip=mA@mail.gmail.com>
 <d8aa9eed-4e9f-7385-6908-438e71c8c2d1@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
        s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yUn4FVx6DNXK1/MMhAFNjkoFT0rrampmAsVe51naHfo=; b=mkn/Eo6aIAFA4u+Ihq/mR0m0Co
        aIaSNTLqycwdWeLawnqePoOge+uLTVAOISrcMD0sHGpVSL6EFm8xnW/LM9UUwdv76tZaxZ43qhxyB
        btDqziY4yn9QaaqtHGM9nrFodAk1LbWLWmZGCmy1s1JIrEczOrnyR2UXAp/bHg1bC2oCwISPSBVpE
        RqWoirtcO7FaLSAP3uqbyup65mdvq/RivJBJ9JkmtWeUeMu8+AGSEDesNjte9bVDY8iOcY7Va0fe+
        Q0G0CiNlcbYb/bRqVsYzD93nZtx5osmBvAZrBv82SS3j6VVMj/O5Ykzuagwo1N9jE14fHB+AXtOEd
        XTl 
Content-Language: en-US
In-Reply-To: <d8aa9eed-4e9f-7385-6908-438e71c8c2d1@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Frank Myhr <fmyhr@fhmtech.com>, =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>
Cc: netfilter@vger.kernel.org




Am 06.07.22 um 13:26 schrieb Frank Myhr:
> On 2022/07/06 06:27, Nuno Gonçalves wrote:
> 
>> Yes. I am testing and always and the bug is exposed with a flood ping,
>> for example, so from the same IP.
>>
>> Yes, I agree that this should accept 5 new sources per second, but
>> each can then do unlimited requests.
>>
>> That is why I suggest the wiki to be updated.
> 
> Thanks for clarifying. Now I understand your need to also move the ct 
> accept rule to the end of the "inbound" base chain to counter the ping 
> flood from a single ip address.
> 
> I'm not going to update the wiki page just yet, for several reasons:
> 
> * I'm not the author of the example ruleset.
> 
> […]
> 
> Best regards,
> Frank

Add the suggested rule and add explanations to existing and new instead 
of replacing existing content? Let the reader choose who presumably 
knows best whether throughput or security is more important.
