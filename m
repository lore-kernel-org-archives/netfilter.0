From: Daniel <tech@tootai.net>
Subject: Re: Nftables 2 WAN
Date: Fri, 14 Aug 2020 23:26:31 +0200
Message-ID: <f271e8e7-12c1-480f-0a06-3db5ebc5875a@tootai.net>
References: <6bd2a7b2-4244-3695-4b62-64957bfd71c5@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597440392; bh=nrW3ktzyZ2/v93pbcNC60TZ5ZTBRhMe8f3eHDO7vLhk=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=lj69hWaeZ0IwinZZG/+qcXYL2NcTxOd3eSgRPndTiWizKcfcefrRnj1OKwSsvfWiW
         xjP22DQpZtVcp+JERdacnFAvsjVkg3coMaP54SgFp47bB7w1Ch1khGsQLTEYCnOMoI
         3fJG0uapNOXkabNKORO7evAxh1WUWwB9VjnyBah0=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597440392; bh=nrW3ktzyZ2/v93pbcNC60TZ5ZTBRhMe8f3eHDO7vLhk=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=lj69hWaeZ0IwinZZG/+qcXYL2NcTxOd3eSgRPndTiWizKcfcefrRnj1OKwSsvfWiW
         xjP22DQpZtVcp+JERdacnFAvsjVkg3coMaP54SgFp47bB7w1Ch1khGsQLTEYCnOMoI
         3fJG0uapNOXkabNKORO7evAxh1WUWwB9VjnyBah0=
In-Reply-To: <6bd2a7b2-4244-3695-4b62-64957bfd71c5@tootai.net>
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>


Le 14/08/2020 à 18:27, Daniel a écrit :
> Hello,
>
> I'm configuring a routeur which has 2 WAN, one being a tunnel over gre 
> which is for bgp session accepting all ipv6 routes. I have 2 
> interfaces, eth0 which has 2 ipv6 addresses and gretunnel which has 
> one ipv6 address.
>
> Problem is that incoming ipv6 traffic to eth0 is going out through 
> gretunnel. My rules are
>
> fwtables="sudo nft"
> myip="sudo ip"
>
> # nft table mangle ip and ip6
> #
> $fwtables delete table ip mangle 2>/dev/null || true
> $fwtables delete table ip6 mangle 2>/dev/null || true
> $fwtables add table ip mangle 2>/dev/null || true
> $fwtables add table ip6 mangle 2>/dev/null || true
> $fwtables add chain ip6 mangle output "{ type nat hook output priority 
> -150 ; policy accept ; }"
> $fwtables add rule ip6 mangle output oifname != gretunnel meta mark 
> set 0x254
> $fwtables add rule ip6 mangle output oifname gretunnel meta mark set 0x2
>
> # nft table route
> #
> $fwtables add table ip6 route
> $fwtables add chain ip6 route output
> $fwtables add rule ip6 route output meta oif gretunnel meta mark != 
> 0x2 counter drop
>
> # ip route mark
> #
> $myip rule add fwmark 0x254 table default
> $myip rule add fwmark 0x2 table isp2
> $myip route flush table isp2
> $myip route add prohibit default table isp2
>
> What is wrong with this setup ?

UPDATE: I discover that the traffic I see on interface gretunnel is only 
the local generated one which is going out with the eth0 ipv6 address. I 
modify mangle table which now looks like

# nft table mangle ip6
#
$fwtables delete table ip6 mangle 2>/dev/null || true
$fwtables add table ip6 mangle 2>/dev/null || true
$fwtables add chain ip6 mangle output "{ type nat hook output priority 
-199 ; policy accept ; }"
$fwtables add rule ip6 mangle output meta oifname != "gretunnel" meta 
mark set 0x254 return
$fwtables add rule ip6 mangle output ip6 saddr 2a01:XXXX:YYYY:ZZZZ::1 
meta mark set 0x00000254 return
$fwtables add rule ip6 mangle output meta oifname "gretunnel" meta mark 
set 0x2

where 2a01:XXXX:YYYY:ZZZZ::1 is the eth0 ipv6 address but no luck, 
traffic still going out through gretunnel interface.

Thanks for any hint

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
