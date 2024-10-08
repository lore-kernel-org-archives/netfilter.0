Received: from GBR01-LO4-obe.outbound.protection.outlook.com (mail-lo4gbr01on2101.outbound.protection.outlook.com [40.107.122.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13701E0DD0
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.122.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406783; cv=fail; b=vBgYcgy42GzMtk9I/USaXZa41YKqQA784jCrBzXu32CmKoVF+H8BNUwUEYhTN6MMp+b20PORNaHSDXF1zypRaN7f+AENC0OCKCnFEHd4DITXhnolsBDxR0IswI0n1pDXJ3PgKWUGoepal5nkt3espiqRVcA05V+wbQRq549xQTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406783; c=relaxed/simple;
	bh=eXtHtpOC3QLKpu1FgH/eu2ZQy3K4AradcFj4R6Oq9Q8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GggPFpi6V6cW59SassKfz0/At8+yCtgC4uRlMSc969Mix4IfNG9KoTsB3Nl+2d3a6/6k+yn6qnSbhQjCjK82DRhEiOw0arvM+JyX7r/c5gdKQXcoRDihLbuR2Q5INgDTtVCRUPHXcVsBv8Xw7fx7OiXGxEfRzGxBBNVf2sURfkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=excelerate.info; spf=pass smtp.mailfrom=excelerate.info; dkim=pass (1024-bit key) header.d=excelerateinfo.onmicrosoft.com header.i=@excelerateinfo.onmicrosoft.com header.b=uecODEDM; arc=fail smtp.client-ip=40.107.122.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=excelerate.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=excelerate.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=excelerateinfo.onmicrosoft.com header.i=@excelerateinfo.onmicrosoft.com header.b="uecODEDM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyEpNxf8UAQfZ2JFm1A5hSzdEfPieaDwJEt0T1RLkf4JN8Sa3jG0dYH+mH1DN7lHBjDBTlMMtqHciJNla86OWXS4pjmj4LbdfcIPEgzWOmbdwfFyDGlahqzWeMOJWreNNBJ6VlzstP97HhcBU8lQrQUHM4XSrhdCWjNf8/XyMgXpW++UyIsGdi545zZWVGTW0mWwd/0qvABeZmj6wdiIR2SEgtVvSdgWlTMdoxxOveLWOvI1xxEiBxmox12qhFErv5Og6lobonoKWqwZYLNXuaKG3FeytzZW2ji6UiFj7WrE3bWpFjW9w2nqj1R2tWj7nHc8y99NCfmtPjusikoAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXtHtpOC3QLKpu1FgH/eu2ZQy3K4AradcFj4R6Oq9Q8=;
 b=Z5jVZxtTIAoo1wvAopsxTMwwh7YUUhp13yUw3tBMyNrvxHt2B86e0VcPpmZxNtZohLEbx8YzPy5EhqurjDCOT347zpo51bUjs8ZNc9zBtwRS1hPSy+pgJ3V/TjkgGvWjCkqK/TAwOEDRD3aK5lSfRUJ/vLONsuuFKS0BDS5GIAPpwZgdrtponK7EiYX5ZHznnKxJI78oc28c0vKkqExN/i+mle1+aGmZ6g7ALzhw0JL5SwqEeKKsZeGnYNV6TKamqt4gJx+batD0pUTjRVb7oKPClS0LG4eV+/f1E6uIApKKl6CC/QlFfJFRrwIddnyJEUnOTRvSZAPM0hqmQ2jtiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=excelerate.info; dmarc=pass action=none
 header.from=excelerate.info; dkim=pass header.d=excelerate.info; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=excelerateinfo.onmicrosoft.com; s=selector2-excelerateinfo-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXtHtpOC3QLKpu1FgH/eu2ZQy3K4AradcFj4R6Oq9Q8=;
 b=uecODEDMJQG8D/pyLu+8cg1irhrwhh2DpZMhzz3NUWWCBaA0v5W9XCA8X8TNOS6vJEXESb4jdA3lLXLP23IGLLOOJmY8NOECTzf9qlPe4jBX0nnUAGz07l5KZRKuE8mC/kAJmg2PH2jVuoi/5COIYi5L5JmLs+wHZhCW+cjCmtI=
Received: from CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:115::12)
 by LO3P123MB3546.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 16:59:39 +0000
Received: from CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cab2:b395:9892:3156]) by CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cab2:b395:9892:3156%2]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 16:59:39 +0000
From: Robin Bussell <RobinB@excelerate.info>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Unsuccessful adding policy to a regular chain
Thread-Topic: Unsuccessful adding policy to a regular chain
Thread-Index: AQHbGaLkrQ5SuReP8U6Ah0Huspy8OQ==
Date: Tue, 8 Oct 2024 16:59:38 +0000
Message-ID:
 <CWXP123MB4792C9E58B0187197122EAFBD07E2@CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=excelerate.info;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP123MB4792:EE_|LO3P123MB3546:EE_
