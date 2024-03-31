Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080FF376
	for <netfilter@vger.kernel.org>; Sun, 31 Mar 2024 00:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711844573; cv=fail; b=IxUgtvsIJQg670sVh9vDNvWkQ0868QaREKn+zTaLBFfbBYpYC836l64iR+VnQdgFqzuiPb2XVeusqrSYplt2lg0zVAu9tYKtJhK9US22hhOpgbP1ygvV+0sYDLarEW1azKdv5iAeyoeJHX01jPX5HXmbYe8x2sfWd1i+XNycbfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711844573; c=relaxed/simple;
	bh=hh9GnQsS8o/XovAT/uLChT1F/JocB/cIHCZD7Ezf+IM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AaNDM8dB2a6Kic+rimAEsw0ePnCd65e63VqqBnn9iCcGtNj82OGltGTVBhfBwi3HXIGp7Wjv2VsvTl8LV+//4bcYWlqJvk9kXBLE6zX6wOD6xYjfn6NL2Rs9GV54UbBafOq1WmKtu/Y5DVRcKwirkG/eUBHanVQEfcRshpfRvWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cygnalabs.com; spf=pass smtp.mailfrom=cygnalabs.com; dkim=pass (1024-bit key) header.d=cygnalabs.onmicrosoft.com header.i=@cygnalabs.onmicrosoft.com header.b=msinfC+S; arc=fail smtp.client-ip=40.107.236.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cygnalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cygnalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cygnalabs.onmicrosoft.com header.i=@cygnalabs.onmicrosoft.com header.b="msinfC+S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpM3O0W9Vl8/uBvtvJx5tbUH7AZEA8Ze87FxhQPLGVxHhYlJfriIsFC/aA+PW05OxrwjjBGpA32SlqNdwVLsdzly1mnWecITkLBOBDOTfOo/Ai+VdCUCURzn0TTmAAC/davJF9Fxzp6y3/FbKHxCmrXGDJI+QNHJ1N5ZuzzNz0gpKRDUZXr2vZTei1F03lfOvGwKX24Xi/fTqX33juoiER9V/HPXLGcBHK9vtljxdzIhNoYxvFAEnD6fkpIAhSRmulGRWkP4fG/jJdu4QBsb0GXgsM0ZkoW9zZGs4dM/MbV+yB+AgjLOVUN/auR291vRsXgb0oop3hu+enkN3tmlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQl73dmExNjyH/1yXE/mmeL6AQc51oeqPUmb0FujCXU=;
 b=Xddhpc2XpN+6tCBdfiSYkJ7cIK8rdaTJXKSoTBonJuIuueD72W2gtk70d3yPo02rB5He+5TivVVRKOWZBY+n0VLoEyOUP9oisGOBFGc02DexESQkz+03gdccixUWmvmXCkyTN6FEPHiDtfobYOQLwCDmcU45on+HoP7VexznYJ0qaXQo3Y9wN4XjrjIbHbdqKdHh4MBLAsRjpAeMXTwJv9MbaVufwVjebpvg2/d6z7Mntx1TkeF6tAmbY1yJzLsAh4QUKQJ6O9cvNmzTxeqndXD52hu61n2yEsov+y68b+RB/twPR3T2+gcxipmhK0wMybSp30F5Md9IK4rSqsnkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cygnalabs.com; dmarc=pass action=none
 header.from=cygnalabs.com; dkim=pass header.d=cygnalabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cygnalabs.onmicrosoft.com; s=selector2-cygnalabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQl73dmExNjyH/1yXE/mmeL6AQc51oeqPUmb0FujCXU=;
 b=msinfC+SC55oSIYtF5X5jl267nHNqKPEspFKSEtqr/qUeQFV8xrQzyUvPIZ/5EojG1N0ydBcY4Dwm8JAW2Tm2xvh+ekUTBkbPWaEVECHWMm4U224RuAtUvoyL1KCDj4Iel0QUJUMjw6geMEIqNDBfItt7gPJtCMNbpJ3fOiq3tY=
