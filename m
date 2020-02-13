From: "" <kfm@plushkava.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Thu, 13 Feb 2020 11:59:11 +0000
Message-ID: <44ce1f43-7bc4-4f1c-c5d1-566a34483036@plushkava.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
 <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
 <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
 <7cd325dd-e028-9b98-9b15-ddfdad3845bf@plushkava.net>
 <17defc0c-6d30-f098-99ca-7594cc63071d@gmx.net>
 <da48838e-d67d-13a0-c349-b51ca3c050a7@plushkava.net>
 <a27d6244-60a5-7b32-fcd9-bb0364f69224@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=e
        JcR8iXZQGi5CL1c4Vq7/BzkrhGbnvWnZ8Agl7MFOAs=; b=Qhczoz07sA8A8/Y0W
        tSibU8hnvjEcpBRteFhJ2zNy5b3FCYD5FRFllEnDu4PnftAM3PDURPpWhmFPOk7s
        HphQl2aV7lWUnRkquwwl7lCEt9YrOXM5ZMtpcNbCc2LFZnlI2OTFnq0TcTCHsbcX
        rj9L98CYwYrK2e3NycDuP2pnBY+7zxBpQitv1DBtKNRfBWSDlFIrol9HgHxFYPXr
        8eS8FKcPsyLbfkiF2hiIa+26N5fDxFhKPEb1KrNg0wQihf0z4aD1AnY+NPPb+OGF
        1tPmTiH5mWI7Iq0auOeorlScYsmKzMS9t2YdVKXz5UO5yUwui7oo/M8FC090yDeT
        srjYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=eJcR8iXZQGi5CL1c4Vq7/BzkrhGbnvWnZ8Agl7MFO
        As=; b=zk4J/FEKAdHwCOXRPcN7bkDf06pPLdfkGVy0dF2ISY7c8O9pgBG1nstts
        kLC8LQdvJdJEG1vqy23ACcZ5avsMUnmm2B812cSiJyJncY48TdClkYV4w8SzEJbj
        RBT+3DnWmbNvWe9rfZXoPXECfLvPUqSAV+k+oSQoZX48UaeXiZcdfXUh9LY2x+m0
        o7UE5YKG/mtQ9iGhMf1iOuiFDk/JQB40qFn1uvC5NvhM1cD0yp+xrA0YJqlIUObP
        2yKhFFFKwyRxlcFHOur1FfEqJkey5vdOfhbHM56LpGjbFSDrZbRWgb+iBEkNdsOR
        8Uf8Bhy4m3MX93pFJ+KhuYyoR1Bkg==
In-Reply-To: <a27d6244-60a5-7b32-fcd9-bb0364f69224@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 13/02/2020 11:41, ѽ҉ᶬḳ℠ wrote:

<snip>

> The current kernel deployed, which kconf is beyond my control, is 
> missing the flag to support sets and thus vmap. But that aside something 
> like this seems to work
> 
> table inet filter {
>      chain input                { type filter hook input priority 0; 
> policy drop; iifname pppoe-wan jump wan_i; }
>      chain wan_i                { ip saddr 0.0.0.0/32 udp sport 67 ip 
> daddr 255.255.255.255/32 udp dport 68 accept; }
> }

Indeed, vmap is by no means required. This is equivalent to the 
previously suggested input chain, only marginally less efficient:

chain input {
   type filter hook input priority 0; policy drop;
   ct state established,related accept
   ct state invalid,untracked drop
   iifname "lo" accept
   iifname "pppoe-wan" goto wan_i
   iifname "eth0-lan" goto lan_i
}

Note that goto is an optimisation. It would still be appropriate to use 
jump in the case that you need for the packet to be able to fall through 
one of the user-defined chains and return to the input chain in order to 
be subjected to other rules there. In this particular example, it is not 
possible for iifname to match "eth0-lan" if it did not already match 
"pppoe-wan" and, because there are no further rules in the input chain, 
the use of goto is fine.

-- 
Kerin Millar
