From: Pete <pgm987@gmail.com>
Subject: Re: Iptables XML
Date: Sun, 8 Feb 2009 22:23:37 +0000
Message-ID: <82e95f530902081423u453f53cdhcdec1f20da8bb9b5@mail.gmail.com>
References: <82e95f530902081417r1c1c4e65ka1c2556ddc765d5e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=1R5YKaPv/z4pvMsNvHPHNFo9qqWROlp4AKsQGDziATE=;
        b=RUYtat40XAhBQuBcXcUiP7Fk58LXOY9gR6LqeirTVN71bvUng0ZUQj/vuHhkE/jWDk
         vnLc6cZzuLRZViOkmRgnXEpC1Qx2fKbph53BwBMnwbNGrWJIk6oytPAbuPxWrYD2cfso
         ZLbAWXZb8n5vYkR6FC8/xPZAVhCYK8v0Buj+o=
In-Reply-To: <82e95f530902081417r1c1c4e65ka1c2556ddc765d5e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

No need to worry I worked it out 2secs after sending the e-mail.
I used "iptables-save | iptables-xml > rules.xml"

Thanks ^_^
Pete

2009/2/8 Pete <pgm987@gmail.com>:
> Could someone show me the command to get a XML output of my rules?
> Iptables-xml says " Use  I/O-redirection  provided by your shell to
> write to a file." which is good but I don't know how to do that ^_^
>
> Thanks,
> Pete
>
