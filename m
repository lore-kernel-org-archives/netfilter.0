Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022131.outbound.protection.outlook.com [40.107.75.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E36350A0E
	for <netfilter@vger.kernel.org>; Wed, 12 Nov 2025 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959771; cv=fail; b=nKIE9QTRwk4ZQNFXlS07e/9+okmwPeZmn1EzW4a9SseKuclQly2wOQxXHcLYLyzQMjfBQbWVDxR+ADhurPviwqks7oXvgcd3HHR3LEYs/6hpO1fOXPCu6XP9cpamrwUaRuckSuXymf0iO7ROAbt275XOta2Pq5jUutaTZFHUu0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959771; c=relaxed/simple;
	bh=m0eXRIOTfxjJ5EJMOg5JeH+3NFTRGcjRycM3cKAbTxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KaXDo8NYenye0Fr/PIkY/UkNejNmtVJxw1p7JhRAbduG12SN3fkbAl83dbme7YaEx63Ku10ZmOYjJO1sJQrYgEwvbV94HEQGSWGKkGnVIlwdMfgW7pPX1fsFX+dF4iBzSJrZtBtr41xGQjI3P4PAorZm2hHJNIXi8WMVURatqDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelsplace.sg; spf=pass smtp.mailfrom=joelsplace.sg; dkim=pass (2048-bit key) header.d=joelsplace.sg header.i=@joelsplace.sg header.b=kCyKf+WM; arc=fail smtp.client-ip=40.107.75.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelsplace.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelsplace.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joelsplace.sg header.i=@joelsplace.sg header.b="kCyKf+WM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBhSWMIU/Ii7ZJpfvkSF+OkT7+pQhdHcXxLY2cz9HZKgtgVmbrKUpgQjNH/dltCoDKqKcP1JRkOeJR+utH/QsIh5dBskbQ9zbtbYxb2VcL7mt4uoCiUKF/LhttGSfDZw2GuYQ7TdrroewFZrhqWIadFBVu8mQcy7/SLQMIiT9UxKJl1d8a+DMkkSQSuNpTrwl7c5aEPaFvB/VLt0izISBUrQGWgFOGcGu/EGLVBrzOvihAyGt5eSlGEuVkjJSWHS0YDRfhEjlEUzS76LdSWFmnhExr4ceZZ/xpJOxuiCbWbFX4dsZVPYgyZUVwfbh7HGHsAVhSgx1SrZ2bOfac7N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0eXRIOTfxjJ5EJMOg5JeH+3NFTRGcjRycM3cKAbTxs=;
 b=fAwu0pkeUkbWJh+U15OYV6YDuLV21ADxNYe60zaDc92GPGJo2wDnZzMGrviQkD03FHFfArYbcLEJlF+wdxEzJUqZ038/0X/GIffwkmoV362bRuDU+nDxqsmaPcfDx1D3J4bXywpG/NOkLiRti1qaKqUCSIUub/adVg6cLm3++u488VcbHuzIwGFPHAljHmfSQnWeyQ+j0T9PUkvolQ/uNNFoz6hIl++3tyP6m3lXGSV99KNJNR0xUtIU/zy52ro6CUXYe9/UgGWCUxOIo1w3Z2KduTv6J3vKwahpdyLn5gYbRPinUPm7tEUp4fHlgZ8tfkY9/5+EOU7MI8EhbD3fNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=joelsplace.sg; dmarc=pass action=none
 header.from=joelsplace.sg; dkim=pass header.d=joelsplace.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelsplace.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0eXRIOTfxjJ5EJMOg5JeH+3NFTRGcjRycM3cKAbTxs=;
 b=kCyKf+WMb2uDMun0NTeVsGnT8ShWq2LyGsMHlA24a/Q5HfPTrJltWHQh2YbGbDbwuGPIhCWjDY0guHek2lhXuhjusprhkcINF0ppdSrQLMtITlsg885bnA+IhSUzDZPyNw32iONLbVYTDdeR98USG/kBKtE4IY8DKPxAgBxxPIIUn4snl7Q9C9w3jBQqZbk+neEvQs/iB0D1hXbVCIv+DFzOdyW8ws2qjskRYBzJHVenr+CYVYOv2BpfqTtCKZjh3856+VCaaTAC3xzVZ9dRFGNMKngnZmzJhPAczes6UryblxiixsdgsSEz7ORAZHQzS1ZfjuxkM/laSntXp/j4PA==
Received: from TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 (2603:1096:405:9b::13) by SEL0PFB2B854072.apcprd01.prod.exchangelabs.com
 (2603:1096:108:1::5c9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:02:42 +0000
Received: from TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 ([fe80::f8ab:e32a:aaac:9ee3]) by TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 ([fe80::f8ab:e32a:aaac:9ee3%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:02:42 +0000
From: Joel Low <joel@joelsplace.sg>
To: Pablo Neira Ayuso <pablo@netfilter.org>
CC: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: conntrackd user-space helpers for multicast/broadcast
Thread-Topic: conntrackd user-space helpers for multicast/broadcast
Thread-Index: AdxQXIQiScm/X6EhTUS44wy1sdYfGwBSRCIAAAnZS/AAev/tAAAKw/Qw
Date: Wed, 12 Nov 2025 15:02:42 +0000
Message-ID:
 <TYSPR01MB6756260D9039F4B757261A10C8CCA@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
References:
 <TYSPR01MB67560AF00CC17680A5DF6175C8C0A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
 <aRDbhC3rnP9Z7CbU@calendula>
 <TYSPR01MB6756856A560B3C1F95B24449C8C1A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
 <aRRXDBQBQ9vogZg2@calendula>
In-Reply-To: <aRRXDBQBQ9vogZg2@calendula>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=joelsplace.sg;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR01MB6756:EE_|SEL0PFB2B854072:EE_
x-ms-office365-filtering-correlation-id: a72c0328-3dd4-4b52-3e50-08de21fc8781
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnFoc2pQTVlwZ1RqQnN6ejdFcDIwbHRhT3NhRllJbUMxUXBDWFFGZG5iSVcr?=
 =?utf-8?B?d0FZc09LZkJLMUJVMmJlRmVxV1EraTIrZzhvVm5zaFhFK1pkeHkyNFk1ZVB4?=
 =?utf-8?B?UDFKdlcxVTZ0NXlZSmxDTUFNb0JxMGt5My9tMU9lRUJpN2N3YWhrNWo3Q2dQ?=
 =?utf-8?B?R2JkSTJJb2liaG85R2x6UmlrY0V5TGFlSndueGpVQVFsMlhHUnJYZ0MvMFVt?=
 =?utf-8?B?UkhGeW1EcW5YZkNZemVrVkp3U1k2ZEhENlBxWFJIL1h3OEtkemVMcmVVWVRO?=
 =?utf-8?B?UjFQY2tValpYZEZUYmV5L3ZnbjNFdDMxV3ZKRnpNWWt5UDZ3VGlCUzhwS0V0?=
 =?utf-8?B?NXp2WDJwUjM2ODAxUkJpMCttWFMxdGtheE5tVW9pRHl2dFphUUpHN2tCOUgz?=
 =?utf-8?B?aGhTR1FCRStIeEo3cTAzaGtWd3ovT0VISFZZeVVmTzgzSnpmMURxWGZJV2Z5?=
 =?utf-8?B?a0FNSHJIU1N6ZGZsbms3di9HWi95cnV6T0pxbWk4RXVRMzhGL0Mrd0tpZXpO?=
 =?utf-8?B?NXlERjJSM0o1c25ad1FpcnFhbGZyN2VQY2RGYWxkSkM1OXJEV1ZzM3ZVSVkx?=
 =?utf-8?B?dWNCWjlmdlJXY091Z3J3WWpUbHVIaysvNVNodCtEWTVhbFJ1N012TVVRRU0r?=
 =?utf-8?B?UzRSVUdjeXIvRUFjNCtmOEFkOG5tMTdIZE92UERwQ3F0dnQ4MEpxS0RUN05H?=
 =?utf-8?B?N2trc0RZRmR5KzQ3YmFuZk1LcWhUSlFPTnZiSkdrM2RZS0pQeG1zSmlvOUIx?=
 =?utf-8?B?RDdFd2RHLytEOXdESldTQmliRWFYSWM2RHRXeHhJYlNXczBJc3RXajlnK05o?=
 =?utf-8?B?VnFMRkE1czN5ck9LKzFlaVdVNm8rNFFiNjBjZFRSdFRPUkhZWWdXd0xJNlgx?=
 =?utf-8?B?YXZLNU5TTTZTRTRlMjNOalI2VGtZc2djc0h1WXg5SW1IL0NXeDViWW9FQVdy?=
 =?utf-8?B?Tm9lcHRKclBSWkh6My81SkdrcmczM1NxcFR5NlhpYysveEY3THBlWFFJUXdq?=
 =?utf-8?B?Qm42aXdpRXVyeVdrd0NnbTFKdjZsbTBzUEM4U0J4bHlYL09CbXhvRHQwb2c0?=
 =?utf-8?B?SGJLT1Y0U0REM3gxMWNrbnBuM3NndEE4Vjd5K090NmxDYS8vZU91NXdhL3lY?=
 =?utf-8?B?THZTV2t5T3RyQnk5c0wzWVlPeHo1Njd2MVEvVFdxZUxMMVg1MHpzOUlGN1Fx?=
 =?utf-8?B?OGxIZlp3UHJKT3lHVGw2dWhhWitBc0ppdHh1NEtidm0wSThZWVpySFc4YUZS?=
 =?utf-8?B?dDBOalQxM3VPWk96czRESGNkZlhYTndVNTFjeE1tRExUT1NxaFU1ZEp4bTIv?=
 =?utf-8?B?N0dhQ3p1eVg2TGtUZmdBbjVqOEFtVHhWbDdTSHA3dTNLZExIdlptV2tSZFov?=
 =?utf-8?B?VVNPeGMwUFlLN3l4VUp4Lzg0d2gzMWhrenQ2K2lMbHlzd1VEOTd5U1gyNStu?=
 =?utf-8?B?eXVaODd2M3lqbE01S3c2aG5MQ3RLaURWOUlnS2prWG1uanh4U0dDYXRQNktx?=
 =?utf-8?B?RGlmbEoyK3NTb1R2Q2E2SkRxSW82N0hPYUV0UnE2ajFWUGo3S3l0R0xyOUFI?=
 =?utf-8?B?UFkwRGJhVlUvbjB2SXk4alNoVmZYNXFoK2l5TWQvdGtBYThaSVMvL2d4YytQ?=
 =?utf-8?B?TTFmdjh2YmROUmxIMVBjdThHRWgxUnRLVGRKVWJwOU9UY2J2QnVCT0hPSnBB?=
 =?utf-8?B?dUd6MHRQSE5Ua3ZiTWRyL0srZkg2RUNBdmh4MVZDclI2aUNUVHZMenJFdHEx?=
 =?utf-8?B?K0FGVFJxNUZGOXZaeWxQaGRBMm45blRNY3hmcDlLMUJRaEZzUDdRQXIyWkxB?=
 =?utf-8?B?YU0zMVVRNG11dDhWNE13YlRweExSV1F5VEhnM0R2T21pKzVtVWRvMzB1dHE2?=
 =?utf-8?B?K05hd0JUbzM4MGV5U0oxakNKQ3RSWWVmMjZvMlJVbFZNL0dsaDFhUDVUS0dk?=
 =?utf-8?B?VnJoUjdFa2xmN2RSaG9zZ1JEZEdDd3EreHFaVnVVeWJ0bWdUL1dmZ3NyaHV2?=
 =?utf-8?B?OFlDaS8xKzBWQU9DNnRiQnZsRmYxbnpZeXRDTEdmcDBUV0hURWJsSVQrM3U1?=
 =?utf-8?Q?jqA2hr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR01MB6756.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?am5hYjkyeUVSWHdRYklwWUtaK00yUXlCYkRnTmpKbVZzbkc5MlZSSmdaSTl4?=
 =?utf-8?B?bEZKaU95cVl5UHVrZFVLczFqU1ZSbXdZL0hJTjNKQ2ExSFZudDRuYVhHZUZ5?=
 =?utf-8?B?UkZ1VW0rcEt0cmVDVGcxdncxUzFUYnBWUnVUc1hOYWcxOElaREJzcWJEMDlK?=
 =?utf-8?B?Q0Q1SFVjaXRLbm1ZWEZvTVg2YjYyb2xGRGpyd1g5OWg5c0VDNEFheUx1N29p?=
 =?utf-8?B?WEVQTnM4NWEwWm9nTHRCTXJscGRjN2w3cXNaUFI0eEVYNCswd3RtZDR1bk5D?=
 =?utf-8?B?eUp6TVpPQ3Q0UzBQcWIyclFOM2svczFRTGE0NUc3NmpsM2FIa2hpVTdFK3dV?=
 =?utf-8?B?NEdRZGtvQmZkSldvdGxFVGlEL3IwdnJhSHRNd3QwaE5DSEZmcjNDT3dIb2t3?=
 =?utf-8?B?M3pYdnBhRHBxT2YyYVdCOGJ2V3hDM2lnekp2VWdYQzdOWmtlMjcvWjcvUlV3?=
 =?utf-8?B?VzFKOHcySGhENmVBNDJsZkUzSW5NV2NNbW5RYnFyOGVJNmh3N2dTQmRLUjN2?=
 =?utf-8?B?a2pMNDRaK2MrZDlTcVZBbk9qaFhoL1VKR3YvTU1sV1RXZmJWTWJIWm9BTXZh?=
 =?utf-8?B?SmYyWWZYUGlseFNWejZTZEpRb01TdzUxSWkxRFd0QldNckZLbk9oTmQ0djBM?=
 =?utf-8?B?SDdWY3pQZy9lTDZ3VFFzVnpkOWsrWWUvSytiSHNSYVBadkpqYllFMzZJTE1j?=
 =?utf-8?B?RHMvc3ZSMnljNE9hc3crN0szaXBpNHlPRzJ5WDM4TXZBVThtY2dtREo2d0h3?=
 =?utf-8?B?dzBMcXVuUkU3YW5penI1cEdlcXdrbU9oZUFZU2tWSlJGRnNpVzNNaUVwK054?=
 =?utf-8?B?UEJaZDJzNkxMWGNFaGFaWGlTOHpQc2tKUmprVTl5SWJzNTJkWlRoeW83L1ll?=
 =?utf-8?B?RXBuV2lJK1NMVHJxK2xoem9HVEFCY3J6MWIyQncydmtpbGR5V3RCL0RCVHZn?=
 =?utf-8?B?VENZaDFEZXQ2QVBQS01wRXA5TlBCYkpKSm5BenJkOCtPTmpsYVY2MW9JL3V0?=
 =?utf-8?B?WEVMcENnanROVlh3a1R3YmdtSkw4VnU3Nm91WHlKdnBOanJKR2VkRDFmbDg1?=
 =?utf-8?B?VzFzM3JmbnFQd1NPN3JOZ2d1dUdvL0NSNG1rR1ErUkRMbU9hSGYwd2RLa3V3?=
 =?utf-8?B?aHlDWnhnemdxalB5cWorSXpqbzVmcDhwRVpEQ2pJcmJsdEFyTEkwRjNwZExD?=
 =?utf-8?B?UG9obkFGMlZjWDdTaUpNazdBUXJaOEZVT1ViNm5Ra0svUkFlSVJ5WDlZdVp3?=
 =?utf-8?B?aXVmTXhRVkNHUUhsakc4VndxTE1vaHpnRFd2SU1GOVpMY2ZKL1lIKzlWYXNU?=
 =?utf-8?B?YzJrTlAxVy9KUWg2L2FrS094NFRKWnljK3BOOTM0ZkZncGh5VXRhUTIveGdI?=
 =?utf-8?B?bWpBSjlVWnZKeU56a3RMWGxkVXl4SXlMMHJBU2xmWlBhb3V6dmVqZkl2WHoy?=
 =?utf-8?B?ZGkyL2s3TGNUM0UxNjlSNUtabXlhVndxeDRHclR6WW5vTWJoL3NONThKYXdI?=
 =?utf-8?B?bnF0TTdlMDBhR2lFa3pPV2VwMXRmcG5aaEdRSFV2WVNETUx1RzRIU2pyQ3NO?=
 =?utf-8?B?NnUwYUdhRVlQbUV1TXJRRlRpcWZ0QnhxdDNjRHFJbmRCSWZVY1dxMWNwQXgr?=
 =?utf-8?B?TnRQa21jOEJDdzJpQ0R2cW9WYTZiMU93ZGk1dTFKM0RmR25XNThtV0k2dkRt?=
 =?utf-8?B?UDRPejFuZ1RSeW1RYlROd1c4bzlvbEQ1QldjNHFpbHRaZ040US9TZVRMNWJ3?=
 =?utf-8?B?Mm9McjhjV2JiRlRyNWluL2VsNVNUSTZBaGl3REE5aFdlcjdFUlh2M2pWMVV1?=
 =?utf-8?B?K01zZDZXTW1SZS94NHFPUERnZGk2SnM3amZhc1NrV2hvZXFidmQ2czNLT000?=
 =?utf-8?B?ZGVEdVRNWUpyTUhyRmFyOU9TSEZlRHA5OWRlZjAwNEpwZlFFQ2MxNjlDT1NC?=
 =?utf-8?B?RmQyUlFremd0UHo5eHMrengyL0dWNmgxUHUvcWRya3U1RDlaY3g3SWNZenZY?=
 =?utf-8?B?UHFQcmNlLzVReXVRU3pDaWgvWlJTaHpzSEJNOXhHWHFCM3NsSkpCOSs0NTQ1?=
 =?utf-8?B?SGJsZllOWU5rMTljVEtpenhqeUp1RUxVNWJObDdPaFcvS1RUSGJldTh5RWZQ?=
 =?utf-8?Q?FPy0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a72c0328-3dd4-4b52-3e50-08de21fc8781
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 15:02:42.1500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d3cf250-83cb-488b-b882-323bc2027851
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CtHiq3TFTtBsY6sqf0U1YGB56J4BW40olhBLmEfUzHhuZtB4+X5taxs8jO14TkbVih263tkzCbW2HtzeUdHmSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEL0PFB2B854072

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYWJsbyBOZWlyYSBBeXVzbyA8
cGFibG9AbmV0ZmlsdGVyLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCAxMiBOb3ZlbWJlciAyMDI1
IDU6NDUgcG0NCj4gVG86IEpvZWwgTG93IDxqb2VsQGpvZWxzcGxhY2Uuc2c+DQo+IENjOiBuZXRm
aWx0ZXJAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBjb25udHJhY2tkIHVzZXItc3Bh
Y2UgaGVscGVycyBmb3IgbXVsdGljYXN0L2Jyb2FkY2FzdA0KPiANCj4gT24gU3VuLCBOb3YgMDks
IDIwMjUgYXQgMTE6NDY6MDBQTSArMDAwMCwgSm9lbCBMb3cgd3JvdGU6DQo+ID4gSGkgUGFibG8s
DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBQYWJs
byBOZWlyYSBBeXVzbyA8cGFibG9AbmV0ZmlsdGVyLm9yZz4NCj4gPiA+IFNlbnQ6IE1vbmRheSwg
MTAgTm92ZW1iZXIgMjAyNSAyOjIxIGFtDQo+ID4gPiBUbzogSm9lbCBMb3cgPGpvZWxAam9lbHNw
bGFjZS5zZz4NCj4gPiA+IENjOiBuZXRmaWx0ZXJAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBTdWJq
ZWN0OiBSZTogY29ubnRyYWNrZCB1c2VyLXNwYWNlIGhlbHBlcnMgZm9yIG11bHRpY2FzdC9icm9h
ZGNhc3QNCj4gPiA+DQo+ID4gPiBIaSwNCj4gPiA+DQo+ID4gPiBBcmUgeW91IHVzaW5nIHRoZSBi
cl9uZXRmaWx0ZXIgbW9kdWxlIGluIHlvdXIgc2V0dXA/DQo+ID4NCj4gPiBJIGRvbid0IHRoaW5r
IHNvOyBgbHNtb2QgfCBncmVwIGJyX2AgcmV0dXJucyBub3RoaW5nIG9uIHRoYXQgaG9zdC4NCj4g
DQo+IEFuZCBubyBidWlsdC1pbiBDT05GSUdfQlJJREdFX05FVEZJTFRFUj15Pw0KPiANCj4gSXQg
c2hvdWxkIGJlIHBvc3NpYmxlIHRvIGZpeCB0aGlzIGJ5IGRyb3BwaW5nIHRoZSBjb25udHJhY2sg
aW4gdGhlIHF1ZXVlIHBhdGgsDQo+IHRoZW4gbmZxbmxfY3RfcGFyc2UoKSBwZXJmb3JtcyBhIGN0
IGxvb2t1cCBmcm9tIHRoZSByZWluamVjdCBwYXRoLg0KDQpGcm9tIHdoYXQgSSBjYW4gdGVsbCwg
Q09ORklHX0JSSURHRV9ORVRGSUxURVI9bSwgYW5kIHRoZSBtb2R1bGUgaXMgbm90IGxvYWRlZCBp
biBteSBzZXR1cC4NCg0KTXkgYXBvbG9naWVzIHRoYXQgSSBjYW4ndCBjb21wbGV0ZWx5IHVuZGVy
c3RhbmQgd2hhdCB5b3UncmUgc3VnZ2VzdGluZyBJIGRvOyBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIGZl
ZWwgbXkgd2F5IGFyb3VuZCB0aGUgY29kZWJhc2UgdG8gYmVzdCBpc29sYXRlIHRoZSBwcm9ibGVt
LiBJcyB0aGVyZSBzb21lIGRvY3VtZW50YXRpb24gb3IgY29kZSB5b3UgY2FuIHBvaW50IG1lIHRv
IHJlZmVyZW5jZSBvciBhcyBhIHN0YXJ0aW5nIHBvaW50IHBsZWFzZT8gTXkgYmVzdCBndWVzcyBv
ZiB5b3VyIHN1Z2dlc3Rpb24gaXMgdG8gbWFyayB0aGUgZmxvdyBhcyBgbm90cmFja2AsIGJ1dCBz
dWJzZXF1ZW50bHkgcmVpbmplY3QgdGhlIG11bHRpY2FzdCBwYWNrZXQ/IE15IGF0dGVtcHRzIHdp
dGggbm90cmFjayBzZWVtIHRvIHN1Z2dlc3QgdGhhdCB0aGUgZW50aXJlIGhlbHBlciBhc3NpZ25t
ZW50IGFuZCBwcm9jZXNzaW5nIGlzIGNvbXBsZXRlbHkgYnlwYXNzZWQgYW5kIHRodXMgSSdtIHBy
ZXR0eSBzdXJlIEknbSBtaXN1bmRlcnN0YW5kaW5nIHlvdXIgc3VnZ2VzdGlvbi4NCg==
