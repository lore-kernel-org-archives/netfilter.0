From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: multicast packets
Date: Wed, 24 Feb 2010 19:33:46 +0100
Message-ID: <201002241933.47105.christoph.paasch@gmail.com>
References: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=/K5g9PEtcjX5MhIk5jrxo46TaV3N+Q3UHoMn+/+1FL4=;
        b=P3Lb+ASM20whE+uxwMfq18BUcXHw2gn3c6n7Ez/vW7FLm+/mfT88aFPQU520OVRkf/
         BgNa9LEruB6z8wDoorJ0rTLAAU606IBulXLOYXAqKgQGB9QCDPeJS4q1yoniKIBPcQ2s
         SkxKca0dOXadgMUK3MWRF/FJMqMb+eanUg1BA=
In-Reply-To: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

As long as there isn't any return-traffic (as it is the case for multicast-
udp), udp doesn't go into the established state.

Regards,
Christoph

On Wed 24 February 2010 wrote ratheesh k:
> multicast packets are udp packets . But its flowing only from
> upstream to downstream . So packet state will be always "NEW" . ??
> 
> my question is : whether we can see multicast data packets in
> ESTABLISHED state ??
> 
> Thanks,
> Ratheesh
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
Christoph Paasch

Alcatel-Lucent
IP Development

www.rollerbulls.be
--
