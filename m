From: "Ivan Petrushev" <ivanatora@gmail.com>
Subject: Re: How to mark traffic on used bandwidth
Date: Mon, 23 Jun 2008 13:35:37 +0300
Message-ID: <d39744a20806230335u4c527f53p258437b4bcc8416@mail.gmail.com>
References: <38db14850806230123h2c0a1aa4uef8afd8275d07d98@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=qLILp8pDkts9PeS0PUxVup00CXrAquaKsrUdSk0Yukc=;
        b=thklU16fHoV44K2yIv50KeJmj1vAlvQ1aV1VilE2ER5EPMp8Ah9oN5rVx6blWIm8wf
         /+0S/r/JHtsE0tKSj7QOeZ0pQ4Cnl9gKPCDxocgzcQQSTuJOGpU8Z9jvIXBkpSn9Rsig
         E43GSuvD/SQPXtg7NK8pVAKKjFoQdJXQn2mGI=
In-Reply-To: <38db14850806230123h2c0a1aa4uef8afd8275d07d98@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org

If these two bandwitdths are on different interfaces (NICs), you can
see real time stats with Gkrellm or other similar utility. ntop does
it too, I think.

On Mon, Jun 23, 2008 at 11:23 AM, Anatoly Muliarski <x86ever@gmail.com> wrote:
> Hi all,
>
> I have an upstream link with guaranteed bandwidth( name it B1 ) and extra
> not-guaranteed bandwidth( name it B2 ).
> How can I marking the traffic by using iptables?
> I need one mark for B1 traffic and another for B2 traffic.
> iptables provides -m limit match but it works with packets only,
> but I need one based on bytes/bits per second.
> I'll be appreciate for any ideas.
> --
> Best regards
> Anatoly Muliarski
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
