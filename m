From: "" <kfm@plushkava.net>
Subject: Re: Does anybody experience kernel crush when 'ebtable -t nat -L'
Date: Tue, 11 Feb 2020 12:23:11 +0000
Message-ID: <36585adb-7e24-0636-d50e-7c983f6f590f@plushkava.net>
References: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com>
 <alpine.DEB.2.20.2002111201530.6759@tornado.local.jubileegroup.co.uk>
 <CAFAx9aZd6vA0Se_6eEsRCr4AkRgGj3Eb=7SDXrRZPSpxMCN2vg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=D
        U31iJfP0ZzJYmQi8H2gN6vMT5ID4HWjCi4Mhy5snDg=; b=Jqsag88f7mEYWpX2b
        3Uxt8Y+kS3mTlwN79KCGVwb5RyzcgPdq1oAml/ZqDsBlmJUQyNsumJkquBUogRmY
        jsd5tW8M4uDk+fhrFu4sGlN11OWfJxvezRxGd9aYI6dINLQ2OrQuaSAR29LWlkrY
        nGfoP2v0XU+BCwSycoGlTbMf3SuswCltWvErK5HBDpu06srTOtaj8+U0dRRuVPYD
        1uE+Hha+ejKf6yQF8I+1FtsVD2gstVJDoOlV0njJn0iDXoAQNlIkjjDghqjAimwt
        BxLVpR0QiP9UFJZ+974LVUi4hoVgPtF8xwoHV+ow9MgTLjKHlMs4FhY7UpoZyBmq
        NzuEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=DU31iJfP0ZzJYmQi8H2gN6vMT5ID4HWjCi4Mhy5sn
        Dg=; b=yUeYDTiD5Lw9ZZPPOKwY4NjZPNDLw0Gh+dWiHctFYsEPR0Z9UR1y2AyYG
        pgqr8cEtiwIEdQ+pBM/C95UDd6kmAICI8lIVQSZTnVByNzoOWxQiCkO7JYF5v6Pe
        CXdQ88NVRtPwGPY1kKjC1mDoI+XEwWoUCrnPyOoykHQWoTae+7ZxCZKn93gGfJc6
        gg1Z1vFLrWXlB8HQQW7arRrxUCzFsZ5Kmql2SxnQBj3o6/JKRL227xSOovSndnjn
        +pAxIcMX3fDB5PU34iulnf2Y0zqNFxQJy+d66tgn+dHBxNJh20Ejn8CwbnOcJqH7
        Prp8YWJHuDWbdyNqIPy2u3I7zKG1Q==
In-Reply-To: <CAFAx9aZd6vA0Se_6eEsRCr4AkRgGj3Eb=7SDXrRZPSpxMCN2vg@mail.gmail.com>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 11/02/2020 12:07, 양유석 wrote:
> Haywood,
> 
> Do you mean the remote logging like rsyslog? We did not try since
> syslog does not emit at all. Is it worth to try though?

I would suggest trying to use netconsole:

https://www.kernel.org/doc/Documentation/networking/netconsole.txt
https://wiki.archlinux.org/index.php/Netconsole

This has helped me on a few prior occasions in capturing information 
that has proven vital to the subsequent debugging of unexpected kernel 
crashes, one of which was kindly resolved by a Netfilter developer.

The other thing to consider is that 4.13 is not a supported kernel, 
beyond the efforts of your distribution vendor. If at all possible, I 
would suggest trying to reproduce this issue in (at least) one of the 
supported longterm releases, as designated by the kernel.org homepage. 
That may entail the use of a backported package, or even the compilation 
of a kernel on your own part.

-- 
Kerin Millar
