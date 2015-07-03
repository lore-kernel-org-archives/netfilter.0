From: Andreas Schultz <aschultz@tpip.net>
Subject: nft: ranges in named maps?
Date: Fri, 3 Jul 2015 13:55:31 +0200 (CEST)
Message-ID: <1197812766.1794730.1435924531931.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

How do I specify ranges in named maps?

I would like to have something like this:

nft add map nat setnat { type ipv4_addr . inet_service : ipv4_addr\;}
nft add element net setnat { 10.10.0.1 . 1000-2000 : 192.168.1.1 };

However, it seems I can't tell nft in any way that inet_service
is supposed to be a range.

Andreas
