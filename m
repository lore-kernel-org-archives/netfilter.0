From: Leon Merten Lohse <leon@green-side.de>
Subject: nftables: Add anonymous set to named set
Date: Tue, 18 Oct 2016 22:52:31 +0200
Message-ID: <20161018225231.5db3dac1@doomgiver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am trying to add an anonymous set that is defined as a variable to a
named set as follows:

define whitelist_v4 = { 1.1.1.1}

table inet filter {
  set whitelist_v4 { type ipv4_addr; }
 
  [ ... ]
}

add element inet filter whitelist_v4 $whitelist_v4

This produces the error:

./testfw.ruleset:290:38-38: Error: syntax error, unexpected '$',
expecting '{' add element inet filter whitelist_v4 $whitelist_v4
                                     ^
If I use curly braces instead, there is no error but a failed assertion:
add element inet filter whitelist_v4 {$whitelist_v4}

produces

BUG: invalid data expression type set
nft: netlink.c:337: netlink_gen_data: Assertion `0' failed.

What is the correct way to use this?

Note: Direct definition as `elements = ...` shows the same behaviour.

The reason I am using this is because I need the whitelist in the nat
(ip) and the filter (inet) table. Yes I could use the anonymous set
directly but that would imho make the rules less readable.

System:
# nft --version
nftables v0.6 (Support Edward Snowden)
# uname -a
Linux maracuja 4.7.0-0.bpo.1-amd64 #1 SMP Debian 4.7.5-1~bpo8+2
(2016-10-01) x86_64 GNU/Linux

Thanks in advance.

Best
Leon
