From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 23:42:57 +0100
Message-ID: <4DD83FF1.7040101@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <4DD83174.6070105@googlemail.com> <alpine.DEB.2.00.1105220023050.23769@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=gayhoCWNQ91HQzlG1AlxAq/6/Jd5zU34pDTMCEFVuVU=;
        b=gGjgaPYzWSymN/k/l/15oiLp+DUPTLT8m1YXkoLy36T7w6m5g+ChkQhuoErhUMr/PY
         LxO0EHBGWd/JYr48iUugW9Zn4AOV94muiuqpe0dah2Epk4urtXoQGM9Bp+fbQsVtLqws
         FoDYyQfNR7YuAoOhWlBP4UziQBIxXXepAUNJs=
In-Reply-To: <alpine.DEB.2.00.1105220023050.23769@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> Your first set named 'test_ips' consisting of 11670 ranges can only be 
> converted to 15613 networks, i.e. members. Not all ranges can be expressed 
> with a single network.
Oh, sorry, my bad! I forgot about this (new) aspect of it all.