Received: from SN7PR18MB3887.namprd18.prod.outlook.com (2603:10b6:806:105::21)
 by LV3PR18MB5639.namprd18.prod.outlook.com (2603:10b6:408:194::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.43; Sun, 31 Mar
 2024 00:22:48 +0000
Received: from SN7PR18MB3887.namprd18.prod.outlook.com
 ([fe80::ecd8:699f:9417:aef6]) by SN7PR18MB3887.namprd18.prod.outlook.com
 ([fe80::ecd8:699f:9417:aef6%7]) with mapi id 15.20.7409.042; Sun, 31 Mar 2024
 00:22:48 +0000
From: Blaine Elzey <Blaine.Elzey@cygnalabs.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
CC: Kerin Millar <kfm@plushkava.net>
Subject: RE: Rocky Linux 9 with firewalld and nftables always tracks
 connections
Thread-Topic: Rocky Linux 9 with firewalld and nftables always tracks
 connections
Thread-Index: AdqCWwLiZxLG+wb/QdeaTIIFKBfwWwAEFukAABAd/AA=
Date: Sun, 31 Mar 2024 00:22:48 +0000
Message-ID:
 <SN7PR18MB3887FC43932FD714B8C8864B97382@SN7PR18MB3887.namprd18.prod.outlook.com>
References:
 <SJ0PR18MB388483F4136B4AEF9FF7F8F097392@SJ0PR18MB3884.namprd18.prod.outlook.com>
 <20240330062742.abeecf69e3c13c6faa45e276@plushkava.net>
In-Reply-To: <20240330062742.abeecf69e3c13c6faa45e276@plushkava.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR18MB3887:EE_|LV3PR18MB5639:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zdpOcuRpUjnrGNbhq5h6KTS/U9fpi5PDADVre6sSQAmEne0ZVyQmqhxfTPeqH3puSJavXvnAWYfl9eLMdZs27rxRA0o0QHMDrRdn2uzsF0wW2Ng2RQDmzHJdm5lNR2FmH+tZ69cWfJtTfv8OvglyM6YVKIbxOPiX9TmDeYuk4ccWLzGtZewFZa95iBfVLc3igX0q5RMYGIdsUX5BVsGLL2Uq4NgKuYTP1KsYNioR9lYNfO0gw6C79l/ezxM6eagOsjdLhNckTYV8yz3BDQyjlC/HGDh7N0BWuf46DzYb/kODYHtLIXtR/+wL5iw4iHiaiHPaqIpMdTSbzxd63WuOiAXVvw3gXl0sxu2dA8DtV8EJd7xMovLe70j5VfWPa8MQWhjzU/uS/i3thLBqKET0O0j0xybBFEr4uxzzwJIKSxY4QEnAqmVVMNPcF2SAcruK3IdBU0/UlIHsAJ5sBc9TlpubaKe7igmPWkhpNB70KU045evzPyJYnDaSvlOxaQPBemC0GOjXQjvseP5X0jvsDQg1y++71nuikyis/+0sTmnKBpHNm/MM1bnwUlufNG6uEBoWnYqczCNi+eZgB9GiZsTZKUeM9v1K80GAAMMCFLg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR18MB3887.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?z6vP/pkjiRMc+F+LD27LMab9v0/XH2a44GgXTVd/HxxQly6S5zQtOX2zxoX6?=
 =?us-ascii?Q?mQqGU6UjqSyLodNUBdWmxJBipm+BQs2T0K+LnTOsqKgsnfGdms7K6CQRW7R4?=
 =?us-ascii?Q?Je7ScOXDcPpdivMEu3e+ZXXp5oiNWx/5AGAhKrcCQJ4ahh/LiKBPluyp700R?=
 =?us-ascii?Q?4z07dQP2GTtME7KcmofP31rexdyFvzec/YrV5DOrUwKpyAa7Oe9wQzl8W1VP?=
 =?us-ascii?Q?3tQ0nDG+TeIMiEsMVhX0ch+EgyJ83wVbf/4zdWn+JC3cPzHQD9cHVrDbwkC8?=
 =?us-ascii?Q?c4gJfofM7puGfKRrxnfcmgh0xIA1siiA6u63dmli/B8+W22gkW78sGyYNQtR?=
 =?us-ascii?Q?r16vymWMHSAZXQ7471XEyVF89gcPR4nbDOvWzajVsE2XHmrwVXSFLDjgkLH8?=
 =?us-ascii?Q?3DtTif58cxnjbYxcKYZlnwvBe0WM2CAiN9HDBTikLFoh5zr94ws9ZyXLa+sZ?=
 =?us-ascii?Q?Vd6ejcbhSbqL1i4PYHxwP0MY5hiN7JtHNCLyLH+iVKclUyGyLTwcYHndH0XF?=
 =?us-ascii?Q?vqkrxuh3bFX26apNlGgmRDqdNS3U3wdiIeiXruZVJm6X0QpDfGHH5EeGg/VV?=
 =?us-ascii?Q?J5MOWpJnYuf8JLMp3AL1KpP07Vll5gS+Add2exhxEigWog2OuSuUvXtkbG3P?=
 =?us-ascii?Q?J01vvcuLOku4XoQUcb0WSLrm+oDwTVABmkYTSBs6wT61azv3Uj9gPGId+h/M?=
 =?us-ascii?Q?cXIuPkZn9Azk5/4TPCslullParXDGDVer//IbxOPUTsUCLeBGu/EpM7uZBba?=
 =?us-ascii?Q?zLm4huOkPyHM9KNLyfqEl9VVGp2ob4eLz46V6q+lFeiwmDa6rLDM2t000r9R?=
 =?us-ascii?Q?g6R22S/wWX+f0rofL2SWreYr37/VdcZEFtcU9CwAUV1pML8to77lhyWKbI4I?=
 =?us-ascii?Q?higfgGyKMzyGPFLdlnBcaVnLEMCJ8WV2cKku2VYKe1YRNPERa9Zp8Z9noDy1?=
 =?us-ascii?Q?+627cusO9fsxLtCQ1oV+Ppk3D4A84XU7JKHPf6webzl7o1sPDDFCy1FhjLU4?=
 =?us-ascii?Q?T2G7f9cAV46gpJpfQPOHlT49K6op8zXjaoHAVkfNXeFH3nBi/Wqq+I4Ga7fp?=
 =?us-ascii?Q?nnpa2/qHMQHxoqgbZBReJwuw7p7sP8ZnC8SiqbLXMQkn2UfVCxjBWVf6YiZo?=
 =?us-ascii?Q?AHJqmt8IL+vV6LAoZnz+V2zzPyzpxO0+x4Tz4SXpe4fHthi/OoXzINXtmfvr?=
 =?us-ascii?Q?b+Hr19yxDNOAMXNUp1lleKvE3rR5Zt2XMtOlrr5w+H+e+YNJAzHgOPzTjccZ?=
 =?us-ascii?Q?HqXxQyJZX67Xv89IdRWLZCKxNLcGF6qEjSNOwv8B99fDIhRHWLCggay1rx6y?=
 =?us-ascii?Q?izrrGJljJnE/jkXauzLvtsyYrvSIiTk5ITZG8Xa1jJ0dUNQjMr3y/hS7aNU0?=
 =?us-ascii?Q?/d6ADqY/zOO2WUSVu/W8p5eXD+u79KsNO2lmSBTjVb8r4/c42gAjVn92FeJ7?=
 =?us-ascii?Q?RxNqLxXUubgKks7Tvy9t9m7/GInNR0uI/YvBoUDxPdlYgfeCfZD1MshzdM/c?=
 =?us-ascii?Q?Hfp2sDPGqcglLR7lxvDoAQVuExpCmaKb7UuVzat7Q7xxVijpoD8JDS4Dhcxj?=
 =?us-ascii?Q?PSHlia47wUF+XnaJnMAJUb358tp2IMQYo3xSKoOGxD1XZISkCHEJ0ftxh7Fc?=
 =?us-ascii?Q?SQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cygnalabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR18MB3887.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a0581d-019d-4556-f36d-08dc5118b1bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2024 00:22:48.2677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52aaff49-9322-41f9-ad11-aa09e87f6af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+CDVd9arYhy3rop+w6YK6tvxaFCA+ondO11PEaYhvGrxKoGBFrEvsOacNTI68R4zLkIkBNyrGbFJ3Hqs48z2xAJFePYXkaIY0BfVFdQf7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5639

From: Kerin Millar <kfm@plushkava.net>=20
Sent: Saturday, March 30, 2024 2:28 AM

Hi,

> You have not fulfilled this requirement because your priority level is de=
fine as -140 (-150 + 10).  Below is an
> example of how one might correctly employ notrack. It presumes that the D=
NS server is running at the same
> host as bears the ruleset.

I had read that and tried this and many variations that did not work.  Belo=
w I tried to create your suggested chains, but also failed. Some good news =
is that this led me to a working solution.

Suggested solution denied traffic:

# nft add table inet raw
# nft add chain inet raw PREROUTING { type filter hook prerouting priority =
-300 \;policy accept\;}
# nft add rule inet raw PREROUTING fib daddr type local udp dport 5353 notr=
ack
# nft add chain inet raw OUTPUT { type filter hook output priority -300 \;p=
olicy accept\;}
# nft add rule inet raw OUTPUT udp sport 5353 notrack
# nft add rule inet raw OUTPUT oifname "lo" notrack

