From: "Adem" <for-gmane@alicewho.com>
Subject: Re: SYN flooding
Date: Mon, 24 Nov 2008 23:46:55 +0100
Message-ID: <ggfavo$h8l$1@ger.gmane.org>
References: <98f5d92c0811090859n1df8231fy750b5930f565fdc6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

"Servers 4you" wrote:
>
> Im having this notice on my messages logs:
> 
> Nov  5 06:40:46 workstation kernel: possible SYN flooding on port
> 38211. Sending cookies.
> 
> (i have and app running on port 38211).
> Is an way to block it with iptables?

If it is tcp protocol then you could try the following method as root.
It allows only 1 connection from the same source IP within the last 20 seconds:

#! /bin/sh
...
if cat /proc/net/ip_tables_matches | grep "recent" &>/dev/null ; then
  # if anybody from the list WATCHLIST, and in the last 20 sec, tries to do new connect attempts then DROP them!
  /sbin/iptables -A INPUT --match recent --name WATCHLIST --rcheck --seconds 20 -j DROP

  # accept client at port tcp:38211 and register in WATCHLIST
  /sbin/iptables -A INPUT -p tcp --dport 38211 --match recent --name WATCHLIST --set -j ACCEPT
else
  echo "# ipt_recent module is not loaded. Cannot use WATCHLIST feature. Ask your HN admin."

  /sbin/iptables -A INPUT -p tcp --dport 38211  -j ACCEPT
fi
...


