Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE8877F12
	for <netfilter@vger.kernel.org>; Thu, 15 Aug 2024 18:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723747694; cv=fail; b=PxERwt0R4nXJg2aZHOri0ja8+35I8rOo7/L6mavHj3noa65jpe1I8kQV9+mAyb027D35u+gTyJ5m6KTP3cg2Zorxs8NFqiT3gmlB0TRweBku1a2UJC2pGEwOtqLJ8B9nSVNgjvMeskUva1/njKyc69MPQcEjruqqhOuBmUVOlAY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723747694; c=relaxed/simple;
	bh=3XTZX2f5O5BGYqN1XWOw2vgRnN1O48SOU0TJsT3mHCM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eDcz4P7LCEvT+qPaMBRP+qSQZgvUpeCJNoFy/ireXw84S+PfkhQaqg3uXGku3MrCyRJThNLw/3V+JaakcG+x9Uz1MUeichFpLFoOidPaAC5jF13LaoMWe04sK/QIT3Riy0/XO8yt8MGCtn0URPPEcKEwDim0PD19zcy7MENb+/k=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com; spf=pass smtp.mailfrom=netapp.com; dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b=yfzAd0gE; dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b=yfzAd0gE; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netapp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b="yfzAd0gE";
	dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b="yfzAd0gE"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jK+jffv+pPwvH0TM5xXDeaNvz00PHt3ZWXgAUX2gtz/tSBXIGkkcDMRSBgoi4Pjbsym3RSKpmkK3ZiNSVACid2VHxFwy+iPe0I/1Bm3WHtQh5tVv7aLFi8EcFTHPkHfLiivy70T43Kaplr5EuoRGARM3s/3MIOAADZjo3u473ZNRAfF+jHOxEyNhYaEAqRSnWZT1X1ZvXKE2xmS+oJWrRasx4CmF3LnM+XfxttZZXHuLU9tHBBogvq4epQSe6mNi35qMwZN5EBTQYp3ZNNrboUvkIKXEsg5hxvjfbPuyA4WeKj/YkXpYJeCYoBKIK3g/QgZ/7QCM/1npCC2oWpt1CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O47UJ5G5Gz2HPYjMjMDm+6Cxh+0QbdlFBf4Jf8KyPmM=;
 b=Dw0QUliaL0BJoNZsRtY7f46py9IluMtuOZM3n8MG5vDPRwLEiKQz9Jtz1Rll6rFbRI0f4rPjksxnLvnfkO5Smp1QMxHo7RKGhzo60wjfn01w8/JaPa+G6DI11jWmk3yig3rTOL9hJuCLFRkuunby8Cgc5QNFfoMRGrvZtoVpiWV8M+TP27r+Hh3feHqOSmH7pbw5KgMwtKFpyKQN316+UJ1bULMPj1vRPwlmlA7CwQ7iB6HFcvehA4DOQzfDI5Z6gspPYvIZ9UE39w0eua53Hihqbm+Bd8GSoqZlBzUgMXdXH8RUJ/wpRqAVo8wrSjyd2sX3lPHNxNKGfUkX1GllLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 104.47.73.177) smtp.rcpttodomain=strlen.de smtp.mailfrom=netapp.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=netapp.com;
 dkim=pass (signature was verified) header.d=netapp.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=netapp.com] dkim=[1,1,header.d=netapp.com]
 dmarc=[1,1,header.from=netapp.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O47UJ5G5Gz2HPYjMjMDm+6Cxh+0QbdlFBf4Jf8KyPmM=;
 b=yfzAd0gEH/vzzGynorUgVlNEqIe+eOuBYaRtfEor2X3GaDSJpWv6+wdoy9Dc5zRre13fCPcJXanF7lLtwQr6JpZnQKaLj2fNvsrIPHfFoWsggPZ62dpJ6xX5X4RH7UN/QRLEDWKK3XLVtj4ORMAC6jS5Alya9Cx6HLymcnqVi+L9pKa7ak8f02/JjLBy1v6JbWmRofiugO6F9y171CTy323E1SFwU8UwL3vrqW8r4UyGyW7fCgQsPmq5YwwZSrbRUseENXcCh7jQVhUBUzdd619CgRum2vUQ7gKTOvBzp5MNKmfdMjc8a38SFaW/fXX9RKEACTAHBlD/pbULx3WPjw==
Received: from SN7PR04CA0002.namprd04.prod.outlook.com (2603:10b6:806:f2::7)
 by SJ0PR06MB7847.namprd06.prod.outlook.com (2603:10b6:a03:399::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 18:48:10 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::aa) by SN7PR04CA0002.outlook.office365.com
 (2603:10b6:806:f2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Thu, 15 Aug 2024 18:48:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.47.73.177)
 smtp.mailfrom=netapp.com; dkim=pass (signature was verified)
 header.d=netapp.com;dmarc=pass action=none header.from=netapp.com;
Received-SPF: Pass (protection.outlook.com: domain of netapp.com designates
 104.47.73.177 as permitted sender) receiver=protection.outlook.com;
 client-ip=104.47.73.177; helo=NAM04-MW2-obe.outbound.protection.outlook.com;
 pr=C
Received: from haraka00-inline-api-pop.vpc-50c51735.usw1.shn (52.8.140.255) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Thu, 15 Aug 2024 18:48:09 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by haraka00-inline-api-pop.vpc-50c51735.usw1.shn (Haraka/2.8.24) with ESMTPS id 3F56FE6D-121C-4EA0-A9B5-C186B0655062.1
	envelope-from <Brian.Atkins@netapp.com>
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 verify=FAIL);
	Thu, 15 Aug 2024 18:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXUJKilQZT56r5nmAILIuaVgScJHbMq2gZ49u77xDswRt/IkpTn8gTfS8fdHsW5MUaBtdp+0xqocI9H7cy6RgjPSNO4UxrGN3qp50w3/MwfKmXqYf+ZKFTsiVUkqXZJ20Qhz01LbcmCrLLa6N1jIVFgTFGkDd/SOpPnfvu0stWiXVX24HCBHOkKJsIs6J+uHCGviAsfBI5f4yeoMsF4LicS5CxkMgig2VqyrVJUUk49F/IjqFYT9jR+1sSvag6NA+vgx/QC33X33yuMaRGpYIeo5WEGZmfQta2RLfZXTHxQbU77Mqsjjj6ycoB5f1pamjN0wYv34nWqt6DW1WplxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O47UJ5G5Gz2HPYjMjMDm+6Cxh+0QbdlFBf4Jf8KyPmM=;
 b=blk3lRYLw+CWao+tARJg+UnKXCWOAgyuYK7ZgBEEt2yZLeJe1NaCL65kIfJoN52QJHTKPhCq8OUvq3isfUWsFbjAo16jcFTRyqoMVwk3JR6c1n3qSBkAriUDMO1UXY5AydvbjURpBg7eVO8/oaGSe3c4XuTJHJoowoFR0kwBr/EYO6JyHe40zhNDO5xDBsKgkD3m12JPJvChzcP+C5Chn+qUVBGCbt+grQGR9qBZNCO29GVRXQcI2Eg7yxW4kYCkVYyHwqtfE26VxcGBFKjlubM6YXMPbqya7YUCFU2pzTpPFvBLItPIUUvV3AR8JIAwaHbKbEQTKz53Ija97071dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O47UJ5G5Gz2HPYjMjMDm+6Cxh+0QbdlFBf4Jf8KyPmM=;
 b=yfzAd0gEH/vzzGynorUgVlNEqIe+eOuBYaRtfEor2X3GaDSJpWv6+wdoy9Dc5zRre13fCPcJXanF7lLtwQr6JpZnQKaLj2fNvsrIPHfFoWsggPZ62dpJ6xX5X4RH7UN/QRLEDWKK3XLVtj4ORMAC6jS5Alya9Cx6HLymcnqVi+L9pKa7ak8f02/JjLBy1v6JbWmRofiugO6F9y171CTy323E1SFwU8UwL3vrqW8r4UyGyW7fCgQsPmq5YwwZSrbRUseENXcCh7jQVhUBUzdd619CgRum2vUQ7gKTOvBzp5MNKmfdMjc8a38SFaW/fXX9RKEACTAHBlD/pbULx3WPjw==
