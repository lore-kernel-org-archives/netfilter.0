From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: nftables
Date: Tue, 28 Apr 2020 10:50:12 +0300
Message-ID: <16ac0a06-b73e-dd66-c858-ae9ea26034d6@gmail.com>
References: <c8a517b2-3e1e-f7f5-53d6-b3e4daf638bc@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=xMoDAHoZDmwSt3bCbetjaOEOkepZezR5cQzXH1HZsG8=;
        b=Vj69kMcP69MHyOpRfvG3O9DjKfmv4I03TLe+pUFBZWUpfnsPcIokwbASWCGGZnpUft
         uxMLiFdAdNrUv2iLXJZwPrnvDwWjNEqvcTzrD53FR3+QWJMTbAKcBGBT9UfRCL7Uao3F
         rCxbvfydLgmuUUxjX8QTfIQCPKgAlMbfZxHLazAloJwRpcfIm3kopgG0ULKk2E3M5dDp
         tL3YPXvzRh8TwwDebSaMQRyeJ7VTS/beaP/8RGAtCxjw31bP4Gu8UFjTfutyIrDCvgMN
         JP9zIlkRMc6m6Yho4qdxlr8qYY0jGTxkX4fbuRSMH1Gf7THNhy4il490HiEh5a7AOoZx
         SNHA==
In-Reply-To: <c8a517b2-3e1e-f7f5-53d6-b3e4daf638bc@gmx.de>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick Greiff <Patrick7878@gmx.de>, netfilter@vger.kernel.org

Hi

You can use sets in nftables like iptables ipset.

http://wiki.nftables.org/wiki-nftables/index.php/Sets


Fatih USTA

On 28.04.2020 10:38, Patrick Greiff wrote:
> Hi everyone,
> i have a question about nftables.
> at iptables i had a blacklist where i wrote in the ip that wanted to
> hack me.
> how can I integrate something into nftables? and also restart when the
> ips are updated.
>
