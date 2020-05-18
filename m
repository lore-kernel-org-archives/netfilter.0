From: "" <kfm@plushkava.net>
Subject: Re: Systemd, nftables, and iptables
Date: Mon, 18 May 2020 15:24:41 +0100
Message-ID: <f7621980-defd-a7f2-89d5-36af2a5fc2de@plushkava.net>
References: <db383c6d-952e-1df3-4abb-a03d46d63959@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=8
        Ld4nimd3OIPu2B0ic9F6aC0S3tA8mw9ca6WgpslHag=; b=v2DeiAAHDPva4f+27
        11D6oMOliHrsUot7sKWTNRn2Ng+/4uN1Pu3hyZ/dJknmlQzXzr9HO7ksaYjxBESo
        3nfXUfBT5rgdx99tv/2sEQ8+Zf0Kr9ImoSAG7NI2tkLuPT45LFKsGnPbkR7fF17W
        IMKu62v9qbGT3MXVq4PWp6RxzC7FDfufo6hjEWq6G98RTzRtOm5KivbMTtCtOvQP
        d+ZslfleQCoTCGxqGVWueZuK0lVLPVNd2Go9YneIoYJDiTewIcd38uUHNfd8hurc
        mCdJCkVU1e2fbj6ulDqyRqJgFMZW9KArEgEaY9M3UMk+WzkwYiCQ1qUQhGY+l3aV
        gJLTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=8Ld4nimd3OIPu2B0ic9F6aC0S3tA8mw9ca6WgpslH
        ag=; b=TwRiL51xA6BBMK+W7b90Pn4dhAsMZYJM8sYVWKWif5UUKtscAFT4KiqDS
        Rm6J4uGN68UuTlk53cneECrTuhEzou0QCF/6Ds+aCFXuxrLoWtzNuch7cRBpveRf
        YgIgZNIwBvfSveUvQPnhAKLvF64bW2qGfX9WGMAH13dqzHKEVXjawnuMVrRdkQRA
        /NpHl7kipw5v5ih6lKkG0QO/3dp2oOiKJrFTfBDKeFqibipw/rQAKm5ZYB+FLUmo
        dJCoyd5LqanUOk7COUpV4Fec9daGtxxqdaXFhhxdcqRRKtQHU1pbrPQ6+bAds7ri
        uDKcO6bPSeLBnX0f/5xqE70TuqSgQ==
In-Reply-To: <db383c6d-952e-1df3-4abb-a03d46d63959@satchell.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: list@satchell.net, netfilter@vger.kernel.org

On 18/05/2020 15:13, Stephen Satchell wrote:
> I'm building a CentOS 8.1 system on a Protectly four-port appliance, to 
> be my new firewall.  To avoid problems, I'm trying to remove IPTABLES 
> completely from the system so there is no chance of interference between 
> the two firewalls.
> 
> Problem:  systemd requires iptables-lib.
> 
> 1.  Why?

systemd uses libiptc for some features. One example I'm aware of is the 
--port option of systemd-nspawn.

> 2.  How to keep systemd from requiring iptables-lib?

Build it with -Dlibiptc=false.

-- 
Kerin Millar