Received: from DM8PR06MB7717.namprd06.prod.outlook.com (2603:10b6:8:37::11) by
 SJ0PR06MB7195.namprd06.prod.outlook.com (2603:10b6:a03:2c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 18:48:07 +0000
Received: from DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3]) by DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3%6]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 18:48:07 +0000
From: "Atkins, Brian" <Brian.Atkins@netapp.com>
To: Florian Westphal <fw@strlen.de>
CC: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: Output port redirect going to loopback?
Thread-Topic: Output port redirect going to loopback?
Thread-Index: AdrufG2gtoXCMY8lSJmxnrEwEYZooQAxXJSAAABwRNA=
Date: Thu, 15 Aug 2024 18:48:06 +0000
Message-ID:
 <DM8PR06MB7717EFC694E792AD29B28BB0F9802@DM8PR06MB7717.namprd06.prod.outlook.com>
References:
 <DM8PR06MB77179054B381DB1DA67B0D4DF9872@DM8PR06MB7717.namprd06.prod.outlook.com>
 <20240815183517.GA6867@breakpoint.cc>
In-Reply-To: <20240815183517.GA6867@breakpoint.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netapp.com;
x-ms-traffictypediagnostic:
	DM8PR06MB7717:EE_|SJ0PR06MB7195:EE_|SA2PEPF00001504:EE_|SJ0PR06MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 606efe3f-515f-4d8c-f355-08dcbd5aceef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?QJU/q5jgREyyeWdxa/Jvk4rjOEPepRjo3MHdBI6LwrdPrKNe27ZoHNNh2V7G?=
 =?us-ascii?Q?Y5f72BcmVVazRPOxsK75XqtuM282gfR4RmQnhntcvwPc9yGdB6yTt8Dr2XmE?=
 =?us-ascii?Q?hO/hWTP1pjZKTaHjMFsuB17IZItGICyDTs2CCn89ztOew1MJVcp6sJFtQJY3?=
 =?us-ascii?Q?SFc1iPAb7Lc224z+tNmdQjD7pWI7ZLpJA833Ty2HOHBQIh1tHjsaUnc1Pu3p?=
 =?us-ascii?Q?3NCGH7GK5ubMA269aqwXIdP61cjp42k4u9jsrj8hTxCb2AV0TJyqtgZxU/n5?=
 =?us-ascii?Q?jnJANVQXPNho8VSAEB84MleDe+JAoDG6NBYd6d3SVSeKksi0NisMjMUTTCk1?=
 =?us-ascii?Q?KXh996zQ+/fpv8xuZyUHo3UxmLfSrr0iqLsFITRDL4viFGzgYJYWy1lVt9mr?=
 =?us-ascii?Q?+mfm+ScWy7ISZFhvY8d5CL1u0GiCgScM4jPVScK5kd4UAnHG08sjOt2b/ypQ?=
 =?us-ascii?Q?szxL1Jc+FLSsLI0K9GSussdqSuqcPMP1LlxQG5jlNZ6l/l4JZnIhcqJkchJo?=
 =?us-ascii?Q?Dzrf06ouPNm/X5F6S7Gejf62CIN2F3d3e9o+pAX/MwNNA4Iv6usZJULhiQkr?=
 =?us-ascii?Q?Vyd+v4G+3MVHSiNCei1BPdu4Pz8oncD6520JIEI1CiPjBm+/Y+kteognQYzL?=
 =?us-ascii?Q?Y2XMy0ax1IdpH/jaXnJ+oyLqvnGd/cbr9dmOk/sozpUAmqxWiPu/MpiAqdNS?=
 =?us-ascii?Q?NhbLeh84YynaSSVM5TeBc4SLEq8oYH4+gvKKR/2uYUnLnd42tlYKDhTdYy9X?=
 =?us-ascii?Q?l9kVXCu1u9Fy4PV2FhS3jaKoNom9oFYN7jMh10Nw/LyJwQwHcQ5//ysnpNH9?=
 =?us-ascii?Q?eeVLzohGHMsMbipo1d9au0eQzW8MTaEKAiXyZlgGUhT4ltt0ge2c/Tl3ZgoJ?=
 =?us-ascii?Q?Cgx9lz2ntRbAqeHFIFmFFhhhCPuPdyCXBzJQMcFnKO0UXrdCMAcI50f8jC2b?=
 =?us-ascii?Q?iVwX0G98Epw2oztJmfhIFl3ohyq0XYquHduokPHPvas738Sr5pGj0o/qX2LK?=
 =?us-ascii?Q?LVsOfmiQQ80wEli65pUAUEgEur7NLkCgcWoFkNm6g5zZ0YqBlzLcJ8uzG0co?=
 =?us-ascii?Q?VSXcD3aLIZtrtKN29N4KIJwMoMj62GhcBnw2lpsfs/IwI/h322WmJEQMc15J?=
 =?us-ascii?Q?Qf/4fiTAYG4O+zRJRj7xzJ+Kr2iEbPxSpEbglylB0zp11uOcDhVSgJT0GvbG?=
 =?us-ascii?Q?gmbD+lDDt1YAmk6u2eIWCsHa2GFGA6A5cIxoVQwoc+N1bJLgaUT0xGBBTFN0?=
 =?us-ascii?Q?1MauyB6GohcGH2tGXVYoxzeTfZWqz0RAjm97e8FZ0O56/oOLxW1G0RxNawmY?=
 =?us-ascii?Q?1S4lVB4CydxzhvXQLXdS0EpYkfNHKzIFoxGyrzdmq5xhbxE5eIBx6/TUjtUm?=
 =?us-ascii?Q?AAVN3t74WyR7u6Yyjvi1t2nmnm33dkMDHBtQxtpA0gHRM1QQGg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR06MB7717.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB7195
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netapp.com;
X-SHN-DLP-SCAN: success
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[104.47.73.177];domain=NAM04-MW2-obe.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[104.47.73.177];domain=NAM04-MW2-obe.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0fa60d15-5338-4351-e5f3-08dcbd5acd5e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	Of6QQUWhDQZsgLnnjEXJM2MoqSp2gmRkVuWgiH6v7GdIJoPTg9JQ7IRejDveiYs37Q//dcv6ZjW1KPi5jE990jwuhgZ+nOZxHV9gzAsxKRngu78NFbCs/tZtBnQjf6o10knVQo+BY0JdZLbfCfrvWPk3+aViARmCnABhMnDIEmZIwNj8mSQAEJbuAlJec8ciaZ8VCxjUlaqQreNjSukC1IQXazYOCy4HOgXFmUloObYhuKh3PYc/NkoEj9EmgAbLDHyOeelrsGDcx2pZTn56W91y43XvVo5rmQGQfQrwfnd0LWB4cD8FmlvFlc1SBuTgSxjFg+uOnOYaBqmbRITfxSpQLITNIXNxG0EAQQ9JhWZkl1x7HJVMKHk7uwtFYyYTXAp+jLOV98OxkVuxIcv6sAnxJOGbaGsCofh6V1IUU0lTbAK1anZQD6h4qyTzaGbm2qrHd63BQPLR4qY4ZDtN83RsPlTySJpnNjg/GdxfKNNwD+fPPKOH4Ft2bUQ6CIynPS2gF18sqIWFpzrYx0/WWWrl8xdklpO/KHQ+eQ8oI4nqvK8SdI81MKtlDyaBAXHqqKqiIBp58Y9GmuGdAoekqv3Q0LndUXZZz9q8nAY3OhIb4v5vsMKLEuzZBjcDkuewTXZLgrPP3bCXEqdVni0svlPedbqZ3p8cXI9rcDZJTG/0zVFpRmZC2KCuiOpOKDIIWmZAmDHFNZJMuA/7nMzE0xu/MKJigPQ9cSz6+UQInMbO96swBOx6ZB+a0ZEaMiRLbdWSkqZkgkebrFfOk7UNH1qievTE35+yTr3hP2ZRe6+dqyFQbyuzNnx0WO8/oX6L2hxT57c0HSKSek8Q0cbQSA==
X-Forefront-Antispam-Report:
	CIP:52.8.140.255;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NAM04-MW2-obe.outbound.protection.outlook.com;PTR:mail-mw2nam04lp2177.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 18:48:09.4743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 606efe3f-515f-4d8c-f355-08dcbd5aceef
