From: Serg <seentr@at.encryp.ch>
Subject: Re: nftables: Internal error when checking rules
Date: Mon, 27 Mar 2023 18:33:22 +0300
Message-ID: <fba11b8b-2c0c-5b2d-f9f5-1f327d931c31@at.encryp.ch>
References: <9a42b3af-8451-8fc2-2565-a60b1c846358@at.encryp.ch>
 <ZCCvj7XxHDFr7QXf@salvia> <4e3d7257-d89e-dad6-53d2-70adad755d7e@at.encryp.ch>
 <ZCGwxl79yXfvybsk@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1679931205;
        bh=KuPZhTZi0OFI/W4mWhBjSRn3qb/Pasz42H7dK773MR8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=qPSE2tcpGxvOXIHf2hsd79IDV3DFFgRlYpTQHMOnGkmdjSmUClT100MtoEOsp6TPL
         wPlobHTPohq9HEGzKGePK2H0miH2svDootZleZt/whAFx8I96bJczv6oerZQM6lf4X
         Et14587lDSMKenzzs83/54kRe60cgl/4+wMn+AJ0=
In-Reply-To: <ZCGwxl79yXfvybsk@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 3/27/23 18:05, Pablo Neira Ayuso wrote:
> It is a userspace bug in error reporting, patch is here:
> 
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230327145045.33797-1-pablo@netfilter.org/
> 
> I recommend you split that superlong line
> 
> Now it shows this:
> 
> # nft -f ruleset.nft
> ruleset.nft:402:1-16: Error: Could not process rule: File exists
> 8.9.10.11/30,
> ^^^^^^^^^^^^^
> 
> instead of the internal location.
> 

Thanks for pointing out this. Now I have figured out that the behaviour 
of nftables is different from my expectation due to absence of the line 
"flush ruleset" at the beginning of the main ruleset file, thus reload 
caused entries addition and not atomic replacement to the newest config.