x-ms-office365-filtering-correlation-id: 99fc52e5-09cc-4357-c690-08dce7ba9897
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Cpz3ZSJYbpKeu6mlmtsdDDrU83wb+0wtllIZPCKxuS+IYy11a1vYBhgRx+?=
 =?iso-8859-1?Q?l+yC40ASsu5d+GFu1S2NQnmj7fiCedYejczXcJh5QJzLh6HlbnmQIasAgf?=
 =?iso-8859-1?Q?jqAAWkCj2Li4N9scNgN8Mz+sP7ojBKhhR3DFO540Oe2BS8yd9fhwm59Dbm?=
 =?iso-8859-1?Q?ySlcHVgL4YdFjeEqpneOCJq68MaPI0/1y9gTSOCDHBPAAnpROIC3dznhQK?=
 =?iso-8859-1?Q?SSOnvZEsW36EBfvmpSaLfFWPdLbFSYtyUaFjJBhh4mF464HN93R28DGgno?=
 =?iso-8859-1?Q?NlvP/aKXRGTzn1o9XOfQOC0OVYPrqhnVV+dsmopYxxk2ba+5xS7AH4YuSF?=
 =?iso-8859-1?Q?9WK+5SSTSy7EoHCmpER2ULh7WZ61jTRQkuuDnzZd5k6u6WdXOWv/Lasbiv?=
 =?iso-8859-1?Q?aGasv6mN5ngLi3p8D4na0JDEpdmrJYM+hYeziBHr2qwBANEeeGPdupfiOT?=
 =?iso-8859-1?Q?igkgoAwAEINttAj4X5c5H3yxmHTIetn4b1Lo0ip/HE1hQtHJxm/K+T1E6J?=
 =?iso-8859-1?Q?nL2Rgp3trhPtc3EhFhPnMzhn+yKastYAAHD5nkV3Pt19ytQRZldhKgoWJ0?=
 =?iso-8859-1?Q?CkaPsI9Zh3lIggF8UoEdZ7JR5LwwYLwat7SfJDdieTvyNaKjkng8mOf3vc?=
 =?iso-8859-1?Q?/uZ3ocqpY55da8oFCNLStNMiv7BA3yOk9G17H2UUPsJFPE9IH5f3K2LG7r?=
 =?iso-8859-1?Q?G3Ujfxr0HhQGhOgGYOxgVuvK1dk4koJdM62cpo6H6IRAwPezAwLkmuLB05?=
 =?iso-8859-1?Q?Q0H2JPIXmXTeTkcw2bhk9Zd6TrZ4tIqXCodRooEPOp+v7O7AaTxHwPNNfd?=
 =?iso-8859-1?Q?LcSJYH6eLlsJkU5+cVFgW4bBLPfzECkfAqwwcpOr8qg+d0c5+0695JEEfW?=
 =?iso-8859-1?Q?ckqtYHu6zZ4GqaUMZCKNCVls/BtMQ/XEkpl+pamZC7cdQKusHByRBMlkZt?=
 =?iso-8859-1?Q?viYZjabpCzMZS6mmyzKw/TFbibSI/zp/xc8giYcFgKUhwzmgRNW9ZueJOD?=
 =?iso-8859-1?Q?rjsa8wqNPeaVTftLyxArSpxdymg7UTTy/8ckeZlTs9Bkimxe1kS+BLs/tU?=
 =?iso-8859-1?Q?U4Cak39nwC3bGXNLKYpKqk6pY79rE++xrTbAd1RYeDutxLAYNm1rogD8aJ?=
 =?iso-8859-1?Q?qwBF/SZ3egKtTXz6UtJ1PuKgy8j2AFylvLzCk0SyBrdom1MUG9urXlsKFs?=
 =?iso-8859-1?Q?i2x9FH2VUBvno4G3+RjJbKRBplvoTpiIw/4VWtSUKBEC2WMSECk1yLRyjE?=
 =?iso-8859-1?Q?pTdT+OdWC50EnHmWzXEBEyIMgOcfG2vObxaGVDExbdzINmdawksr4dangl?=
 =?iso-8859-1?Q?PLLkC/i6txiFwR8KnBk9Lr78+4aWB+oSIjSue7AHrhpaZELxknjI9OUImw?=
 =?iso-8859-1?Q?FArvfIiOnS9hFHH9J1MV/Gf0gHyuY6uA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qszTNuYY+p2sspZd9kJ8zQy6lWSkQQ3/Lvnq/AKH0Aja6YsaLQvjoRaYK7?=
 =?iso-8859-1?Q?6pMtZNjO5YgXm/ZvXzCLjTdS4PN9Wg3dbKwmoctGTZhzx7FBiMKjVhojyJ?=
 =?iso-8859-1?Q?Blg2iwD07/WFg41IAEeCH2zEFY/9vk1tfeeh1PRRhpDGbpqIftVoZuh5Mw?=
 =?iso-8859-1?Q?Wm8e7+YAIzRy7YoH4ilygMLdtURu5A2CqdJzxEaQmUKEApO35Dxop+yzOZ?=
 =?iso-8859-1?Q?xbXZ980hmQDst0MH9spz61npTM5nEtm2k6qJxt0MVP6Gj+B133Dt+2SY+s?=
 =?iso-8859-1?Q?+NrsqMWD7hCPu3Ox4uWN8xIQ4GnHt8cIhuW1PHhcKgbr5je8LkmnV+zXEL?=
 =?iso-8859-1?Q?Mtsu0g0wy+UDrdyJc0itNA7QZHCQpHgZD0+LsvdsWXigxJOXVKRqvkHrtP?=
 =?iso-8859-1?Q?QOcmxHRQ+/KOItKxxaMe+EX+JhTd2JdoO5IPgtMnWIGRjLzDzQk5J5cds0?=
 =?iso-8859-1?Q?v4cr4tTnYV8odnDGZBu5ZMB2EwwSxPxdNcA0moQTHLMIh3BOwvwU6YjFbe?=
 =?iso-8859-1?Q?MUi3bSLNIg14Cq09fAmw1RJ0+4KrNch3H7ct4TBxsLKTzrirfoOfC/Musm?=
 =?iso-8859-1?Q?Yiew53M1QhdP21OJO2D92tgAuTR1XsThS0bQAHZgfZmq0IOgZflSr7stAI?=
 =?iso-8859-1?Q?VrY5L0qoSk02wk5vy1J0IyILf9Izg/BaIOurro/S/OMWfFM8Hq23a5TYwv?=
 =?iso-8859-1?Q?hR2QYD8y6JII8PUc+qt8SE78N6TRFmVdeRghZlWniAKNMVAmL28KEE/Z2i?=
 =?iso-8859-1?Q?MfXwgE2lcvwZjY293c8GZaHKf9rWUob2iR8Bd0g+ujzbp/HGHwBs2PRc+O?=
 =?iso-8859-1?Q?b7bnF0uE97CdmIGUN5AlSMrPF4CTfe5LNC4u37vTGMSV9WVidnJKC9utnB?=
 =?iso-8859-1?Q?1zR7M470krobLIIENWkM4oCkpQjvO/UEzQHorsvsE/mx4WaSBsw3B19axB?=
 =?iso-8859-1?Q?aBpM0BrMWecPlG6krdd/g0kMeDRsopOsyyfdNcN5PqLMWtpCJmLVaaqQKd?=
 =?iso-8859-1?Q?A5rUBU/zt/HgE1rdM//PxHOe3VIhtmVs9PlOffKMhW4LtXYuSAqiu24NgS?=
 =?iso-8859-1?Q?3o1oWMG5+t3GFoCqD0Rc4UXnLGab414YNB+bZzZCL9s8HVF0mIUFFAHJGF?=
 =?iso-8859-1?Q?phP5edp3SQVJtaxWAom1GHRR/CpCExYrD5loUtbOjk2ywioUSmN0st4d+F?=
 =?iso-8859-1?Q?D1mEoBWsHUO6T0ImUnDrCNWbECq0lp6/2l2UukPuWx+gd3mPtDf0Q+5KeY?=
 =?iso-8859-1?Q?+fmYKLp07ig4zKIuNkBvSfTMKEu3KaZxPF2EEHlfw6KImeNa3Of6r58BMF?=
 =?iso-8859-1?Q?b1qNAMxdDPB+gQcwpT73UC3LxcPokgQXI8iRIOAj2XCHWU2BNf10m+l4o8?=
 =?iso-8859-1?Q?ArpHFcJ60tCV9ot8XsJVQoDxHrJ5te9do+PBpzOWaUMBzfsQZtmsPQwp6x?=
 =?iso-8859-1?Q?ygnM7qkyyv2xoFX/vtUj9DWIeiAUWTW7pwGKhsdlJXXNbigr3Z7pR24d/q?=
 =?iso-8859-1?Q?8WMksAW15HBBthIm5Wuv95G7AKblrUMktn5n6x1PhHkdmvnzaUxykiYDwv?=
 =?iso-8859-1?Q?WCPKPFraEmJgTytgV0EWnnxFyYspaitN8UkVYhb45I2NNY0f8ZGOlETJ6I?=
 =?iso-8859-1?Q?HjnGW7LOwpar3tR/Bm6giydKeICZaP31hy?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: excelerate.info
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fc52e5-09cc-4357-c690-08dce7ba9897
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 16:59:38.9432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6d8a7b1-77f0-4119-a6d4-0e2aa62bf8c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sp70J+4EbNFNZnZAwMd9c8467b0ppas2qnKYyLr/ic6RGV00bfJILV5GvTKpau+gw12Hco4+PoowfFkUrce/oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3546

