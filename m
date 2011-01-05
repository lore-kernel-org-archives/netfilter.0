From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: VLANs
Date: Wed, 05 Jan 2011 12:12:40 +0000
Message-ID: <4D246038.5040504@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

If I plug my Xen host to a VLAN aware switch using a trunk port (I.e. 
all frames are tagged), can my Xen host, using a linux bridge, strip out 
all tagging and send frame to correct Xen VM? (And vice versa)

I wish to have isolated and secure networks that cannot communicate 
except via my VLAN aware firewall (pfsense)

Thanks
