Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023133.outbound.protection.outlook.com [52.101.83.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B6538DC53
	for <netfilter@vger.kernel.org>; Thu, 15 Oct 2026 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049942; cv=fail; b=ZjNorKi1WLBH/TGu3tv7s48jzUWNJBe1mMXM/8Axd6S7q3dtTEP04756sri1KgLxeoIOoHjLqN5Ucs6ELky3LLg3bNrsPMyFjTKJ2mcCo8lDk0cr4NmAFppIkt/S2s0sND1pZe3kwvxqahEi0HBD5ZdLEJhm777kDa0FHxzC6rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049942; c=relaxed/simple;
	bh=BVWGZEQyukcX2LHug9kP2d5hXDYNQnEuyHQfgqZ3778=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P4tXU7gV/WuZNwTUd19Kl0kcU9j6lBV0AyKpu4rxJ8Y9/nWVJ26GF7Hu9Yjh2fTaL8QOVAJNk8UPfFl1j40iLphR4ZtdYzt95qlqyT9ABkin2UQ5487Zoh74mXflKnBn2hWW6ugurAPtsT8IYEneI5NM51W93mgDEzQda6rB+NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=earthlink.iq; spf=pass smtp.mailfrom=earthlink.iq; dkim=pass (2048-bit key) header.d=earthlink.iq header.i=@earthlink.iq header.b=TjqZp0z9; arc=fail smtp.client-ip=52.101.83.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=earthlink.iq
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=earthlink.iq
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=earthlink.iq header.i=@earthlink.iq header.b="TjqZp0z9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4UmPssCHqEQfoIVhnWx7qSrFcfpCb+xLIHUliqp8jKZuKjtGU8/BFaRAzYI5zEd/gJ5z/DhQPjZl+bOawMD2/ZX2xa7XwpWyilA+2dVMGCv90WNZOfgcDB0HYWRpUm8ePOGdIRScytSqEpRLkzDH/J36dAjPeq6jwujyPRpTda32lxMJp5IDHkoxYDVx3/Y5DMkiMqMtDSEX8ISvdsRqJr2Xxeqi6+bri02Isu9sRGHgK67RpfAviY4MqH7yoqjUAdhFdy0ZFD2X0+i/0Ii+FCJXLHoBU2AFs5bpxHY72xJK+LM4w6jbQeRlNGvxl+IxfWtGvcoKBqb7ORRnO0N9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVWGZEQyukcX2LHug9kP2d5hXDYNQnEuyHQfgqZ3778=;
 b=d4qEGpUkVmTXV9JOfdbxGIsnNyHrsux6LHHrveRWreiLZWjNAKuL+EeubXjTyTQVFavJMUwmkxx5Bz7m2CnenO34f0z4EajIa7oUuX3cJw31Eg9BgabRqBQxhykzmS/wOK4NcnC1ozY8NmDXI1SZjfkARymq6Izg7in47uh0HEUeql4zOikRqYUHNqIzwTBBhBnYLZiOGVTKIrI2bmgEJnCf6iU9DfnQS78HTEzysYoDv0mMG6F1NfwM6DOFIin58Gg5wi9hFNbkiKiCLeIfZzYzVEH80015ygRwZ8FgGQNoFPQLq77wPatmvkvGqXa85Av90o0fiHQ6rVZdp7L2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=earthlink.iq; dmarc=pass action=none header.from=earthlink.iq;
 dkim=pass header.d=earthlink.iq; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=earthlink.iq;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVWGZEQyukcX2LHug9kP2d5hXDYNQnEuyHQfgqZ3778=;
 b=TjqZp0z9OjGMuoHibJN9OkYztjKPXD+/50b+btXojd/t72jxw5D+lldDXbocCi8Ef1TzweJ28KMYyUYtdCzBehdnApnZ2OQMdxmvEuvWJTOurV9+ioZukZ1QalpK2rDJpdOTDMz4SPvyRDCUv+WLhq1cRjL34gRFVAtOfnORlKyN1oDhN/fT861oLWW5DdxFxJJA8UpsWTpdwiuM/F8lHvp18uOwcwS1RY0Ym4dFFI8eOE/JFpIYPW+kSJfYh4OGiC1GJ6KxKKSeaydxsoH9WiuAlfYiO3p1TItqObNw9a50WB82to/saFpoU8E49FtYqytK0Y+zC1lrcNyFW6O+Bg==
Received: from AM0PR02MB4307.eurprd02.prod.outlook.com (2603:10a6:208:d9::10)
 by GV2PR02MB11970.eurprd02.prod.outlook.com (2603:10a6:150:350::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 07:38:52 +0000
Received: from AM0PR02MB4307.eurprd02.prod.outlook.com
 ([fe80::c392:dbc8:75f1:ef9c]) by AM0PR02MB4307.eurprd02.prod.outlook.com
 ([fe80::c392:dbc8:75f1:ef9c%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 07:38:52 +0000
From: Muhammad Zuhayr al-Tayyar <mzuhayr@earthlink.iq>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Nftables flow table hardware offload
Thread-Topic: Nftables flow table hardware offload
Thread-Index: AQHdXHetRqLsqxqdTEqK6TWm0UBISw==
Date: Thu, 15 Oct 2026 07:38:52 +0000
Message-ID:
 <AM0PR02MB430700A2F758257B5AD3049CC69C2@AM0PR02MB4307.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=earthlink.iq;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR02MB4307:EE_|GV2PR02MB11970:EE_
x-ms-office365-filtering-correlation-id: 08c7df6d-42e5-49e5-19a5-08df2a8f5bfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|56012099006|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 UKOb5rGI8YIfxlb3Sx0FlIhKrBtwWwewcAKCQdgYS/avWvmsOiXCKKkrjYCc6IBCAaUbyfFl89VvstYIdOMX8r4Wtd1/h5ZmpVsHhsJ+51Ge6N4BdQSkKA2qDUTU1LnrC0fwnsSyGU2LPoX4KLc75qHL9JL1SZItGfWGjK0piacs2GFh+y+PXGlvpqc/LtoSIg2I0ABDcoI+4FgZRlMCPnqX407Ec49hgJGvJX4tXlRv173lE4lDQfpdvRwfBENi1+MvmhlEsQ7pALLRTHx0rhL7MS2H1y0360SALtrjREYH3o04LhyIZW8myN02IbAqRnKlJcj1PQlqFXhS71JrO1xX6LNqpq2HR6MOSNacWtuTJqHAs1id6pEQcQcEl3CTSS6ORIdakVLHjb0UGUmzpuuYyyfqBCXqz+a9jDWDhh5pbMmmy+Ljnh9X5JjId3JRp3wn/IHSPy924SwiVMyF9w+dExbuSZOkW1KkHX/NX6Exduv7KPhiIMHEXUmclnMfCdwGiPKUxx6xmjN14EdcqDaGHX4gFLF0OFdmOjED4eIYP7WiJr0S1VjlxOVN8BDxqZ4BPG17ASmfzJnAj3SH4yZ49Vyw8+hKD2RfW46rbmIQA0qlr2Kf1gI5LXn/zA27LY6piYZyRtjctVJCQgXskvQU8JP+OpIgBRuSFeT56vQESc1kMkE+MrqrKaiRj3TtBk0RxMmIHK9n2uwGd6iv06x3NDNWQT4Zsn3DVFdiITo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4307.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnJTL0FGY21aNWFZcjhxcUpmTXpFejFZWHZZOFFlajlqRXZTazFKZHlna0NY?=
 =?utf-8?B?bUxLajZ1ZDZyU3o1bWExNjhRdmE3NXNhV3dHbTZUcjJOR2EzcTdRNlVlNTZ6?=
 =?utf-8?B?Q3JuREtNU0MxUHM0V2t1UEtidDN6c3BoQmlyZDRJYVFiTUdiUXBqVnk3V2Uw?=
 =?utf-8?B?WTlId2JrWlcrY3JNYUhnTkFReTNrRjJDNkZ0SHc0SkFxUVpDRjQwM0poZFdP?=
 =?utf-8?B?QXliVkxlUnI1cE00d3ZRQUluYWNmNDc0UndJSi9QQWlqc2VZTUpXVXJ3RnNO?=
 =?utf-8?B?akt2aDJKckJSU1lGOEhhbU80aVpLWloxbXFkcWk5NWRIWFo3cGNBdlJjdzVl?=
 =?utf-8?B?SFBoUUswM21pTVVvbVZOc0dCblRudyszckZ2TWREb1hCSlRJQUtNZjNkT2pi?=
 =?utf-8?B?Y0V6RzdTMGQzUExCZmk4Y0Q2ckdqR3Z6TTVZUElIV2E2V2JZOWNLN0FPcmhT?=
 =?utf-8?B?RzczU2ZwL2ROYUVoMnc2VDZIUU8xWVdsMjFJSlhweU5hTjA5ekszOEJVTnp6?=
 =?utf-8?B?TVNjTUxrQ1VPTXpCdTY2REQrWm9KaVdVMm9za1FCTFNpZUZ0b2RWMkVqSVcz?=
 =?utf-8?B?cnRWWnFaYmpHRmcvSmlZTlNQRkowd0xlM0wvZGpiZ1pVVC9maVFObmhVbEIz?=
 =?utf-8?B?ZE10V1hPVksyOG9WZEM4eW1hcklyNzc3QVovcWNRdG9STkt1MzF5bWxNS0dq?=
 =?utf-8?B?a1pHMG03RXVnc1d0VlVybTg5UVVOQ2Vndlh4TWswSnhpdUxDSnJ3TTR3cDBP?=
 =?utf-8?B?ZTlVV2NlaEVtMTI5WkhrUURMdDlndmp1Y3hobWJxSkY0cEdVUU82RGVZSlBa?=
 =?utf-8?B?UjdOam4zdm54Qy9nRXJESlBOYm9RTzNnenpUa3ZzclppSzNpOVN1VnpyeGVD?=
 =?utf-8?B?anowK3Z3aDJnTlBSbGozMkU3S2IrK0d6azVkb0VCajdrbEJZQnRydjVHR3BG?=
 =?utf-8?B?ZjBQWEdwWmx0VmtVZEo5UE44ekJ5U2QzRTNiWWh6UVI1bjkrOUJ1c2Zzb25N?=
 =?utf-8?B?YU9qdC9Hc2xyNzBvWHhsd3JwN3BUY1lTKzRuY3BBdEhsMmk0RXdnMGpZZThn?=
 =?utf-8?B?T0RJbW5vb1kxVkoyZlRYcTAvMzRWM3kvWmhtbVBmbGJtL0MvWTZCMFo4akZZ?=
 =?utf-8?B?a0gya1ptS0dZazBZQkJpMXY4UFIrSSsxaGloTG9SQkxHTDA4TmplT25TRkFT?=
 =?utf-8?B?NGRtc1J2WW1TK0RGNkFZSWgrOVhNUnowZXZsazZKWlM4eVlnVE9GYTVMMEIz?=
 =?utf-8?B?U0E2R0k2V2NlYytHVmJFdWtQTlZVV1ozVENJeE93TVlibXRlY3VSWDM4NXVh?=
 =?utf-8?B?WTdiaWFHdXgvK0EyL0lJV0FYQWVxaDBLZWZyZWJUYXFMdmRHVXltY0pXVkNt?=
 =?utf-8?B?NnBRVlNhOGhjMS9CS0xOcmFNYzJyalBRRklVNUtwaW9pbkhuaXAyUHNSUjdo?=
 =?utf-8?B?V0ZuUDAwQy9VdlNsMnpmbFZ1cG92Q0JDYkw4N05IMzcvVFhWWXdGQXlqYi9W?=
 =?utf-8?B?dzJOTDRJZU84Nng2YXMyODdiVG1IM1hnZEQ3eUQvKzVmVUQ5NWllVmRuNFlp?=
 =?utf-8?B?SE5iSU44aXNGR3VpWmlLNTQyQVpiTnR1Tjd5OEJoekR4bzFEWTNrSkJwdlhl?=
 =?utf-8?B?SC8xeVVCMkp2TWpMV2FMWW9uYWxOV3E4cGdyV05kQmt1UEVuMDZSaThXUlRS?=
 =?utf-8?B?L3dvZm9SL05xSGhPa1RjdVc1YnNpUkhVSi92V3lYcVkveitmT0ZaNzJva093?=
 =?utf-8?B?TW9hQTI4ekRhbUFLejRxYUhOM1Y2L2o4WXQzTkhWWGIyQ25KaTNuak5nSFBt?=
 =?utf-8?B?V0h0cy9NYkFsMWVwSVJyemczemd5cTM4WERxd0xVejJVWWVkY1FFSlhNeWMx?=
 =?utf-8?B?clFzbHRnZ1ZZS1BsU2YvK0tvZDU5R0dvYVExb3FVbytKRFlDVUZCc3ozMFg1?=
 =?utf-8?B?Wmg3TXFQdFNvN2ViTS9VNHMwSmhNMlBidDZxMmZlNk1jKzJlK3E0R0dkbVJS?=
 =?utf-8?B?OE9OVVFrZUxzQXdhVjVJVTI3aFJac1JZcGhzc3NkZFdIbFF4ek8rUmRkd1NN?=
 =?utf-8?B?VXZKQW1NMTJDK0dWQkVFY3JTNW0zc1k5clZITzgvZDl2UmRsNzBScEtVUEpX?=
 =?utf-8?B?RHd5UEhDZlloeHlaUk04TnBWOHRRWGJndTZISWVBUlQrYitMRnl2Qjl1dkRX?=
 =?utf-8?B?SHh4bFdGKzRiMmN6SHhDcXNVckJmN3A3YjNmdEJHMVl3SjVuR3JzbkI5TGF4?=
 =?utf-8?B?QVFzbENPYndqTC8vTDkveTVZUTNxb1ZkYXM3eWREajU5OTVheUFWbjNHVnJu?=
 =?utf-8?Q?DojrzAsIXef+wRxJhC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: earthlink.iq
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4307.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c7df6d-42e5-49e5-19a5-08df2a8f5bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 07:38:52.1615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 89d949e4-9c48-4c58-9092-cf9b53301a04
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7xf6af3IWSvPb5zW5uUxrF0yx5ZfQqP0RY8rnTZbjg5d4eb4+O+ahSPOKMWR17/GW1qOjBfwG3I0Jaa4K+rOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11970

RGVhciBUZWFtLCAKCkdyZWV0aW5ncywgCgpJIG5lZWQgdG8gdmVyaWZ5IGlmIHRoZSBuZnRhYmxl
IGlzIGRlc2lnbmVkIHRvIHdvcmsgd2l0aCB0aGlzIHNldHVwLCBJIG5lZWQgdG8gaW1wbGVtZW50
IGZpcmV3YWxsLCBidXQgd2l0aCBoYXJkd2FyZSBvZmZsb2FkIGZvciB0aGUgZmxvdyB0YWJsZSB0
byBnYWluIHRoZSBtYXhpbXVtIHBlcmZvcm1hbmNlLgoKSSBhbSBwbGFubmluZyB0byBidXkgTklD
IHRoYXQgaGFzIGhhcmR3YXJlIGFjY2VsZXJhdGlvbiBsaWtlIE52aWRpYSBCYXNlZCBjaGlwIENv
bm5lY3RYLTYgRFgsIHdoaWNoIGlzIGVxdWlwcGVkIHdpdGggQVNBUDIgZmVhdHVyZXMuCgpBcyBJ
IHVuZGVyc3RhbmQgSWYgSSBuZWVkIHRvIGltcGxlbWVudCB0aGUgaGFyZHdhcmUgb2ZmbG9hZCwg
SSBoYXZlIHRvIGV4cG9zZSB0aGUgbmljIGVzd2l0Y2ggdG8gdGhlIGtlcm5lbCB2aWEgc3dpdGNo
ZGV2IG1vZGUsIGFuZCBpbiBteSBkZXNpZ24gdGhlIHNlcnZlciBzaG91bGQgaGF2ZSBkdWFsIGhv
bWUgY29ubmVjdGlvbiB0byB0aGUgc3dpdGNoLCBzbyBib25kIGlzIHJlcXVpcmVkLCBidXQgYXMg
d2UgZXhwb3NlZCB0aGUgZXN3aXRjaCwgd2UgaGF2ZSB0byBtYWtlIGhhcmR3YXJlIGxhZyB3aXRo
IExBQ1AgKDgwMi4zYWQpLCBhbmQgdGhpcyB3aWxsIG1ha2UgdGhlIGZvcndhcmRpbmcgZGF0YWJh
c2Ugc2hhcmVkIGJldHdlZW4gdGhlIHR3byBwb3J0cyBpbiBzYW1lIE5JQy4KCkF0IHRoZSBlbmQg
dGhlcmUgYXJlIHR3byByZXByZXNlbnRvcnMgc2hvdWxkIGJlIGV4cG9zZWQgdG8ga2VybmVsIHRv
IHVzZSB0aGVtIGluIGJvbmQsIGlmIHRoaXMgc2V0dXAgaXMgYmxvY2tlciwgd2UgY2FuIGZhbGwg
YmFjayB0byBzaW5nbGUgY29ubmVjdGlvbiBpbnN0ZWFkIG9mIHR3by4KCkFsc28sIGluIGVpdGhl
ciBjYXNlLCBtdWx0aXBsZSBWbGFucyBzaG91bGQgYmUgcGFzc2VkIG9uIHRoZSB1cGxpbmsgaW50
ZXJmYWNlIHRoYXQgcmVwcmVzZW50cyB0aGUgdXBsaW5rIHBlZXJpbmcgcGx1cyB0aGUgVmxhbnMg
Zm9yIHRoZSBwcm90ZWN0ZWQgc2VydmljZXMuCgpOb3RlLCB3ZSBhcmUgZnJlZSB0byB1c2UgYW55
IGtlcm5lbCByZWxlYXNlIHRoYXQgc3VwcG9ydHMgdGhpcyBmZWF0dXJlLgpPdXIgcXVlc3Rpb25z
CuKAguKAguKAguKAgmEpIElzIG5mdGFibGVzIChuZXRmaWx0ZXIpIGZsb3d0YWJsZSBoYXJkd2Fy
ZSBvZmZsb2FkIG9mZmljaWFsbHkgc3VwcG9ydGVkIG9uIHN1Y2ggTklDLCBpZiBub3QgaXQgd291
bGQgYmUgZ3JlYXQgaWYgeW91IHNoYXJlIHdoYXQgaXQgaXMgc3VwcG9ydGVkCuKAguKAguKAguKA
ggrigILigILigILigIJiKSB3aGF0IGludGVyZmFjZSBzaG91bGQgd2UgcHV0IGluc2lkZSB0aGUg
ZGVmaW5pdGlvbiBvZiBmbG93IHRhYmxlIGluIG5mdGFibGUgY29uZmlnPyBJcyBpdCBhIGJvbmQs
ICBvciB0aGUgcmVwcmVzZW50ZXJzIG9yIHRoZSBzdWItaW50ZXJmYWNlcz8gICBJIGFtIGFza2lu
ZyBiZWNhdXNlIG5vdCBhbGwgaW50ZXJmYWNlIHR5cGVzIGhhdmUgaGFuZGxlciB0byB0aGUgVENf
U0VUVVBfRlQuCgoKQXBwcmVjaWF0ZSB5b3VyIHN1cHBvcnQKCk1vaGFtbWVkIFp1aGFpcgpFYXJ0
aGxpbmsgVGVsZWNvbW11bmljYXRpb25zCg==
