From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Force traffic
Date: Sun, 13 Jun 2010 18:22:59 +0100
Message-ID: <4C1513F3.5010508@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

Does anyone know any rules that I could use (using iptable, ebtables, or 
otherwise) that could force all traffic coming from an interface to go 
out via a particular interface? I'm using Xen and all the DomUs ("VMs" 
or "Guests") are connected to a linux bridge. I wish to force all 
traffic from these VMs to go out via the interface which is connected to 
my firewall (which itself is a filtering bridge). I wish to do this all 
at the "link-layer" if possible.

I am lead to believe that in a linux bridge, all frames are sent to all 
ports (a bit like the old-school hubs), so it could just be a matter of 
blocking all traffic, except those which are for the firewall interface, 
using ebtables.

Any help is very much appreciated.

Thanks

Jonathan
