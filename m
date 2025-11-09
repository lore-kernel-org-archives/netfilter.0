Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023090.outbound.protection.outlook.com [52.101.127.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D334D384
	for <netfilter@vger.kernel.org>; Sun,  9 Nov 2025 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762731971; cv=fail; b=OQfHEB/G7rZ8TudBKDuzzyvK1GuOB1JnLaDCTOi4dicF+uipgysInOt9RIlMWBOld5LveJWKTF6TnyCpCcoc1n6rDjDEtvoZukYKk15mVdHGiYYbipvsfpcAvcNsdq/DuQS5rVFCODJKeHYRE9RkzGoc1+M+9RkfyD0dBH32QhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762731971; c=relaxed/simple;
	bh=0uT5B7SnqnRgqpiIlBG2FbskE658X+cdMsmtUpFZmuM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EUrHRwzfXnrz4fmmWz9EmADudQie5WlOarHx+qOOp83jsj4kBmw4tgqiZBMIoS3t3LXN8t4FFaA70LB6R9X85UtBXp/7Zyf9SiXpe4t5cQcNivGuHd9hG0sORd/VL2MWdaEtNRMtUZYEvUYyELcmgJXzdV5l3c8vRH+dgYlNOsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelsplace.sg; spf=pass smtp.mailfrom=joelsplace.sg; dkim=pass (2048-bit key) header.d=joelsplace.sg header.i=@joelsplace.sg header.b=FlHBPqus; arc=fail smtp.client-ip=52.101.127.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelsplace.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelsplace.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joelsplace.sg header.i=@joelsplace.sg header.b="FlHBPqus"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6G7HWjjWFpSNLepIsr4TLnRhUNwHLsMjdWXl5DqRUENKf+RY3grcMuONp1toVMYmvw8mWDSnoZStWpacjQqDi9dmyPbtOaFjN8NBYG7pIUFmeRv3HkGp9dFSczeVZngkMGUp2zbSBJjxlwNIrCNZm8YwHEKGm8Jr7z+/kOQARBIEdZ6GITd/JYKnX1/H9YYX/cJy2Rf4dql5s3naAIrBnUZOZiWWaci0YBqikrxWf0rubpJP854fDGAvhdrCVQ9nC2Nq/7wFt62jN8ytKgis0HhO9nmJelN3bNcbcUU6SUYZuHpr+OszV1M86HRM3oHk149hnJT92gQi9x5/beruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uT5B7SnqnRgqpiIlBG2FbskE658X+cdMsmtUpFZmuM=;
 b=XN19dcgmNmpUhi6NmsLBHtQm8TT/P6HXl2QemubltTUS9DGYAvWwUrjNhxiLH6pysFhPyWAiPUusBb2sOylGPHxdUno8L11eFfpYndr2baQ+6hayJsL9+88Scnw+p8bXzs9LfKHCztyQPnbX7GGco9WaIaOgtWuGHedGl2QuvUm5p/sQO8/yEYBRBJyqVRL9uD2rk9obzWTzsy1m/XkTWAu64Svf5AkZ4naFzdZtj0m0lgZgi7tzeUMqATP1m5ORfCVWzg2EA+RL7PYdtBPI1Dt0E1b0A4GnoDWf3e3syoUqz2leV3hZS53lE/xi+f7vehacqJLQfh5Ogt8imhsI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=joelsplace.sg; dmarc=pass action=none
 header.from=joelsplace.sg; dkim=pass header.d=joelsplace.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelsplace.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uT5B7SnqnRgqpiIlBG2FbskE658X+cdMsmtUpFZmuM=;
 b=FlHBPqus1rYOIlHyUmkEKkCfhR52UbqbnJiIKakMAV/WqdLEp+SlI4sg94Q2p+3DeW0pfX2mQmL+O5CrvcH46A5dmtrbAy0cd7oKEzaz3KUCqpUOsdJRcPLbaWegrj0rHT/KjNSRmbp57bYIUH0Q3NSfGxGSu7hhVfkhSzJRGxyu0QrCSOaDYz5xVEsCOykyNhzFHONwpiZc+Ikps0WFP7T1tVxLvnYKk/EN6WyvF02bKNKfnTapEQk1GJjKAwHoLv6Nk8XDzLKXvKj+qi1Dg2upkQVxZTtxFTO7NIA5c82NIM9Qgmv5eulVnJPJsneAa+5HXXuwJPCVMnz3J0mtsg==
Received: from TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 (2603:1096:405:9b::13) by TY1PPF12218DC95.apcprd01.prod.exchangelabs.com
 (2603:1096:408::30c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Sun, 9 Nov
 2025 23:46:01 +0000
Received: from TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 ([fe80::f8ab:e32a:aaac:9ee3]) by TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 ([fe80::f8ab:e32a:aaac:9ee3%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 23:46:01 +0000
From: Joel Low <joel@joelsplace.sg>
To: Pablo Neira Ayuso <pablo@netfilter.org>
CC: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: conntrackd user-space helpers for multicast/broadcast
Thread-Topic: conntrackd user-space helpers for multicast/broadcast
Thread-Index: AdxQXIQiScm/X6EhTUS44wy1sdYfGwBSRCIAAAnZS/A=
Date: Sun, 9 Nov 2025 23:46:00 +0000
Message-ID:
 <TYSPR01MB6756856A560B3C1F95B24449C8C1A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
References:
 <TYSPR01MB67560AF00CC17680A5DF6175C8C0A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
 <aRDbhC3rnP9Z7CbU@calendula>
In-Reply-To: <aRDbhC3rnP9Z7CbU@calendula>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=joelsplace.sg;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR01MB6756:EE_|TY1PPF12218DC95:EE_
x-ms-office365-filtering-correlation-id: 2ac3fcfc-d2a6-4ff1-f4f1-08de1fea2363
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkRyT2dVbUExb1pUK1hPeGZjKzFjck84U0JmYXFwTGwwRm9LRy8wYm9RQjlq?=
 =?utf-8?B?dUxJMGJRRWVFN1lVSU5hbEF3RmZJcXRHT09hQVRZME5iU0wxOUU0MktDVnNZ?=
 =?utf-8?B?R0xlT3hBWjBxNzRjRE56N09neFZ0TWlDTE1mRlBSQUQ3NGhHdk9QOFZEWEt4?=
 =?utf-8?B?YTFobDZVYStFdnR3UWc2WlBDWmJqSS9yeUFkQVdIRFFla0MwalJ5WGo5NXlh?=
 =?utf-8?B?UGRpQWZmUldhWWpmSkR2amliSUROTlgxd0VUbkkzVU5sYzdxcEdDWWZ5akZM?=
 =?utf-8?B?NGdreGR4THVrdC9XMy85dG5Td1Jwc1RPOTdRcHkwVkYxSm4vRlkxL0ZHOFh2?=
 =?utf-8?B?SU56Z2xIbU81RThhWjFlVTJvckcrN0c0WlJhbmkvTzl0YVI5aTEzNzAxSUZq?=
 =?utf-8?B?K1FVbUNKSExxMWplN2pYeVZpTVhKdDV4UmN3YTBlM0QrellnOHRsaE5YMFFv?=
 =?utf-8?B?TDBiem5oS0ZFR0hWS3Nya0ZtS3FocmdXK3ozSHVZamtnQ1RRN09aQW9Fc3Bo?=
 =?utf-8?B?d3hBMjRKVmNnSFZTdU5wOW9rRjVyb09FUjJTa0RiTm16K3lNaE44dndYb0lx?=
 =?utf-8?B?enVROTY4a3l6K2xNRHlnbVR6bitLZUQ0WEtZbEVhRlpUQ0VFWjB3dTNmekdq?=
 =?utf-8?B?SjNkcUNST2ZZMVVIM2lhOUtpU21YNDFsZ1gwL0xKL0JqdTkwQ0xnZkZDVUJS?=
 =?utf-8?B?OUl5blNZOGEvaXBNZVdvSy80ZjQyampISXVPWURaYUNqMmFnSmhVZ0NaNTZv?=
 =?utf-8?B?TFl6eEFUQkgrWDJOZnJ6SHFrdWpXVzVEUmx0WFZxYk5XdjZpcHFURlE1b0kv?=
 =?utf-8?B?UW1DV3AwMFBCRU52aHdWRXJ5QUM1eUE1WGlZaFFpSlVjVXVLQWMvbEZMYnNY?=
 =?utf-8?B?a1M5bDJHeGkvNVJUL1E5bnBzUW9TWWk2YTlkUDMvaVA5K0UyUlhoQTVsQTlJ?=
 =?utf-8?B?elBEVTRvZTR6VnBlQ2dsTnJzczhqcmlXY09RUm9SK1owdEoxb1VobGpoS09y?=
 =?utf-8?B?eFRMeERiZjhjYTY2UkM3Q0ExUFpKcFg1UURialp1QXpQN1d0MWdheXRqQUVJ?=
 =?utf-8?B?cjBvMy9PL1V4cTI4bzFqaldYbWxKMU12QStjVXEvUjJCaHV2ZVE3YXVEUURr?=
 =?utf-8?B?NHVORWJCekFjcHZaNXpDbE5qancydE4zY1BUenFUeHoxR1BRU09ta3JaZkxM?=
 =?utf-8?B?R1RIN2t0eWh2dXhrRGV3aGhSdjBEL0dFOFRQdU5PYzRkVVREWkVjc2dyT0Nx?=
 =?utf-8?B?cVh2WjlFS2RKcFExSTBPMFhDeXpYejVQMEU1RFk5OXFkWHkySTNQYzBHbmZX?=
 =?utf-8?B?YjkrMlpKYml3SWQ4Z1ZQN2Y2SXF1RVdQeG5sSkZlemc2YzRrUGtOcEp0eWhj?=
 =?utf-8?B?QXNoWkV4UUprWXNHdDY3bVc3RUNQSVczNUxxK1N1RlE2bE5aQlBsa1YvQXJv?=
 =?utf-8?B?VkQyZTRDZVo1VGZCbTYxaEVEb09OWWw3VTZ2bDhOcjBLdVk1VUFRNkljT0RZ?=
 =?utf-8?B?WkQwdHY5N3JWTWtGbmROSEo4T2NuUWQ2TTBIS0hXc1E2Q25mM3QwcEU1dW1l?=
 =?utf-8?B?S2J1WmdZZ0I3UWVsdjE5WEh1bVN3VExGK1I1cjNRczlCYml2cXNqS1k5QW9T?=
 =?utf-8?B?cDJzK2J5VGRWbG92SmpUUUJ1RmRxaU5oM1lVdGRpLzVaRE1DV0VLdndYeW8y?=
 =?utf-8?B?M0NhMmc3c2gxelNtbnRrSnRqRFBUQlVEaUtCc0MxYkJCR2VuYXkxbnJiQklQ?=
 =?utf-8?B?K0pjV2Rhc0ZmeC9uUlBtMEZ2czR5Z1VycTZWNkhBMWROc2tKVXpEQ3NVdjBL?=
 =?utf-8?B?TmhaeUVyd2o1dUFVbTV3THRrY2F1dkFvb09vTWdMTWRrR0xTalF1WjJoSEVM?=
 =?utf-8?B?cTlMTkh3TFNlNkZ0VmYvOVZESFF1NTZyQ0l6c2t1OExXWG8vUGRpbUVKRDJG?=
 =?utf-8?B?OHNwU2tvbWo1NnN0aGkrUXhrMHRGNzZpYWhvaVoyelk1cWx4dnlvb3BwRTB3?=
 =?utf-8?B?K0pURDdMdnVNNnBnMUhwdndpUDZCWFlhOFBqemZTb2YzNnJkK01wcFhmcUdW?=
 =?utf-8?Q?cF07gY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR01MB6756.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elI2NW9YbzFwY3MxcU91Qk5VRHlNQUNHTkM5S01HU1JLZStuVVZxelMrYWdt?=
 =?utf-8?B?NFVnN0I1UlMzTVZ6cTMvY0JBbUZqbm9CSUJIc2J1ZzBSWTRhNGVlLzRQZnlM?=
 =?utf-8?B?NDNIWnY1RHluYmpkV3NnZ3pndUlObGQxTmQ0Q3p2YkdPVFZwSXdiaUt6ZTlS?=
 =?utf-8?B?Rk5rcDkzSmlVck5DYStRTXUyS0VpOElYb1pzaTFSS2plSXFHR2lQTW1od0Zh?=
 =?utf-8?B?djZpQXA0K2hvVWtNdXZQcjhiaWZOU24vK0R5QWh0QTJrU1ZxUGV3ak4vOWcz?=
 =?utf-8?B?eEE5VUx2TlFxNzZzNnp1QmtiMldQOVo3V0pjVlpRNm1DcUsvM3lFNWRWYnFU?=
 =?utf-8?B?MVVyekUwM3p6ZktDMy9KdHQxRmt2STkvcHkwSmdYUmFRcnNqQmR1QXpWVFVw?=
 =?utf-8?B?T0VUMUt3YTc4ZityMHBIY0JoYmxhQy94Q1NWVG1YQTF3aGtjMlZDTk9XZFZz?=
 =?utf-8?B?c3p5eGpsbjFoOWFkd0U0MzY0OFBQZjZONHZJMlA2dEpsK2pKMEZOSllMVEN5?=
 =?utf-8?B?cjFIQ2NxSFFyZTc4RXZDQm9QV3VQK3RkbDBKT25mUCtyT3ljWWxHM01WcDdJ?=
 =?utf-8?B?MmEyUTA1dWJMeTB2M2xqYjJVelpkOGNJb1BjLzVwSC9SV0ZveDNBdnRZSzYy?=
 =?utf-8?B?S01IeFhiSjZ4ZTBNRENONGRkZzAxMWJzQW9EaGdpdVphSE5wMXBSb1JHMS81?=
 =?utf-8?B?MzQ5dlBjWkVrRnVGcW9rQndQNFpoQTlkMDQrZ01odUZhUURiQXRXZnhqV1da?=
 =?utf-8?B?UE1LN2ptN0EwSFNqT0dMKzZGcXZOVVhXelVnanl2eXJWSEhFRVNQM1o2WG1C?=
 =?utf-8?B?aXhxY0RJSCtlRU9SV1FjaDRydVZsUG4rQ1FJWFhJTDFzNTY3bGtTbFhuQW03?=
 =?utf-8?B?aFFOTEpFUG84WXh5RTVpOW1hWlI3UFQySmlZVGhwTytjazdYYmtaK25tRGcy?=
 =?utf-8?B?Ukh0Y08wK29adTZlS25yNUZGVVNQRk41TUtKOGRnaEJ5VmcvRHBDMHQvemlq?=
 =?utf-8?B?eTczLy8rSHB6bjhWS3cxckVtYk1oZWxJeFVxMVNGUU0xWER5dUl2L0xlWTVi?=
 =?utf-8?B?dGNEMWZyWk5GekhsVXBXU2lqbnAyVEdJM3gwNDJhS1hrZVQ1ZGEvYkNJQ3N2?=
 =?utf-8?B?L1lrN0F4OWEyUWxzNWg4Y3lrYXIzWVBWUktOVnVuNGRzMHJ2czdvZXlaajgy?=
 =?utf-8?B?YkdwMVI5ZjRNSmlyRHNoT3pZQTc2cGprTVl2TzlOMy9jRko0SStsaXJTRVdR?=
 =?utf-8?B?RkNlUUdES1daOUNWTHQ1Y2w1SERWdzJTdUg2ZnNoSFlDMk85WmFrQWt2dFpG?=
 =?utf-8?B?dUhYZGRuRVZJdzc5bDB2QWJETG1CclN3Mlc3UmJnTjg0ZXNmY1RoZTlCdXdE?=
 =?utf-8?B?bFNLc0pLenpHT2hYZFBNRVNqMnRrNHIwRHlZdzlCSU1yZ3NkZndUYVphZHhK?=
 =?utf-8?B?ckdZT1pKMG91cU5hVnpqWWlzdXVMUUNTbGpXVjQ3QU1vSUsxQ1NGeXBDRi9S?=
 =?utf-8?B?ZG8zYlcvdFNXS2xSaVVxRlY4RVorajZyY0l3aHRydHNOOTBoQ0RsY0k5allL?=
 =?utf-8?B?TkFvbW5ReW1nbVNPYmxWK3ZnNS9wYlpCRnRZc01qTlRmSzhxd3NZaGs4cTZU?=
 =?utf-8?B?SGFoQlZnY0dSWmtiZTRBVFVjaytYMVhVOVhNUkVuU08vVkNtR0F5ZEczZFEr?=
 =?utf-8?B?UUNQR0JpU0VsR2cwZGRKTkxwb1Y2VU9GZThYTVdBY3RmbDRSaitwOTUzL2JF?=
 =?utf-8?B?cm0yakdHNUc5RTcwQzUvVmYzdmVmamJWcVpxV1gzQlR1NVR2cGtYQzF2eDds?=
 =?utf-8?B?Z2cwRk9oQ1dHcGo2Q0ZJR3VDUnRmL25GRG91bGFSZnhmUldPRlc1bnJ4WlB6?=
 =?utf-8?B?Q0pzVE1zYjRUL2RpZkdQcnAxSXFqbHVFaytObDdEc0tZYVNvR0dtM2luQnNY?=
 =?utf-8?B?aE1iV21EeGh6T3NnSmRnbDVzOUNHWkM4em1XTkhweDBObEkxblU2Qlg1NzI2?=
 =?utf-8?B?STRwZjBwaTJCaS83MVViYUt1OGxaR2t1YWxaOWU0T0o5bFdCQjhxMEhYSUpU?=
 =?utf-8?B?ZFB3akQvSmpFdmNTb0Y0NjRObGl1UTZDSFZOdEIyUnI3RFFQU0ZTUDQyNmtT?=
 =?utf-8?Q?3B1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: joelsplace.sg
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR01MB6756.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac3fcfc-d2a6-4ff1-f4f1-08de1fea2363
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2025 23:46:00.9280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d3cf250-83cb-488b-b882-323bc2027851
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXQtVjmURpf3z/bf8OkXMtkXEX2cMCcszI5MjlpBm4TfVeJOctOeaIetFeZvGoX7g6Qd6ujkD2zT0L0at+SHLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF12218DC95

SGkgUGFibG8sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFibG8g
TmVpcmEgQXl1c28gPHBhYmxvQG5ldGZpbHRlci5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgMTAgTm92
ZW1iZXIgMjAyNSAyOjIxIGFtDQo+IFRvOiBKb2VsIExvdyA8am9lbEBqb2Vsc3BsYWNlLnNnPg0K
PiBDYzogbmV0ZmlsdGVyQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogY29ubnRyYWNr
ZCB1c2VyLXNwYWNlIGhlbHBlcnMgZm9yIG11bHRpY2FzdC9icm9hZGNhc3QNCj4gDQo+IEhpLA0K
PiANCj4gQXJlIHlvdSB1c2luZyB0aGUgYnJfbmV0ZmlsdGVyIG1vZHVsZSBpbiB5b3VyIHNldHVw
Pw0KDQpJIGRvbid0IHRoaW5rIHNvOyBgbHNtb2QgfCBncmVwIGJyX2AgcmV0dXJucyBub3RoaW5n
IG9uIHRoYXQgaG9zdC4NCg==
