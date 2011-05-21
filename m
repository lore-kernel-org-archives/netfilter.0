From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 23:15:00 +0100
Message-ID: <4DD83964.5050105@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Pbb9n3wFKmLm+BPGs+g9miNli3kZ/V+Zx20bQ+T47X0=;
        b=EI5lPA0RlPMZ/Zd7EeJAvqR+H2YMfhAuWdVs0+oZpQRdegAcjSg7RXFo6eW5M+5ZuN
         IsZqz9Ao+/o1RIEbZ+LMNf9o1BH+ErjvS7E5RTSwvdoWkn+C/llKA9LGn2jLpWPKoOYs
         treD+NNbjc8mZtFlozMbcGSTT54wMuVs7AHMc=
In-Reply-To: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> Kernel part changes:
>  - Support range for IPv4 at adding/deleting elements for hash:*net* types
>  - Set type support with multiple revisions added
>  - Fix adding ranges to hash types
>   
Forgot one more thing: I was able to compile all ipset 4.5 kernel 
modules into the kernel itself (i.e. all ipset kernel module options set 
to "y" as oppose to "m"). I am, however, not able to do that in ipset 
6.5 - I can only compile them as modules (i.e. I only have two choices 
and that is either "m" to include them as modules, or not compile them 
at all). Is there a reason for this or is this another bug?

