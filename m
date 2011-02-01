From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: IPv6 filtering
Date: Tue, 01 Feb 2011 21:38:49 +0000
Message-ID: <4D487D69.7000808@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

We host VPSes using Xen to customers. We run iptables and ebtables on 
our Xen hosts to make sure that each VPS can only use the IP and MAC 
addresses assigned to them.

With IPv6, does anyone have any experience on how to do this? I know we 
can use ip6tables, but isn't there some trickery with NDP (Which 
replaces ARP)?

Thanks
