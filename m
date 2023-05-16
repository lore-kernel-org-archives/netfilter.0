From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
Subject: Re: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 07:18:07 -0400
Message-ID: <a659096f-6142-4193-8b6a-500de4a8467a@app.fastmail.com>
References: <CAF_hPjN0pV9w+RmO8rkSnNwd-2+ep6vmy-7JaREvUFSyNzuGhg@mail.gmail.com>
 <81765c91-cfc1-cf1a-8d34-c69dea29e2af@thelounge.net>
 <CAF_hPjOsjMJqvgPLSgfzLqaQ21GTvLUXGNmHCCkxHEbvNCo1ZQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc:cc
        :content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to; s=fm1; t=1684235908; x=1684322308; bh=rg4JJ
        vzZUfIpOBR+/12F5XEIIMZ8qGw9MpcZGi8AJzU=; b=VMVvCqPVdJRf8hCkK6XUw
        GayzcxRbT1ZX7suNUGOdeOp+QkgtAGhZLHGCFkOJokdgbV+LZq8ekZqiiz+Congt
        Jk0yS1gaYFDceKliLckjA/+dJh5ATjuZaoin2x4EDTieWFTu/Vi2kq3jF4K5Pn8U
        HX1xmzWQpt4gSKOozCyWwVP5HrrvLMl0jr/KSex2qLVxvDajP0gXBiwZ6mRxrNFB
        h4zO2Lppl+0CCukdaB3T6Un+XMHLNcyvSpwua2UlxIypHsyNF8fSc9X9n68w8Ykz
        8BwvhJ22ogUKFrr1JsnD/vM2onLR43o+N8zqz8LCjwVSAVAgLNvRkRtR8M5OuvQ3
        A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1684235908; x=1684322308; bh=rg4JJvzZUfIpO
        BR+/12F5XEIIMZ8qGw9MpcZGi8AJzU=; b=fy/YSD1mWAxHyXnNKLrrZoQe1Uzdb
        VN/0w+rkvWGOwPg/jvIJZUZIdyR0XZgxANKK0HIb/JJY3QJT0WFt5vG4vxh4GHXQ
        u+OK0+uecxxXX9nLzAs7nGcm9NYiv+1f1dhsao1oZCj8rsk/yEynArHn3ByfCIBP
        ttOCtIJClyH1/Yc1A0IMCkIBq9WUeyp9PsQeUlHmHC04Dk+L8Pib0Q3P1NPPEEep
        65a1GVEYV8NLWH21rGNhw0ESoVXZIlJZ3lDwFhp4mGgASTwHBDlf5d40raNk9eKs
        3efoGJNgkpQ0DHnVe2WgThr9+iJk+KiXa6dvD42L2YnaeKTObKKfRdruw==
In-Reply-To: <CAF_hPjOsjMJqvgPLSgfzLqaQ21GTvLUXGNmHCCkxHEbvNCo1ZQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: netfilter@vger.kernel.org

On Tue, May 16, 2023, at 07:07, Shane Wang wrote:
> Thanks for your reply.
>
> I think the "--to-destination 10.0.0.1" rule will be matched, and the
> "--to-destination 10.0.0.2" rule will never be matched.
> Does iptables unsupported "full cone" NAT for multiple internal IP addresses?

Does *any* platform support such a configuration? Based on my understanding of what 'full cone' means, every internal address needs a separate external address to be fully mapped to it. Your example shows that you have one external address, which means you can only provide 'full cone' mapping for one internal address, no matter which tool you use.
