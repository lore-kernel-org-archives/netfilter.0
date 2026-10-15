Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021097.outbound.protection.outlook.com [52.101.70.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC14D9577
	for <netfilter@vger.kernel.org>; Thu, 15 Oct 2026 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068875; cv=fail; b=gfCvT903Xrlh0tOA7C9Es0FRG4hrqTmWn1lYPe9fXNiTmD7we3Qd4YpptjytiHbbGnJ51UhIw8VZmEeax9b+ibu8fbCV68j6brg0uR7Kpp+2fKgHZQDyBvzzVZonNBaeq5SXaMhvFHNEV/QbDCS7/KGT24t+9Wxzs2tsKCKCBT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068875; c=relaxed/simple;
	bh=BgYafUe3wYcRvqWCbmVtg6Mv4iWoppMcVYVXWh9IzIo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GzLpxgohr48b1qb2FXgapakdrUw9UBGK4rSjjIYkQIqu7fXbBwFjY5mMpmsRZKqg4OAxA8aQiYq1rZqkl7tAieaq4HjVyCmecDC60SW93AzD/Gcs34YuVgLmAiXgJe+2zwxkOBDRa5Rls9e4OtxbcwWGBD6yZ98kH2BUe2nDJJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=earthlink.iq; spf=pass smtp.mailfrom=earthlink.iq; dkim=pass (2048-bit key) header.d=earthlink.iq header.i=@earthlink.iq header.b=BDYVqLGm; arc=fail smtp.client-ip=52.101.70.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=earthlink.iq
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=earthlink.iq
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=earthlink.iq header.i=@earthlink.iq header.b="BDYVqLGm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brkR+W7IZlFBd951VK9u2SpyL9/Vf0VI5gEHff5+/f2CcyAKtu6gUjog21jJ/c08ac+H/I6XBab1iB0IzfEC70qD7kGFQVRc7u34Eng08gSL734Rc+R8fiKko/IVICNm5lLyCmCuTuq1VEFzI5WpxlAM8yk+QkhYKiUifNx0a0mdX7YaOik4Mw1Olvs/2YgUJ5gql/2cDL6el5jOxvygkHk8+oLC6OvsfCmUycJ2SDRQRml11pZwUnQfkIXO4mWryyC/69L74LhO4AeKD1ENOIOduuhuGos1Sa9dN3DeKANrcp6jHcd+q/QGAWo6z5yvqvXlYiD345z3eNiz/Cuz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgYafUe3wYcRvqWCbmVtg6Mv4iWoppMcVYVXWh9IzIo=;
 b=TsIzt3RJOz2cJ26nDLiavZvRZ2FNAduUhlST3KLGepoG4dfY4ijpDte09FCUBf9Bu3XM0y4ZYLdu+BGv5gEZBsoE5gQgnmV51in3qiPo39OtA6CJ3vBjVqjDdXD7n8UtLuJDnxE2aCny4pYdgpAExjKUrZC8pg4qeYUbyERZZxjFRa1FnnB0f60mMLR+KVWPofXMu9G24+RWHO7ImNKQHcsaLfc3b/a+i8UiDRVz6vKduOBFuQyxhcJ48E+zY/gA1kX+J2jF1Y8d1nBexORi6O6tokWKOu5hCrc0aFVbP91jBQOQdiYZo2AAXxtyDu+cgQU3oNsHR386c0YYrGCkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=earthlink.iq; dmarc=pass action=none header.from=earthlink.iq;
 dkim=pass header.d=earthlink.iq; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=earthlink.iq;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgYafUe3wYcRvqWCbmVtg6Mv4iWoppMcVYVXWh9IzIo=;
 b=BDYVqLGm5mpRCcJR24oWgghgeIEbBmlLUZ/IXRKjJWdUSDWhAuSJhjjw0Wk7AVU5CfSnKB6abSgV+Ep7fWSSem5mBfF++BGzljx3RkKTC8oL8n0BzNg07Axy+NVHp19IMVWARDoAm+W5/xwKixrCTYoxHI4tlCNuj6RqzIKG1QUZKncSzPiGUvt7uSmPwo0hemVfoiEMvcgz85zx0p+SFkGBkT2olhZJzR6JxD4EEZ1SCO347Xt76WEBY7x7PnxhMFKE448eT99PBE0SeMXkHZZwRFP2nnDmPzxocmoXrXT+1jd6lGYdft86Ng1FWzcmgHwY5Ri7r17VzwDB/PSqGA==
Received: from AM0PR02MB4307.eurprd02.prod.outlook.com (2603:10a6:208:d9::10)
 by DB5PR02MB10189.eurprd02.prod.outlook.com (2603:10a6:10:4a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 12:54:30 +0000
Received: from AM0PR02MB4307.eurprd02.prod.outlook.com
 ([fe80::c392:dbc8:75f1:ef9c]) by AM0PR02MB4307.eurprd02.prod.outlook.com
 ([fe80::c392:dbc8:75f1:ef9c%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 12:54:29 +0000
From: Muhammad Zuhayr al-Tayyar <mzuhayr@earthlink.iq>
To: Lazuardi Nasution <mrxlazuardin@gmail.com>
CC: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Nftables flow table hardware offload
Thread-Topic: Nftables flow table hardware offload
Thread-Index: AQHdXHetRqLsqxqdTEqK6TWm0UBIS7b+RKaAgAAj5zE=
Date: Thu, 15 Oct 2026 12:54:29 +0000
Message-ID:
 <AM0PR02MB4307273B9336DB6501760728C69C2@AM0PR02MB4307.eurprd02.prod.outlook.com>
References:
 <AM0PR02MB430700A2F758257B5AD3049CC69C2@AM0PR02MB4307.eurprd02.prod.outlook.com>
 <CA+u3Gu+KFN-r_j3BS+SBQMnM2XxB5gqENVARRC_0LP7AG8i1Og@mail.gmail.com>
In-Reply-To:
 <CA+u3Gu+KFN-r_j3BS+SBQMnM2XxB5gqENVARRC_0LP7AG8i1Og@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: mrxlazuardin@gmail.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=earthlink.iq;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR02MB4307:EE_|DB5PR02MB10189:EE_
x-ms-office365-filtering-correlation-id: 32ff73e0-ae79-4c0d-6cf2-08df2abb737d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|10067099003|4143699003|261009223027099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 TallesqO80wx+zdUPE+TrFS2fKgkIi4+sZYioH85ZX0gjwYP0hB2Kk+vEmFm/QWUvxkx9F66nNqjayKsQBQQ3ZEOvUSGR0i+MmNfszTXwWLxeF1OHIBWquVfLFiwpJmYmH3ZSZWYlZhU9BFCu0ZDq8fO/2AZBT1tkMgxlhnC4ZokLlmL9MrKz3ZPItYsyZ1ybYMw37Etsu2FSrCgSYNYUa84qiQsxHSEBLbSR+UNPIhUtZdsN2wkVqg90r86Y5dzHI4vxb5+kYHJcg8GfUazjIl+aPk1xuB6StWW4UhdgCknwctqRdZaW69O9ljpAYbjYw6ZwRQgY20gR4KqZPnU+7h2RXeh/dYTCF0r0f90lHyHp8FynywhttcuYPzLEPotAIgnC6/W8DJz6OF/RK17MIr/GPD3M/Tv6K1Pr4EsPc0qBxLSb5l/XMq9Higkh2Muc9lBU3mkOBpOXdhLBEplSTDxmJy+oBb5xMcsRiwSlK3bNOomVtqK1LKL0oFEvNJ+vAu7Whlz7IqPa8PI7yEPqs34Y7L0rP8cKGbE9PB2sMxzOcgrSdZthhvmcAQW5Wwd4tvY9oaKrAymLLbd9JjqwwzZrbjWckANuF8c+7F0dgqPkuvMH2vSvCUUoIr/1iihehoDli0tnbWrZfC/oqJR1SN14nObT5V7LGwqGjcvNrfFzDsqa7Y+DWFpwIn8o74PrWlVa1enPyRnoB6hH8u6zg9DHOQ4QKFJ1bcneiBcGvg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4307.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(261009223027099003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Qymt2HwWWuZnVuUFmm+9LgcIPVp9vkHUPageIYNOU7A0IRHsHL7nBPWYiB?=
 =?iso-8859-1?Q?t+6S4fzepHJcd3+Fy5elnxa9idv/QYVWYw7KgU4yv8wl5VYFyrwB8bsg5B?=
 =?iso-8859-1?Q?qwQw0DZhhRhZ/RQkLXI7VczIlsHcXvXVkVC1BQaZ5fDE2OScROK21C7fmV?=
 =?iso-8859-1?Q?N4o7PF4LA47uOT8ZsLbayzqRwoudR1cq5UHdUlX2Ikbkc1N3XMAYyt7o0N?=
 =?iso-8859-1?Q?q+kkW3Z0HHmTbXGZEc9kDEgIutsFvxGPa8YtsJS+khpczoYCX2a+x/tPL3?=
 =?iso-8859-1?Q?VW1OByBcUppn6UVzJ+TK2jDhTLtONvEnutQROzd+LFzWNzwnYDtxZZwOjG?=
 =?iso-8859-1?Q?5lddyWv/s6wDxzaD+fMyQ4FzCRpsjpcnnQhxlLbcoKIKRunNezydMzinbp?=
 =?iso-8859-1?Q?5X+3ADs+MOjPGibw4sY9tl+wlEPtkky/FL0uSV+OUaxNdhrOvdxxZps2J/?=
 =?iso-8859-1?Q?/8fKj7cW5DFoiiXJ6FzlG+GkZiYHmdY9cZba6ip0ikPsFO1qcu9RqBuPiz?=
 =?iso-8859-1?Q?a0tioi1LoKu7m8sm0hg2iLIIfn0JiMhocE0MI0bdDWBVUzpOfHtSr1MoSC?=
 =?iso-8859-1?Q?8vqpAadOrHA9F/dWsfJmAkZ7HWAkk5Hmshefdv99ryrK3EeaJd3o5Jctv6?=
 =?iso-8859-1?Q?JgM5aQ7I4+ub1WY8PIRA89JIQ81Gi59WPQZ1I2KHjmEgVZMPgE7B1dlMmn?=
 =?iso-8859-1?Q?saRupACI4QNNQoLZRDmZLaGF1Cr/b0DU7yw54WXB5f/2P4nsmZWZi7cVpz?=
 =?iso-8859-1?Q?RcaLBZHHHyQphwoZDroH7TsVJOXRXqJbisLQbNIyTG8SLarBTNdVExGOPj?=
 =?iso-8859-1?Q?/AqMA/sBhX4ZDaxLqhmSwcpxTOmoP0e6voEIKVY94hkT7Gy09L1cQmGz9d?=
 =?iso-8859-1?Q?iizf9PJV+nvKKbaJ8zM/62lr3LvTCzmEfvB4O+lJ41l6yzj+uSBc/+h1uw?=
 =?iso-8859-1?Q?5lZVu/3yBpvSZJbFgv+Pf4aZ9sOPmssp3ehqDtm8ju5Be0Y2sGAaPo6neJ?=
 =?iso-8859-1?Q?HDK8KsbVzbTylq9IJVhjbgJGqSW7hW8MB3d5G0aNVNWoM+lt+mhMSTT2Uc?=
 =?iso-8859-1?Q?79xieUHi8cRM7yBFbtk1Pl+q3zpFubF85aYV4lsWtGTwBGaNR8LVFGjxZz?=
 =?iso-8859-1?Q?mLG7zBBVnivQaQOJHYDHre550qdZZ/ORrDZys2fsjI5bOXE2KLpwBrffnE?=
 =?iso-8859-1?Q?+C8O9GZ5TvB/GB+2a/wxHNjf1aOvfStMSCduX3kPUo9TsZbmODlz+/HtNW?=
 =?iso-8859-1?Q?D75mpljhD/TxDnNO1vMcd+NLrqsEocJguuNQuH42xiZu5I81wTKZFOFuGj?=
 =?iso-8859-1?Q?fEKxMNBUX9Bj8N2IKP4ggxw4iEj6v2wnhlNwo09lrH/Ru6iwNjzyaqNb9X?=
 =?iso-8859-1?Q?5yWimq9V2c7pE9byfuRbnR1WNDbrByQTsEtTlJpjKICh1fN4xWQJ91HlBa?=
 =?iso-8859-1?Q?sb1YuSKYIYGN5pXh3/irQJHleJG9Ctk6o5zTZvC9rQNsxLA26MS2fxeqOn?=
 =?iso-8859-1?Q?6qe473i9BD8jq3a9AuWUIP8eR4NwLx3VKXwiYHKWJDbpg1gTnY5Y+8TreN?=
 =?iso-8859-1?Q?hEyUK2tHtjoq6QcNbbgbOw15uFUAm9R9qrdTFVqmSn1E3F1SOuS4B1grTq?=
 =?iso-8859-1?Q?FnfLbYOQS1IKVWAbM6XHyzpug/IMah4GwHrRNbvX5z3sROBnVQmKa7AYDO?=
 =?iso-8859-1?Q?Y+C9o9+IL02so0QBDvKWZ5SiZSbXJuyr1YH/V5/I7q9nMuiDLX2oTc0qdI?=
 =?iso-8859-1?Q?gikHEV5CaCnb+dhCdETaC/TgcBF/ty0SvED647kWCdWrbM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: earthlink.iq
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4307.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ff73e0-ae79-4c0d-6cf2-08df2abb737d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 12:54:29.4230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 89d949e4-9c48-4c58-9092-cf9b53301a04
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0MUMFW24aJKvGzIhoYmFzxQydwYoEXt4buf2AfdXHtOnyAvOqZ/3PJ696x8aLllGvj/+0Ise4S3AEJJn2FQkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10189

Dear @Lazuardi Nasution,=A0=0A=
=0A=
Thanks for your reply.=0A=
=0A=
Actually, I am building the firewall around nftables, and keep OVS and SR-I=
OV away for simplicity, but the problem is I don't think all interface type=
s are accepted (like bond, bond.vlan) for the flow table HW offload , I tra=
ced part of the code in=A0=0A=
- net/netfilter/nf_tables_api.c=0A=
- net/netfilter/nf_flow_table_offload.c=0A=
- drivers/net/ethernet/mellanox/mlx5/core/en/rep/tc.c=0A=
=0A=
if the interface is bond, the offload for the "TC_Setup_FT" is rejected=0A=
=0A=
=0A=
Best regards.=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
________________________________________=0A=
From: Lazuardi Nasution <mrxlazuardin@gmail.com>=0A=
Sent: Thursday, October 15, 2026 11:25 AM=0A=
To: Muhammad Zuhayr al-Tayyar <mzuhayr@earthlink.iq>=0A=
Cc: netfilter@vger.kernel.org <netfilter@vger.kernel.org>=0A=
Subject: Re: Nftables flow table hardware offload=0A=
=0A=
=0A=
[External Email] This message originated from outside our organization. Ple=
ase exercise caution when clicking links or opening attachments.=0A=
=0A=
Hi=A0Muhammad,=0A=
=0A=
1. I only have worked with OVS based ASAP2. I think it should be the same w=
ith nftables, so the nftables will be on the OVS side as control plane.=0A=
=0A=
2. Like on OVS, you should bind PF and VF representor to nftables. Don't fo=
rget to enable "offload" flag. For LACP, the PF is bonding interface.=0A=
=0A=
Best regards.=0A=
=0A=
On Thu, Oct 15, 2026, 2:39 PM Muhammad Zuhayr al-Tayyar <mzuhayr@earthlink.=
iq> wrote:=0A=
Dear Team,=0A=
=0A=
Greetings,=0A=
=0A=
I need to verify if the nftable is designed to work with this setup, I need=
 to implement firewall, but with hardware offload for the flow table to gai=
n the maximum performance.=0A=
=0A=
I am planning to buy NIC that has hardware acceleration like Nvidia Based c=
hip ConnectX-6 DX, which is equipped with ASAP2 features.=0A=
=0A=
As I understand If I need to implement the hardware offload, I have to expo=
se the nic eswitch to the kernel via switchdev mode, and in my design the s=
erver should have dual home connection to the switch, so bond is required, =
but as we exposed the eswitch, we have to make hardware lag with LACP (802.=
3ad), and this will make the forwarding database shared between the two por=
ts in same NIC.=0A=
=0A=
At the end there are two representors should be exposed to kernel to use th=
em in bond, if this setup is blocker, we can fall back to single connection=
 instead of two.=0A=
=0A=
Also, in either case, multiple Vlans should be passed on the uplink interfa=
ce that represents the uplink peering plus the Vlans for the protected serv=
ices.=0A=
=0A=
Note, we are free to use any kernel release that supports this feature.=0A=
Our questions=0A=
a) Is nftables (netfilter) flowtable hardware offload officially supported =
on such NIC, if not it would be great if you share what it is supported=0A=
=0A=
b) what interface should we put inside the definition of flow table in nfta=
ble config? Is it a bond,=A0 or the representers or the sub-interfaces?=A0 =
=A0I am asking because not all interface types have handler to the TC_SETUP=
_FT.=0A=
=0A=
=0A=
Appreciate your support=0A=
=0A=
Mohammed Zuhair=0A=
Earthlink Telecommunications=
