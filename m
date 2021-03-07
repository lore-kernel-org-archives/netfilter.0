From: Stefan Hartmann <stefanh@hafenthal.de>
Subject: nftables carefully open the related-flow: ct state related ct helper
 "ftp-21" ...
Date: Sun, 7 Mar 2021 16:12:57 +0100
Message-ID: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I want to carefully open the related-flow and noticed that I cannot 
concatenate the two ct expressions:

		ct state related ct helper "HELPER" ... accept


Simple example with ftp-helper:
...
chain INPUT4 { vom VPN-Peer,
         type filter hook input priority 0; policy drop;


	ct state established counter accept
	
	# would be nice to match on state related AND applied helper
	ct state related ct helper "ftp-21" tcp dport {1024-65535} counter accept
	
	ct state related ct helper "ftp-21" counter log prefix "NFT: 
FILTER4/INPUT4: p. died :" group 0 drop
	
	# I want not care about other related traffic
	ct state related counter accept

	...


Simple Workaround, which could be unsecure in certain circumstances, eg 
using different helpers, sip-A, sip-B, sip-C:
	
	ct state established counter accept
	ct state related tcp dport {1024-65535} counter accept


Is the concatenation possible or have I to use another syntax, eg 
different chains?

Tested on nftables 0.9.8-3 on Debian Bullseye.


-- 
Thanks,
Stefan Hartmann
