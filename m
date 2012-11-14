From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: VoIP conntrack issue
Date: Wed, 14 Nov 2012 02:47:51 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1211140225280.4653@nerf07.vanv.qr>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com> <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Cc: netfilter <netfilter@vger.kernel.org>

On Tuesday 2012-11-13 04:20, J=C3=B6rn Krebs wrote:

>Not really, as I use the devices behind the firewall, in many
>networks, so I need one setup that works.
>
>But to be honest, I don't like to start this discussion:
>My question is, why can netfilter not reuse the same port?

Because the port is still "in use" - in this case, the STUN from earlie=
r

>smartbyte:~ # conntrack -E
># Here is the STUN-Part
>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D216.93.246.14
>                     sport=3D44608 dport=3D3478 [UNREPLIED]
>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>                     sport=3D3478 dport=3D44608
>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D216.93.246.14
>                     sport=3D57890 dport=3D3478 [UNREPLIED]
>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>                     sport=3D3478 dport=3D57890
>[UPDATE] udp   17 59 src=3D192.168.1.38 dst=3D216.93.246.14
>                     sport=3D44608 dport=3D3478
>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>                     sport=3D3478 dport=3D44608
>[UPDATE] udp   17 59 src=3D192.168.1.38 dst=3D216.93.246.14
>                     sport=3D57890 dport=3D3478
>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>                     sport=3D3478 dport=3D57890

2x2 STUN probes sent

>[UPDATE] udp  17 600 src=3D192.168.1.38 dst=3D216.93.246.14
>                     sport=3D44608 dport=3D3478
>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>                     sport=3D3478 dport=3D44608 [ASSURED]
>[UPDATE] udp  17 600 src=3D192.168.1.38 dst=3D216.93.246.14
>                     sport=3D57890 dport=3D3478
>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>                     sport=3D3478 dport=3D57890 [ASSURED]

STUN replies. Note how the timeout for the CT entry is raised to 600
seconds.

># STUN ended - Two connections assureds, ports: 44608 and 57890

NFCT cannot know that. For NFCT, the STUN UDP pseudo-connection
is still (considered) active for another 600 seconds.
However that does not seem to be the issue; more precisely:


># Now we try to connect to the VoIP Server source port 44608 and 57890
>[NEW] udp      17 60 src=3D122.XX.115.203 dst=3D114.XX.234.123
>                     sport=3D10020 dport=3D44608 [UNREPLIED]
>                     src=3D114.XX.234.123 dst=3D122.XX.115.203
>                     sport=3D44608 dport=3D10020

Host 122 contacts 114:44608, and there is no mapping done on
this CT. Therefore,
<122.XX.115.203:10020 -- 114.XX.234.123:44608> is now in use.

>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D122.XX.115.203
>                     sport=3D57890 dport=3D10021 [UNREPLIED]
>                     src=3D122.XX.115.203 dst=3D114.XX.234.123
>                     sport=3D10021 dport=3D57890
>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D122.XX.115.203
>                     sport=3D44608 dport=3D10020 [UNREPLIED]
>                     src=3D122.XX.115.203 dst=3D114.XX.234.123
>                     sport=3D10020 dport=3D1030

<192.168.1.38:44608 -- 122.XX.115.203:10020> would normally be mapped
to <114.XX.234.123:44608 -- 122.XX.115.203:10020> because of your
MASQUERADE rule. However, <114 -- 122> is already taken (see above).

So far that I can see at this time of day.
