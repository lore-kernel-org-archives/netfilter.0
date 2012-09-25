From: =?UTF-8?B?Tmd1eeG7hW4gSOG7k25nIFF1w6Ju?= <quannguyen@mbm.vn>
Subject: iptables to redirect traffic through AP router?
Date: Tue, 25 Sep 2012 08:57:04 +0700
Message-ID: <50610F70.50900@mbm.vn>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hello

I run a wifi router in AP mode and want to setup iptables rule to redir=
ect
traffics to Google AdSense to a proxy. I added this chain and rule to
NAT table:
1. Create GoogleAds chain
-N GoogleAds
2. Append this chain to PREROUTING chain
-A PREROUTING -j GoogleAds
3. In GoogleAds chain, I make some rules:
-A GoogleAds -d 74.125.235.25/32 -p tcp -m tcp --dport 80 -j REDIRECT
--to-ports 8888
-A GoogleAds -d 74.125.235.26/32 -p tcp -m tcp --dport 80 -j REDIRECT
--to-ports 8888
-A GoogleAds -d 74.125.235.13/32 -p tcp -m tcp --dport 80 -j REDIRECT
--to-ports 8888

But the problem is that no traffic is driven to those rules, though it
is driven to GoogleAds chain
Screenshot: http://i.imgur.com/bpRBE.png

I suspect this is related to AP mode of router. I tried on OpenWrt on
VirtualBox and successful.

How should right iptables rule is?

(I brought the GoogleAds chain to POSTROUTING, but got error ip_tables:
REDIRECT target: bad hook_mask 0x10/0x9)

Thanks.

--=20
Regards,
Qu=C3=A2n

Y!IM: ng_hquan_vn
GTalk: ng.hong.quan

