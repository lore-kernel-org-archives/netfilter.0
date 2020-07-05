From: Reindl Harald <h.reindl@thelounge.net>
Subject: iptables-nft and unsused default chains
Date: Sun, 5 Jul 2020 13:24:18 +0200
Message-ID: <d66b7df9-4178-a5c1-431a-cae7676c1c07@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

other than "iptables" with "nftables" which is the backend of
"iptables-nft" most default chains are not mandatory unless they are in use

* nft delete chain ip filter OUTPUT
* the unused chain can be removed in theory that way
* iptables-nft -t filter --list
* all the empty compat chains are there again

i would expect them only to appear when using them like "iptables-nft -t
filter -A OUTPUT ..." and given that they have counters that's some
overhead which probably could be avoided

even on the datacenter-firewall which makes heavy use of all tables are
6 chains which could be avoided

* filter OUTPUT
* mangle FORWARD
* mangle INPUT
* mangle OUTPUT
* nat INPUT
* nat OUTPUT

looks like there is some room for optimization by create them omly at
first use aka apply a rule or explizit call by "list rules"
