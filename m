From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: VLANs
Date: Mon, 10 Jan 2011 22:15:12 +0000
Message-ID: <4D2B84F0.6030300@abpni.co.uk>
References: <4D2B44E9.3000006@abpni.co.uk> <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: John Haxby <john.haxby@oracle.com>, netfilter@vger.kernel.org


On 10/01/11 21:33, John Haxby wrote:
> On 10 Jan 2011, at 17:42, Jonathan Tripathy wrote:
>
>> I wish to use VLANs on my Linux Xen hosts to seperate managed custom=
er networks.
>>
>> Can anybody please give me some pointers on how to make the network =
secure so no-one can VLAN hop?
>>
>> At the minute, I plan to set up one bridge per customer, and use lin=
ux vconfig to add an if to the bridge (which I believe strips all tags)=
=2E Then, all the respective customer Xen DomU (VM) interfaces will con=
nect to the bridge.
> If each bridge (for each customer) contains just one vlan-tagged phys=
ical interface then there is no way for the guests to vlan-hop.  A vlan=
 tag added by a guest will either be replaced by the vlan tag of the ex=
ternal interface or the frame will be dropped.  If you have multiple vl=
ans on a bridge (with multiple physical interfaces) then the vlan will =
be chosen by routing if the interfaces have their own addresses, I'm no=
t sure what happens if the interfaces don't have addresses, but when a =
frame leaves on a vlan interface it acquires the corresponding vlan tag=
=2E  It doesn't matter what happens to the tag on the way back as it's =
only relevant to an interface that's on a vlan.
>
> Obviously you should test this, but it's all pretty straightforward a=
nd there's nothing special or complicated to set up.
>
> jch
Excellent! Thank you for your explanation.

If a guest maliciously added a vlan tag, wouldn=92t it still remain in =
the=20
frame, however be "double-tagged" by the outgoing physical port? Even=20
still though, this probably isn't an issue, provided that all upstream=20
switches are configured correctly.

In the first instance though, my Xen host will connect directly to my=20
vlan-aware firewall port

Please let me know if I've got this wrong somewhere...
