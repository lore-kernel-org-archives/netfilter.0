From: "Mark Mastandrea" <mark@themastandreas.com>
Subject: Re: can ebtables be used to add/remove vlan tags
Date: Thu, 22 Sep 2011 18:50:19 -0600 (MDT)
Message-ID: <22535.198.202.202.21.1316739019.squirrel@secure.forethought.net>
References: <126fca97-0703-4c67-bbed-a8220f07b855@tahiti.vyatta.com>
Reply-To: mark@themastandreas.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <126fca97-0703-4c67-bbed-a8220f07b855@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Hemminger <stephen.hemminger@vyatta.com>
Cc: netfilter@vger.kernel.org

>
>> I created a vlan 0 interface using the vlan package and vconfig under
>> linux . I'm just wanting to set the 8021p tags not segregate traffic.
>> However I noticed that untagged traffic is is not being allowed thru
>> the
>> interface that I configured( in this case eth0.0). This seems like a
>> bug
>> in the VLAN module since VLAN 0 is a reserved id used to indicate
>> priority tagged traffic so I would expect it to accept traffic tagged
>> with VLAN 0 and untagged traffic.
>>
>> In any case I'm trying to see if I can create a bridge with eth0.0
>> interface associated with the bridge and then use ebtables to add a
>> VLAN
>> priority tag to an incoming untagged packet so the packet will get
>> processed. I also want to strip off the VLAN 0 traffic with priority
>> 0
>> on outgoing traffic.
>>
>> Based on my research this isn't possible and I would just like
>> someone
>> to confirm.
>
> Actually vconfig is considered deprecated.
> The best way to add/remove vlan's is with ip command.
>
> ip link add link eth0 name eth0.1 type vlan id 1
>
> I think you don't understand the behavior of the reserved vlan
> tag 0.
>


What I'm trying to do is to just add 8021p priority tags to traffic on a
socket that has a certain priority set by a setsockopt call. I want the
priority tags only set for this traffic. So basically I want priority
tagged and untagged frames accepted on the interface. I realize VLAN 0 is
for non vlan priority tagged traffic but it seemed to be the only way I
could get outgoing traffic tagged with the set_egress_map.

Based on my research I did see any other way of getting packets priority
tagged, am I missing something here ?


Thanks

Mark

