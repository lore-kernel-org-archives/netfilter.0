From: Kyeyoon Park <kyeyoonp@qca.qualcomm.com>
Subject: IEEE 802.11 Proxy ARP using netfilter?
Date: Thu, 10 Jul 2014 15:23:19 -0700
Message-ID: <53BF1257.80308@qca.qualcomm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qca.qualcomm.com; i=@qca.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1405031002; x=1436567002;
  h=message-id:date:from:mime-version:to:cc:subject:
   content-transfer-encoding;
  bh=4uo4Kprgv/cJI3h3c2GHW/Bmd3xVZ2Pl0H6zjnYRDis=;
  b=KXvps4UhUT+JwVMRrIkjghztot45MaPnnngM0VAKIE0vUmC5uhZW2ugS
   qyr8+GsNvE1xFPLs7TykrP2EJaN1wKRuRwTvlid0YATABsOeb7m7nEPhB
   3zU+AdGhQOOXuQr5fKjPSMnf+yAC076sNv+cDatN/SPNgmDvWmPH8/Mts
   g=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: "Malinen, Jouni" <jouni@qca.qualcomm.com>

Hi guys,

I am trying to use netfilter infrastructure to implement Proxy ARP in 
IEEE 802.11. This is different from proxy_arp that can be enabled via 
/proc/sys/net/ipv4/conf/<iface>/proxy_arp.

I initially tried to implement this feature entirely in the mac80211 
stack, but was asked to look at alternative designs (i.e. netfilter). 
The relevant discussion can be found at:

http://comments.gmane.org/gmane.linux.kernel.wireless.general/123342

In a nutshell, I am trying to keep track of MAC <-> IP address mapping
for only the associated stations for the access point (AP). Of course, 
as the stations associate and disassociate from the AP, I will need to 
update whether to keep track of a particular MAC address or not. When an 
entity asks for the IP address of one of the associated stations, the AP 
will reply on behalf of the station and drop the broadcast ARP request 
that would go out to the wireless-medium.

I was thinking about implementing this using the target extension for 
ebtables (i.e. a target extension module for "ebtable_filter" something 
that would look similar to "ebt_arpreply.c").

Then I saw that I cannot dynamically change the data that is being used 
by my own target extension module. So when a new station associates or
when an associated station disassociates, I cannot dynamically alter 
database within my own target extension module; the dynamic data being 
the database of the MAC addresses to keep track of.

I COULD rewrite the whole table every time, but this is obviously not 
scalable (i.e. imagine rewriting the table of 100 MAC addresses from the 
userspace on every association/disassociation).

What do you think is the best way to approach this? I don't even have to 
use the target extension necessarily. I just thought it was the most 
suitable solution on a first glance.

Your comment on this would be greatly appreciated.

Best Regards,
Kyeyoon
