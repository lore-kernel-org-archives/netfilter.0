From: "Greenberg, Paul" <greenbergp@HSS.EDU>
Subject: Re: Re: nftables destination ip rewrite - checksum recalculation
Date: Mon, 31 Aug 2020 13:46:18 +0000
Message-ID: <CY4PR20MB1159B7E9CC890E3BB5E4F574D1510@CY4PR20MB1159.namprd20.prod.outlook.com>
References: <CY4PR20MB1159B43B8849944AC51011D2D1510@CY4PR20MB1159.namprd20.prod.outlook.com>,<20200831132139.GI7319@breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hss.edu; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=default;
 bh=0VUZ0dEb+GBQu5ftrczE5r8xcOJv1qvPcpBI/7Ri7jk=;
 b=EgJw+DwyapdbgZRE2aTpeYNNfKSB/XsaDLDsVcR0AP6PUle9D7LusGkzP1rEjL9qzY+6
 rWOLuhLM8iKE7SuedpUNCE3ueGhrh/SKqjnnF2D9WHJZG/pn6O2geqlPWymO8FJb27ns
 rdUbTmHs1U31rBKcLZIP5Ozk1d+nMSWP83eu+87mqUGoaxC6xagReuju14pTRGAr1jPq
 Nse1a46mLWMZKYGppwNmYSkot/EQL6WFsH7nHtxrnlp6rebrdoR3LKLcCHeGU+ljFd1M
 zWjt9gPmlQDsb6E2RJ4CFeJvgW+td+hAzpv/pvprbi9QOIa1fyxxtwDvEzVKn/tGczhI aw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=MyHSS.onmicrosoft.com;
 s=selector2-MyHSS-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VUZ0dEb+GBQu5ftrczE5r8xcOJv1qvPcpBI/7Ri7jk=;
 b=is+CvAWh+ZyNWxX+GKmqBR88Xgir2XvU5BeMG1LfeJYF3aN7ujVeFse0bCESbjzrjisrdk6++9wC1nO6PdtcVB39xswYI813Hsi66YBhcSUqX8hLzFb0xeFprDZwN86Tk2qQkRRiC/okyyhKztXZm8k5uAT8HcLlpxDrxRgvZSI=
In-Reply-To: <20200831132139.GI7319@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thank you, Florian!=0A=
=0A=
Best Regards,=0A=
Paul Greenberg=0A=
=0A=
From: Florian Westphal <fw@strlen.de>=0A=
Sent: Monday, August 31, 2020 9:21 AM=0A=
To: Greenberg, Paul <greenbergp@HSS.EDU>=0A=
Cc: netfilter@vger.kernel.org <netfilter@vger.kernel.org>=0A=
Subject: Re: nftables destination ip rewrite - checksum recalculation =0A=
=0A=
Greenberg, Paul <greenbergp@HSS.EDU> wrote:=0A=
> Hi All,=0A=
>=0A=
> I am running into the following issue while working on a port-mapping CNI=
 plugin compatible with nftables.=0A=
>=0A=
> My target OS is CentOS: 3.10.0-1127.19.1.el7.x86_64 with nftables v0.8 (J=
oe Btfsplk)=0A=
>=0A=
> How do I force the recalculation of checksum on a packet where I modify d=
estination IP address?=0A=
=0A=
> table ip raw {=0A=
>=A0=A0=A0=A0 chain prerouting {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0 type filter hook prerouting priority -300; policy=
 accept;=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0 iifname !=3D "cni-podman0" tcp dport http ip dadd=
r set 10.88.0.114 tcp dport set http return=0A=
>=A0=A0=A0=A0 }=0A=
> }=0A=
> After rewriting the destination address, packets arrive to a container wi=
th checksum error below.=0A=
>=0A=
> 01:05:16.704789 ee:58:3f:4d:1f:23 > ea:56:b4:c6:4f:c7, ethertype IPv4 (0x=
0800), length 58: (tos 0x0, ttl 63, id 8844, offset 0, flags [none], proto =
TCP (6), length 44)=0A=
>=A0=A0 10.0.2.2.54017 > 10.88.0.116.80: Flags [S], cksum 0xd776 (incorrect=
 -> 0xd8b9), seq 2337032705, win 65535, options [mss 1460], length 0=0A=
>=0A=
> The incorrect checksum causes the failure to make tcp handshake. That is =
SYN packets arrive, but container disregards and does not send SYN/ACK back=
 because of the incorrect checksum.=0A=
>=0A=
> The destination IP rewrite has NFT_PAYLOAD_L4CSUM_PSEUDOHDR flags.=0A=
=0A=
NFT_PAYLOAD_L4CSUM_PSEUDOHDR was added in Linux 4.10 and is not available i=
n Centos7.=
