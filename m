From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Mon, 8 Mar 2021 07:48:55 -0500
Message-ID: <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
 <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=1dT8K2iI0KJDuVzsNQ9OZZB3/dUzebdiWgQ7hre9zQg=;
        b=smKdr4EtniYcMmsHHK/8CRvVHdTU0voIaXi84ygmYVCqyywuJPeKphjSWn3NRWqfs4GxhbpaKStb+jjYqcrjD70lSW2p7vYJqQegsQ564q7jiAJRbghwGEMCniVO7wlv8+sHHtvcJ+tUzPwF46RF3xQGatU49Sp4r/C5/RBWl24=;
In-Reply-To: <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Stefan Hartmann <stefanh@hafenthal.de>, netfilter@vger.kernel.org

On 2021/03/08 04:24, Stefan Hartmann wrote:

> In chain INPUT4 {
> 
>      your mentioned rule
>      ct helper "ftp-21" tcp dport {1024-65535} counter accept
> 
> did not match in my test.
> 
> Eventually the ct helper "ftp-21" matches only on the master connection 
> and not for the expects?

What if you do (untested):

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
     tcp dport 21 counter accept   # accept ftp control packets
     ct helper "ftp-21" tcp dport {1024-65535} counter accept
     ...
     limit rate 15/hour burst 30 packets     log prefix "drop: "
   }
   ...
}

Differences from previous ruleset:
1) Add accept rule to tcp/21 for ftp control packets
2) Add log rule (at least during debug) to see dropped packets.

Best Wishes,
Frank
