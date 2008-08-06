From: Charles Duffy <Charles_Duffy@messageone.com>
Subject: NETMAP of destination *after* routing
Date: Wed, 06 Aug 2008 17:57:42 -0500
Message-ID: <g7da9g$21r$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Howdy, all. I'm looking at building NETMAP-like functionality into 
libvirt, such that groups of guest VMs (each group on its own bridge) 
can think they're sharing the same address space, but be separately 
addressable from outside (including the VM host itself). This has 
applications in automated QA -- being able to suspend a group of virtual 
machines in-flight, create an arbitrary number of copy-on-write images 
of these machines (each group of copies attached via a different bridge 
device) connected to different bridges, and being immediately able to 
separately address each copy via a distinct network address without 
reconfiguration.

Unfortunately, the current behavior of NETMAP -- translating the source 
address in POSTROUTING and the destination in PREROUTING -- doesn't 
appear to work for this purpose: I still need the original destination 
intact when routing to decide which bridge packets should go out.


How do 'yall suggest resolving this? I've played around with 
xtables-addons somewhat, and am pondering building a target to do 
translation in the mangle table on a packet-by-packet basis (as my 
present understanding -- correct or otherwise -- is that translating the 
destination post-routing with existing conntrack-based NAT functionality 
simply isn't feasible)... but at present I don't know what roadblocks 
are likely to be hit in the process.

Thoughts?

Thanks!

