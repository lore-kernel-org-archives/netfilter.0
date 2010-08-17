From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Bridges
Date: Tue, 17 Aug 2010 23:44:26 +0100
Message-ID: <4C6B10CA.4090604@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

When using a single Linux host with lots of bridges, would there ever be 
a time, even for a few seconds, where traffic would "jump" bridges?

I know a previous poster mentioned that when adding a host to a bridge, 
for a few seconds all packets get sent everywhere, however does this 
only apply to the bridge that the new host was added to, or all bridges 
in the system?

Reason I ask is that I am considering have one bridge for public traffic 
and one bridge for private, and don't want private traffic to be seen by 
hosts connected to the public bridge.

Thanks
