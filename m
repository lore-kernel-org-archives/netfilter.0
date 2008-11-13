From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: www.adobe.com
Date: Thu, 13 Nov 2008 11:02:13 +0100
Message-ID: <491BFB25.3000800@plouf.fr.eu.org>
References: <20081113075231.50345b2c@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081113075231.50345b2c@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

TheOldFellow a =E9crit :
>=20
> # wget http://www.adobe.com/index.html
> --07:45:04--  http://www.adobe.com/index.html
>            =3D> `index.html'
> Resolving www.adobe.com... 192.150.18.101
> Connecting to www.adobe.com|192.150.18.101|:80...=20
>=20
> it just times out - browsers are the same.
>=20
> Looking at the log shows the following warnings:
>=20
> IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:74=
:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 PR=
EC=3D0x00 TTL=3D53 ID=3D9637 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D2=
0498 RES=3D0x00 URGP=3D0=20
> IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:74=
:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 PR=
EC=3D0x00 TTL=3D53 ID=3D45688 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D=
20498 RES=3D0x00 URGP=3D0=20
> IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:74=
:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 PR=
EC=3D0x00 TTL=3D53 ID=3D37819 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D=
20498 RES=3D0x00 URGP=3D0=20

Wget hanging after printing "Connecting to..." but before printing=20
"connected" seems to indicate that it didn't receive a SYN/ACK packet=20
from the server in response to its SYN packet. However the logged and=20
dropped packets do not look like SYN/ACK packets, as they do not have=20
the SYN and ACK flags set.

Can you provide a capture of the resulting traffic from and to=20
192.150.18.101 on interface 'net' with tcpdump, tshark or wireshark whe=
n=20
running wget ? E.g.

# tcpdump -nvi net host 192.150.18.101

Does the problem happen if you temporarily allow all input traffic (at=20
least from 192.150.18.101) ? E.g.

# iptables -I INPUT -s 192.150.18.101 -j ACCEPT

