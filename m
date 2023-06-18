From: Kerin Millar <kfm@plushkava.net>
Subject: Re: nft list sets changed behavior
Date: Sun, 18 Jun 2023 12:22:16 +0100
Message-ID: <20230618122216.3bdd0e34776293adb0655516@plushkava.net>
References: <60e59333-3d37-5b66-e0ed-8e7d4c01d956@qmail.sunbirdgrove.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1687087339; x=1687173739; bh=rCe86wEDva9+Ju+sigifhweb/
        2VAxH9qrBYKiCgLMrw=; b=KmlWlG1nocUoR4vA3GE2l/opedygdE6qYGM6Qkijg
        smYd65BSd8hqtIlcvEUbGgO0okkarhd031CQzKIRdQBPPaQSfC+jnSVEF+JcHYv4
        CVFpGAwFrlkWWM/wDgUKMNpLy/LDofvrw/CaIAIy3cKID7afuRU3PyeQcAigTj0h
        Osgk2eS3WR98bxsbK8is7fU3yHXh/V26+I2NA9G7MpH9As3R6QGNvkZoM9V6+9dC
        JuCgK8C0IqR1mVhkUt9i1b6Th+Zc29UxS/rMJB7g1DnIzhHDG98Cb0fZpA5HV7kG
        /j9nUBYr8nSV/0nxbkNXVGstMKfZKeLvZgKN3LhNoaJNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1687087339; x=1687173739; bh=rCe86wEDva9+Ju+sigifhweb/2VAxH9qrBY
        KiCgLMrw=; b=KCVNwE3Z19hTGh9clW52uL6Cn10NAog0FqHhG0wdheZeAWFo5VU
        Kp/OVzc65b+TNy307exiP+SH7S57306ZCoc6GCrxIKgFnBqJk8fGGv6Y//XRb1e3
        sCxdMjZ1hL2t6QTzpRGSswhMq2FHcg7h0/2/7tBOYwiYFDLzu4NQmf+j1uNVfPmi
        +OlJITjSumbOrJe/9AfXh9PwOCgZNXeLxxRpsYsiIHitQvQ6tSFmBfYQ+N011mWi
        QitsjzOZEHzW5NffQPcDwaQ53lWBXBevsJPUKWysWbExSdjnuC9yT7e/baqULtXB
        unwvCIirP/kmU7fAKqsDLZkk0w/eckOdn8Q==
In-Reply-To: <60e59333-3d37-5b66-e0ed-8e7d4c01d956@qmail.sunbirdgrove.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nft.ogxzcrqhuhgchbvxcs4j7wws@qmail.sunbirdgrove.com
Cc: netfilter@vger.kernel.org

On Sun, 18 Jun 2023 02:42:46 +0200
nft.ogxzcrqhuhgchbvxcs4j7wws@qmail.sunbirdgrove.com wrote:

> After updating to Debian 12 my tools relying on 'nft -j list sets' fail. 
> It now does not include the elements in those lists like it did on 11.
> 
> Is this hidden behind an 'anti-terse' flag now?
> 
> Web searches, the changelog on the site, and manpages didn't reveal 
> anything.

Running `nft list sets` doesn't list elements either. Unfortunately, whatever the intended behaviour may be, it is not documented at all. The nft(8) page states that the "list" verb should "display the elements in the specified set", which can only describe the "list set [family] table set" syntax, rather than the "list sets [family]" syntax.

I agree with the implication that to have "list sets" include the elements, unless -t is given, would be more consistent and logical. I would suggest filing a bug for further discussion.

-- 
Kerin Millar
