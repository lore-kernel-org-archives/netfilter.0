From: "sabitov@sabitov.su" <sabitov@sabitov.su>
Subject: How to use NFT inet sets???
Date: Tue, 20 Oct 2015 16:51:06 +0600
Message-ID: <56261C9A.3020902@sabitov.su>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!

I try to build combined ipv4 and ipv6 firewall using NFT. But I cannot 
find any working example of nft's _INET_ set usage :(

I try to do next:

/sbin/nft -i
nft> list ruleset
nft> flush ruleset
nft> list ruleset
nft> add table inet fw
nft> add chain inet fw input { type filter hook input priority 10; }
nft> add chain inet fw output { type filter hook output priority 10; }
nft> add chain inet fw forward { type filter hook forward priority 10; }
nft> add set inet fw admin_list { type inet_proto ; }
nft> add set inet fw black_list { type inet_proto ; }
nft> add rule  inet fw  input    inet saddr @black_list log drop
<cli>:1:29-32: Error: syntax error, unexpected inet
add rule  inet fw  input    inet saddr @black_list log drop
                             ^^^^
nft> add rule  inet fw  input    ip saddr @black_list log drop
<cli>:1:38-48: Error: datatype mismatch, expected IPv4 address, set has 
type Internet protocol
add rule  inet fw  input    ip saddr @black_list log drop
                             ~~~~~~~~ ^^^^^^^^^^^
nft> add rule  inet fw  input    ip6 saddr @black_list log drop
<cli>:1:39-49: Error: datatype mismatch, expected IPv6 address, set has 
type Internet protocol
add rule  inet fw  input    ip6 saddr @black_list log drop
                             ~~~~~~~~~ ^^^^^^^^^^^
nft> add rule  inet fw  input saddr @black_list log drop
<cli>:1:26-30: Error: syntax error, unexpected saddr
add rule  inet fw  input saddr @black_list log drop
                          ^^^^^
nft> ^D


Is there any example how can I use nft's _INET_ set?

Thanks a lot.


