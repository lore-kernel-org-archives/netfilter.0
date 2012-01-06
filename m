From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Fri, 6 Jan 2012 06:15:27 +0100
Message-ID: <CAKywjPoHa_0kjvC0H_YT+RQ-pjeTN1aUoyULbhzYOmFT51giZw@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <1325748924.2270.334.camel@andybev-desktop> <CAKywjPrGnmOg9Zh4T-VzCJHrhJ52s1jmBJsKq4R=D2viFZHmsA@mail.gmail.com>
 <1325788784.2606.18.camel@kushiel.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=LgmPtgWj66lSF7gUWiIa8NkEhovEqN4dTnW0ZXZq9FY=;
        b=HI2oj77Ca/8pK0J4Hdc17JMySDDsCeDVdgbj0FSgTIiYyO3D5lixqN6AYiH4jsoZB3
         xzG90hZtAyjL9Svvy+czzo6i68BN2/xtxuZS4LY4RIlLRMNLu6OeGbrlfPzpZpueWWV8
         jTKltIDmCf+qrz1FUwwbSFqOnNdo1lD2q5ky0=
In-Reply-To: <1325788784.2606.18.camel@kushiel.sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Cc: netfilter@vger.kernel.org

...
> On Thu, 2012-01-05 at 09:15 +0100, Anton Melser wrote:
>> I was thinking that when the packets *arrive* on the router they could
>> be marked for ToS or fwmark from their source IPs. The ToS or fwmark
>
> You could mark them with a TOS value, but since (I understand that) you
> want to NAT private subnets using 1600 public IP's, you'd need to be
> able to check 1600 different TOS values otherwise I don't see how you
> would be able to differentiate. That's not possible as the TOS field is
> 8 bit according to 'man iptables' (F15's 1.4.10, yes I have to look it
> up too :-))..
>
> There's also DSCP; the man page it has superseded TOS, and that there
> can be 64 DSCP values (0-63), so that would also be a no-go AFAICS.
>
> IIRC fwmark only exists on the localhost, not in the header of the IP
> packet, so if I'm right then keep in mind that you can only use it at
> the localhost. The man page says that the mark value is 32bits wide
> which would make it usable here.
>
> But I don't think all of this is going to help you.

Maybe it will, see below!

>> could then be used for routing decisions. On the surface of it there
>> is no benefit - if you can use source address for routing decisions
>> then why bother adding a step for marking? ToS and fwmark looked a
>> little simpler in the examples, but I'm a noob, so don't really know!
>> In any case, source IP seemed to be the best option, so it looks like
>> you are confirming my original suspicions.
>
> Since it seems you want to map private subnets to 1 public IP and do
> that 1600 or so times, I don't see a way to do it easier then matching
> the source address and SNAT it accordingly.
> Yes, that would mean a lot of rules to create and maintain but I just
> don't see any other way.
...
Sorry to everyone for my explanation not being clear - I suppose that
is just a function of my lack of experience/understanding. You have it
right Rob - I want to map private subnets to different public IPs 1600
times. If the only way to do the NAT is with 1600 rules then I'll stop
looking elsewhere, thanks!
There is also the matter of routing though. I agree that this question
is more an iproute2 issue, and could/should be better asked on the
iproute2 list. In my mind marking the packets for ToS or fwmark was
actually for use at the routing level. The public IPs don't all belong
to a single subnet, and so there are actually 4 different gateways via
which the packets need to go (3 /23 and one /25 networks with 4
different gateways).
If people confirm that there is no better way they can think of for
achieving what I want to do, I shall thank you all and go and bother
the iproute2 people for the routing part!
Thank you all for your patience and help.
Cheers
Anton
ps. I'll do a blog post when I get a coherent config set up and post
back here for reference and your comments. It will need failover using
connection tracking so could end up being a nice little article.
