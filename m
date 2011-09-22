From: Mark Mastandrea <denmmas@dim.com>
Subject: can ebtables be used to add/remove vlan tags
Date: Thu, 22 Sep 2011 10:27:38 -0600
Message-ID: <4E7B61FA.7010403@dim.com>
Reply-To: mark@themastandreas.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Sorry if this is a duplicate post , I tried to post ebtables mail group 
and it pointed me here.

I created a vlan 0 interface using the vlan package and vconfig under 
linux . I'm just wanting to set the 8021p tags not segregate traffic. 
However I noticed that untagged traffic is is not being allowed thru the 
interface that I configured( in this case eth0.0). This seems like a bug 
in the VLAN module since VLAN 0 is a reserved id used to indicate 
priority tagged traffic so I would expect it to accept traffic tagged 
with VLAN 0 and untagged traffic.

In any case I'm trying to see if I can create a bridge with eth0.0 
interface associated with the bridge and then use ebtables to add a VLAN 
priority tag to an incoming untagged packet so the packet will get 
processed. I also want to strip off the VLAN 0 traffic with priority 0 
on outgoing traffic.

Based on my research this isn't possible and I would just like someone 
to confirm.


Thanks
Mark
