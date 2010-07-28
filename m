From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: How Expensive?
Date: Wed, 28 Jul 2010 01:23:47 +0100
Message-ID: <4C4F7893.9020900@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

I wish to use iptables on a host that will be hosting a large number of 
VMs for customers. IPtables will do some basic "managed firewalling" for 
them.

My question is, how expensive are having lots of custom chains? My idea 
is to create one child chain per VM, with the idea to cut down the 
amount of rules evaluated (i.e. a parent chain would only jump to a 
child chain if the dest IP matches) - does this sound like a good idea?

Thanks
