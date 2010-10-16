From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: NAT-PMP connections not tracked with nf_conntrack
Date: Sat, 16 Oct 2010 19:04:08 +0100
Message-ID: <4CB9E918.2040707@googlemail.com>
References: <4CB5C1C1.8060809@googlemail.com> <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr> <4CB9D437.2030902@googlemail.com> <alpine.LNX.2.01.1010161948580.29809@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=/GYHusQBDgt6cGnHyJPHe/81JvoOd0RdW42v3uGZuPk=;
        b=nVkWc9E4ec/9NfkHj5LsfY2D21oAZl6uqh90d13e1EaOr+M3g0Hr6UM+0j8hoqxXYY
         RvEJwbdFxUVRUPFGbsS9kM6gYubWRahWaw9J0k2R8Gh1FJe8dlW/EvOWufg1gi+gwoA1
         4HXjYJqxAhue6mv8pZUnP1Lv5zCUKsmMlap38=
In-Reply-To: <alpine.LNX.2.01.1010161948580.29809@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


> ip6tables-save, or its respective v4 part.
>   
iptables-save | grep NOTRACK returns nothing, so I assume that I am not 
using this.
