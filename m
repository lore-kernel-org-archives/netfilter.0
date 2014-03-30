From: Laurent GUERBY <laurent@guerby.net>
Subject: nftables: nft @nh segfault
Date: Sun, 30 Mar 2014 13:34:41 +0200
Message-ID: <1396179281.15058.469.camel@pc2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

While trying to use @nh I got nft to segfault:

root@h7:~# nft --version
nftables v0.100 (keith-alexander-filter)
root@h7:~# cat /proc/version 
Linux version 3.14-rc7-amd64 (debian-kernel@lists.debian.org) (gcc
version 4.8.2 (Debian 4.8.2-16) ) #1 SMP Debian 3.14~rc7-1~exp1
(2014-03-17)
root@h7:~# nft add rule filter output @nh,16,4 8.8.8.8 counter
Segmentation fault

I infered the syntax from src/parser.y:

payload_raw_expr	:	AT	payload_base_spec	COMMA	NUM	COMMA	NUM
payload_base_spec	:	LL_HDR		{ $$ = PAYLOAD_BASE_LL_HDR; }
			|	NETWORK_HDR	{ $$ = PAYLOAD_BASE_NETWORK_HDR; }


But may be I made a mistake, I could not find documentation.

Sincerely,

Laurent

