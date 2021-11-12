From: John Marrett <johnf@zioncluster.ca>
Subject: Issues with SIP NAT for SDP/RTP Addresses
Date: Fri, 12 Nov 2021 08:37:04 -0500
Message-ID: <CAAafysFnkqNbhxc-FNibxUD4bfZkVC+DfCKJoG7dp4rUqo+F7g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zioncluster-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=5Jumonm2l6QeKu/7QtpG5lzzMrLB0d6UD6Nynt1/zy0=;
        b=m5Aj1VTtFnhZ3fYYhpDxz4CG7c243DUgXFmb8+gbhQi7Yya1bKpyNnUk/APaiFTe0N
         zrwq1ZeWjxpS584i2VwFOCat1BuXI/5es48pPJsPJQXojtOs09r9Q/VArWW9OOIa86Ai
         9UAXs/SaZIRkK9hUFjWq7gWZoQw1mKj/liUCQJOY2moBWgTLJ2Cg4vSjkCu85h9+KNDf
         EUfW32JqoUNQi8X3hQ1pNiTpVpxBzxTyRP9cpDdHdcYA1uA3TUKYSxvrenhhrC5uKHPD
         Ecea4G4FkuEndSS1xNF8H1l32VsLgirLEzuqppV4Qn8TS0c/wbv81GIjAFVGchZwI5yJ
         5D5Q==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I am trying to configure a router (OpenWrt, kernel 5.4.154, modules
nf_conntrack, nf_conntrack_sip, nf_nat_sip loaded) to NAT voice
traffic, both SIP and RTP between two different networks. On one side
of the NAT I have an SBC and on the other a SIP server and multiple
SIP endpoints. NAT is working correctly for my SIP traffic, it is not
working, within the SDP portion of the SIP exchange, for RTP
addresses.

In this simplified example I have an SBC in one network, with the IP
address 192.168.1.10. In another network I have a SIP server with IP
192.168.2.10 as well as several SIP endpoints in this network, in this
example we will discuss the SIP endpoint with the IP 192.168.2.20.

At the bottom of this message I have included an ascii diagram showing
the communications between the devices as well as their actual and
NATed IP addresses.

I have configured NAT translating the addresses in the 192.168.2.0/24
network to IPs in an intermediary network, 192.168.3.0/24 which is
sent by an upstream network device to my router performing NAT. The IP
of my SIP server is translated to 192.168.3.2. I wish to dynamically
translate the IPs of all other devices inside the 192.168.2.0/24
network to 192.168.3.1, including the SIP endpoint in my example with
IP 192.168.2.20.

In the other direction SIP servers in the 192.168.2.0/24 network will
reach the SBC at 192.168.1.10 using the address of my router,
192.168.2.2.

In order to achieve these translations I have configured the following
NAT rules.

# SIP NAT
iptables -t nat -A PREROUTING -p udp -d 192.168.2.2 --dport 5060 -j
DNAT --to-destination 192.168.1.10
iptables -t nat -A POSTROUTING -o eth1 -d 192.168.1.10 -s 192.168.2.20
-p udp --dport 5060 -j SNAT --to 192.168.3.2
iptables -t nat -A PREROUTING -p udp -d 192.168.3.2 --dport 5060 -j
DNAT --to-destination 192.168.2.20
iptables -t nat -A POSTROUTING -o eth0 -d 192.168.2.20 -s 192.168.1.10
-p udp --dport 5060 -j SNAT --to 192.168.2.2

# Media NAT
iptables -t nat -A PREROUTING -p udp -d 192.168.2.2 --dport
16384:32766 -j DNAT --to-destination 192.168.1.10
iptables -t nat -A POSTROUTING -o eth1 -d 192.168.1.10 -p udp --dport
16384:32766 -j SNAT --to 192.168.3.2

The SIP portion of this NAT configuration functions correctly. There
are some issues with the media NAT configuration which may NAT other
unintended traffic, I can refine these rules at a later time.

The NAT functions correctly both for the IP packets as well as the SIP
protocol itself, with the OPTIONS methods and other SIP elements being
translated correctly, for instance:

OPTIONS sip:192.168.2.2:5060 SIP/2.0
becomes
OPTIONS sip:192.168.1.10:5060 SIP/2.0

When a call is established between the SIP endpoint and the SBC the
RTP media addresses in the SDP portion of the SIP exchange are not
modified. Because the SIP endpoints are registered with their local
SIP server and not the remote SBC the SIP session is between the SIP
server and the SBC, however the RTP session defined using SDP is
directly between the SIP endpoint and SBC. This is a different and
more complex flow from what you would see with a SIP endpoint
connecting to a SIP remote server using NAT as the RTP addresses are
not the same as those of the SIP server.

Here's an example of a 200 OK response after the SIP/2.0 180 Ringing
exchange where I need the IP 192.168.1.20 to be transformed to
192.168.3.2:

v=3D0
o=3DCiscoSystemsCCM-SIP 1274830 1 IN IP4 192.168.1.10
s=3DSIP Call
c=3DIN IP4 192.168.1.20
b=3DTIAS:64000
b=3DAS:80
t=3D0 0
m=3Daudio 49048 RTP/AVP 0 101
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-15
a=3Drtcp:49049 IN IP4 192.168.1.20

I need to have these addresses translated so that the endpoint and SBC
media streams will be sent via the appropriate NAT addresses.

Can netfilter perform this type of NAT, and how do I configure it with
netfilter? I have tried to answer these questions myself but haven't
been able to find much information on how to perform SIP/SDP NAT.

Thank you in advance for any help that you can offer me, please let me
know if you need any additional information, I've tried to be as
detailed as possible in my explanation of the problem.

-JohnF

Here's the diagram of the network, if this doesn't render properly in
your mail client you should be able to view it using a preformatted
font in any text editor.


            =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
            =E2=94=82                  =E2=94=82
            =E2=94=82 SBC              =E2=94=82
            =E2=94=82 IP: 192.168.1.10 =E2=94=82
            =E2=94=82 NAT 192.168.2.2  =E2=94=82
            =E2=94=82                  =E2=94=82
            =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
                     =E2=94=82 eth1 x.x.x.x
            =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
            =E2=94=82                  =E2=94=82
            =E2=94=82   Linux Router   =E2=94=82
            =E2=94=82                  =E2=94=82
            =E2=94=82                  =E2=94=82
            =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
                     =E2=94=82 eth0 192.168.2.2
        =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90
        =E2=94=82                        =E2=94=82
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
=E2=94=82                  =E2=94=82   =E2=94=82                  =E2=94=82
=E2=94=82 SIP Server       =E2=94=82   =E2=94=82 SIP Endpoint     =E2=94=82
=E2=94=82 IP: 192.168.2.10 =E2=94=82   =E2=94=82 IP: 192.168.2.20 =E2=94=82
=E2=94=82 NAT 192.168.3.2  =E2=94=82   =E2=94=82 NAT 192.168.3.2  =E2=94=82
=E2=94=82                  =E2=94=82   =E2=94=82                  =E2=94=82
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
