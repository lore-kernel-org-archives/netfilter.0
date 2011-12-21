From: Steve Hill <steve@opendium.com>
Subject: Filtering on bridges
Date: Wed, 21 Dec 2011 10:16:54 +0000
Message-ID: <4EF1B216.50303@opendium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


I have previously used iptables to filter traffic on bridged interfaces 
using the physdev module.  However, recently it seems there was a change 
in the semantics of physdev:

For bridged traffic (i.e. traffic that is coming in through one physical 
NIC, traversing a bridge and being sent out of another one without being 
routed), physdev still works as expected.

However, for traffic that has gone through the machine's own IP stack 
(either by being routed or by being generated locally), --physdev-out is 
no longer allowed.  At the time the iptables rules are being executed, 
the only thing you know is the logical bridge interface it is being 
routed to rather than the physical NIC it will eventually be sent from. 
  Is there a recommended method of filtering this traffic based on the 
physical NIC it is being sent out of, now that the deferred rule 
functionality has been removed?  ebtables doesn't really seem to be an 
option since it is nowhere near as powerful as iptables when it comes to 
IP filtering.

Background:
I'm running virtualised servers which are bridged to the physical 
network (this makes VM migration between physical hosts possible - doing 
this using a routed infrastructure would be messy since the routers 
themselves would need to be adjusted during VM migration).  I run 
iptables/ip6tables on the host machine in order to firewall the VMs and 
also for statistics reporting - these iptables rules reference each VM's 
network interface.  I would like to be able to filter routed traffic in 
the same way as the bridged traffic, but this involves knowing which VM 
it is destined for (and hence which NIC it will be sent to).

-- 

  - Steve Hill
    Technical Director
    Opendium Limited     http://www.opendium.com

Direct contacts:
    Instant messager: xmpp:steve@opendium.com
    Email:            steve@opendium.com
    Phone:            sip:steve@opendium.com

Sales / enquiries contacts:
    Email:            sales@opendium.com
    Phone:            +44-844-9791439 / sip:sales@opendium.com

Support contacts:
    Email:            support@opendium.com
    Phone:            +44-844-4844916 / sip:support@opendium.com
