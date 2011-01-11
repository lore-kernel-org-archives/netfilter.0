From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: VLANs
Date: Tue, 11 Jan 2011 10:57:37 +0000
Message-ID: <4D2C37A1.8090906@abpni.co.uk>
References: <4D2B44E9.3000006@abpni.co.uk> <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com> <4D2B84F0.6030300@abpni.co.uk> <4D2C3426.3000202@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2C3426.3000202@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: John Haxby <john.haxby@oracle.com>
Cc: netfilter@vger.kernel.org

> On 10/01/11 22:15, Jonathan Tripathy wrote:
>> If a guest maliciously added a vlan tag, wouldn=92t it still remain =
in=20
>> the frame, however be "double-tagged" by the outgoing physical port?=
=20
>> Even still though, this probably isn't an issue, provided that all=20
>> upstream switches are configured correctly.=20
>
> I don't believe that this is an issue.  And 802.1ad double tag won't=20
> be recognised so it will either be dropped by the switch or dropped b=
y=20
> the outgoing NIC on the bridge.   Short of constructing frames by=20
> hand, though, I'm not sure how you would go about adding an 802.1ad=20
> vlan tag on top of an 802.1q vlan tag.
>
I wish it wasn't an issue. Many switches allow hosts to vlan hop if the=
=20
native vlan of a trunk port is the same as the native vlan of the host.=
=20
It's eaisly prevent t hough with proper switch configuration.

What ebtable command would I use to prevent *any* tagged frames coming=20
from a host?


