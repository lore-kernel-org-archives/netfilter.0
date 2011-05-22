From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 15:52:44 +0100
Message-ID: <4DD9233C.70208@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <4DD83174.6070105@googlemail.com> <alpine.DEB.2.00.1105220023050.23769@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Q9hULRoicr+xKT2DVeTPRNF4X7a8F2jtz4cky1WiIpQ=;
        b=rl6W3CRWQ3my1atpG1zuXYJyzDbotQxRQBv50IiP5LpCMFESomSuhkUUoPtUO6Bkjk
         wSveI/5mz+O9YsPknsa7YMq/TVDztqBQcrs7DGUE9YQWvFTpe2fme6yg6KkhrCBZm7dP
         exq/pa1/q4tCP/pZ7AuyDSDH7EYs24xxbyPj8=
In-Reply-To: <alpine.DEB.2.00.1105220023050.23769@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> Your first set named 'test_ips' consisting of 11670 ranges can only be 
> converted to 15613 networks, i.e. members. Not all ranges can be expressed 
> with a single network.
>   
I have a suggestion then: Is it possible to include the number of 
members registered in the set in the set headers - something like 
"Members: xxxxxx"? That way I won't be guessing how much members I have 
in a set (particularly if members of said set run into many thousands) 
and don't rely (as I did previously) on my text files to do "estimates", 
which, as we've seen, could be wrong and misleading and I would be able 
to view this with the "-terse" option.

