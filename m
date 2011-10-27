From: Ronald <ronald645@gmail.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Thu, 27 Oct 2011 08:45:26 +0200
Message-ID: <CAF1_xX3-AOvXDhieJe6Wdw_v8GCwgW_5Q0UNN6bnaR_58citZQ@mail.gmail.com>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
	<1319669075.26402.6892.camel@andybev-desktop>
	<CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>
	<1319696663.26402.6931.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ZbGNOvay+/mOi6sc4hrN7Pri3IxQA6h5ZtagYQb7fc0=;
        b=pqa/vhBytU6EeE24RDxk0Q7lsnARCs09jCBEZHPhZkw1JDZ30HYB7Qqstvatp/ZTu+
         pcwaGC92widbEGr94blKiJbadZ9TN0pl4p1t3ERSmT14cstjOexG2wvt3Ee0e8Ug/ZEZ
         A6wtrvguUlC2wuDmlLPeZRKteDiYJwTncWDEo=
In-Reply-To: <1319696663.26402.6931.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

>> > I assume that you have the relevant rules for the returning packets?
>>
>> What you see above is the entire iptables configuration that is
>> relevant for port redirection. I made these based on examples from the
>> internet. In order to redirect a port, you have to apply 1 rule to the
>> client and 1 rule to the server.
>
> For packets going in one direction, yes. But surely you need similar
> rules from the server back to the client? That said, it's probably
> working (with the cable connection) because you're not doing it at
> either end, so the packets are using the default ports.

No I don't. If I redirect packets from the client that originally go
to udp/500 to udp/56301 (for example). I can even add the following
line to my server. (This is in the case I use port redirection. Then I
use this line to make it an effective security enhancement):

iptables -I PREROUTING -t raw -p udp --dport 500 -j DROP

This works, since redirected packets also travel the raw table before
they are NAT-ed back to udp port 500. So these packets all use the
port that I assigned to them using DNAT (hence succesfully NAT-ed
packets won't get caught by this rule).

If I use a cable, the connection succeeds. If port redirection would
fail, this rule would catch it and make a connection impossible. So I
can conclude that port redirection works as expected when using a
cable.

Besides, I designed my netfilter configuration to not differentiate
between interfaces. I use the addrtype extension, works better.

>> > then your answer is a problem with the bearer in between.
>>
>> Thinking of it, I suppose that is a valid conclusion. Totally agree,
>> bothers me why this is happening though.
>>
>
> Hmmm, I'm still not convinced you've got the iptables rules correct, as
> per my post above, but I've not got time to re-read them right now.

I'll take that in consideration when testing with nc, thank you.

>
> Andy
>
>
>
