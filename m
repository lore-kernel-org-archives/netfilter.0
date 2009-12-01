From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: FTP port mode, client and server behind iptables
Date: Tue, 1 Dec 2009 09:39:49 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD50B07@HSSBS.holdstead.local>
References: <034DEBCAE934A74991E6E76B8DA72D14185DD50B01@HSSBS.holdstead.local>
 <4B14D774.5070605@chello.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B14D774.5070605@chello.at>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> 
> Port mode does not exist, there are passive and active mode in FTP, both
> use ports, but different ones....

I guess, years ago I had head it referred to as Port or Passive.  Anyway, non-passive (or active is what I'm looking for.

Either way, I was able to verify that clients that are not behind a firewall are able to connect fine with either mode.  It appears to be a client side issue.

Even with the change that you provided, the client still had the same issue.  Anyway, I verified that the client firewall has the FTP nat/conntrack modules loaded but that didn't seem to help.  No packets on the firewall are being dropped (as we log everything before drop).  I'm going to look into a few more possible NAT issues on the client side to see if there are any other problems.

<lines added to top of forward chain>
-A FORWARD -i eth1 -d 10.20.0.12 -m helper --helper "ftp" -j ACCEPT
-A FORWARD -i eth0 -s 10.20.0.12 -m helper --helper "ftp" -j ACCEPT

If M$ just added a passive mode to their FTP client this would probably resolve a lot of small client complaints (with those incapable of downloading a real FTP client).


