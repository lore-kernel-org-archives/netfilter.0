Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59094E2F1F
	for <netfilter@vger.kernel.org>; Fri, 18 Sep 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729528; cv=fail; b=F/qfg35Amktp3QOYvvx33TTTZ6S6aoXANGAu9cSl59nWCgNEu4DdzDm2USiKnxKo8gHi3wzFlcdjuS4HwFunPksgDTqYwn9jBHEfDBl156L8nqUn2MhQ8RHG3rkB6A88OM+AbeC2Tbr2stiZKIcBiouPA4ZkmeXiFpNsDiVIVRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729528; c=relaxed/simple;
	bh=mvlCqdih/8M8GPcj37LE4+opuAMEaY8ILk4DyZzQjKk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=luAUKpvko15cXqbLbiG1r23Y9PpsiO/h7V4d/tvxOBnN1c603br3WjhzAdf5c86qbVV8+epU+AFrBMUJImuLwnKSWE0LrrY2lCYYDi50dzd6pC9QIIVNDddO12yMIfJ7labnmPs0KgURM4Nzd1YpfS1MFUM5u1NOfxIpuFYd5Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=SiGqDHP+; arc=fail smtp.client-ip=52.101.83.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="SiGqDHP+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOyHBpzZy4U12WxM0bSyzKGUC7YtyNY+80VFabVcxZVu80xtqQcdW5BXDv3EStkr5+oFWwHljWroKpQsskN3r/nWJVDdY7O/vegQqqgm7uXHGg2Yh4lQRlwVwud8gjWKH+WgIYp99mTVV6rrRY6fA6ckDjks8oCYB8Hmx5IfNRtIohcB7miXlZBr8JhTy4W98i3NQROQvhquQS2puf27vpx3XIGXb2UHR7tB+wKbv0ikRMWUb3Bbz1AQnNtc0JPeUy4OcUBNCibpXOq89OWiLQSWIxvFIaGACmChDO8U+d1FcEf785ulH70B2QoCYjyKMtHvsrf7y56qLXE9VkVuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvlCqdih/8M8GPcj37LE4+opuAMEaY8ILk4DyZzQjKk=;
 b=t7qK0c8Jcf5htne6eKQR7sZVQu99blOcVJOk4S+K2KAuK9dHAr7D3vdxlFlAxtRzpi++Z240rvvNM7u5eYtnanbeTViZxBKS5LdxNyYxe+rgIgCPA1gf6TbCPJgS4GpSv1+EHOHWj4WDy8E+tw6X+G8xhdXbZlpqIlVZMpuDYoyeUuSKP93am9xNtu7YipTNAhq3sUoalp4fus9Lu2iRLpPmgvPtaq1N8LmVPI5zBdVSHE6P0Ww95C5qtfqnWH3D7Cq6Pmsij33BkuGEFI8VBV2xs2bDpB9WpAJj+0eFsaHUaSXBehyLrFenLpY7RC8ieH9VO2dqpgfT4hZ2h1635w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvlCqdih/8M8GPcj37LE4+opuAMEaY8ILk4DyZzQjKk=;
 b=SiGqDHP+NF3/P4nPDto9ffhCfvsStUzGG8ztuy6yBv7cg4ab+ZqpHRxXg3cS3tJqjDGafJtziUFGnLRLSwI5Nj0CNXUKUWR/d3Y2eQhTM1ZBVDHwEo+xsSjfH0WocSDxmVymaiuhabQJj5olsKX4Jf7eFQkgYmJqaRPftZNFwRwKkOS0b8fP8NHP01BTsSze1mnlJwsbwMNGE6u/a05ZpvGvy7x4x0/r0hdcGaexCpe22JCL/ZNvSeQqJSerIhWPz8kHX67IZuf9ddW3l6EbXvSHiPMmHnrU6AlegREYReGadN1M/UFor/EGs7bKiH00D1VpegChU4iV8qm56h4qqg==
Received: from DU0P189MB2227.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3e2::12)
 by VI6PPFEF14AC1C5.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::1ad) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 11:05:11 +0000
