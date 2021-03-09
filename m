From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Tue, 9 Mar 2021 11:59:10 -0500
Message-ID: <af7cddce-b8cf-1a01-1b71-130ea452c84b@fhmtech.com>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
 <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
 <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
 <375f428e-f37b-551a-e09d-1024f00abb3d@hafenthal.de>
 <20210308210518.GC10808@breakpoint.cc>
 <624d2626-2fdc-a1d8-825c-81891488bf9d@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=EqedqLsnOwHxtEoS0dOJMCZuOgaLjJfJxM4xVcSCxAU=;
        b=vJq4mic80QmdG0tFLiDwCu+lt81wBxVW8gxoFa0HCgmpTCNJhKNVT566JJGPDS6VSPA6t5AIGd6p1z3MtNhxvrOv6lRH/KfUnNVIkQ/A7rvyjg2GScBix2kRD0GHh2MfRgngez5evfyr7tBF8/uTNTMua82Z1mA7gmCul7VyqdA=;
In-Reply-To: <624d2626-2fdc-a1d8-825c-81891488bf9d@hafenthal.de>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Stefan Hartmann <stefanh@hafenthal.de>, Florian Westphal <fw@strlen.de>
Cc: "netfilter.org" <netfilter@vger.kernel.org>

On 2021/03/09 11:13, Stefan Hartmann wrote:
> On 08.03.21 22:05, Florian Westphal wrote:
>> 'ct helper' fetches the in-kernel name of the helper
>> ("ftp" in this case) and not the object name defined in the ruleset or
>> used for assignment
> 
> Thank you, this is the necessary hint!
> 
> The ct helper "ftp" matches on the RELATED packets.

Stefan, congrats on getting your configuration working. :-)
And thank you very much for posting your complete ruleset below.

Florian, I hope you can comment:

1) I will look at the code, but am surprised that "ct helper" uses the 
in-kernel name "ftp" rather than that of the stateful object "ftp-21" 
that the ruleset goes to the trouble of explicitly defining.

a) Is this simply a parsing artifact -- if the helper were called "abcd" 
would the expression 'ct helper "abcd"' match it?

b) If it is NOT a parsing artifact but by design: why? It would be more 
intuitive to use the name of the explicitly-named helper object. Another 
way to ask the same thing: why bother with the explicit helper object at 
all, rather than just use "ftp" (which implies the ip & tcp protocols in 
"ftp-21" definition anyway) in both match and statement, like 'ct helper 
set "ftp"'?


2) Does it make a difference whether 'ct helper set' is done in input 
(as in below ruleset) or in prerouting? Maybe it has to be in prerouting 
only in case of forwarded traffic?

https://wiki.nftables.org/wiki-nftables/index.php/Conntrack_helpers
currently says:
"You have to attach your conntrack helper from the prerouting chain."

Thanks,
Frank


> For the sake of completeness, here my nftables ftp-helper test ruleset:
> 
> Active ruleset: ================.
> table ip FILTER4 {
>      ct helper ftp-21 {
>          type "ftp" protocol tcp
>          l3proto ip
>      }
> 
>      chain PREROUTING-EARLY4 {
>          type filter hook prerouting priority -300; policy accept;
>      }
> 
>      chain PREROUTING-MANGLE4 {
>          type filter hook prerouting priority -150; policy accept;
>      }
> 
>      chain PREROUTING-NAT4 {
>          type nat hook prerouting priority -100; policy accept;
>      }
> 
>      chain PREROUTING-FILTER4 {
>          type filter hook prerouting priority 0; policy accept;
>      }
> 
>      chain FORWARD4 {
>          type filter hook forward priority 0; policy drop;
>          counter packets 0 bytes 0 log prefix "NFT: FILTER4/FORWARD4: p. 
> died: " group 0 drop
>      }
> 
>      chain INPUT4 {
>          type filter hook input priority 0; policy drop;
>          iifname "lo" accept
>          ct state established counter packets 317 bytes 20876 accept
>          ct state related ct helper "ftp" tcp dport { 1024-65535 } ip 
> saddr 10.18.0.0/19 counter packets 3 bytes 180 accept
>          ct state related ct helper "ftp" counter packets 0 bytes 0 log 
> prefix "NFT: FILTER4/INPUT4: p. died :" group 0 drop
>          ct state related counter packets 0 bytes 0 accept
>          ip protocol icmp accept
>          tcp dport ssh accept
>          tcp dport ftp ip daddr 10.18.16.143 counter packets 2 bytes 120 
> ct helper set "ftp-21" accept
>          counter packets 0 bytes 0 log prefix "NFT: FILTER4/INPUT4: p. 
> died: " group 0 drop
>      }
> 
>      chain OUTPUT-MANGLE4 {
>          type route hook output priority -150; policy accept;
>      }
> 
>      chain OUTPUT4 {
>          type filter hook output priority 0; policy drop;
>          oifname "lo" accept
>          ct state established counter packets 250 bytes 1073349 accept
>          ct state related ct helper "ftp" tcp sport ftp-data ip daddr 
> 10.18.0.0/19 counter packets 3 bytes 180 accept
>          ct state related ct helper "ftp" counter packets 0 bytes 0 log 
> prefix "NFT: FILTER4/OUTPUT4: p. died :" group 0 drop
>          ct state related counter packets 0 bytes 0 accept
>          ip protocol icmp accept
>          udp dport { domain, ntp } ip daddr 10.18.0.0/19 accept
>          tcp dport { domain, 3128 } ip daddr 10.18.0.0/19 accept
>          counter packets 0 bytes 0 log prefix "NFT: FILTER4/OUTPUT4: p. 
> died :" group 0 drop
>      }
> 
>      chain POSTROUTING-MANGLE4 {
>          type filter hook postrouting priority -150; policy accept;
>      }
> 
>      chain POSTROUTING-NAT4 {
>          type nat hook postrouting priority 100; policy accept;
>      }
> }
> [info] End of ruleset: ================.
> 
> 
