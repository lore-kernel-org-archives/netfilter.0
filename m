From: Stephen Satchell <list@satchell.net>
Subject: Waiting until first release of NFTABLES
Date: Wed, 19 Feb 2020 15:41:52 -0800
Message-ID: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm concerned that Centos 8 is using a pre-release version of nftables. 
I just did a system update, and found this as current:

/etc/redhat-release:  CentOS Linux release 8.1.1911 (Core)
$ nft -v:             nftables v0.9.0 (Fearless Fosdick)

I think that, given some of the issues that have been mentioned on this 
list, I'm not comfortable with this new pre-release facility.  So I'll 
wait until it reaches v1.0 or higher, and in the meantime revert to 
using IPTABLES and my home-brew shell script, disabling firewalld(8) in 
the process.

To ensure BGP-38 compliance upstream, I'll use the routing table 
extension that I have developed for NetworkManager, that I posted 
earlier, that null-routes all reserved netblocks.  (I'm not planning to 
incorporate the BOGON enhancement as suggested by others.)

The following will appear in my /etc/sysctl.conf file, which turns on 
source filtering and logs martians.

  net.ipv6.conf.all.disable_ipv6  = 1
  net.ipv4.conf.all.rp_filter = 1
  net.ipv4.conf.all.log_martians = 1

  net.ipv6.conf.default.disable_ipv6 = 1
  net.ipv4.conf.default.rp_filter = 1
  net.ipv4.conf.default.log_martians = 1

Yes, this means that I'm blocking all ipv6 for now.  I will reconsider 
as the 1.0 or later release version makes it to the CentOS 8 distribution.
