From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: nflog : We are losing events. Increasing buffer size to 1736704
Date: Tue, 15 Sep 2015 10:54:27 +0530
Message-ID: <CAA5aLPiH2CRJnA0H1WrpnHp=R-eS_MWiZJq9r-y+fYHiD7ptqg@mail.gmail.com>
References: <CAA5aLPi5sdeEQTX0ss8DEQGNYd2SuNgt45tGHfWeO9t0uqvZxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=eXoXkP9Ql51kprJTogL+O6notBtZT/PkQ/ig1+LLjaw=;
        b=PLaDI8Q2xVfhn4StRvElyesyx/QpnM545AZkAHHG1fqLgfgrxVn0vd97UtsJda8vbt
         ub/zgA7j6BC7zT9wR1RgexYt858tSamqkhZIOVdfN+KoPegPHvWHRfjXirDLIoDmNHVz
         tHibfhisop8/6Ak07rjmgD6ehbgR0YgDHM53JA8ggvB1g0LRid5bfm7Rn1BxWnI1mLzO
         /l+fxB7A3/KEWR9pIY4HjDp1B8s1cnVglvHvRIeulbuOSZEtMep2oIJkVMkg1yj+ukG2
         W1kMulEx5bk3M04zTf97WmOiaP0dO2UoGhajr4GtyOKmOZdnjg69FbidNjQT/GtZ8fXv
         CB4w==
In-Reply-To: <CAA5aLPi5sdeEQTX0ss8DEQGNYd2SuNgt45tGHfWeO9t0uqvZxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Anybody? Please ...

ulogd_inppkt_NFLOG.c:443 We are losing events, increasing buffer size to 1736704

On Wed, Sep 9, 2015 at 6:54 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> Hi!
>
> I am using nflog for logging iptables traffic. When traffic rate is
> increased, I see message like
> We are losing events. Increasing buffer size to 12000
>
> We are losing events. Increasing buffer size to 16000
> ...
>
> We are losing events. Increasing buffer size to 1736704
>
> It doesnt get increased more than 1736704.
> Even if I set 1736704 as the default buffer size, then also I get the
> same message
> We are losing events. Increasing buffer size to 1736704
>
> Why is that so? What makes the buffer size having ceiling at 1736704
> (= 212KBytes)
