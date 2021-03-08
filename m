From: Stefan Hartmann <stefanh@hafenthal.de>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Mon, 8 Mar 2021 20:22:28 +0100
Message-ID: <375f428e-f37b-551a-e09d-1024f00abb3d@hafenthal.de>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
 <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
 <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank Myhr <fmyhr@fhmtech.com>, "netfilter.org" <netfilter@vger.kernel.org>

I tested with this sequence, with multiple counters and no verdicts and 
nflog:

chain INPUT4 {
	type filter hook input priority 0; policy drop;
	iifname "lo" accept
	ct state established counter packets 403 bytes 26976 accept
	ct state related counter packets 1 bytes 60
	ct helper "ftp-21" counter packets 0 bytes 0
	ct state related ct helper "ftp-21" counter packets 0 bytes 0 accept
	ct state related counter packets 1 bytes 60 log group 10
	ct state related counter packets 1 bytes 60 accept
	ip protocol icmp accept
	tcp dport ssh accept
	tcp dport ftp ip daddr 10.18.16.143 counter packets 1 bytes 60 ct 
helper set "ftp-21" accept
	counter packets 0 bytes 0 log prefix "NFT: FILTER4/INPUT4: p. died: " 
group 0 drop
	}

And indeed, the RELATED packet going through is the SYN packet from the 
FTP DATA flow.

The ct helper "ftp-21" matches NOT on the RELATED packets, it matches 
pretty sure on the master connection.
I will try to verificate this.


-- 
Cheers Stefan Hartmann
