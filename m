From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: TCP and UDP dport in the same rule
Date: Sun, 22 Mar 2020 15:11:53 +0100
Message-ID: <477be69c-1afd-233c-1126-b081aab6a244@thelounge.net>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <670198645.21727.1584884428183@ox89.mailbox.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 22.03.20 um 14:40 schrieb Darius:
> Hi,
> I can't find the way to make one rule matching packets with the same dport either on tcp or udp. So far I have rules like this:
> 
> ip protocol tcp tcp dport 2000 counter accept
> ip protocol udp udp dport 2000 counter accept
> 
> I would like to have one rule instead. I couldn't find the way to do it with intervals or maps because dport statement must go together with tcp or udp.

not sure for nftables but with iptables "ipset" is the solution

--------------------

Name: DNS_PORT
Type: bitmap:port
Header: range 53-53
Size in memory: 80
Number of entries: 1

Members:
53

--------------------

9    1333K  102M IN_DNS     all  --  *      *       0.0.0.0/0
 0.0.0.0/0            match-set DNS_PORT dst
