From: kay <kay.diam@gmail.com>
Subject: Re: preroute raw filter only on some packets possible, why?
Date: Fri, 14 Sep 2012 12:00:25 +0400
Message-ID: <CANaOheaw9suxnTXvcDoWM+UgLDLyFf6k+7u5qa4QduKQeHUdnQ@mail.gmail.com>
References: <CAH_S8NitmC6nZf859J-CA4Bic_0ep96-ZXrStb3kPDQEVUPzAA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=eC71MviSwl6U2SzGiwaz9ab/XoZx+Ou1wO+amoFw5Qs=;
        b=lHvoz6nJiWStlnKQUDs7bfGriNa2jqP23y0rS1oA2t3wCJ7PZSy3MYwykSl4dul6il
         b/tITkzXtbXS7Vw2Euj0KY4iSNI/vFyhRVOr6+nwdpCAl3W6t9G/Uo7RMxO6TLGGY5vV
         mmoSnnBKn+8dFu+SlCzo6Q97x8iIssDzNuMV081VCp0Q8oyNw0yyLNlnsu7nzzkggWKU
         qg74YqlCf0s5R3bDyd0yIJSNrkTMzTIBABdLnflQStooSQE3Gwoq3/jlXo7XAnXcK+6b
         ab4SKram5T5tlGAVJIgxa/70hjhVwemmlsj44sXoa9tOXyTDJpLMzBJJNSTJ15Aw7kuK
         AxGQ==
In-Reply-To: <CAH_S8NitmC6nZf859J-CA4Bic_0ep96-ZXrStb3kPDQEVUPzAA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

You can try to use the RAW table. For example:

iptables -t raw -A PREROUTING -p tcp --dport 22 -j DROP

2012/9/14 Sladjan Ri <sladjanri@gmail.com>:
> Hi,
>
> I read that the notrack target could be used to save performance. Is
> it really possible to exclude for example packets to a specific port
> from being tracked? How could the target know where the packet would
> go, if the target has to be used in "preroute", before the routing
> decision? I am referring to this text:
> http://security.maruhn.com/iptables-tutorial/x4772.html
> Thanks!
>
> Regards,
> Sladjan
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