The resulting new table (just the new table shown, the firewalld table is t=
he same, except without the 2 mark rules I added in my initial post):

table inet raw {
        chain PREROUTING {
                type filter hook prerouting priority raw; policy accept;
                fib daddr type local udp dport 5353 notrack
        }

        chain OUTPUT {
                type filter hook output priority raw; policy accept;
                udp sport 5353 notrack
                oifname "lo" notrack
        }
}

The chains in the firewalld table that are different from my original post =
(no " udp dport 5353 notrack meta mark set 0x00000035" in mangle_PREROUTING=
 or "meta mark 0x00000035 accept" in filter_IN_public_allow):
table inet firewalld {
        chain mangle_PREROUTING {
                type filter hook prerouting priority mangle + 10; policy ac=
cept;
                jump mangle_PREROUTING_ZONES
        }
        chain filter_IN_public_allow {
                tcp dport 22 ct state { new, untracked } accept
                udp dport 53 ct state { new, untracked } accept
                tcp dport 53 ct state { new, untracked } accept

Testing results:

From client (192.168.1.2):

# dig @192.168.1.1 +timeout=3D1 +retries=3D1 1.0.0.127.in-addr.arpa ptr +sh=
ort -p 553

; <<>> DiG 9.16.23-RH <<>> @192.168.1.1 +timeout +retries 1.0.0.127.in-addr=
.arpa ptr +short -p 53
; (1 server found)
;; global options: +cmd
;; connection timed out; no servers could be reached

# dig @192.168.1.1 +timeout=3D1 +retries=3D1 1.0.0.127.in-addr.arpa ptr +sh=
ort -p 553

; <<>> DiG 9.16.23-RH <<>> @192.168.1.1 +timeout +retries 1.0.0.127.in-addr=
.arpa ptr +short -p 53
; (1 server found)
;; global options: +cmd
;; connection timed out; no servers could be reached

On system with DNS server and nftables config, there were no connections:
# cat /proc/net/nf_conntrack|grep 192\.168\.1\.2

But the log_denied messages on the DNS server:

Mar 30 14:26:55 qip1250re-2 kernel: filter_IN_public_REJECT: IN=3Deth0 OUT=
=3D MAC=3Dc4:5a:b1:b2:95:a4:c4:5a:b1:a5:ea:1d:08:00 SRC=3D192.168.1.2 DST=
=3D192.168.1.1 LEN=3D91 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D26795 PROTO=3D=
UDP SPT=3D53369 DPT=3D53 LEN=3D71
Mar 30 14:26:56 qip1250re-2 kernel: filter_IN_public_REJECT: IN=3Deth0 OUT=
=3D MAC=3Dc4:5a:b1:b2:95:a4:c4:5a:b1:a5:ea:1d:08:00 SRC=3D192.168.1.2 DST=
=3D192.168.1.1 LEN=3D91 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D27658 PROTO=3D=
UDP SPT=3D57512 DPT=3D53 LEN=3D71

Looks like the filter_IN_public is still denying the traffic (so I don't se=
e the connections like in my initial post where traffic is allowed):

        chain filter_IN_public {
                jump filter_INPUT_POLICIES_pre
                jump filter_IN_public_pre
                jump filter_IN_public_log
                jump filter_IN_public_deny
                jump filter_IN_public_allow
                jump filter_IN_public_post
                jump filter_INPUT_POLICIES_post
                meta l4proto { icmp, ipv6-icmp } accept
                log prefix "filter_IN_public_REJECT: "
                reject with icmpx admin-prohibited
        }

To get the traffic accepted, but not tracked:

Flush the ruleset and restart firewalld
# nft flush ruleset
# systemctl restart firewalld

Run nft commands to setup the suggested new raw table and add the extra inp=
ut chain accept:
# nft add table inet raw
# nft add chain inet raw PREROUTING { type filter hook prerouting priority =
-300 \;policy accept\;}
# nft add rule inet raw PREROUTING fib daddr type local udp dport 5353 notr=
ack meta mark set 53
# nft add chain inet raw OUTPUT { type filter hook output priority -300 \;p=
olicy accept\;}
# nft add rule inet raw OUTPUT udp sport 5353 notrack
# nft add rule inet raw OUTPUT oifname "lo" notrack
# nft insert rule inet firewalld filter_IN_public_allow mark 53 accept

