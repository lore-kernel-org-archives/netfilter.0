From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Sun, 01 Jul 2012 13:19:04 +0100
Message-ID: <4FF04038.4080306@googlemail.com>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu> <4FF02A93.8080603@googlemail.com> <alpine.DEB.2.00.1207011405160.2289@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=KesiOTaOSSWG5zXVhG+t0zR9vy8FAbLOG+ni/0Syw/Y=;
        b=0dImB94beupjQbtKXbcnKG3bWJHuJexw9X3uysNpMd/0nZNcb3qh0ht6e5esN3koIt
         UCT1CutVvDTNYm/D/aeO3i8G7Rb+UDSCJy9WPNdG161fnX/E4S4dcaMxp2wn6zGnRzRN
         somLKoNlvOxqQrvGl+wcMx8JpqJ6WssAgFe+v3fOox6FMhURklDJyEEJnc4n2+5e/x4g
         DSEeRhMEYR5DNWyu4g4BJMwC2wNRt6UxUiec9h1+wZSemwORpYI4Ue/s7B2Tfiax5pdl
         rXs69rh5wTYSVvXquxY9Ol1I8BlRKjxHTSM1Fp10ZNYI4hk+4QPoJhNofPsoeuQk5KOz
         /DAA==
In-Reply-To: <alpine.DEB.2.00.1207011405160.2289@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> The hash:net,iface type is out for a long time. It is not possible to 
> change the meaning of src/dst without breaking backward compatibility, 
> therefore I won't do it.
It has nothing to do with "backward compatibility" at all, but 
everything to do with something which was done wrong initially and needs 
to be fixed. The fact that this "has been out for a long time" is not an 
excuse - if anything, it reflects pretty badly that this wasn't spotted 
earlier. Besides, when a bug is discovered do you write a man page 
documenting it or do you fix that particular bug?

>  As a "workaround" I tried to explain the meaning 
> of src/dst for iface as clearly as possible.
>   
As I stated before - documenting a bug doesn't make it right. The proper 
course of action is to fix that particular bug, not document it in a 
bloody man page!

