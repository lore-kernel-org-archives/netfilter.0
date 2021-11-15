From: John Marrett <johnf@zioncluster.ca>
Subject: Re: Issues with SIP NAT for SDP/RTP Addresses
Date: Mon, 15 Nov 2021 07:39:54 -0500
Message-ID: <CAAafysH=un8BVBM8aJ+JgeRLDJJXugb3FmLbYjQ-ZLOLSKg2dg@mail.gmail.com>
References: <CAAafysFnkqNbhxc-FNibxUD4bfZkVC+DfCKJoG7dp4rUqo+F7g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zioncluster-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=GN0zXlMwQRcnkKpsYJq9jOKI48wwoo0A2wOGspM9/Lo=;
        b=GRHVn9w5y5KAn60dG32UM1YUSYZOWW17Avt/zyeW3e34cwtXhRDFdYNt3960NmQT38
         C5cGvqAA8ks/W58lwRP52M88Z7kYwC5lSEz6jn3EieFZlj+JQlDmjKhvknKkVvJrX7wX
         83btT+Y9ONmYBfrT2pO1dNP5WY6bHJJu6vvKjRT9IJjI+t1ehVF8VCeCzzz7lu8YnUDe
         2XNpx+qvvbeToHq+R7oGvDM9WKX3PPWJaC4O0RSYiycSRi+iHP8NAouaiedkhs07GC5i
         NBD+vTp5yld/3m1Ha1Y3sCqd4+3gGFD2uQKdP/zgvbjFuiOMhG6m+Igp7dBbGlaXitI6
         8Dlg==
