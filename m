Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022096.outbound.protection.outlook.com [52.101.66.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F62225779
	for <netfilter@vger.kernel.org>; Fri, 19 Sep 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758263869; cv=fail; b=jY6sZelFz/vFV/GrnvPB/dG4kNDbVBovkvaZiNmOilMniIZbC0m4ET1TxlhFq9Y2ik4sVHYGTMXxe2mc5B6yZTONIF8kBqKTvNz+TflFuCs/KzhO0D4dfi0heiW6g67UhU7LO3h4BofMYRRklZhqMyotFdJPsakWBA87jbrCrik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758263869; c=relaxed/simple;
	bh=XtfjW2Zn29Q8x1mtBa4LJEjSpi4th+uUn+Qdiz9kK7M=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hs5bnAp54tBH44K9OTU2zSl15Zwvizxtdbg9PsrWs8J9ojLOX1q9KfDvgZg+6drimLSd9nJFS0UWJf3PmvWgQ4dHQbI2rUnubCtpomaEWswBEySPLXqVf+LjTNJcLr5YyaWj/y0Ju4cpRr5UVbDQbgApLZ5jfI3t724EiM64jVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adresys.com; spf=pass smtp.mailfrom=adresys.com; dkim=pass (1024-bit key) header.d=adresys.com header.i=@adresys.com header.b=cHR9sXQi; arc=fail smtp.client-ip=52.101.66.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adresys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adresys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=adresys.com header.i=@adresys.com header.b="cHR9sXQi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdGF5CjzrVg+KZGMXIQulTLTbVPBEMvUxWCBDOHW9aU4xQEZBDYx2pycGfbl/frWL/xnSunIy3OVeAAkSV1l7FiKtk78ru2qmnFwKpqzE1qMYgKhV4DxhXUMYog1hCBoaK5XoClK44Ntd8tgv6F84+bbcajbS07cIg21H7haeGmygPQ97XtzGQh9cXTzllZlvoIP6EIJwGNT6Zu/hWZmaxG9ve3gCQQZcezkfCLbzJBGLJUuvN5BRxvNaSbTNrVyspXlHsXIbUqgxXRJNgQ1k0Y+0g0ujPOI8rqQVoFdX09yWPacm7rRs1ssiYUMvR481JaNs7NFT1keNR9V03a9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtfjW2Zn29Q8x1mtBa4LJEjSpi4th+uUn+Qdiz9kK7M=;
 b=pH3/Zr2KjQNBO1xXXfojWWPHIXh8g5V7yPVdci+LD8ezPsAFKFYus64P2PlZWeLKL95u1828oy2qvnw8xIfVjPEGNIw+iEyEc2qZm28Dc35HyEscDywKpoG0jhx7mdpgPj6NDtAj5wts/KAINwrhJqhpDzveuFkGdepjmS5el7aWybelu3fFSJLlb3ynnOoZJtoixpXnNd0a4EUB28OxUg99A+TUl5lI6KYPXRhS4WspCrmMo1Qp0E2GYYokSFyYDzYNNMr52StMqbej0pxKtYvlNi9cF+wB93olOz6PmksekrqvrlcC0B7ajpnwUE/0T1B8IiTejnZfIeNlZUYkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=adresys.com; dmarc=pass action=none header.from=adresys.com;
 dkim=pass header.d=adresys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adresys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtfjW2Zn29Q8x1mtBa4LJEjSpi4th+uUn+Qdiz9kK7M=;
 b=cHR9sXQiaWCIEjCoxq07zyBq8TUuI5HF86KWQ2Ku0UJfBIVGX/H/3vgpy2FP7n+u0LJYM75TySv/WIYtNh1m5mlJbDIV8QG0XYsbSLQYds4A3cuPiNZyVC7XJhnEJW7OD3VceZgrEmepiVpQ5KrDFxhPkRaRRUGi7DFgb6WjA3A=
Received: from PAVPR03MB9137.eurprd03.prod.outlook.com (2603:10a6:102:328::17)
 by PA4PR03MB6864.eurprd03.prod.outlook.com (2603:10a6:102:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 06:37:41 +0000
Received: from PAVPR03MB9137.eurprd03.prod.outlook.com
 ([fe80::f783:c4e6:e8df:82d4]) by PAVPR03MB9137.eurprd03.prod.outlook.com
 ([fe80::f783:c4e6:e8df:82d4%5]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 06:37:41 +0000
From: Martin Weber <martin.weber@adresys.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: netdev egress 'log' + tcpdump : capturing 'Bogus IPv4 version (3,
 must be 4)' packets
Thread-Topic: netdev egress 'log' + tcpdump : capturing 'Bogus IPv4 version
 (3, must be 4)' packets
Thread-Index: AdwpL4IuFPMbpKotTUugLb3YAzix8g==
Date: Fri, 19 Sep 2025 06:37:40 +0000
Message-ID:
 <PAVPR03MB9137E7B52B4174E4F9F5AC399A11A@PAVPR03MB9137.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=adresys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB9137:EE_|PA4PR03MB6864:EE_
x-ms-office365-filtering-correlation-id: 64ff4677-58ee-4478-454c-08ddf7470840
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eVB4UmF0VHByUXl2a1R4bHRDOU9DcC9xUzdCSHJ3Qm1HMjJsZmNRWCtYUlFx?=
 =?utf-8?B?UEgvb1hnWWNBMVhORTlDbkRFZU1vcHdiQ29oNGYyR1V3TUxVNXMzYU9RejdT?=
 =?utf-8?B?ZDZGRG40RWZkNXlsNjNpQUdTZDNSVytPMGZaVWRJMVQxb0w4c29LdFNWNlJC?=
 =?utf-8?B?bGhQb3RvaGV0VnRxNW5uR2xuVXBXTFZ4SFBzMlpDTmdrVjZ4V0tPT1NjMWtt?=
 =?utf-8?B?SmRYS29FcTNPTU0zaC9IZ1k4aEVBRzUycExJT3p5L0syT2hYdmVSd3pZUlpw?=
 =?utf-8?B?U1VDVHhGd3RVcmNhUTdoTGNwWER0REtCc3pmalB0bWk4Qmw0TnNiQWNmZzlW?=
 =?utf-8?B?NUJieUlicDlxOEg0c3ZOcmtkUCsvUTBjR2ZsVFRlN1ZMaS94NEp3R2cwMHd1?=
 =?utf-8?B?bS8wRVp6ZTFITTRUN08xaVlhR3owVjIvNm9wU01pV3c5ZVJ2YlFyeTU3V0dE?=
 =?utf-8?B?MktmbU9RYWg4MEc0cEdsdWUyYmlDYWEyeVVhU2N3RHdlR21pUVBtUG1xWEtZ?=
 =?utf-8?B?Wm1JYjhLZ1MxNVRlMmxsY0lYMFFaV1c0Z0hvaHYxb3lGVFNac3owSjhXbnJO?=
 =?utf-8?B?S1hGd2tQWm1adGdnUG8xZnQ4MkdVU0tOL0Q2d0VOYytVVjlxcHhPSGFhM3Vw?=
 =?utf-8?B?UmdKOUFSa1pMODA4OVBjZE1ZK25qU2xVTzV6QkpwN0ZtMjQ5WVdyOHFYZWNl?=
 =?utf-8?B?dU5BTm5XVUVGeXVJQzc3Z2M3cVM0TlVOYVV6ZmxUVk5NdFVBU2R0SjRnL2ll?=
 =?utf-8?B?bldMTTNBNlFlSTh5NysreU0yRE9rcVVmVDJxbW1MTE9DTnhhcDEzaWt0TUZD?=
 =?utf-8?B?d3NBajBOTnVmaFk3MXVTZEo0cTEzekpDTnh6YVMwemM5TDZhT1p1YngwU1VH?=
 =?utf-8?B?dE00WnZvaHl6K3BHdmRqQ21GVEZXRDZZNUZUTTBBNEcxbDhpeHBFenhvL0JR?=
 =?utf-8?B?RUY3aXIzTFhMcUV5UE11TzdPZWVZQjZCZXVhQ3ZnMkp0eUFkOWZuMm5tMEY0?=
 =?utf-8?B?M2NEUURrWG1pNlc3d3MrbHZ5cHhXcDNjaUlMdGdvQVNxRnlPMmtRUzlSU0dz?=
 =?utf-8?B?OFAzZlJMVE1aSC9XSDMweTQydmZPTlVNek5LUGpCRUg5SkgxWGtOR1dPcXpk?=
 =?utf-8?B?dk1qaTNBRDNsVHFVOTB5dytCVWgwQm5TQkdLVHNoY3NHV0R1RTlBdU5VWTZ0?=
 =?utf-8?B?ekVVVXljVlFPNW90cE5yM2ZvVGxYNUxYN0xlUXk3WktHbjBxYUZlb3VTSUtj?=
 =?utf-8?B?RThvN2tid01IWEZPL2VmL2hsSEZ4REs2V1V2Qi9JYVRLbjFlLy8rUmRvVmNl?=
 =?utf-8?B?R3d5Wmwvb2QxYkNuUkR0S2F6TE5DTzN1YTk2emErQU80aEhmcm9sUnJhR1lX?=
 =?utf-8?B?K1NTUUpnaWdWRTAzMUlBNnFTbzB4V29WWmN2M1RGMkJTbzVpWmVZWXFCZmdE?=
 =?utf-8?B?c3VPNkJ4cGR0ei9tMUxHc1Z1WW51VUNHN0xKOHRGem5BR3pKMDJsV2NVWEdz?=
 =?utf-8?B?eDRpRU9RTWlCNTJnWGtEcmhFYjQ5RW5ScHNGZ0NXVEhEOXh5SmxWZFdTb0U0?=
 =?utf-8?B?UGhLa1ZGeVBwNTlLR3UvZEUzZmppaTNrUDFtSVhNZzZDZ0hFaC85bERsMk9K?=
 =?utf-8?B?ZnM5VFA1VFRub3kwbTlQeXdMb0RqanNsNHlhQ2s2Tk9Ma2RNMXNpd2F6Q2sw?=
 =?utf-8?B?c0t0V3E2R1lYeEZFd2lBRlhqT3Frb3VYdjhzQXkwNmRReXh3MGxmZndGTWZV?=
 =?utf-8?B?bFNGQXQ1WXo2OWk4U08yQlY3QlgzRHNPV3BLcUhXL0ZtT2ZHYkRBNXAzUjJH?=
 =?utf-8?B?ZnJsR0VhdmVSSXRLaHJTdzhSQzNCVVV1bVJXbHcxdE12eW1jWWFIL2p5dFhE?=
 =?utf-8?B?Y3JNMXZuMjUxQUZ0NGNlMWV2QVNMV05NYUNDeCtTVngyL2F5c1FhWGFzeTJ6?=
 =?utf-8?B?b1RCVVBIeGROUkZJcy9adkRzcVc4bmhXRTlCQnNDYU5LNGtrYitZUFpMcFVF?=
 =?utf-8?B?cTFsUHFYeGV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9137.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnd2ZG1ZSTJ4RzNVbzh3azRFWU10Si9MZGFlUElBVStlb0pKa2I4K2REWGow?=
 =?utf-8?B?SkVWY3VkQitrRnBUSnJDdEVicnNXK1FMMkNkV3FLdjZIN2NpNjJPVVZJc0dK?=
 =?utf-8?B?UlhnMmtEQXVoZzQrYlhvdWpWMDUzTW9iUlpJUlprejFVZFdQZjBGcFdRVXcv?=
 =?utf-8?B?NlZMQ2Y3dzJmcHd2R2xhKy8vWCs4REFLYUc2K3F0RTlqNXRPLzd2N1dLT0dq?=
 =?utf-8?B?aUI4MWRnNDhLd3VIeVpjMHBHNDFmY2tpOXVmWnh4dVQzc0x2VENqdDl2WU9D?=
 =?utf-8?B?cFFBbDJsNENDSEdFWElEQisxMTBKK0NmSmFoWFM2M2N5aG92cVhmR2lUbmth?=
 =?utf-8?B?cFl0K01jcTNZaHdEMSs4QUwxVVZlSDJGbHhJRTJTNy9IdjkxYkdGcWZhcU5F?=
 =?utf-8?B?aHl0R0x1YUZmbEE5aHN6dzdzYWVGMnVPWVk5c0VqeXRPeElJRERwSFNRcmRR?=
 =?utf-8?B?RHZubzgwT0g5RGVsVEhzdWJiTmVWclQ5VElUd2haejg3dWVMUU1mcFVENDlq?=
 =?utf-8?B?SDliU25tenltSmlKT1BLV1luRHJFWXVCbHdhTkVVNEJYTmJYNlJieXJxZnFi?=
 =?utf-8?B?NiswdFF3M250WkN5dHA1alV6MUJieEsyRXZqVlZ4T1lzdTVLVXVxK1hKZ1hN?=
 =?utf-8?B?cXFaQ1FieG5PRDQrK0dZb3Eya0JyNG9KRDVIVy9XMTllVnJxd2gxZVUwdm1T?=
 =?utf-8?B?VHBFNkpWcjNlV3Y2ZHZQcnh3TDUvM0VsWG1uSjlvUnlaYWdwcHY4TFNiTVpj?=
 =?utf-8?B?UjN5dDhONXFTY2lmUVdYNGJLWU9mODJ1c2NwOUJBQ1ZCL0t4cHVvOXBWcG5h?=
 =?utf-8?B?dEYxQmtKQ0pNTTZJanNSMnE1K01LaW5mL0EzUUZubmlacTBpYitYcjZiT3RW?=
 =?utf-8?B?YWMyM09nNUFKMFZTMGVBK2lGU056anA0YTlNYmlFSTgvSlVndzA4U2p5TkVC?=
 =?utf-8?B?TTE0WU5TQnZvcWowSTcvUkxTWmg2K3lnNG4zNncrVE1qNDRycmwxSlFMZzdp?=
 =?utf-8?B?NjRRVFVXUnpYajJVSzhjZ3hRSWdiMEU2VEdIMEpMbXFiM1Z0NXpTVFRuMWtO?=
 =?utf-8?B?R1lXZUJMaklKc3N6UU91bjhZS1ppYzJqVldaMTBKRitJMnNGQmYzdlcrQUJj?=
 =?utf-8?B?azZCRnErWkh1em4xNW1WZVRwZnd2RUEyZEticVhta0ZYQmFrRkFMd3JWMmtP?=
 =?utf-8?B?R3lid0N3NUxiNHBWZWdHRG15RTRhNG5MNW9CTERpdjkxNzdPbjNuK0VmM0E3?=
 =?utf-8?B?NlZnZDQ2c2Z0WGFRV3ZsQzBQYm5sYnY1dXBVRXQwWGdFWCtseVQ0ZzdSbHpO?=
 =?utf-8?B?Wld0c28wZlNBaXBROUZKaUQ3OC9CSENMQ1dzbC9VZW01Y3NoeVAxQU50OHVt?=
 =?utf-8?B?eVN4MnN3RFlseUFDQmhUUS9vMHU3WnlYMFNIZGREcXF5T3dZWVF0YXh3eExY?=
 =?utf-8?B?clRDd1dQQ1hwbW5QMnkrclB5Q2xZOFdMWjkvYWNMM2MrTEhNVVRZbDdEck5h?=
 =?utf-8?B?VG9aUFQzb1k4b3BsVE1NTE0ybzFOSFhvaGdWTXBha2Z3R0xiV1crb0pmRlJD?=
 =?utf-8?B?S3A2djdOYnlkU2RUWFU2QUlRdE5BVEpiZlVnSkwrbnV1WUoyeUZpMlBIN3BQ?=
 =?utf-8?B?VGpUV3JVbEFPY09SYlNZMDFkeGw0UUVBalM5Z0lzVlV2UmVXR1BKYWZDZlJn?=
 =?utf-8?B?RjVmbkhzTWFURWM5UFdGQTBwUUUwNWJHeVNBaGFzSFhoUzNHRCtYUXhYZVpY?=
 =?utf-8?B?REtwYlBTODBGR2NYS1V6WXNsRlA1QTg5bUpQV1FPdTAzeDNEN2dORnlibnB2?=
 =?utf-8?B?eVpGQzJ5M0tvZFdaSGpqdTRmRDFaZmxTNXpWMFc0WnN4NXJCZTRIN2txNS9I?=
 =?utf-8?B?R2h2cGRsVVh2TjdEMXJqanFENm1KdjZCU1VPN01jV2wwL0VZeDhkd2JxQnJB?=
 =?utf-8?B?ODREcUR4VkROblVDNE1rUjM3VitQQlUyL0I5TzhSVk5mc0lkcEhKeURaby9u?=
 =?utf-8?B?VDd5R29PYjRsRTlrZkFpeVZERlBTWHVVWXJxeDByNm5qMHBiaDN3K3V4NGlM?=
 =?utf-8?B?L2syMjkwRk95eTJuMWV2Sm5OQUN3eG4xV1dNZlN2YUxsa2RqM2ZpWFFwTUo0?=
 =?utf-8?Q?kOeEVkYA+ad3a/vRjfyGP+CLc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: adresys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB9137.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ff4677-58ee-4478-454c-08ddf7470840
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 06:37:40.9106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1357ca9e-a1a5-404b-bb16-554d5d05c5c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pnL7amXBE5DLnlW/9qc7iHVXon/kE/oOyPR5mjgQIc8TUH8q1UnpTxHvvGhVmoYCvBwDjqK1LKMc/qnX+260HQ/vXC4+Z0dyeHWKgzdvGBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6864

SGlobyENCg0KSeKAmW0gdHJ5aW5nIHRvIHVzZSBhIG5ldGRldiBpbmdyZXNzIGFuZCBlZ3Jlc3Mg
ZmlsdGVyIHRvIGVuc3VyZSBJ4oCZbSBvbmx5IGdldHRpbmcgdGhlIEwyIHRyYWZmaWMgSSB3YW50
Lg0KDQpUaGUgbmV0ZGV2IGluZ3Jlc3MgYW5kIGVncmVzcyBwb3J0aW9ucyBvZiB0aGUgcnVsZXNl
dCBsb29rIGxpa2UgdGhpcyAoc25pcHBlZCBmcm9tIGBuZnQgbGlzdCBydWxlc2V0YCkNCg0KYGBg
DQp0YWJsZSBuZXRkZXYgbDJmaWx0ZXJzIHsNCiAgICAgICAgY2hhaW4gY3RybF9hbGxvd2VkX2lu
IHsNCiAgICAgICAgICAgICAgICBtZXRhIHByb3RvY29sIHsgaXAsIGFycCwgMHg4MDM1LCAweDg4
Y2MsIDB4ODhmNyB9IG1ldGEgbWFyayBzZXQgMHgwMDAwMDAwMyBsb2cgZ3JvdXAgNDIgY291bnRl
ciBwYWNrZXRzIDEzODMgYnl0ZXMgMjE1ODIxIGFjY2VwdCBjb21tZW50ICJJUHY0LCBBUlAsIFJB
UlAsIExMRFAsIFBUUCINCiAgICAgICAgfQ0KDQogICAgICAgIGNoYWluIGN0cmxfaW4gew0KICAg
ICAgICAgICAgICAgIHR5cGUgZmlsdGVyIGhvb2sgaW5ncmVzcyBkZXZpY2UgImV0aDAiIHByaW9y
aXR5IGZpbHRlcjsgcG9saWN5IGRyb3A7DQogICAgICAgICAgICAgICAgY291bnRlciBwYWNrZXRz
IDQwNjYgYnl0ZXMgMzQyNTQxIGp1bXAgY3RybF9hbGxvd2VkX2luDQogICAgICAgIH0NCg0KICAg
ICAgICBjaGFpbiBjdHJsX291dCB7DQogICAgICAgICAgICAgICAgdHlwZSBmaWx0ZXIgaG9vayBl
Z3Jlc3MgZGV2aWNlICJldGgwIiBwcmlvcml0eSBmaWx0ZXI7IHBvbGljeSBkcm9wOw0KICAgICAg
ICAgICAgICAgIG1ldGEgcHJvdG9jb2wgeyBpcCwgYXJwLCAweDgwMzUsIDB4ODhjYywgMHg4OGY3
IH0gbWV0YSBtYXJrIHNldCAweDAwMDAwMDA1IGxvZyBncm91cCA0MiBjb3VudGVyIHBhY2tldHMg
NjQ0IGJ5dGVzIDEzNDIyNCBhY2NlcHQgY29tbWVudCAiSVB2NCwgQVJQLCBSQVJQLCBMTERQLCBQ
VFAiDQogICAgICAgIH0NCmBgYA0KKHByZXZpb3VzIGl0ZXJhdGlvbnMgdXNlZCB0aGUgc2FtZSBj
aGFpbiAobm93IGN0cmxfYWxsb3dlZF9pbikgYW5kIGJvdGggaW5ncmVzcyBhbmQgZWdyZXNzIHdv
dWxkIGBqdW1wYCB0byBpdCwgYnV0IEkgc3VzcGVjdGVkIHRoZSBzaGFyZWQgY2hhaW4gdG8gYmUg
dGhlIGN1bHByaXQgb2Ygd2hhdCBJIHNlZS4gSSBoYXZlIG5vdyBjb25maXJtZWQgaXTigJlzIG5v
dCDigKYpDQoNClNvIHdpdGggdGhlIGFib3ZlIHNldHVwLCBJIHdvdWxkIGV4cGVjdCB0byBiZSBh
YmxlIHRvIHVzZTogYHRjcGR1bXAgLUkgbmZsb2c6NDIgLXcgL3RtcC90cmFmZmljLnBjYXBgIGFu
ZCBnZXQgYm90aCBpbmdyZXNzIGFuZCBlZ3Jlc3MgcGFja2V0cyDigJx2ZXJiYXRpbeKAnS4NCk5v
dywgaWYgSSBsb29rIGF0IHRoZSBwY2FwIGZpbGUsIEnigJlsbCBzZWUgc29tZXRoaW5nIGxpa2Ug
dGhpcyAob3V0cHV0IGZyb20gYHRzaGFyayAtciB0cmFmZmljLnBjYXBgKToNCg0KYGBgDQogMjA0
ICAgMi44ODYwNzcgMTcyLjMxLjE3NS4xMSDihpIgMTcyLjMxLjE3NS42MSBUQ1AgMTg0IDYyMDE0
IOKGkiAyMiBbQUNLXSBTZXE9NTIwMSBBY2s9NTIwMSBXaW49NjU0IExlbj0wIFRTdmFsPTIxNDE0
MjUzODkgVFNlY3I9MzUyOTUzODYzNw0KICAyMDUgICAyLjg4NjA3NyAxNzIuMzEuMTc1LjExIOKG
kiAxNzIuMzEuMTc1LjYxIElDTVAgMjE2IEVjaG8gKHBpbmcpIHJlcXVlc3QgIGlkPTB4MDNlOCwg
c2VxPTEvMjU2LCB0dGw9NjMNCiAgMjA2ICAgMi44ODYwNzggICAgICAgICAgICAgIOKGkiAgICAg
ICAgICAgICAgSVB2NCAxODAgQm9ndXMgSVB2NCB2ZXJzaW9uICgzLCBtdXN0IGJlIDQpDQogIDIw
NyAgIDIuODg2MDc4IDE3Mi4zMS4xNzUuMTEg4oaSIDE3Mi4zMS4xNzUuNjMgVURQIDI0OCA1ODA1
MSDihpIgMTk1NDAgTGVuPTg4DQogIDIwOCAgIDIuODg2MDc4IDE3Mi4zMS4xNzUuNyDihpIgMTcy
LjMxLjE3NS42MyBVRFAgMjQ4IDU0OTQzIOKGkiAxOTU0MCBMZW49ODgNCiAgMjA5ICAgNC4xNjYx
NDEgMTcyLjMxLjE3NS4xMSDihpIgMTcyLjMxLjE3NS42MSBJQ01QIDIxNiBFY2hvIChwaW5nKSBy
ZXF1ZXN0ICBpZD0weDAzZTgsIHNlcT0yLzUxMiwgdHRsPTYzDQogIDIxMCAgIDQuMTY2MTQ0ICAg
ICAgICAgICAgICDihpIgICAgICAgICAgICAgIElQdjQgMTgwIEJvZ3VzIElQdjQgdmVyc2lvbiAo
MywgbXVzdCBiZSA0KQ0KICAyMTEgICA0LjE2NjE0NSAgICAgICAgICAgICAg4oaSICAgICAgICAg
ICAgICBJUHY0IDQ0MCBCb2d1cyBJUHY0IHZlcnNpb24gKDE1LCBtdXN0IGJlIDQpDQogIDIxMiAg
IDQuMTY2MTQ2IDE3Mi4zMS4xNzUuMTEg4oaSIDE3Mi4zMS4xNzUuNjEgSUNNUCAyMTYgRWNobyAo
cGluZykgcmVxdWVzdCAgaWQ9MHgwM2U4LCBzZXE9My83NjgsIHR0bD02Mw0KYGBgDQoNCigxNzIu
MzEuMTc1LjYxIGJlaW5nIG15IGJveCBpbiBxdWVzdGlvbiwgMTcyLjMxLjE3NS4xMSB0aGUgYm94
IGZyb20gd2hpY2ggSSBjb25uZWN0KQ0KDQpBbGwgbXkgb3V0cHV0IChlZ3Jlc3MpIGxvZ2dlZCBw
YWNrZXRzIGFyZSBlc3NlbnRpYWxseSBicm9rZW4gLi4gZG8gdGhleSBvbmx5IGNvbnRhaW4gYSBw
b3J0aW9uIG9mIHRoZSBwYWNrZXQ/DQoNCknigJl2ZSBhbHNvIG5vdGljZWQgdGhhdCBvbiB0aGUg
ZWdyZXNzLCBgbWV0YSBwcm90b2NvbGAgZG9lc27igJl0IHNlZW0gdG8gd29yayBhcyBJIHRob3Vn
aCBpdCB3b3VsZCDigJMgYXQgbGVhc3QgSSBjYW4gc2VlIHRoYXQgb25lIG9mIHRoZSBldGhlcnR5
cGVzIEkgYWxsb3cgKEdPT1NFIGFuZCBTViBvbiBhbm90aGVyIGRldmljZSwgaS5lLiwgMHg4OGI4
IGFuZCAweDg4YmEpIHNpbWlsYXJseSB0byB0aGUgYWJvdmUgY2hhaW4gKGBtZXRhIHByb3RvY29s
IDxldGhlcnR5cGVzLXNldD5gKSAgZG8gbm90IGdldCBwYXNzZWQuIFNvIEkgYXNzdW1lIG15IGVn
cmVzcyBmaWx0ZXIgZG9lc27igJl0IHNlZSB0aGUgd2hvbGUgcGFja2V0ICh5ZXQ/KQ0KDQpUaGlz
IGlzIG9uIGxpbnV4IDYuMTIsIHdpdGggbmZ0YWJsZXMgMS4xLjUNCg0KSSBhc3N1bWUgbmV0ZGV2
IGVncmVzcyBmaWx0ZXJpbmcgd29ya3MgYXMgaW50ZW5kZWQgaW4gZ2VuZXJhbCwgc28gSSBhc3N1
bWUgdGhpcyBpcyBhIHByb2JsZW0gb24gbXkgZW5kLiBJZiB0aGUgYWJvdmUgZGVzY3JpcHRpb24g
dHJpZ2dlcnMgYW55IHdhciBtZW1vcmllcywgSeKAmWQgYmUgaGFwcHkgdG8gZ2V0IHRvbGQgdGhv
c2UgdG8gbGVhcm4gYW5kIGZpeCBteSBzZXR1cC4NCg0KVGhhbmtzIGluIGFkdmFuY2UgJiBSZWdh
cmRzLA0KLU1hcnRpbg0K
