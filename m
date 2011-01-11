From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: VLANs
Date: Tue, 11 Jan 2011 10:26:53 +0000
Message-ID: <4D2C306D.3020709@abpni.co.uk>
References: <4D2B44E9.3000006@abpni.co.uk>	 <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com>	 <4D2B84F0.6030300@abpni.co.uk> <1294733963.12295.11.camel@thober-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1294733963.12295.11.camel@thober-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: thomas.berg@branndal.se, netfilter@vger.kernel.org


On 11/01/11 08:19, Thomas Berg wrote:
> m=C3=A5n 2011-01-10 klockan 22:15 +0000 skrev Jonathan Tripathy:
>> On 10/01/11 21:33, John Haxby wrote:
>>> On 10 Jan 2011, at 17:42, Jonathan Tripathy wrote:
>>>
>>>> I wish to use VLANs on my Linux Xen hosts to seperate managed cust=
omer networks.
>>>>
>>>> Can anybody please give me some pointers on how to make the networ=
k secure so no-one can VLAN hop?
>>>>
>>>> At the minute, I plan to set up one bridge per customer, and use l=
inux vconfig to add an if to the bridge (which I believe strips all tag=
s). Then, all the respective customer Xen DomU (VM) interfaces will con=
nect to the bridge.
>>> If each bridge (for each customer) contains just one vlan-tagged ph=
ysical interface then there is no way for the guests to vlan-hop.  A vl=
an tag added by a guest will either be replaced by the vlan tag of the =
external interface or the frame will be dropped.  If you have multiple =
vlans on a bridge (with multiple physical interfaces) then the vlan wil=
l be chosen by routing if the interfaces have their own addresses, I'm =
not sure what happens if the interfaces don't have addresses, but when =
a frame leaves on a vlan interface it acquires the corresponding vlan t=
ag.  It doesn't matter what happens to the tag on the way back as it's =
only relevant to an interface that's on a vlan.
>>>
>>> Obviously you should test this, but it's all pretty straightforward=
 and there's nothing special or complicated to set up.
>>>
>>> jch
>> Excellent! Thank you for your explanation.
>>
>> If a guest maliciously added a vlan tag, wouldn=E2=80=99t it still r=
emain in the
>> frame, however be "double-tagged" by the outgoing physical port? Eve=
n
>> still though, this probably isn't an issue, provided that all upstre=
am
>> switches are configured correctly.
>>
> There is an sencario where your customer can make a mess. If the oute=
r
> vlan tag is the same as port vlan id aka native vlan on a dot1q enabl=
ed
> port it will remove the outer tag and forward the packet only with th=
e
> inner tag wich was set by your customer.
>
> I should suggest that you only allow ipv4 and arp passing trough to/f=
rom
> your customer and drop any other frames including frames with vlan ta=
g
> set and ethertype x8100.
Hi Thomas,

While I have made sure that my trunk ports do not have a native vlan=20
associated with them, I still think it's a good idea to use ebtables to=
=20
prevent tagging from the customers. What would the command be?

Thanks