Hi Folks,=0A=
=A0 =A0 =A0 =A0 =A0I'm trying to create a regular chain with a default drop=
 policy and not getting anywhere. The wiki implies this can be done, but wh=
en I try:=0A=
=0A=
=A0nft 'add chain ip myTable myChain { policy drop ;}'=0A=
=A0=A0=0A=
I get back:=0A=
=0A=
Error: Could not process rule: Operation not supported=0A=
add chain ip O365 O365WhiteList { policy drop ;}=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^^^^=
^^^^=0A=
=0A=
( those carets line up with the "policy drop" on my terminal. A table calle=
d myTable of the ip family exists already )=0A=
=0A=
So are policies actually supported on regular chains? If so, can you tell m=
e what might be wrong with my=A0 nft invocation?=0A=
=0A=
What I want to do is make a whitelist setup by having a base chain hooked t=
o forward with a rule that jumps to my whitelist chain for packets coming i=
n from one particular interface.=0A=
Then have the whitelist chain with a default drop policy and a set of rules=
 defining=A0 which hosts and networks to accept for further forwarding.=0A=
=0A=
Can anyone help me here?=0A=
=0A=
nft --version returns:=A0 nftables v1.0.6 (Lester Gooch #5)=A0 =A0 , all op=
erations are being run as root on debian 12.=0A=
=0A=
=0A=
Thanks,=0A=
=A0 =A0 =A0 =A0 =A0 =A0Robin.=A0=A0=0A=
=0A=
