From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Re-Routing after OUTPUT mangle
Date: Fri, 19 Jun 2015 09:28:32 +0300
Message-ID: <CA+4D1sdue-kCrTikcMZTma=SK96ADyi1hUsrAnkRYi3=+_aBUw@mail.gmail.com>
References: <AA848452A6213541AA3068E39B028C5616B0EE59@EX-1-MB2.lancs.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=+0pCZVrYsQ/PZhEenH+6UPHgA87BI6NfaJwJR/rdScA=;
        b=LPLcv6FborT6q2I0W6aD1TPkt9eiNQ2tVm87Osi/kJAbFKo3DWjxRUix39TXCkoRr0
         thPfL4umeeFPV+KfqWkCekpidil7hgx5GTts6jg5kYJjJanGoeMip2cdDOzca3LIIgt0
         ov5SQ+8PIo6KtmTei1v1AsZlWxKvaMbNizde2MPXJJyeFMFn/R5PNM67SHdro2NH8qUp
         4fNtG8Xc3PUA+Dt4b3aCXA7GIyyy+5ipRC97Ev6PWX1S1JEX36CkMg0Ebc0/+BNXukCf
         fZRQDkbsjxo+IbPQ2sBYj9N/s6pSLmQZlIk9bMshgXKFA6MEovi8OErK0zIslie2NXLM
         Xhcg==
In-Reply-To: <AA848452A6213541AA3068E39B028C5616B0EE59@EX-1-MB2.lancs.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Withnell, Richard (withnell)" <r.withnell@lancaster.ac.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Richard,

Re-routing means to choice the correct routing path possibly by using
the specific routing tables, but it has nothing to do with mangling of
the source IP.
Therefore you have to change it the nat table in the POSTROUTING chain
what you have already done.

2015-06-18 22:56 GMT+03:00, Withnell, Richard (withnell)
<r.withnell@lancaster.ac.uk>:
> I'm having a little trouble marking packets to split traffic across
> different connections.
>
> I have specified rules (see below) that mark the packets as expected, and
> they do hit the correct routing table. The source address however, is still
> based on the decision from the main routing table, made before it hits
> OUTPUT. As far as I know, after altering the packets mark, it should be
> re-routed, changing the source address to match the interface/route it will
> actually use.
>
> ip route add default via 192.168.1.1 dev eth1 table 2 src 192.168.1.10
> ip route add 192.168.1.0/24 dev eth1 table 2 src 192.168.1.10
> ip rule add fwmark 2 lookup table 2
>
> iptables -A OUTPUT -t mangle -j CONNMARK --restore-mark
> iptables -A OUTPUT -t mangle -m mark ! --mark 0 -j ACCEPT
> iptables -A OUTPUT -t mangle -m mark --mark 0 -p tcp --dport $PORT -m
> conntrack --ctstate NEW -j MARK --set-mark 2
> iptables -A OUTPUT -t mangle -j CONNMARK --save-mark
>
> I have worked around this by using SNAT, in the POSTROUTING chain, however I
> would like to clarify why the re-routing after mangling isn't working as I
> expect.
>
> Is there something wrong with my understanding of the re-routing process? Is
> there something about the rules I have specified that is causing a problem?
> Or something else entirely.
>
> Thanks in advance,
>
> Richard
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Best regards
Anatoly Muliarski
