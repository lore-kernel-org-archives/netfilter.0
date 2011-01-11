From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: VLANs
Date: Tue, 11 Jan 2011 12:24:51 +0000
Message-ID: <4D2C4C13.3020107@abpni.co.uk>
References: <4D2B44E9.3000006@abpni.co.uk> <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com> <4D2B84F0.6030300@abpni.co.uk> <4D2C3426.3000202@oracle.com> <4D2C37A1.8090906@abpni.co.uk> <4D2C47DB.10702@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2C47DB.10702@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: John Haxby <john.haxby@oracle.com>, netfilter@vger.kernel.org

> On 11/01/11 10:57, Jonathan Tripathy wrote:
>>> On 10/01/11 22:15, Jonathan Tripathy wrote:
>>>> If a guest maliciously added a vlan tag, wouldn=92t it still remai=
n=20
>>>> in the frame, however be "double-tagged" by the outgoing physical=20
>>>> port? Even still though, this probably isn't an issue, provided=20
>>>> that all upstream switches are configured correctly.=20
>>>
>>> I don't believe that this is an issue.  And 802.1ad double tag won'=
t=20
>>> be recognised so it will either be dropped by the switch or dropped=
=20
>>> by the outgoing NIC on the bridge.   Short of constructing frames b=
y=20
>>> hand, though, I'm not sure how you would go about adding an 802.1ad=
=20
>>> vlan tag on top of an 802.1q vlan tag.
>>>
>> I wish it wasn't an issue. Many switches allow hosts to vlan hop if=20
>> the native vlan of a trunk port is the same as the native vlan of th=
e=20
>> host. It's eaisly prevent t hough with proper switch configuration.
>>
>
> One of us is missing something.  A VLAN tag is 802.1q; a double tag i=
s=20
> 802.1ad and, so far as I know, linux doesn't do 802.1ad.   If a guest=
=20
> applies an 802.1q VLAN tag to a frame then that tag will either be=20
> replaced by the outgoing 802.1q vlan-tagging interface or it will be=20
> dropped.  (At least I believe this to be the case, you'd have to test=
=20
> and/or check the code to see what happens, as I'm relying on memory=20
> here.)  vconfig (on Linux) does not do 802.1ad double tagging, it's=20
> only 802.1q.
I think I'm go on the assumption that the guest will double-tag the=20
packet themselves
>
> I'm not sure what you mean by vlan hopping.  You have several vlans o=
n=20
> the same port so you can't use trunking (where the port is responsibl=
e=20
> for tagging the frames) so you have to say which vlan tags are=20
> permitted on the port and, of course, any frame with a permitted tag=20
> will be passed but incoming frames will only go to the right vlan=20
> interface.  (eg if the host has vlans 100, 101 and 102 then the switc=
h=20
> will have to be configured to allow those vlan tags on the port that=20
> the host is connected to.  A frame destined for the host with vlan ta=
g=20
> 101 will show up on eth0.101 (or whatever) and that is connected to a=
=20
> bridge that guests who are supposed to be using vlan 101 are using. =20
> So even if a guest could send a frame with tag 100, it wouldn't get a=
=20
> response from any other host on vlan 100.)
>
>> What ebtable command would I use to prevent *any* tagged frames=20
>> coming from a host?
>>
>>
>
> I don't remember exactly off-hand, but you can check the particular=20
> bytes in the frame for the vlan tag identifier and if it's present,=20
> drop the frame.  (The 802.1q tag normally appears immediately after=20
> the source and destination mac addresses, although it is allowed to b=
e=20
> in a different place.  The 802.1ad tag normally appears after the=20
> source and destination mac addresses as well, immediately before the=20
> 802.1a tag.)
>
>
> Have you actually tried this to see what happens?  Or are you=20
> surmising that guests can have a double tag applied to an already=20
> tagged frame?  Or that a vlan tagged frame is allowed through a vlan=20
> interface with its vlan tag intact?  As I recall, the frame will be=20
> re-tagged but it might be dropped, but I'd try it to see what happens=
=20
> if I really wanted to know.  And then I'd check the code as well :-)
>
>
> jch

=46or seeing what I mean about VLAN hopping:

http://en.wikipedia.org/wiki/VLAN_hopping

