From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 5 Jan 2012 09:15:01 +0100
Message-ID: <CAKywjPrGnmOg9Zh4T-VzCJHrhJ52s1jmBJsKq4R=D2viFZHmsA@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <1325748924.2270.334.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=FS7xXqmMEBvgFpVI5PNcyr1R5Jv3oBLVPVN0Yvi7+lA=;
        b=NVcjiJktxG6cb7pl9zVq8yRGz59hjNcsMFuVxitYvWfIbkkmKZ9wuXIrjoxFRPZ0rY
         S35ozX6vMTM9yr2r2WxHJcmzvNQmq5B1ghr/XDG6qotGlRiZoWOR/u8/Rlbf03glOCT9
         buPiV/QlRJNxdvSIu2yg3LO302eUaDHzYh4Rw=
In-Reply-To: <1325748924.2270.334.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

=2E..
> So you have something like:
>
> Server A ----|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> Server B ----|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |-----> Linux router ----> =
Internet
> Server C ----|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> Server D ----|
>
> Correct? And it's the Linux router you're asking about?

That is exactly right. I thought it might be useful to do part of the
routing on the servers (A-D) but that has the disadvantage of meaning
Windows can't be used (Windows doesn't do policy-based routing). Not
that the idea is to use Windows but I like choice...

>> AFAICT the best way to do this is with iptables SNAT - is that the
>> case?
>
> I think the main question is: how does the Linux router know which IP
> address that the mail should be sent from? Server A/B/C/D somehow nee=
d
> to pass this information on. This can't be done with fwmarks, because
> they aren't retained between on packets between servers.

My idea was to communicate the external/public IP that should be used
by the router by associating an internal network to each external IP.
So if an internal machine presents a packet from their address in
network X, the router knows that it should use public IP X. What I had
in mind was just taking the standard case where you have one publicly
available IP and lots of internal machines that need to access the
'net, and multiplying that by all the external IPs. So if we have 1600
external IPs then we'll have 1600 internal networks, each with N
hosts.

>> =C2=A0It's not 1 to 1 so it needs to be stateful, and can't be done
>> with just iproute2 stuff - am I correct in my understanding?
>
> You might be able to do this with iproute2, but depends on answer to
> above.

My understanding was that iproute2 doesn't do stateful, and that if we
have many : 1 then we need stateful. Is that right?

>>
>> There seem to be many different ways I could do this in terms of
>> routing - at least by source IP, TOS, and fwmark.
>
> I'm going to guess that source IP is the only option. So can you set =
the
> source IP from each server depending on its eventual external IP
> address?

I was thinking that when the packets *arrive* on the router they could
be marked for ToS or fwmark from their source IPs. The ToS or fwmark
could then be used for routing decisions. On the surface of it there
is no benefit - if you can use source address for routing decisions
then why bother adding a step for marking? ToS and fwmark looked a
little simpler in the examples, but I'm a noob, so don't really know!
In any case, source IP seemed to be the best option, so it looks like
you are confirming my original suspicions.
Thanks for your input.
Anton