Received: from DU0P189MB2227.EURP189.PROD.OUTLOOK.COM
 ([fe80::7939:4c37:40e7:58d]) by DU0P189MB2227.EURP189.PROD.OUTLOOK.COM
 ([fe80::7939:4c37:40e7:58d%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 11:05:11 +0000
From: Henrik Nilsson B <henrik.b.nilsson@est.tech>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Question: is git://git.netfilter.org/* down or have the git repos
 been moved?
Thread-Topic: Question: is git://git.netfilter.org/* down or have the git
 repos been moved?
Thread-Index: AQHdR11L+WFxJsIoz0qVrsqoRqMoKw==
Date: Fri, 18 Sep 2026 11:05:11 +0000
Message-ID:
 <DU0P189MB22277AA490C5FA005F58391AB7872@DU0P189MB2227.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P189MB2227:EE_|VI6PPFEF14AC1C5:EE_
x-ms-office365-filtering-correlation-id: 7d8fec91-33a0-4956-a16f-08df1574b546
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|38070700021|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 0O/hhFDTTW6Rm9TcgnI+xA/HVRdrfbbt4ahW0X68Wecgocte4C/HUVGIOSlo1W5pMlFkX4TXuAM4WHicwuhUVdKYUZXrw11yyCuO+LC/lqj028feS9nWIKSjqhR4kL/VE9JQhCPZqNHCTWU+7dUrmapItER81iL+9/fsAe4gclLNSTY1mLE7EhnOTdTfiYvEHs0TinhuTZDhq2+OJx0looLbvnPPuHIYIkjEvRKQxCVnUoJdWrJdBSwc7k6AvKSjAbteEU1ge9qYel10id/3/aWJaAztP3u/OfG8N/T7FSFxq7HUUUz/X58m5TbYSTefYgp1HYWRKp7UHJbgI7Jl+rAd3UR7vZjG6UZRPKKy/qYchn0lBA2Wja4nvZK4O6JNX9b1/MslSgMJ2KsmtuXphWyp4Kjp0HxFfDQX67GCzNwyvUZOvIhOS+/jasn7rpb+/3mqug/9dU9HAnZuMKEBrJ0vZZX+Yh4JKndve2d4aCC3YbkVy6iDiykoZXhYvS9GvMTxMzx/nz+jUayxSxKbnxtic+RuAmKHep7OkQidUtXtGBq4P48MxsY0qgSMQjLkaJdnXyqKmDF0eAf/AbTX/2luw7HPo/3Nc4m7qMTKcs8fjvx1f89iOmmp0/h9UVe7k8XI4Izmz/13R0f+s3yEjQR97A3cgCfMYEgqmzCVBm5Txl7b0/z/xu8miS3RsX8lmqTYZ62IwpgOUQVJ+X12vbpaQ7oi0D3bRLXjCC6G5Bs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P189MB2227.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(38070700021)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?atTjn5619B3Eteo0m2TjwpBAP/NaN4Ex9YjnHJoGLjBPwyi16ezWEsnVc/?=
 =?iso-8859-1?Q?gxh6dvDZsneMA+OkdzpiNZSuPRRNpews4EYoJ89ecFWCTpLKWTTbcGZrd3?=
 =?iso-8859-1?Q?EH0+M0zwS2F6bppRflyTlbJ92P7l7FFbWoiqA9tQEzntou9HLx8FqMoaw9?=
 =?iso-8859-1?Q?Ivx4J45HjrQtMEAIoIsrJd9HmE1XsY7vvVSs8JhEqoF0TwZyU8Whief3id?=
 =?iso-8859-1?Q?XtyMX85Hok/7Fvv3XRv27FMbEnLHe4omUrJVnNkOL82ry6mPbom7x2njJ9?=
 =?iso-8859-1?Q?OsPKRIF5pYJheboqubCPM0CkmrWYA/hT8VwPwpbAlrvhgRjwsjrA4F2Xpq?=
 =?iso-8859-1?Q?gwipFviythegMZS57dL08RLBvtTvUGBYxlAzOf/mhV3LJ6PbrU3URs608I?=
 =?iso-8859-1?Q?CUVThAumdtclp4T8UTfVA16VtbLKYstLB5MxjVlEQEiMVZH1Nt3KsiQh12?=
 =?iso-8859-1?Q?zgb53IwhjjdhIQcNU3shw5c7QHXqj+25RUqOqVenKze0btmj97/C/QHNSN?=
 =?iso-8859-1?Q?L4mRKhjdPlLfzPWCyVqoSTHriZ182ub8T8ECeAx+h2/q05CgnCtt90mTKq?=
 =?iso-8859-1?Q?xCXedJuZwuEuL2EWV2/cihDa+tCmwv+Lqw9bt+bP1itqhMXWV4I9EZ7FhB?=
 =?iso-8859-1?Q?lRQ4ss0WItx+wCODQvj0K+Dhp6MZKwvg2V8xO8Bf+2dP18oIMkIWMbNVHW?=
 =?iso-8859-1?Q?bRRIYKPCkPIKvOpGfeNLR2Bvb4WLgbLSTddTOAwub1N+uE1G7ADYys8W3w?=
 =?iso-8859-1?Q?AR6fW8V5A3bB+tymvu6MIBYcwdnsiM7F5h2T26PnopNZKObl+eg3s9rtLR?=
 =?iso-8859-1?Q?3HO3BCi3TbYr2XeM76sW/P9bFEKAiKdai8X2EqqLbbqkrgkazFh6LPrx6/?=
 =?iso-8859-1?Q?rPvIPGaTYbBLKzth1ygqk4b9GqKZUbvzdt3dTM1hAZRhA4KR6Qx9ZOkc5u?=
 =?iso-8859-1?Q?crLQgHtN4tl+2//9Fcvupgeu3z6WBaVPVe3g6AMuckPxVRZQxFN1bORA5P?=
 =?iso-8859-1?Q?G8BYb54FSj54bHq/cyIbN+zjtsXOOTQ2n7iFIPPdOJcDM8HxGA1lIxHKhp?=
 =?iso-8859-1?Q?XUw9/9kJiTwR8Zur6QKXUMOwdK9j40BoJcjtwRsklSfjdElxYVCNEKNqhJ?=
 =?iso-8859-1?Q?H7aBweIYlQsktL96/RnANbGFjrhZ6dR+enoDLS/2PtGd17ocTSwuus8d3v?=
 =?iso-8859-1?Q?OK1iemkJkZQTXQ9a9KnYZVcZJT9RIZ3HxOh+ju2RcT+QprfJkQSfJz7E0P?=
 =?iso-8859-1?Q?Jrgh/2ae/ShHff+vrLWOUH0ulzjXIBVxwbriFW1TScc+FgJDzkyyWTc9J6?=
 =?iso-8859-1?Q?ieKWog/At30HK2rI9kJ4Lt9V3yKrzc5Fykn6FYQ9dFr9WTTzVLWrKJ7HOa?=
 =?iso-8859-1?Q?KfNVmd3aZEFRPUQsZ8SSWLcxpid4DBZZIqmKnXKv60t9ZxKTW0V+EFE79Z?=
 =?iso-8859-1?Q?Ifi5AVv8PJ2Ivt+261dBaRLPOZHL1ra2uADyEzXr0QAhF6ydQM8D7s6zHm?=
 =?iso-8859-1?Q?oBQqXrNcIldhOrlAdkm1icPVyq0wAOoUXS77y7h8R85x1L8F3c838V04OW?=
 =?iso-8859-1?Q?hzmd2yXkZImsEfPUVentMJWkclFerkPOCN7YD4ppeNaNZqCdYNZ6xoEkWI?=
 =?iso-8859-1?Q?kFtfUku62zfeio2D2i/JNFtZOrr1jSuESNblsD1hy9NSINnkrYHUwp6qhR?=
 =?iso-8859-1?Q?72og5W8oRU6JJoFkGkFRLRkyEVtgP9jDhHpbSDTX7nEDBImeN/n6TXXm32?=
 =?iso-8859-1?Q?NQ2c7Z0ZTslJrtgjfpG72bCdySucwJ+gjILWQ/SQb92buFP6Fm0BDKXmHy?=
 =?iso-8859-1?Q?GlnmUDZR/Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P189MB2227.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8fec91-33a0-4956-a16f-08df1574b546
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 11:05:11.1555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UJBJdv0gbO049nVLKnNgoW/Z4ETTjZxgca7Ghe2qmOfg8NoYESodaz1kS1ugGtfHQTdpCErZB4kRxweNeV/910cZapxPxx6YEUdKIT6DnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPFEF14AC1C5

Hi all,=0A=
=0A=
Is git://git.netfilter.org permanently closed down or have these git repos =
been migrated to some other location?=0A=
=0A=
I have been trying for a while to clone the following git repos without suc=
cess:=0A=
git://git.netfilter.org/libnetfilter_log=0A=
git://git.netfilter.org/libnetfilter_queue=0A=
git://git.netfilter.org/libnftnl=0A=
=0A=
Example:=0A=
$ git clone git://git.netfilter.org/libnetfilter_log=0A=
Cloning into 'libnetfilter_log'...=0A=
fatal: unable to connect to git.netfilter.org:=0A=
git.netfilter.org[0: 92.243.22.118]: errno=3DConnection timed out=0A=
git.netfilter.org[1: 2001:4b98:dc0:45:216:3eff:fe94:c030]: errno=3DNetwork =
is unreachable=0A=
=0A=
I am trying to setup local mirrors of these repos since they are used as SR=
C_URIs by their yocto recipes and I want to use the local mirrors for our b=
uilds and only fetch the new commits from upstream once per day when/if the=
 source repos gets updated.=0A=
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-filter/libnetfilter/libnetfilter-log_1.0.2.bb?h=3Dmaster=0A=
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-filter/libnetfilter/libnetfilter-queue_1.0.5.bb?h=3Dscarthgap=0A=
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-filter/libnftnl/libnftnl_1.2.6.bb?h=3Dscarthgap=0A=
=0A=
/Henrik=
