From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: VoIP conntrack issue
Date: Wed, 14 Nov 2012 12:23:31 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1211141055040.4653@nerf07.vanv.qr>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com> <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com> <alpine.LNX.2.01.1211140225280.4653@nerf07.vanv.qr>
 <CABY2qi8BmP4t1=4gj4iW1niTJWNagTbeVu=C+t6S2WvfyRttBg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABY2qi8BmP4t1=4gj4iW1niTJWNagTbeVu=C+t6S2WvfyRttBg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Cc: netfilter <netfilter@vger.kernel.org>

On Wednesday 2012-11-14 03:35, J=C3=B6rn Krebs wrote:

>>># Now we try to connect to the VoIP Server source port 44608 and 578=
90
>>>[NEW] udp      17 60 src=3D122.XX.115.203 dst=3D114.XX.234.123
>>>                     sport=3D10020 dport=3D44608 [UNREPLIED]
>>>                     src=3D114.XX.234.123 dst=3D122.XX.115.203
>>>                     sport=3D44608 dport=3D10020
>>
>> Host 122 contacts 114:44608, and there is no mapping done on
>> this CT. Therefore,
>> <122.XX.115.203:10020 -- 114.XX.234.123:44608> is now in use.
>>
>>>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D122.XX.115.203
>>>                     sport=3D44608 dport=3D10020 [UNREPLIED]
>>>                     src=3D122.XX.115.203 dst=3D114.XX.234.123
>>>                     sport=3D10020 dport=3D1030
>>
>> <192.168.1.38:44608 -- 122.XX.115.203:10020> would normally be mappe=
d
>> to <114.XX.234.123:44608 -- 122.XX.115.203:10020> because of your
>> MASQUERADE rule. However, <114:44608 -- 122:10020>
>> is already taken (see above).
>
>Why is there only one port mapping?

#  <-> both ways

=46irst, you only used one MASQUERADE rule, which says to establish a
mapping 192.168.1.38:P <-> 114.XX.234.123:Q, if and only if,
192.168.0.0/16 is the src address on the initiating packet. This is
not the case for that <122.XX.115.203:10020->114.XX.234.123:44608>
packet of yours.
In weird Wikipedia terms, nf_nat implements "Cone NAT" exclusively.

There are two ways here.

1.
`modprobe nf_nat_sip` and see if that yields the desired result.


If not,

2.
To get the "1:1 NAT", you will need to add a "second" cone in the
other direction, so to speak. This is then something like

 iptables -t nat -A PREROUTING -i internet [-d 114.XX.234.123] \
          -j DNAT --to 192.168.1.38

As you no doubt will notice, this makes the router as a host=20
inaccessible on 114.XX.234.123, but that's what 1:1 means.

HTH.

