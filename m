From: Andreas Schultz <aschultz@tpip.net>
Subject: nftables: variable network ranges in named maps
Date: Mon, 12 Jan 2015 15:39:09 +0000 (UTC)
Message-ID: <2071244541.1592171.1421077149125.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi,

I want to use network ranges and host IP's in named maps. Using them in
anonymous maps works:

# nft add rule filter output ip daddr vmap {192.168.0.0/24 : drop, 192.168.0.1 : accept}

However, in named maps it failes:
root@SCG4:~# nft -i
nft> add map filter verdict_map { type ipv4_address : verdict; }
nft> add element filter verdict_map { 1.2.3.5 : drop}
nft> add element filter verdict_map { 1.2.3.4/16 : accept}
BUG: invalid data expression type prefix

How do i use ranges or more complex expressions like IP + Port in maps?

Andreas
