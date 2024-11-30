Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2039.outbound.protection.outlook.com [40.92.107.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399601C6A3
	for <netfilter@vger.kernel.org>; Sat, 30 Nov 2024 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.107.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732946595; cv=fail; b=X49c2cNF0bDmKEWTqzT7PH7y/8rXRVWwF6xHZpO4jRkGbsDvlCowaJ0xxaE4t1TuWWYWFTewjko8lvMc/K5BBolBEfVew6LjgUWgt4sTXgJ9P/zYr+2QC6f5v64C9JbRK+yEpDf/zI20KmWtLqgHaSFepl7gLFpXLpCibZdCS8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732946595; c=relaxed/simple;
	bh=iUkKR6R1wJQb+INpEN++wydynt2b9MzDG/pti2sV/jA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iGf+VKax1AvwvdxBGWNudSSzwkdREYMZb4WwcfUEFdYZM5UDxC4QFHMOR3S9ldAEcc4u9xTmUdZQkKNOspJ36vqvrKigQUGWrTd67L1zKxQw2gtpqhmiowUTJB3UfO6I+FPkJhlD8X3paMKTqZF2a8Dlvp8QuldFXY/uSEMNJ1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=PDYWL5kZ; arc=fail smtp.client-ip=40.92.107.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="PDYWL5kZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKvpxyTnVZUFPEPljQgzGtnuWu6FqK4YNnvEQM//RZ4qpQBBBLGoG744B40Z06F09LI372cm6KY7mcBUqVmku+JMlKUBg6/s8dGcB4ymeBO9NZv4gsfKJmBz/tezIKmWMtGiZJKPef58qrS04wnY6l6+emwVemzhrEMffHGr/ZuIFQUF6rIm34mVYOYyqsww0ogj1Oeni30uk1af7PgeIEUcu4waTwbL9f+fZ1MssvbNGPvPfrV4kcYuNa8iq83ztamf2mFOlXXNxkLSB75zkqb36OL/ezYpK/LhgvvvctaUx5kdgAO0Ogi0fhS1BqGgO+Zu4ssQnZQFMdFFbhf9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUkKR6R1wJQb+INpEN++wydynt2b9MzDG/pti2sV/jA=;
 b=cDIZ/+zxwl/5sMWfDidMCbkEnRL3SOwLAa3azF7FWUb+ATZbRyGT0qn6jUs+X9n9NUTut5/1y0+oUg3S9iQQTjSsH8wrBO2pySCmw2kxcmJA2NPsyuNyVX/Vis78UfYc+OwL1gzepHmq+loy6bRW553bpsLL8chCY6KmvYzRVru6E98FAmZ2OfdjvTl+YZMFUY0+X1rgkyIwSwtv2ajoqS63M74XVhWI59I9ScTyVoczXxV03/wFl/s0oCfexLOOKp0IlpUFEgSndtICG5XnHgZxGqXCjNTnkjajcI6UE/kBGLkxPbsDsvAew9X/Dw6oswYRH6ba72RLYkLw/YYS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUkKR6R1wJQb+INpEN++wydynt2b9MzDG/pti2sV/jA=;
 b=PDYWL5kZ7AbLaJ6vwhFhh3z6OpWkckBhiiPdRK3LAhH61mh+h1y4yhhs0a19jT2+ZtEs7zXBW+tapc5pfT0p7MqfoFKBw4ZUzzfoTjQXXoRdm59cWwK0dw80+faydnL47CiBXAnJTJD0jElmpdEWryzdsXS7Tphb6gInr6XJNqUfgZ39JXykzDQaISfIy98U1m/Wqel1cN0/yHwUIaWyoUthIPtPtG1uuIWOgxUOKaJvLRHFP5BnyH/fraV1sr4TkdcdMYaLGJOyyxlx00L0S4JJYGYWIA9Q/1ZAyxDMi26iV6jUB9GFtdIZ5TKLkHISvamqJxmpcuvkbnwFe/0pcg==
Received: from SG2PR04MB5867.apcprd04.prod.outlook.com (2603:1096:4:1d7::13)
 by JH0PR04MB7267.apcprd04.prod.outlook.com (2603:1096:990:39::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Sat, 30 Nov
 2024 06:03:11 +0000
Received: from SG2PR04MB5867.apcprd04.prod.outlook.com
 ([fe80::d6b1:e911:fa5a:bd5a]) by SG2PR04MB5867.apcprd04.prod.outlook.com
 ([fe80::d6b1:e911:fa5a:bd5a%5]) with mapi id 15.20.8182.018; Sat, 30 Nov 2024
 06:03:11 +0000
From: ye4 yu3 <ye4yu3@outlook.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: an idea about flow tables
Thread-Topic: an idea about flow tables
Thread-Index: AQHbQutrTn1+vI2hHk+FiwfJtn5LEA==
Date: Sat, 30 Nov 2024 06:03:11 +0000
Message-ID:
 <SG2PR04MB5867D09539CE12DB891B343CCB2B2@SG2PR04MB5867.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5867:EE_|JH0PR04MB7267:EE_
x-ms-office365-filtering-correlation-id: 2a12cc17-1cd7-4b82-7c3f-08dd1104ab72
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|8062599003|15030799003|461199028|19110799003|15080799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?gb2312?B?eXY1NFZTNUtXT094WDVoalM2dzhRUlJKQlZhdlVtUE9PM0llMzlxcXBTSDd3?=
 =?gb2312?B?ZUxMZnZ2ZnlVcUZQRHRXK2tVc1dXaVZtVlRZTytxUnh5MFpjcEhPOGZhVy8r?=
 =?gb2312?B?SldUeG1POFF0VVJ6bnBHWmI1TlA5UVJNWDRBWENKZVMxSndSTmladzRPWHRS?=
 =?gb2312?B?WlFVL0dQYUVtMmExaFM4TThMa2d0WGtxMXZJb1QzVmVic216TXVqTVN5eGhG?=
 =?gb2312?B?dUQwTWRhQlRMWVJmQ0dHMmJsbFpnOWdlYkVFQzlrRGU4VjlLWkR3NE1lSU0r?=
 =?gb2312?B?ZzBlWWhIcGdhOWorWFFMRTh1OHVaNGZIeUc0b2kzSHZkQ2d2OVpUQjZVVlVr?=
 =?gb2312?B?Nm9nSjlFclZJUngzQlRpcHFMOGxGN0haZHE3azZRTm1yV3ZJdWVGeE1IWDZV?=
 =?gb2312?B?eWNiUWpHb3FhY3NuQ0ZKNDI3cFkvTTlPdEtqeDdrd3hiUkpLTFBjRENOSGk1?=
 =?gb2312?B?VmlKcUUvZ2lKUWZrVnVrS2MwcTZFejFNbFRRS09Hb2FuRXptWGlIWFNNNjBZ?=
 =?gb2312?B?a0VqMDhXejBHV0l0QThzTXlGWDZpMmlJekFKZFRsT0VzN3drTmZwbFJjdkhW?=
 =?gb2312?B?WmdpNEV1MmlNWXpqYlJjRFR2N2pMV3Q5SHMrTXFESGpxMDh2Wng5M1huY09n?=
 =?gb2312?B?dlhWWDN0UUc1eGhCUnMzem45U0tiMGJrRzdJcGgyQUw3LzlvUW9tczVLV1Rj?=
 =?gb2312?B?bXlzczMzdm5rNFJ2Tjh5M2VGR1dyWHMwZXVjdENaK09BSytLempWOU1KajVG?=
 =?gb2312?B?UEN0RUtIdVhmZk9sSjIyMzhPbEhtSjFMT1dQYjJDRTZwbk9naGFrNERpRjlj?=
 =?gb2312?B?RXdGYkxzWmZ5N3VaTkkrTFlQeldxTmFKNWp6aHZRdHIyd1VpMG5uVGl6dExS?=
 =?gb2312?B?SUFnQTlGL3Rza1R3cEdGRmQ5NUQ4Qjd6Z1dWY0Q4aTJteVVFZEFmQzNrTms2?=
 =?gb2312?B?RjdoQ3Z3OEU5eldvRDErRURNNWxiUHFXbFBkbjQ5UGJQNEgvdmRkdjJqZjl1?=
 =?gb2312?B?T0xISE1YM2dSUUxBcDlySDlRMWxnbXFOTWRDT2RVU3g0bEpyTVQ1TjNuNDAz?=
 =?gb2312?B?dW9jNUo3WkZFVkNVOVZMVnAybDdCYnpPYnBVbnErZ3V5Z2x1SGUxNXBOcXFx?=
 =?gb2312?B?VlZGL2xsalZCa0p1a0tSUi9WZ1MzVmhhd1pib2dFaFkrMTRWaTBibitQd0lI?=
 =?gb2312?B?azYyTUZQY1ZCQkpiZEJZYjlEVjR6S0p3THZlWFZVM3NoWitNbC93dTFqaEpL?=
 =?gb2312?B?SVZZUHAzMFllcDhwRjhneUxlaEZjbDQrbzBiWGE0VWx3M0F6V1FYZVVJdmVG?=
 =?gb2312?B?UkZpVkxENGJZTVBYYlcxdW9veTF4elJDd3hiL0VIcVdkeXRHbjBvOHkvdXR5?=
 =?gb2312?Q?mCpLvm9F8sM1VkJs2fdWbYUkHIcU3+wg=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?dlY5SFUvaFk2WHZGam52SWg0cHZ0UnQrSVBTZDh5OTdHdTN2S3lWNVNONnNM?=
 =?gb2312?B?c2xyeUNRdnpSL0tRYVRwNzNoS01DcmQ0d25DWmNSZWlzZW96cGRhYitXNXpK?=
 =?gb2312?B?cEFsU2NiQms4dmJvTzdneldOSzBObHkwa25hbUJlL25nRUZOdWVmaGgyakZi?=
 =?gb2312?B?YlYybmh1L2FsYTAxRjUzS3M5SEZlNmZSZzV5Q1owdnlrMTFMbUpaTmFtRWJn?=
 =?gb2312?B?dU9TRHdtTnovZWNNQlo0S2lxY01wZ3ZnbmlWN2gwSy9rbU5mZVRHc3N4T3FZ?=
 =?gb2312?B?MFVHMXdURndtVmU1U2REM2NjbGRadlJXWjBBdXVDVGNGVS9ZSTc1b0ZGTjdS?=
 =?gb2312?B?MDhMUk1hWVJnbEdMNlFiVEJOSXZaZEUvVFFSTTBjM2NkYTJKcjlCZHZMUHNu?=
 =?gb2312?B?WGtuSWtpL1hVM09OVVBwdHViUzI4TTNGVUk5Z1lpMEN6NzhCZ3NWbTFOdW5p?=
 =?gb2312?B?eXh2anV0MFF4bUNwbmR4b3RXcTVnZHA0S3UvZWtWQldiYTQ4KzY1LzQ5N0pt?=
 =?gb2312?B?cnNYQ3NudE9ZVXB0OURsZ1ZRdXdBMEVNODNQeDFhaVkwREJ6U3pjeldLYWZs?=
 =?gb2312?B?eDFhNzBBTWZWNEZWek1VSExud1kwV001TnN4bXZqUUNJbGRKMnFSYTQrTzdl?=
 =?gb2312?B?UGpadFVjY3gxZFJqSEt1bENyblF4STZUNmtaQmtIU1dXOUtNZFZqRDExNjVj?=
 =?gb2312?B?cjFLd2RrSytZVEk1QzNGaTVFM25YZHh3RW9XZWhpZDl2bVVXNXlGVVk4QmJa?=
 =?gb2312?B?cWo2L0pFTjZoT1J2RkNjdkhSVHdYczNPQ3lNRVVvTEV3bm82clFHWFlzM0Fa?=
 =?gb2312?B?OFF3bmlvcWxwaUIzTlEzNlAzSjFxTW9QbTQvMlhmUTBCcGY5eXlQcG5UQ0o2?=
 =?gb2312?B?T09WU0JNaWc3akxaaWxqQkFQZlJ1ZTdiS1VqWnIrcUFtM1U2ZE5VWUdhRnVn?=
 =?gb2312?B?bXh1bjAvWEZXRUZBMkxFdUR6TnBHVzFINXA4UkQ2ZFArcFoyZDJWR2tHaFFZ?=
 =?gb2312?B?VmFkc1MyNnlqM2FhaytvdnhFOGVRN042L3Z3d3BoUVgwelJ3emdlTjVjL1Fx?=
 =?gb2312?B?NmNvZFo0enBtRVZYRHVQdVUwSjdVTXkrSDhKWkRDNDB3RkIwcVFWL1FuazNF?=
 =?gb2312?B?Tit0R3ZFNE1RMGRRN1Z2M0FoQ1VpNjNmQm9mTzNXaC9lQjVNZHYvRzZFSkVG?=
 =?gb2312?B?cmx2QmNZVENqVnJyMXVmWWRBemx4dDg0NnFGSng5RUY0VUpaekdJdllSOEpE?=
 =?gb2312?B?MFM0eHdHcmh3eTExc0UrR1BiZlVkQkhpUmVFYTduVklzRG5rYVlnclhqOTB0?=
 =?gb2312?B?Z2d1OENRVnk0bis0Y3FRS0dkUS9XYmpxbk1kTlJQc2xHbmVlZ2lydW9ZZzMr?=
 =?gb2312?B?Nmhhc0JFbWgwaWNUNDVuNUJpaUNZYnNBcXhOQ2Z4WXl2V1g1QWZTNDRWdEFv?=
 =?gb2312?B?WnhzeEc3SjM3UlZqTFR2Vm5oZ1VPc01hbXN6S2FDbGo1S1JNeHZvVDZpSkdt?=
 =?gb2312?B?Lzd3RnV6N3lkQmoxWEdORWE2NXJnNC85TVc5ZXBOWlBuVXgvMXZXYW5uQWIw?=
 =?gb2312?B?c2R4N1hCakZKVDRUNjhpblhFZXlLMnNGQ2ovWElDV3RCUTA2K0hTRHB2dk1U?=
 =?gb2312?B?aEFPR24vWGVRQkY1TE9SMENUT1QrZHc9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5867.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a12cc17-1cd7-4b82-7c3f-08dd1104ab72
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2024 06:03:11.0056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7267

aGVsbG8gbmV0ZmlsdGVyIGNvbW11bml0eSwKCmkgaGF2ZSBhbiBpZGVhIGFib3V0IGZsb3cgdGFi
bGVzLCB0aGUgY3VycmVudCBmbG93IHRhYmxlcyBjYW4gb25seSBiZSBhY2NlbGVyYXRlZCBiYXNl
ZCB0aGF0IGFyZSBzdGF0ZWZ1bCBuYXQgYW5kIGVzdGFibGlzaGVkLCBidXQgbWFueSB0aW1lcywg
c29tZSBvZiBteSBidXNpbmVzc2VzIGFyZSBzaW1wbHkgb25lLXdheSBhbmQgc3RhdGVsZXNzIG5h
dCwgdGhpcyBjYXVzZXMgdGhlIGZsb3cgdGFibGUgdG8gYmUgdW5hYmxlIHRvIGFkZCBydWxlcyBh
bmQgYWNjZWxlcmF0ZSBmb3J3YXJkaW5nLCBzbyBpIHdhcyBib3JuIHdpdGggdGhpcyBpZGVhOiBj
YW4gYWRkIGEgZmVhdHVyZSBmbG93IHRhYmxlIGFjY2VsZXJhdGlvbiBmb3Igc3RhdGVsZXNzIG5h
dCBwYWNrZXQgZm9yd2FyZGluZz8KCnRoYW5rIHlvdSBpbiBhZHZhbmNlLgoKYmVzdCByZWdhcmRz
LAoKeWUgeXU=
