From: Thomas Berg <thomas.berg@branndal.se>
Subject: Re: VLANs
Date: Tue, 11 Jan 2011 09:19:23 +0100
Message-ID: <1294733963.12295.11.camel@thober-desktop>
References: <4D2B44E9.3000006@abpni.co.uk>
	 <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com>
	 <4D2B84F0.6030300@abpni.co.uk>
Reply-To: thomas.berg@branndal.se
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2B84F0.6030300@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: John Haxby <john.haxby@oracle.com>, netfilter@vger.kernel.org

m=C3=A5n 2011-01-10 klockan 22:15 +0000 skrev Jonathan Tripathy:
> On 10/01/11 21:33, John Haxby wrote:
> > On 10 Jan 2011, at 17:42, Jonathan Tripathy wrote:
> >
> >> I wish to use VLANs on my Linux Xen hosts to seperate managed cust=
omer networks.
> >>
> >> Can anybody please give me some pointers on how to make the networ=
k secure so no-one can VLAN hop?
> >>
> >> At the minute, I plan to set up one bridge per customer, and use l=
inux vconfig to add an if to the bridge (which I believe strips all tag=
s). Then, all the respective customer Xen DomU (VM) interfaces will con=
nect to the bridge.
> > If each bridge (for each customer) contains just one vlan-tagged ph=
ysical interface then there is no way for the guests to vlan-hop.  A vl=
an tag added by a guest will either be replaced by the vlan tag of the =
external interface or the frame will be dropped.  If you have multiple =
vlans on a bridge (with multiple physical interfaces) then the vlan wil=
l be chosen by routing if the interfaces have their own addresses, I'm =
not sure what happens if the interfaces don't have addresses, but when =
a frame leaves on a vlan interface it acquires the corresponding vlan t=
ag.  It doesn't matter what happens to the tag on the way back as it's =
only relevant to an interface that's on a vlan.
> >
> > Obviously you should test this, but it's all pretty straightforward=
 and there's nothing special or complicated to set up.
> >
> > jch
> Excellent! Thank you for your explanation.
>=20
> If a guest maliciously added a vlan tag, wouldn=E2=80=99t it still re=
main in the=20
> frame, however be "double-tagged" by the outgoing physical port? Even=
=20
> still though, this probably isn't an issue, provided that all upstrea=
m=20
> switches are configured correctly.
>=20
There is an sencario where your customer can make a mess. If the outer
vlan tag is the same as port vlan id aka native vlan on a dot1q enabled
port it will remove the outer tag and forward the packet only with the
inner tag wich was set by your customer.

I should suggest that you only allow ipv4 and arp passing trough to/fro=
m
your customer and drop any other frames including frames with vlan tag
set and ethertype x8100.



> In the first instance though, my Xen host will connect directly to my=
=20
> vlan-aware firewall port
>=20
> Please let me know if I've got this wrong somewhere...
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Best regards
Thomas

