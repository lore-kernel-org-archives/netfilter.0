From: Benno <b.ohnsorg@freenet.de>
Subject: Re: Fw: nftables portknocking
Date: Tue, 5 Apr 2022 21:16:07 +0200
Message-ID: <8d91afa2-6cef-f12f-7b99-2ed48cd8cf60@freenet.de>
References: <trinity-a562df00-31ef-40b9-9a08-4b842eca8f0e-1647086495600@3c-app-gmx-bs23>
 <trinity-9d8181c6-0f95-4798-ab11-17b63f7de864-1648567419132@3c-app-gmx-bs05>
 <trinity-3c753dd7-a93f-4833-aee3-9dc0f1837d4c-1648567904310@3c-app-gmx-bs05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
        s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1MWtFNA1z0WaEQ+KwxTyu2ODCLB8H/Tze3fOzHQVgEs=; b=xGBa0AdBShcoXB5tO2zNfXfKIr
        v8RLm0Es5X5AikcUJTqYJ839+G7DACc5bGHE3jA04UXWO1Yk1thWqd1icpcY3lwRQwM15jpCPP5UU
        CPafvnuwZHyyMDG2u8YQwCNPaG3RUxLhwy0OC2cKBNc1uFS8a4106u/vfSogB0bPyBbJDk+tz4pFE
        m+TvYhFbHqNaQaIOyL58owxT4jmgb5XIAQWlJhlNCylJpi8KzhQMQEW9EtMLlrRqh1TS9Ud1x+hTB
        4vynIvx6R2ylZQhVGetio0f8O0C8xRSa9sFDbXP4aYbznmk9CV89qTDiO+f0tsuY699R/9p45sy2F
        7WG 
Content-Language: de-DE
In-Reply-To: <trinity-3c753dd7-a93f-4833-aee3-9dc0f1837d4c-1648567904310@3c-app-gmx-bs05>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org




Am 29.03.22 um 17:31 schrieb Frank Wunderlich:
> Hi,
> 
> got portknocking basicly working, currently only for ssh (of course changed ports in my config ;) )
> 
> define pkport1=123
> define pkport2=234
> define pkport3=345
> define pkport4=456
> 
>     chain PortKnock {
>         tcp dport $pkport1 add @candidates_ipv4 {ip  saddr . $pkport2 timeout 1s}
>         tcp dport $pkport2 ip  saddr . tcp dport @candidates_ipv4 add @candidates_ipv4 {ip  saddr . $pkport3 timeout 1s}
>         tcp dport $pkport3 ip  saddr . tcp dport @candidates_ipv4 add @candidates_ipv4 {ip  saddr . $pkport4 timeout 1s}
>         tcp dport $pkport4 ip  saddr . tcp dport @candidates_ipv4 add @clients_ipv4 {ip  saddr timeout 10s} log prefix "Successful v4 portknock: "
> 
> 
>         tcp dport ssh ip  saddr @clients_ipv4 ct count 5 counter accept comment "ratelimited ssh"
> 
>         tcp dport $guarded_ports ct state established,related counter accept
> 
>         iifname $ifexternal tcp dport $guarded_ports counter reject with tcp reset
>     }
> 
> as far as i tested it, it opens the port (ssh) only for a short period (~5s) then closes it. so connection needs to be establishes in this short time. after closing connection port gets closed too...so far so good. imho i can increase the time with the timeout-setting, right?
> 
This first strategy seems to work by adjusting the rules over time. When
knocking the first port @candidates_ipv4 is changed so it matches the
next port (and source ip). The rule with $pkport1 still works but would
re-add the source ip to the candidates with the next port in the sequence.

I assume for multiple ports and different sequences it is necessary to
have unique names per candidates and client variable.

The other rule from the examples does not mutate the rule but selects
different entry points and records state in contrack table as well as
independent sets per knock port. Initial jump entry is PortKnock which
tries the states in reverse. Clients (=ip) which already knocked
correctly are handled first with a refresh. All others move through the
sets. Either they proceed in time or they get evicted after 10s
(timeout) which is checked every 4s (gc-interval). I'd say this is a
matter of taste along the lines of Shannon: gc-interval below half the
timeout.

Also for the second case sets need to be named unique per guarded port.
That is why the original author seems to prefer scripts to generate the
rules.

Final question remains: which strategy is more performant? I assume the
first changes the same condition again and again which saves memory but
requires more CPU. The second throws memory at the problem and saves CPU.
