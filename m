From: Mike Wright <mike.wright@mailinator.com>
Subject: help with --helper sane
Date: Sun, 09 Dec 2012 12:14:09 -0800
Message-ID: <50C4F111.8090702@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

Hi all,

I'm trying to make a usb scanner network available using "saned".  The 
machines involved are both running "saned -a".  It works well until I 
turn on iptables on the machine with the scanner.

If I enable firewalling with port 6566 open the scanner initializes but 
never proceeds beyond that point.

I tried these:

-A INPUT -p tcp -m tcp --dport 6566 -m conntrack --ctstate NEW -m helper 
--helper "sane" -j ACCEPT
-A INPUT -p udp -m udp --dport 6566 -m conntrack --ctstate NEW -m helper 
--helper "sane" -j ACCEPT

but that results in "no scanners found".

Using CUPS as an example I did this on both sides and didn't have any 
luck that way either.

Sorry if I can't better describe this.  I've never used a scanner over 
the net before and netfilter's helpers are new to me.  Google finds many 
references to iptables and sane, but only in the context of sanity, 
which I am quickly losing ;D

Any helpers?

TIA,
Mike Wright
