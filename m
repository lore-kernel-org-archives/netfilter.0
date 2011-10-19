From: Erik Schweigert <ejschweigert@gmail.com>
Subject: Netfilter TCP Established Timeout
Date: Wed, 19 Oct 2011 12:03:19 -0700
Message-ID: <CADVVA4-XORAyHOLxx-x9RGxEDWmpP=5hxqwxqCaHXv-13WXqaw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=8q8VHjuw//IPAkqlMasFPp88UvEOzf/nDaVRQ89beJk=;
        b=T8r3e8fYSd561/8tbdzgK+G5UotjuAXpWBj/43b7T1ceOi+g2jlHhuzahp4rlzMUdc
         zHnxqtTbhZyBmjXDnZMyOwFNRO5Ey1HLdv7OqbqDMNughxo6PDldh9Ll3rYYZ3YlL5Ve
         umRLDv63Wy74rPxgji8Nvo7qVnHz64yItDwwc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,

I have noticed an oddity in the timeout values of a TCP Established
connection. =A0I currently have the
"nf_conntrack_tcp_timeout_established =3D 1800".

# cat /proc/net/nf_conntrack =A0| grep EST
ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 1385 ESTABLISHED src=3D192.168.10.25
dst=3D192.168.10.134 sport=3D2513 dport=3D1217 packets=3D71 bytes=3D101=
54
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2513 pac1
----> ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 1799 ESTABLISHED src=3D192.168.10=
=2E25
dst=3D192.168.10.134 sport=3D2550 dport=3D1217 packets=3D1142 bytes=3D1=
21874
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2550 1
ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 1413 ESTABLISHED src=3D192.168.10.25
dst=3D192.168.10.134 sport=3D2515 dport=3D1217 packets=3D824 bytes=3D10=
1370
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2515 p1
ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 263 ESTABLISHED src=3D192.168.10.25
dst=3D192.168.10.134 sport=3D2440 dport=3D1101 packets=3D41 bytes=3D645=
8
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2440 pack=
e1
ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 1221 ESTABLISHED src=3D192.168.10.25
dst=3D192.168.10.134 sport=3D2512 dport=3D1101 packets=3D79 bytes=3D135=
78
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2512 pac1
# cat /proc/net/nf_conntrack =A0| grep EST
ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 1369 ESTABLISHED src=3D192.168.10.25
dst=3D192.168.10.134 sport=3D2513 dport=3D1217 packets=3D71 bytes=3D101=
54
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2513 pac1
----> ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 296 ESTABLISHED src=3D192.168.10.=
25
dst=3D192.168.10.134 sport=3D2550 dport=3D1217 packets=3D1166 bytes=3D1=
24610
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2550 p1
ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 1396 ESTABLISHED src=3D192.168.10.25
dst=3D192.168.10.134 sport=3D2515 dport=3D1217 packets=3D824 bytes=3D10=
1370
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2515 p1
ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 247 ESTABLISHED src=3D192.168.10.25
dst=3D192.168.10.134 sport=3D2440 dport=3D1101 packets=3D41 bytes=3D645=
8
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2440 pack=
e1
ipv4 =A0 =A0 2 tcp =A0 =A0 =A06 1205 ESTABLISHED src=3D192.168.10.25
dst=3D192.168.10.134 sport=3D2512 dport=3D1101 packets=3D79 bytes=3D135=
78
src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2512 pac1

You will notice in the two iterations I have marked above, the timeout
values goes from 1799 to 296 within a 16 second span. =A0Is this a bug
or something inherent to the connection tracking system that I unaware
of.

I am running kernel 2.6.26.5. My current settings of the tunable
conntrack features are:

nf_conntrack_tcp_be_liberal =3D 0
nf_conntrack_tcp_loose =3D=A01
nf_conntrack_tcp_max_retrans =3D=A03
nf_conntrack_tcp_timeout_close =3D=A010
nf_conntrack_tcp_timeout_close_wait =A0=3D=A060
nf_conntrack_tcp_timeout_established =3D=A01800
nf_conntrack_tcp_timeout_fin_wait =3D=A0120
nf_conntrack_tcp_timeout_last_ack =3D=A030
nf_conntrack_tcp_timeout_max_retrans =3D=A0300
nf_conntrack_tcp_timeout_syn_recv =3D=A060
nf_conntrack_tcp_timeout_syn_sent =3D=A0120
nf_conntrack_tcp_timeout_time_wait =3D=A0120

Any help or suggestions is appreciated,
Erik