X-MS-Exchange-CrossTenant-Id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=4b0911a0-929b-4715-944b-c03745165b3a;Ip=[52.8.140.255];Helo=[haraka00-inline-api-pop.vpc-50c51735.usw1.shn]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB7847

Thanks, I missed that note in the wiki.

-----Original Message-----
From: Florian Westphal <fw@strlen.de>=20
Sent: Thursday, August 15, 2024 12:35 PM
To: Atkins, Brian <Brian.Atkins@netapp.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Output port redirect going to loopback?

EXTERNAL EMAIL - USE CAUTION when clicking links or attachments




Atkins, Brian <Brian.Atkins@netapp.com> wrote:
> I have the following nat table:
> table inet nat {
>         chain prerouting {
>                 type nat hook prerouting priority dstnat; policy accept;
>                 tcp dport 10999 counter packets 0 bytes 0 redirect to :99=
99
>         }
>
>         chain input {
>                 type nat hook input priority 100; policy accept;
>         }
>
>         chain output {
>                 type nat hook output priority -100; policy accept;
>                 oif "eth0" ip daddr 172.16.5.220 meta nftrace set 1
>                 oifname "eth0" tcp dport 9999 counter packets 620 bytes 3=
7200 redirect to :10999
>         }
>
>         chain postrouting {
>                 type nat hook postrouting priority srcnat; policy accept;
>         }
> }
>
> I would expect to connect outbound on 9999 and have it redirect to 10999 =
and reach an IP address on my subnet, for example:
> # telnet 172.16.5.220 9999
> Trying 172.16.5.220...
> telnet: Unable to connect to remote host: Connection refused

Expected, redirect is 'dnat to local machine'.
