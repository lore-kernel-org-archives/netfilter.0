From: Leon Merten Lohse <leon@green-side.de>
Subject: nftables: named set for ipv4 networks
Date: Sun, 23 Oct 2016 21:38:22 +0200
Message-ID: <20161023213822.16337e5c@doomgiver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

is there a way to migrate a hash:net type ipset to nftables?
We use this to implement a blacklist where we block a large number of
networks.

I tried using a type ipv4_addr named set as follows:

flush ruleset
table inet filter {
  set blacklist_v4 { type ipv4_addr; }
}
add element inet filter blacklist_v4 { 10.0.0.0/8 }

However, this results in:
Error: Set member cannot be prefix, missing interval flag on declaration
add element inet filter blacklist_v4 { 10.0.0.0/8 }
                                       ^^^^^^^^^^
Is ipv4_addr the wrong type in this case? I could not find any
documentation on it.
Using networks in anonymous sets seems to work flawlessly.

Best,
Leon

System:
# nft --version
nftables v0.6 (Support Edward Snowden)
# uname -a
Linux maracuja 4.7.0-0.bpo.1-amd64 #1 SMP Debian 4.7.5-1~bpo8+2
(2016-10-01) x86_64 GNU/Linux
