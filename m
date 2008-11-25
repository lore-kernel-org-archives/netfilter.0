From: "Adem" <for-gmane@alicewho.com>
Subject: Re: Allow client only 1 connect per 20 seconds
Date: Tue, 25 Nov 2008 21:07:13 +0100
Message-ID: <gghm16$qal$1@ger.gmane.org>
References: <gghgq9$33t$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

"Adem" wrote:
>
> How would you code this rule in iptables:
> 
> If anybody tries to do more than 1 connection to port 8191
> within 20 seconds, regardless of the protocol, then DROP 
> it and ignore any further connect attempts on that port
> from that source for 20 seconds.

The following should work, but it somehow doesn't work in iptables v1.4.1.1:
 ...
  # if anybody from the list WATCHLIST, and in the last 20 sec, tries to do new connect attempts then DROP them!
  /sbin/iptables -A INPUT --match recent --name WATCHLIST --rcheck --seconds 20 -j DROP

  # accept client at port 8191 (all protocols) and register in WATCHLIST
  # BUG: if "-p XXX" is left out or if instead "-p all" is used then the rule gets eliminated!
  /sbin/iptables -A INPUT -p all --dport 8191 --match recent --name WATCHLIST --set -j DROP
 ...

It works only if "-p tcp" is specified.
Isn't that a bug in iptables?


