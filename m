From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: How to do nat filtering in 1.4.3.2
Date: Wed, 22 Apr 2009 23:26:48 +0100 (WEST)
Message-ID: <3466.87.196.144.12.1240439208.squirrel@webmail.decimal.pt>
References: <3276.87.196.144.12.1240436887.squirrel@webmail.decimal.pt>
    <49EF9337.7000304@solutti.com.br>
    <3404.87.196.144.12.1240438707.squirrel@webmail.decimal.pt>
    <49EF98A0.2030505@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49EF98A0.2030505@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leonardo Rodrigues <leolistas@solutti.com.br>
Cc: netfilter@vger.kernel.org

>     absolutely !!! -t filter is the place to filter. -t nat is the place
> to do NAT-related stuff, and not filtering.
>
>     if you wanna filter packets coming TO your firewall machine, then
> your rules should be in INPUT chain
>
>     if you wanna filter packets going out FROM your firewall machine,
> then your rules should be in OUTPUT chain
>
>     if you wanna filter packets passing your firewall (ie, getting
> routed), then your rules should be in FORWARD chain. Remember that
> packets go and come, so depending the case, 2 rules are necessary to
> fully accept a forwarded packet

For packets going to the machine, i already am using the INPUT chain.
My confusion was the filtering on the nat table, but now i'm clear thanks
to you :)


