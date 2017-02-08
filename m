From: Robert White <rwhite@pobox.com>
Subject: BUG: nft cannot "list ruleset" with interval maps
Date: Wed, 8 Feb 2017 17:00:18 +0000
Message-ID: <f6c01a5c-33f4-0c90-96e1-8abf7777b4b8@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

(please forgive stupid email word wrap)

# nft table ip nat
# nft map nat dnat_example { type inet_service: ipv4_addr\; flags 
interval \; }
# nft element nat dnat_example { 3476-3480 : 192.168.14.12 }
# nft list ruleset
table ip nat {
	map dnat_example {
		type inet_service : ipv4_addr
		flags interval
nft: mini-gmp.c:4311: mpz_export: Assertion `size > 0 || u->_mp_size == 
0' failed.
		elements = { 3476-Aborted

So the entry seems to have gotten in alright but it can't come back out 
normally. I can tell because a "export json" works

# nft export json
{"nftables":[{"table":{"name":"nat","family":"ip","flags":0,"use":1}},{"set":{"name":"dnat_example","table":"nat","flags":12,"family":"ip","key_type":13,"key_len":2,"data_type":7,"data_len":4,"set_elem":[{"flags":1,"key":{"reg":{"type":"value","len":2,"data0":"0x0000990d"}}},{"key":{"reg":{"type":"value","len":2,"data0":"0x0000940d"}},"data":{"reg":{"type":"value","len":4,"data0":"0x0c0ea8c0"}}},{"flags":1,"key":{"reg":{"type":"value","len":2,"data0":"0x00000000"}}}]}}]}


NOTE: interval sets work fine:

# nft list ruleset
table ip nat {
	set portrange {
		type inet_service
		flags interval
		elements = { 3776-3780}
	}
}

