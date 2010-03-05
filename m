From: Gary Smith <gary.smith@holdstead.com>
Subject: bridging with nat, looking for recommendations
Date: Fri, 5 Mar 2010 09:37:59 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D1418ABAEA1D5@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

We have been using a NAT firewall for some time.  We have used bridges in the past but when I changed ISP's some time ago, we received a limited number of IP's.  We have fixed that problem and now that we have more IP's we have moved almost all external facing servers over to the bridged firewall.  Everything works smooth there.

The problem is that we have this annoying little problem with the SBS server.  I really don't want to put the SBS server into the DMZ if I don't have to (as it's also our main file repository for our business).  But we still need to access it via http over RPC (so ports 80 and 443) remotely.  

My options as I see it are:

1) NAT it on the firewall, but I recalled that we had some problems NAT'ing with a bridge some years ago.  

2) Put it in the DMZ

3) setup some type of proxy service (like ipvsadmin or something).

Without starting a flame war, what's the recommended path for something like this?

