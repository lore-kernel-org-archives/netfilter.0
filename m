From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Mon, 8 Mar 2021 14:59:35 -0500
Message-ID: <f190d25c-ed4d-5773-5b6a-f92b53c43e28@fhmtech.com>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
 <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
 <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
 <375f428e-f37b-551a-e09d-1024f00abb3d@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=LAtN893iYaFLVjHasBh8zDDjnsJflM2UdukrtxEx8Zc=;
        b=WAW5UznWnpWuEqInug9cHF1BFOBqFC6ox2bVq1V/ceNpO0BL+W7t0ZmiPATFCATV3pZfjgBkx7aSqVvwC/d5l2zOUnKv+S+TuUHvVTmYJ2AwxzsIBjDPIeZFza6W3YSV5hx/rb2XJ2lheT7rYfdvy+3BC15qQ+dGzHx4On0tqKY=;
In-Reply-To: <375f428e-f37b-551a-e09d-1024f00abb3d@hafenthal.de>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Stefan Hartmann <stefanh@hafenthal.de>, "netfilter.org" <netfilter@vger.kernel.org>

On 2021/03/08 14:22, Stefan Hartmann wrote:
> I tested with this sequence, with multiple counters and no verdicts and 
> nflog:
> 
> chain INPUT4 {
>      type filter hook input priority 0; policy drop;
>      iifname "lo" accept
>      ct state established counter packets 403 bytes 26976 accept
>      ct state related counter packets 1 bytes 60
>      ct helper "ftp-21" counter packets 0 bytes 0
>      ct state related ct helper "ftp-21" counter packets 0 bytes 0 accept
>      ct state related counter packets 1 bytes 60 log group 10
>      ct state related counter packets 1 bytes 60 accept
>      ip protocol icmp accept
>      tcp dport ssh accept
>      tcp dport ftp ip daddr 10.18.16.143 counter packets 1 bytes 60 ct 
> helper set "ftp-21" accept
>      counter packets 0 bytes 0 log prefix "NFT: FILTER4/INPUT4: p. died: 
> " group 0 drop
>      }
> 
> And indeed, the RELATED packet going through is the SYN packet from the 
> FTP DATA flow.
> 
> The ct helper "ftp-21" matches NOT on the RELATED packets, it matches 
> pretty sure on the master connection.
> I will try to verificate this.


Thanks for including the output with counters. I'd advise removing the
'ct helper set "ftp-21"' from the last 'accept' rule in your INPUT4 
input chain to get simply:

tcp dport ftp ip daddr 10.18.16.143 accept

And adding the ct helper 'ftp-21' definition and a _prerouting_ chain 
with your helper rule as in the earlier example I sent, and:

https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_connection_tracking_metainformation

https://www.mankier.com/8/nft#Stateful_Objects-CT_Helper

I think having the helper rule in _prerouting_ rather than _input_ may 
change what you see...

Best Wishes,
Frank
