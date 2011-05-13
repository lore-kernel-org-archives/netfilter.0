From: Chris Adams <cmadams@hiwaay.net>
Subject: IPv6 neighbor discovery protection
Date: Fri, 13 May 2011 09:17:29 -0500
Message-ID: <20110513141729.GB9464@hiwaay.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm running virtual hosts managed with libvirt.  I'm using libvirt's
ability to manage ebtables/iptables rules to share a single subnet on a
bridge between multiple virtual hosts (the auto-created rules prevent
ARP, MAC, and IP spoofing).

Now I'm looking at IPv6 support, and I don't see a similar way to filter
neighbor discovery.  I can block router advertisements (ICMPv6 type
134), but I don't know how to filter neigbor advertisements to only
allow the assigned MAC/IP.

Is there a way to do this with ebtables/ip6tables?
-- 
Chris Adams <cmadams@hiwaay.net>
Systems and Network Administrator - HiWAAY Internet Services
I don't speak for anybody but myself - that's enough trouble.
