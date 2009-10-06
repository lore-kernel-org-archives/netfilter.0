From: Saikiran Madugula <hummerbliss@gmail.com>
Subject: Re: evaluating kernel-mode packet processing (netfilter target extension?)
Date: Tue, 06 Oct 2009 17:59:26 +0100
Message-ID: <4ACB776E.1090909@gmail.com>
References: <96837AF99C543646B54E8DA1A0315D5677B183@ahr-mail.avtnet.local> <96837AF99C543646B54E8DA1A0315D5677B187@ahr-mail.avtnet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=KCsQpY9+2dZzHgJvdE8SPANNKwPjwzpmi6aKIfCFoO8=;
        b=np7elgDAa+yzH85Fz8JWpma7nqsWWx1Tw+3gwrRvMFHYtlDcKyJybgJmwTFYK2Mr6Q
         1+Aoqsmd3JJ8KMGq7LG4pA1pPKm1k7h8Z5Tmk6SkdPz+LgCniOJv/ZTvgTUGl/JsdaGw
         HVo0TPhnoLFwEo6pEVU2pGf9eOqcd9yrKXlzM=
In-Reply-To: <96837AF99C543646B54E8DA1A0315D5677B187@ahr-mail.avtnet.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Beyer, Philipp" <Philipp.Beyer@alliedvisiontec.com>
Cc: netfilter@vger.kernel.org

Beyer, Philipp wrote:
>  
> Having read some more, I think a bridging network driver could be the thing I'm looking for, although I don't need any bridging functionality at all.
> 
> Could anyone tell me if this concept is reasonable, pragmatic, bad or even impossible:
> 
> - Writing a bridging network driver, meant to be connected only to a single physical NIC.
> - Consuming all UDP packets I'm interested in, managing some buffers inside the 'bridging driver' to be filled with these packets' payload
> - Setting up some kind of streaming to send these buffers to user space
> - Simply passing all 'other' network traffic through the bridging driver.

Have you explored the possibility of using libpcap-mmap or PF_RING for streaming
required packets to user-space?
