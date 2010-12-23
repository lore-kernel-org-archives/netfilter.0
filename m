From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset-5.0 released
Date: Thu, 23 Dec 2010 18:10:05 +0000
Message-ID: <4D13907D.3040301@googlemail.com>
References: <4D138C02.3050905@googlemail.com>	<20101223.095545.183057798.davem@davemloft.net>	<4D138E46.7090207@googlemail.com> <20101223.100653.115946740.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=UWsmD+yvCD8oCD0URrf6ScU4Qo4/o85+lZYuh+pqP2w=;
        b=rzzLtfALN18d60updlSh3g2nu8DPBwEbZYFXk4HuAoJUty+I4St3adOZ2fOV/RP2LS
         GHJT8uM1/LhUSpRlR/KuS0YElFw2A28GQb2s7YJ+EqLaSEv9Md5r+SGLWbe2pGz1Jn40
         ks5WkPlvYpWOcQ/+esHRWOUpY2R5lvUB7RBr0=
In-Reply-To: <20101223.100653.115946740.davem@davemloft.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Miller <davem@davemloft.net>
Cc: kadlec@blackhole.kfki.hu, dennisml@conversis.de, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org


>> What do you mean by 'puts the ports in a different location'? Clarify
>> please.
>>     
>
> Look at the proto_ports_offset() function in the kernel if you don't
> believe me.
>   
I've never stated that I do not believe you - I just asked for a 
clarification. After looking at the example below I am still unclear 
what your point is (call me daft if you like!).

> static inline int proto_ports_offset(int proto)
> {
> 	switch (proto) {
> 	case IPPROTO_TCP:
> 	case IPPROTO_UDP:
> 	case IPPROTO_DCCP:
> 	case IPPROTO_ESP:	/* SPI */
> 	case IPPROTO_SCTP:
> 	case IPPROTO_UDPLITE:
> 		return 0;
> 	case IPPROTO_AH:	/* SPI */
> 		return 4;
> 	default:
> 		return -EINVAL;
> 	}
> }
>   
