From: Daniel <tech@tootai.net>
Subject: Re: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Fri, 17 Sep 2021 12:18:12 +0200
Message-ID: <24b4d340-d951-103b-27d4-9bb97afd9c4c@tootai.net>
References: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
 <20210916092924.GB31336@salvia>
 <48e95c8a-2469-08dd-0620-55187252653c@tootai.net>
 <20210916125858.GA9451@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1631873893; bh=nIOanO5FQKIL/d9fMTS3nlanA8/Mspk9GHn0zuV9S7s=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=XucD1Z5g0fDsEOWj+Eun4jjir6YyRhipFEq6QdYXKsdN5DQGHFwxIgvt+0DF7VAL2
         cvBBs9C6xyuQnz3cgl44yWelUuoZBcrcQfB/p4IW79yLWD6N8R1724DqYZMp/y6Iy1
         e6v3JIYkWJW4rERNLt7er7UUxRIvUuwk35ucLygQ=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1631873893; bh=nIOanO5FQKIL/d9fMTS3nlanA8/Mspk9GHn0zuV9S7s=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=XucD1Z5g0fDsEOWj+Eun4jjir6YyRhipFEq6QdYXKsdN5DQGHFwxIgvt+0DF7VAL2
         cvBBs9C6xyuQnz3cgl44yWelUuoZBcrcQfB/p4IW79yLWD6N8R1724DqYZMp/y6Iy1
         e6v3JIYkWJW4rERNLt7er7UUxRIvUuwk35ucLygQ=
In-Reply-To: <20210916125858.GA9451@salvia>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Le 16/09/2021 à 14:58, Pablo Neira Ayuso a écrit :
> [...]
> so you want to redirect all ports except a few of them?
>
>    add map x mymap { type ipv4_addr : ipv4_addr ; }
>    add rule x y ip protocol { tcp, udp } th dport 1-65534 dnat to ip saddr map @mymap
>
> This allows you to dnat depending on the IP source address, skipping 0
> and 65535 for TCP and UDP.

I don't get I so lets be more explicite with an example.

I want to redirect udp port 10000-20000 to another IP (typically 
asterisk RTP ports from host to a VM) What I have today which work with 
single ports (bash script, yes I know ;))

     $fwtables add map $1 nat fwdtoip_tcp.$IFACE { type inet_service : 
$mytype\; flags interval\; }
     $fwtables add map $1 nat fwdtoip_udp.$IFACE { type inet_service : 
$mytype\; flags interval\; }
     $fwtables add map $1 nat fwdtoport_tcp.$IFACE { type inet_service : 
inet_service\; flags interval\;}
     $fwtables add map $1 nat fwdtoport_udp.$IFACE { type inet_service : 
inet_service\; flags interval\;}
     $fwtables add map $1 nat redirect_tcp.$IFACE { type inet_service : 
inet_service\; flags interval\;}
     $fwtables add map $1 nat redirect_udp.$IFACE { type inet_service : 
inet_service\; flags interval\;}

where $1 is ip or ip6, $mytype is ipv4_addr or ipv6_addr

Then from a list of ports I extract each value -including ranges like 
above exemple- and do

If src address != to dst address
$fwtables add element $1 nat fwdtoip_$myproto.$IFACE { $tmpsport : 
$mydaddr }
$fwtables add element $1 nat fwdtoport_$myproto.$IFACE { $tmpsport : 
$tmpdport } ; this is not accepted when a range is given like 10000-20000

If src address = dst address
$fwtables add element $1 nat redirect_$myproto.$IFACE { $tmpsport : 
$tmpdport }

where $1 is ip or ip6, $myproto is udp or tcp, $tmpsport port or range 
of port to redirect, $myaddr is destination ip. $tmpdport can be equal 
or a different value from $tmpsport

Finally rules

$fwtables add rule ip nat prerouting ip daddr == $myaddripv4 dnat tcp 
dport map @fwdtoip_tcp.$IFACE : tcp dport map @fwdtoport_tcp.$IFACE
$fwtables add rule ip nat prerouting ip daddr == $myaddripv4 dnat udp 
dport map @fwdtoip_udp.$IFACE : udp dport map @fwdtoport_udp.$IFACE
$fwtables add rule ip nat prerouting ip daddr == $myaddripv4 meta 
l4proto tcp dnat to : tcp dport map @redirect_tcp.$IFACE
$fwtables add rule ip nat prerouting ip daddr == $myaddripv4 meta 
l4proto udp dnat to : udp dport map @redirect_udp.$IFACE

This works perfectly with single ports but as soon as I want to redirect 
a range of ports it fail.

Where is my mistake ? Is it to complicate to achieve something which 
should be easy ?

Thanks for your support and ideas

-- 
Daniel