Resulting new table and updated chain:
table inet raw {
        chain PREROUTING {
                type filter hook prerouting priority raw; policy accept;
                fib daddr type local udp dport 5353 notrack meta mark set 0=
x00000035
        }

        chain OUTPUT {
                type filter hook output priority raw; policy accept;
                udp sport 5353 notrack
                oifname "lo" notrack
        }
}
table inet firewalld {
        chain filter_IN_public_allow {
                meta mark 0x00000035 accept
                tcp dport 22 ct state { new, untracked } accept
                udp dport 53 ct state { new, untracked } accept
                tcp dport 53 ct state { new, untracked } accept
        }

On the Client, both authoritative and recursive queries are answered:
# dig @192.168.1.1 +timeout=3D1 +retries=3D1 1.0.0.127.in-addr.arpa ptr +no=
cmd +short -p 53
localhost.
# dig @192.168.1.1 +short www.google.com
142.250.80.36

On system with DNS server and nftables config, there were no connections fo=
r DNS:
# cat /proc/net/nf_conntrack|grep 192\.168\.1\.2

There are no logged reject/denied messages for DNS packets on the DNS serve=
r either

I thank you very much for the pointers to successfully configuring notrack =
of the DNS packets.

Now that I know the underlying nftables configuration, I need to incorporat=
e this configuration into the firewalld configuration.  I understand if thi=
s is off-topic and I may need to post in a different forum.

I see that firewalld says that direct rules is deprecated, and to use polic=
ies.

Unfortunately policies do not support notrack, and the necessary arguments =
that I have tried in direct rules are invalid.  I have also come to find th=
at the firewall direct rules only support iptables, while my firewalld.conf=
 is set to use nftables; thus, unable to see nftables tables and chains set=
up by firewalld.  Maybe the nftable rules from firewalld override the iptab=
les rules from firewalld direct?

At the moment, I created some workaround scripts from the information in th=
is post, and call the in the systemd  ExecStartPre=3D for DNS service start=
.  I remove them in ExecStopPost=3D.

Cheers,

Blaine
