From: Stefan Hartmann <stefanh@hafenthal.de>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Tue, 9 Mar 2021 17:13:10 +0100
Message-ID: <624d2626-2fdc-a1d8-825c-81891488bf9d@hafenthal.de>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
 <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
 <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
 <375f428e-f37b-551a-e09d-1024f00abb3d@hafenthal.de>
 <20210308210518.GC10808@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210308210518.GC10808@breakpoint.cc>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: Frank Myhr <fmyhr@fhmtech.com>, "netfilter.org" <netfilter@vger.kernel.org>

On 08.03.21 22:05, Florian Westphal wrote:
> 'ct helper' fetches the in-kernel name of the helper
> ("ftp" in this case) and not the object name defined in the ruleset or
> used for assignment

Thank you, this is the necessary hint!

The ct helper "ftp" matches on the RELATED packets.

It matches not on the master connection, my previous sugestion was wrong.


For the sake of completeness, here my nftables ftp-helper test ruleset:

Active ruleset: ================.
table ip FILTER4 {
	ct helper ftp-21 {
		type "ftp" protocol tcp
		l3proto ip
	}

	chain PREROUTING-EARLY4 {
		type filter hook prerouting priority -300; policy accept;
	}

	chain PREROUTING-MANGLE4 {
		type filter hook prerouting priority -150; policy accept;
	}

	chain PREROUTING-NAT4 {
		type nat hook prerouting priority -100; policy accept;
	}

	chain PREROUTING-FILTER4 {
		type filter hook prerouting priority 0; policy accept;
	}

	chain FORWARD4 {
		type filter hook forward priority 0; policy drop;
		counter packets 0 bytes 0 log prefix "NFT: FILTER4/FORWARD4: p. died: 
" group 0 drop
	}

	chain INPUT4 {
		type filter hook input priority 0; policy drop;
		iifname "lo" accept
		ct state established counter packets 317 bytes 20876 accept
		ct state related ct helper "ftp" tcp dport { 1024-65535 } ip saddr 
10.18.0.0/19 counter packets 3 bytes 180 accept
		ct state related ct helper "ftp" counter packets 0 bytes 0 log prefix 
"NFT: FILTER4/INPUT4: p. died :" group 0 drop
		ct state related counter packets 0 bytes 0 accept
		ip protocol icmp accept
		tcp dport ssh accept
		tcp dport ftp ip daddr 10.18.16.143 counter packets 2 bytes 120 ct 
helper set "ftp-21" accept
		counter packets 0 bytes 0 log prefix "NFT: FILTER4/INPUT4: p. died: " 
group 0 drop
	}

	chain OUTPUT-MANGLE4 {
		type route hook output priority -150; policy accept;
	}

	chain OUTPUT4 {
		type filter hook output priority 0; policy drop;
		oifname "lo" accept
		ct state established counter packets 250 bytes 1073349 accept
		ct state related ct helper "ftp" tcp sport ftp-data ip daddr 
10.18.0.0/19 counter packets 3 bytes 180 accept
		ct state related ct helper "ftp" counter packets 0 bytes 0 log prefix 
"NFT: FILTER4/OUTPUT4: p. died :" group 0 drop
		ct state related counter packets 0 bytes 0 accept
		ip protocol icmp accept
		udp dport { domain, ntp } ip daddr 10.18.0.0/19 accept
		tcp dport { domain, 3128 } ip daddr 10.18.0.0/19 accept
		counter packets 0 bytes 0 log prefix "NFT: FILTER4/OUTPUT4: p. died :" 
group 0 drop
	}

	chain POSTROUTING-MANGLE4 {
		type filter hook postrouting priority -150; policy accept;
	}

	chain POSTROUTING-NAT4 {
		type nat hook postrouting priority 100; policy accept;
	}
}
[info] End of ruleset: ================.


-- 
Cheers Stefan Hartmann

