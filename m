From: "Greenberg, Paul" <greenbergp@HSS.EDU>
Subject: nftables destination ip rewrite - checksum recalculation
Date: Mon, 31 Aug 2020 12:51:22 +0000
Message-ID: <CY4PR20MB1159B43B8849944AC51011D2D1510@CY4PR20MB1159.namprd20.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hss.edu; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=default; bh=hzqx9DhLL/wuvLRvbSvfWznCKoEe9wefHBdG9W8wlig=;
 b=hapIVforfrzRxzqxlb939juml+6RTU+BzNGSSjBQy3lf9pGPFtnS5aWU6pTihzd11rrY
 3dA/bpDbADUXwwltdATgBkWROmpF8WqnZUMuP1/rl7t7ew6o2LrEMRtdtB6CgFOMktOf
 zJBR+5ftNQj3M4wwgMNCWmgThsCs6gZDyhpMiSXwJxh9/QJ2QVO0aRTeCfZJQXOeN2Ul
 +ZlKiB8ZIn6kkQLdgyqdCFvbic3uqNSLRR1qqbji+covKypAYBQVFn6S4u0sU12KXkhT
 OjRcyg9ewooC3AYY7NHcEeZ6vucDyaJ4JN8+TLFY6V+Win8TwsOCWPIjnHxwv6kAuI8Q tQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=MyHSS.onmicrosoft.com;
 s=selector2-MyHSS-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzqx9DhLL/wuvLRvbSvfWznCKoEe9wefHBdG9W8wlig=;
 b=NdLzlX5reEdG1FR2jH4GeN0IKVwUFCbM7+aZlmmbp0h7FiG65S2+COL5aOhjUhqfl7A1Cf2iQeDT1jyiiXocgK0IxQI0u3KGRKdTPTU0wb6DO7XpPc4bb/COW3dDFas9papuDmP6iiQfoJXXoxva0JUKbkw4fueHh9AdZfqMc14=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi All,=0A=
=0A=
I am running into the following issue while working on a port-mapping CNI p=
lugin compatible with nftables.=0A=
=0A=
My target OS is CentOS: 3.10.0-1127.19.1.el7.x86_64 with nftables v0.8 (Joe=
 Btfsplk)=0A=
=0A=
How do I force the recalculation of checksum on a packet where I modify des=
tination IP address?=0A=
=0A=
table ip raw {=0A=
    chain prerouting {=0A=
        type filter hook prerouting priority -300; policy accept;=0A=
        iifname !=3D "cni-podman0" tcp dport http ip daddr set 10.88.0.114 =
tcp dport set http return =0A=
    }=0A=
}=0A=
After rewriting the destination address, packets arrive to a container with=
 checksum error below.=0A=
=0A=
01:05:16.704789 ee:58:3f:4d:1f:23 > ea:56:b4:c6:4f:c7, ethertype IPv4 (0x08=
00), length 58: (tos 0x0, ttl 63, id 8844, offset 0, flags [none], proto TC=
P (6), length 44)=0A=
  10.0.2.2.54017 > 10.88.0.116.80: Flags [S], cksum 0xd776 (incorrect -> 0x=
d8b9), seq 2337032705, win 65535, options [mss 1460], length 0=0A=
=0A=
The incorrect checksum causes the failure to make tcp handshake. That is SY=
N packets arrive, but container disregards and does not send SYN/ACK back b=
ecause of the incorrect checksum.=0A=
=0A=
The destination IP rewrite has NFT_PAYLOAD_L4CSUM_PSEUDOHDR flags.=0A=
=0A=
https://github.com/greenpau/cni-plugins/blob/dnat/pkg/utils/dest_nat_rewrit=
e.go#L130-L140=0A=
=0A=
Best Regards,=0A=
Paul Greenberg=
