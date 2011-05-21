From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 23:44:20 +0100
Message-ID: <4DD84044.2060103@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <4DD83174.6070105@googlemail.com> <alpine.DEB.2.00.1105220023050.23769@blackhole.kfki.hu> <alpine.DEB.2.00.1105220037250.24076@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=ZaGPRj+Vt0CEfqlc0L38U/iY5zl0CLDeWY7+lcLyUIs=;
        b=kNr317ULUM0BCmCdGAxDllVIeWn03IYhz14lPz6cq/Tq3qhRMJkoubyXb11//oZJrX
         d/10986ZrkF16kD6RuY2hqu8DCxPq4RQsWAhgdrRAhQ6N1AJL6OztU5IWAfOe7c87cqt
         OxDhWOX2gj92U2SHTcbg9Fbh9UcFFbcPaFkfw=
In-Reply-To: <alpine.DEB.2.00.1105220037250.24076@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> Just look at the firs range in that file: with the first octet anonymized, 
> it's
> 
> a test 10.0.1.0-10.0.3.255
> 
> However that's identical with two networks, 10.0.1.0/24 and 10.0.2.0/23, 
> thus two set members. So the command above is equivalent with
> 
> a test 10.0.1.0/24
> a test 10.0.2.0/23
Yeah, I understand it now - I think I need to allow for some more leverage when defining maxelem. Thanks.

