From: Hossein Zabolzadeh <zabolzadeh@gmail.com>
Subject: Re: Iptables Unnown Error
Date: Sat, 20 Sep 2014 21:26:35 +0430
Message-ID: <CAMadfcwjWxi3jXuJOkcLH-eVmBXcyceWTW_gy6jU0krwEgtVfQ@mail.gmail.com>
References: <CAMadfcxmKqxOdTsSHbE_mopB2XECmx4DMfM4G8VJUe9eDYRkfA@mail.gmail.com>
	<CAFpD06Qfu+Lk+o9wjVZvCDZubEK0yrZAyLo8bsjm=WEhBrkdFQ@mail.gmail.com>
	<CAMadfcyMNVWOhpV1mgRoZ-0Vw_v3BYyi_9GOBjwSjFgJ1jCwuw@mail.gmail.com>
	<CAFpD06TAJ4fcFTw6t7u4j56_px167ntn01Z3xmiCyO6cF43-3w@mail.gmail.com>
	<CAMadfcxnaLoiPmEZoAjwA83SDiFU0wNBGT+E=hTv6WGjL=7vqw@mail.gmail.com>
	<CAFpD06Q8Cn83A3YRDY36XyA=NcNY5vBDD7HSjDxFmTgCyD9nVQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=4eM1RlYqn6+VrLD6Gr93fkAgcZqADhya5wbACWZmVo4=;
        b=keR1fe32WiZeRnfmJOuWSdXMS3mcGthF3kMaWsLqItVZ2KonTMBib0zVKrcDAHYv6b
         SlV27z1qrPV/f6Qv2jbNVN9eHKtCdZbwt4Ws9Q1tb/2kJYDf5SSn4Eo8Tj/CSFb+PGqt
         Juf5i85CaJv7qYASFjpdrcm1zBBBggG3E/SAAxCYeu1gRdiERefKqdwjAXKbKzRDWZ3T
         lmk6EKmp+4h5Q5htHROPuz52JTV8kUsu7th9ImNZQzIIwOI0LNG/dBUhikopyJou6KlL
         AgDwOzpKO/2l4upxtr3vwOM/52b9F9bFi918OGCU+ZtSOm5tvn8Csq6PirXZBKohYFQs
         n6pw==
In-Reply-To: <CAFpD06Q8Cn83A3YRDY36XyA=NcNY5vBDD7HSjDxFmTgCyD9nVQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Longo <giuseppelng@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Thanks Longo,
I build a new kernel with nf_nat nf_nat_ipv4 enabled, and the problem
was resolved.
Really thanks for your advises.

On 9/20/14, Giuseppe Longo <giuseppelng@gmail.com> wrote:
> I suggest you to follow this tutorial:
>
> https://home.regit.org/netfilter-en/nftables-quick-howto/
>
