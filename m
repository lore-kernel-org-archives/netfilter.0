From: Benno <b.ohnsorg@freenet.de>
Subject: Re: nft numeric output translates tcp flags rule so it cannot be
 loaded again
Date: Fri, 22 Oct 2021 20:10:07 +0200
Message-ID: <9d7cf59f-eb61-5914-cbd5-83e5dd053684@freenet.de>
References: <b02e9c0a-281d-02d1-d876-b0b997b6d8c2@freenet.de>
 <YXLWuHabUtY9wKXq@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
         s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LmYEdNnEI/MIazi032XNuG5aegRitb60So0sAYjPFLU=; b=kZYj2F2cn0b5+6MjbU6EQtD2WG
        F19/q57Y6JEAZsjJe48uf6xtaia6G8CMHGdhNIKWd6qgdxpO80qp2sqgTzOocMPxVaj3fny79lXg4
        E2aw77wbg+IZnTHm7filpxJcMdXaoK6SQfDuCj8TpnieXxr9IQw4TRdYQaWMeQmN+0iLTv0Gy3qCc
        SqqcSJsKphUvMk9pO2UiJw25PW29V5ZpW728puOZX5kb5xWy5E3T8OG/P0J5XcSFtKUCp0tcoOhkE
        RL5ZwD3SRo1FM+Ts9cOMdNzXjDtGzf80P1qgQRBEmnIvd3XWjvGajyRMp2tHDBlVRBTzLrlec01oV
        3W 
In-Reply-To: <YXLWuHabUtY9wKXq@salvia>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Am 22.10.21 um 17:20 schrieb Pablo Neira Ayuso:
> On Fri, Oct 22, 2021 at 03:51:04PM +0200, Benno wrote:
[…]
> 
> What nftables version are you using there? Using nftables 1.0.0.
> 
> Reload works fine here:
> 
> # nft -f ruleset.nft
> # nft -n list ruleset > /tmp/ruleset2.nft
> # nft flush ruleset
> # nft -f /tmp/ruleset2.nft
> # nft list ruleset
> table inet firewall {
>         chain inbound_ipv4 {
>         }
> 
>         chain inbound_ipv6 {
>         }
> 
>         chain inbound {
>                 type filter hook input priority filter; policy drop;
>                 ct state vmap { invalid : drop, established : accept, related : accept }
>                 tcp flags != syn / fin,syn,rst,ack ct state new counter packets 0 bytes 0 drop
>                 iifname "lo" accept
>                 meta protocol vmap { ip : jump inbound_ipv4, ip6 : jump inbound_ipv6 }
>                 tcp dport { 22, 80, 443 } accept
>                 udp dport 1900 meta pkttype multicast limit rate 4/second burst 20 packets accept comment "Accept UPnP IGD port mapping reply"
>                 log prefix "[nftables] Inbound Denied: " counter packets 20 bytes 6180 drop
>         }
> }
> 
>> For example connections to sshd on port 22 is not possible anymore.
>> There are also no logs about the dropped traffic.
> 
> Works also fine here.
> 
I fast forwarded to (not yet stable 1.0 on Gentoo) and tried a restart
with same result. But restoring the working rule set, saving through the
init script and restarting yields a working rule set.

And instead of numeric variant of 0.9.9 which was

tcp flags 0x2 / 0x1,0x2,0x4,0x10 ct state 0x8 counter packets 0 bytes 0 drop

it looks now different with 1.0:

tcp flags != 0x2 / 0x1,0x2,0x4,0x10 ct state 0x8 counter packets 0 bytes
0 drop

Interestingly both variants are syntactically correct according to nft
-c but I'm not experienced enough to interprete the consquences of the
missing operator != for 0.9.9.

Replacing the now working 1.0 variant of tcp flags with the broken
variant from 0.9.9 causes failed connections again.

It'd be great if you could explain the effects of the subtle change of
the rule. Since I'd like to use nftables to be verbose/ easier to
maintain. Both numeric variants look complicated to the untrained eye.

I can match the different string tcp flags to their numeric values. But
I'm unable to get the difference between tcp flags 0x2 and tcp flags !=
0x2… It looks like a not-equal-operator that clearly lacks in the 0.9.9
variant. Is it because of polish notation/ operator first?
