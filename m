From: Daniel <tech@tootai.net>
Subject: Re: NAT - how external source port is selected
Date: Wed, 18 Aug 2021 17:12:28 +0200
Message-ID: <771b005e-4127-7065-7bc8-8ca6b71eee64@tootai.net>
References: <9cc05668-b4fb-4ed8-1588-7a0f5c378b3a@tootai.net>
 <20210818144615.GQ607@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1629299549; bh=KKYzfsSYR3PH29K0kWqrWdkYVB3dF7/geVXbXswZMro=;
        h=Subject:Cc:References:From:Date:In-Reply-To:From;
        b=XaXBZpj+RrmL9YZQQ8TRylWUFIuBjahtHdRI0g4XczQLUmHCxAZP7/wkejinFAmep
         m9yqCGvL5B4fyCBntnJNGGae2gytCfIQH/8KvTjgyc72fTq2GSmUI/NHv6IhhNg7dv
         tCJpZoAaWCPzX7kd2X30DryryzNUeh8FRcEB0wYg=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1629299548; bh=KKYzfsSYR3PH29K0kWqrWdkYVB3dF7/geVXbXswZMro=;
        h=Subject:Cc:References:From:Date:In-Reply-To:From;
        b=IIe+dc4klBpLIsPrqcV/Ncop1NEm5LDzoYszuv1U6CQw/5APmGyLpbULw15egpB4t
         3rASWgMAA3o2Sqlf0CE7We42j4Ae5sr/FmaEKTjG5YOi7R+viICLJnwsjo6Pnlz0ye
         Pc/GMuNx/V/9OUlFMbK2P/KrNpOWm4RXmJpBmfAE=
In-Reply-To: <20210818144615.GQ607@breakpoint.cc>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org


Le 18/08/2021 à 16:46, Florian Westphal a écrit :
> Daniel <tech@tootai.net> wrote:
>> how on a NAT firewall server using iptables or nftables, are the external
>> source ports choosen ? I would say range is 1024-65535 but if for instance I
>> use port 5060 for SIP this one can not be used as source port. Is there a
>> table of at time used ports ?
> Are you talking about SNAT/MASQUERADE?
Yes
> It will try to use whatever port is used.  If the source address
> replacement results in a collision, it tries to pick a different source
> port between 1024 and 65535.
OK
>> Also, SNOM phones are systematically using port 2048 as source port of the
>> WAN ip. Is there a mechanism to allow such behavior ?
> What do you mean? The initiator is free to pick whatever source port they like.
Well, how he will know that the port is free ?

-- 
Daniel
