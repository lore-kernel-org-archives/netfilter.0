From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: bonding-related problem with DNAT/SNAT
Date: Wed, 25 Nov 2009 07:54:06 +0000
Message-ID: <56378e320911242354p1e97649r1fbd881add2de2e8@mail.gmail.com>
References: <200911241855.nAOItoF7006140@post.webmailer.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=na/FLvz3liSw6vwwXu0TaE86+MlDngwNvMLEKJu4srA=;
        b=WYFHM8Za4WLvbQ9/3O4TU4+4dJmQWVI0BC6Rcueovltt6TzcX0eKGZtOUpllgK6Ttp
         dDPOIs61UICbxZldLvlo2QDIHK9RT01L7yXivScZBpGvkLopGbfIt6foFN1fpWGuc5Yl
         2g69e8LM8TchBpcGNC1RG9xmGpACQWDNVU51U=
In-Reply-To: <200911241855.nAOItoF7006140@post.webmailer.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Craig Craig <craig@haquarter.de>
Cc: netfilter@vger.kernel.org

2009/11/24 Craig Craig <craig@haquarter.de>:
> Dear netfilter List,
>
> I have two machines running Kernel 2.6.29.5, one has bonding-related problem.
>
>

Might be worth sticking trace on and seeing which rules are met...

iptables -t raw -A PREROUTING -j TRACE

and then post the resulting trace logs...

-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