In-Reply-To: <CAAafysFnkqNbhxc-FNibxUD4bfZkVC+DfCKJoG7dp4rUqo+F7g@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I have made some more progress since I made this post last week. I set
sip_direct_media to 0 (which indicates NAT should be performed for
media streams which don't come directly from endpoints) and
sip_external_media to 1 (I'm not clear on the purpose of this setting;
reading the description of the git commit
https://github.com/torvalds/linux/commit/a3419ce3 it appears to
prevent NAT for traffic that transits the router and egresses on the
same interface, this shouldn't be needed in my environment). With this
configuration some of the IPs in the SDP traffic were NATed correctly.

Is there any documentation that explains in detail what the
capabilities of netfilter SIP/SDP NAT are and how to configure it? I'm
mainly looking at the source and commit messages which are difficult
for me to understand, I would like to document my findings and share
them with the community.

There are a several errors in the information that I have previously provid=
ed:

The IP 192.168.1.10 in the SDP section should actually be 192.168.2.20
The NAT IP for the SIP Endpoint in the diagram should be 192.168.3.1

There are also errors in the IPs in the existing NAT rules, I've
updated them all here:

# SIP NAT
iptables -t nat -A PREROUTING -p udp -d 192.168.2.2 --dport 5060 -j
DNAT --to-destination 192.168.1.10
iptables -t nat -A POSTROUTING -o eth1 -d 192.168.1.10 -s 192.168.2.10
-p udp --dport 5060 -j SNAT --to 192.168.3.2
iptables -t nat -A PREROUTING -p udp -d 192.168.3.2 --dport 5060 -j
DNAT --to-destination 192.168.2.10
iptables -t nat -A POSTROUTING -o eth0 -d 192.168.2.10 -s 192.168.1.10
-p udp --dport 5060 -j SNAT --to 192.168.2.2

# Media NAT
iptables -t nat -A PREROUTING -p udp -d 192.168.2.2 --dport
16384:32766 -j DNAT --to-destination 192.168.1.10
iptables -t nat -A POSTROUTING -o eth1 -d 192.168.1.10 -p udp --dport
16384:32766 -j SNAT --to 192.168.3.1

With the adjustments to the nf_conntrack_sip parameters described
above I observed the following behaviour in the SDP part SIP traffic;
first with the unsuccessful transformation of traffic from
192.168.2.10 to 192.168.1.10

o=3D 192.168.2.10 was correctly translated to 192.168.3.2
c=3D 192.168.2.20 was translated, but to 192.168.3.2 instead of the
expected 192.168.3.1; this isn't a major concern presently though it
is surprising
The a=3Drtcp header a=3Drtcp:56157 IN IP4 192.168.2.20 was not translated,
and passed unchanged. I notice that the correctly translated SDP
packet does not have an IP address in the a=3Drtcp header and, I
presume, only makes use of the IP specified in the c=3D line.

v=3D0
o=3DCiscoSystemsCCM-SIP 6732621 1 IN IP4 192.168.2.10
s=3DSIP Call
c=3DIN IP4 192.168.2.20
b=3DTIAS:64000
b=3DAS:80
t=3D0 0
m=3Daudio 56156 RTP/AVP 0 101
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-15
a=3Drtcp:56157 IN IP4 192.168.2.20

and after of the SDP info:

v=3D0
o=3DCiscoSystemsCCM-SIP 6732621 1 IN IP4 192.168.3.2
s=3DSIP Call
c=3DIN IP4 192.168.3.2
b=3DTIAS:64000
b=3DAS:80
t=3D0 0
m=3Daudio 56156 RTP/AVP 0 101
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-15
a=3Drtcp:56157 IN IP4 192.168.2.20

Traffic sent from the SBC at 192.168.1.10 was correctly translated
with all three instances of the IPs of 192.168.2.2 being transformed
to 192.168.1.10

v=3D0
o=3DSBC 64 1001 IN IP4 192.168.2.2
s=3DSBC
c=3DIN IP4 192.168.2.2
t=3D0 0
m=3Daudio 16520 RTP/AVP 0 101 13
c=3DIN IP4 192.168.2.2
a=3Drtpmap:0 PCMU/8000/1
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-15
a=3Drtpmap:13 CN/8000
a=3Dptime:20
a=3Dmaxptime:40
a=3Dsendrecv
a=3Drtcp:16521

v=3D0
o=3DSBC 64 1001 IN IP4 192.168.1.10
s=3DSBC
c=3DIN IP4 192.168.1.10
t=3D0 0
m=3Daudio 16520 RTP/AVP 0 101 13
c=3DIN IP4 192.168.1.10
a=3Drtpmap:0 PCMU/8000/1
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-15
a=3Drtpmap:13 CN/8000
a=3Dptime:20
a=3Dmaxptime:40
a=3Dsendrecv
a=3Drtcp:16521

I don't properly understand the RTP behaviour I'm seeing with this
test traffic and I am continuing to test the behaviour; it appears
right now that traffic is being sent for the partially incorrectly
NATed traffic and that the successfully NATed SDP traffic has not
resulted in RTP data being sent correctly.

I'll update the list as my investigations continue. I welcome any
assistance or guidance anyone can offer.

Thanks in advance,

-JohnF

On Fri, Nov 12, 2021 at 8:37 AM John Marrett <johnf@zioncluster.ca> wrote:
>
> I am trying to configure a router (OpenWrt, kernel 5.4.154, modules
> nf_conntrack, nf_conntrack_sip, nf_nat_sip loaded) to NAT voice
> traffic, both SIP and RTP between two different networks. On one side
> of the NAT I have an SBC and on the other a SIP server and multiple
> SIP endpoints. NAT is working correctly for my SIP traffic, it is not
> working, within the SDP portion of the SIP exchange, for RTP
> addresses.
>
> In this simplified example I have an SBC in one network, with the IP
> address 192.168.1.10. In another network I have a SIP server with IP
> 192.168.2.10 as well as several SIP endpoints in this network, in this
> example we will discuss the SIP endpoint with the IP 192.168.2.20.
>
> At the bottom of this message I have included an ascii diagram showing
> the communications between the devices as well as their actual and
> NATed IP addresses.
>
> I have configured NAT translating the addresses in the 192.168.2.0/24
> network to IPs in an intermediary network, 192.168.3.0/24 which is
> sent by an upstream network device to my router performing NAT. The IP
> of my SIP server is translated to 192.168.3.2. I wish to dynamically
> translate the IPs of all other devices inside the 192.168.2.0/24
> network to 192.168.3.1, including the SIP endpoint in my example with
> IP 192.168.2.20.
>
> In the other direction SIP servers in the 192.168.2.0/24 network will
> reach the SBC at 192.168.1.10 using the address of my router,
> 192.168.2.2.
>
> In order to achieve these translations I have configured the following
> NAT rules.
>
> # SIP NAT
> iptables -t nat -A PREROUTING -p udp -d 192.168.2.2 --dport 5060 -j
> DNAT --to-destination 192.168.1.10
> iptables -t nat -A POSTROUTING -o eth1 -d 192.168.1.10 -s 192.168.2.20
> -p udp --dport 5060 -j SNAT --to 192.168.3.2
> iptables -t nat -A PREROUTING -p udp -d 192.168.3.2 --dport 5060 -j
> DNAT --to-destination 192.168.2.20
> iptables -t nat -A POSTROUTING -o eth0 -d 192.168.2.20 -s 192.168.1.10
> -p udp --dport 5060 -j SNAT --to 192.168.2.2
>
> # Media NAT
> iptables -t nat -A PREROUTING -p udp -d 192.168.2.2 --dport
> 16384:32766 -j DNAT --to-destination 192.168.1.10
> iptables -t nat -A POSTROUTING -o eth1 -d 192.168.1.10 -p udp --dport
> 16384:32766 -j SNAT --to 192.168.3.2
>
> The SIP portion of this NAT configuration functions correctly. There
> are some issues with the media NAT configuration which may NAT other
> unintended traffic, I can refine these rules at a later time.
>
> The NAT functions correctly both for the IP packets as well as the SIP
> protocol itself, with the OPTIONS methods and other SIP elements being
> translated correctly, for instance:
>
> OPTIONS sip:192.168.2.2:5060 SIP/2.0
> becomes
> OPTIONS sip:192.168.1.10:5060 SIP/2.0
>
> When a call is established between the SIP endpoint and the SBC the
> RTP media addresses in the SDP portion of the SIP exchange are not
> modified. Because the SIP endpoints are registered with their local
> SIP server and not the remote SBC the SIP session is between the SIP
> server and the SBC, however the RTP session defined using SDP is
> directly between the SIP endpoint and SBC. This is a different and
> more complex flow from what you would see with a SIP endpoint
> connecting to a SIP remote server using NAT as the RTP addresses are
> not the same as those of the SIP server.
>
> Here's an example of a 200 OK response after the SIP/2.0 180 Ringing
> exchange where I need the IP 192.168.1.20 to be transformed to
> 192.168.3.2:
>
> v=3D0
> o=3DCiscoSystemsCCM-SIP 1274830 1 IN IP4 192.168.1.10
> s=3DSIP Call
> c=3DIN IP4 192.168.1.20
> b=3DTIAS:64000
> b=3DAS:80
> t=3D0 0
> m=3Daudio 49048 RTP/AVP 0 101
> a=3Drtpmap:0 PCMU/8000
> a=3Drtpmap:101 telephone-event/8000
> a=3Dfmtp:101 0-15
> a=3Drtcp:49049 IN IP4 192.168.1.20
>
> I need to have these addresses translated so that the endpoint and SBC
> media streams will be sent via the appropriate NAT addresses.
>
> Can netfilter perform this type of NAT, and how do I configure it with
> netfilter? I have tried to answer these questions myself but haven't
> been able to find much information on how to perform SIP/SDP NAT.
>
> Thank you in advance for any help that you can offer me, please let me
> know if you need any additional information, I've tried to be as
> detailed as possible in my explanation of the problem.
>
> -JohnF
>
> Here's the diagram of the network, if this doesn't render properly in
> your mail client you should be able to view it using a preformatted
> font in any text editor.
>
>
>             =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>             =E2=94=82                  =E2=94=82
>             =E2=94=82 SBC              =E2=94=82
>             =E2=94=82 IP: 192.168.1.10 =E2=94=82
>             =E2=94=82 NAT 192.168.2.2  =E2=94=82
>             =E2=94=82                  =E2=94=82
>             =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>                      =E2=94=82 eth1 x.x.x.x
>             =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>             =E2=94=82                  =E2=94=82
>             =E2=94=82   Linux Router   =E2=94=82
>             =E2=94=82                  =E2=94=82
>             =E2=94=82                  =E2=94=82
>             =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>                      =E2=94=82 eth0 192.168.2.2
>         =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90
>         =E2=94=82                        =E2=94=82
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82                  =E2=94=82   =E2=94=82                  =E2=94=
=82
> =E2=94=82 SIP Server       =E2=94=82   =E2=94=82 SIP Endpoint     =E2=94=
=82
> =E2=94=82 IP: 192.168.2.10 =E2=94=82   =E2=94=82 IP: 192.168.2.20 =E2=94=
=82
> =E2=94=82 NAT 192.168.3.2  =E2=94=82   =E2=94=82 NAT 192.168.3.2  =E2=94=
=82
> =E2=94=82                  =E2=94=82   =E2=94=82                  =E2=94=
=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
