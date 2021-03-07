From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Sun, 7 Mar 2021 15:06:46 -0500
Message-ID: <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=/NRC0gZRaipHPegVkD2L42h6ks0G2vDlhPgGbdyxTAM=;
        b=VKP1lRk3Q6cAiNjvDiVebSXi4yYFtD5QzYyRKSf5IiooMYTvHKCZWc0k8Ts7tMcTobILy3Le52vsgzie89LwkG8MJYU5vd6f7wJZldoZ5EQv26UAG4vKFjLeMEuX9Qn8iF3dnKKAi8uW6LuPNm9w4sEJMzPKWS6i4oq1M+EuNZY=;
In-Reply-To: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Stefan Hartmann <stefanh@hafenthal.de>, netfilter@vger.kernel.org

On 2021/03/07 10:12, Stefan Hartmann wrote:
> Hi,
> 
> I want to carefully open the related-flow and noticed that I cannot 
> concatenate the two ct expressions:
> 
>          ct state related ct helper "HELPER" ... accept
> 
> 
> Simple example with ftp-helper:
> ...
> chain INPUT4 { vom VPN-Peer,
>          type filter hook input priority 0; policy drop;
> 
> 
>      ct state established counter accept
> 
>      # would be nice to match on state related AND applied helper
>      ct state related ct helper "ftp-21" tcp dport {1024-65535} counter 
> accept

Hi Stefan,

I guess the problem is that input tcp packets with dport {1024-65535} 
that are matched by "ftp-21" ct helper are by definition related packets 
(to the original connection to tcp/21), so the explicit "ct state 
related" match in your INPUT4 chain rule is redundant. You didn't show 
your "ftp-21" ct helper (stateful object) definition, I suppose it is 
something like those at:

https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_connection_tracking_metainformation

Then you'd have something like (warning, untested):

table my_table {

   ct helper ftp-21 {
     type "ftp" protocol tcp;
   }

   chain ct_helper_assign {
     type filter hook prerouting priority filter;

       ct state new tcp dport 21 ct helper set "ftp-21"
   }

   chain INPUT4 {
     type filter hook input priority filter; policy drop;
     ...
     ct helper "ftp-21" tcp dport {1024-65535} counter accept
     ...
   }
   ...
}

In the above ruleset "ftp-21 related" packets are accepted in a 2-step 
process:

1) In the prerouting hook such packets receive "ftp-21 related" status 
when the "ftp-21" "ftp" helper recognizes them as matching expectations 
it created based on recent packets to tcp/21;

2) In the input hook such packets are matched (with additional tcp dport 
restriction), counted, and accepted by the rule in your INPUT4 chain.

This explicit 2-step process differs from the way ct helpers worked 
using iptables, for example:
https://home.regit.org/netfilter-en/secure-use-of-helpers/


Best Wishes,
Frank
