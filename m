From: Benno <b.ohnsorg@freenet.de>
Subject: Re: exclude named sets
Date: Fri, 20 May 2022 12:57:49 +0200
Message-ID: <a2155df3-e6ae-e659-5cf7-7a43b89556c6@freenet.de>
References: <CAMsxNkSkjBkwS=AhJpG+GPTfz1nYsH4YjLVJ56DxvW9hAVeoCg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
        s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jnEJ9pI6KoXWGS3N3UEFM5F0ikkmMtlunrRvFNK8zJM=; b=hlxafHZQfVru5bUrLWRMHILF7L
        SU29Q3c5fyw1nbAwPLJ0fSXuY37GZ7Z+JGDLZm3qXrJbe8IG62J+McBZqtAuxNNv8IP2v47tE2UYI
        hWYkGHTWIs0vbwXslueHpIaaNvZh+yL3Tu6pSobgWPpGUgJvXrEYU20fPKmHWhFeZp5y3CNJGa5uw
        b/XoLFbxqm8TE5a+DS2+lNoDHNt3stlOofR5DukGoEGGbq2sQB8K5B0wlfziyMxUdTtpChUBS87ae
        32Q1MfpPxgVfYqzMCLERjpwEVmWQvNOW5/gS+xf83XLQ8hihppHrKuJpn+y/XpINIUdHvUWW9JsID
        L50 
Content-Language: de-DE
In-Reply-To: <CAMsxNkSkjBkwS=AhJpG+GPTfz1nYsH4YjLVJ56DxvW9hAVeoCg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Clark <andrewclarkii@gmail.com>, netfilter@vger.kernel.org




Am 20.05.22 um 05:49 schrieb Andrew Clark:
> […] to route all
> traffic in the TOR network, but I have a bunch of addresses which
> should be passed directly, without using TOR.
> 
> This is valid rule: iifname $int_ifs ip daddr @rkn meta l4proto tcp
> redirect to :9051
> But this one is not: iifname $int_ifs ip daddr != { @akamai,
> @stormwall } meta l4proto tcp redirect to :9051
> 
> […]

Would it be sufficient to have only one list and work with the default
package handling? For example a single whitelist causes direct package
routing without Tor. The default rule forwards to the Tor network.

The other way around a blacklist would force packages through Tor while
the rest via default rule goes through!?

Out already pointed out that one rule is the other's negation.

Is there a third route? Or even more?
