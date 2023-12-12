Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="eBR6noph"
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn2108.outbound.protection.outlook.com [40.92.53.108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DFE83
	for <netfilter@vger.kernel.org>; Tue, 12 Dec 2023 05:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJfKP6thtwWDwOIxQUa3Fdjtr/R0gMIXIXYmSa9TAUhj1q5SaJP5mpW4mV29DPFLFrXw4Pr4q027GO+TU1jXTXBNOiCGZ/8t+VT856eq+wWXzKFevqmgGfsQeeQB3xU47GLLZWJW4wwYdDAnZJAYJTAIzcJ7Q3Qc8rHsiUmwprr4BQ053mFqcOpTXvfypqNaA5X3qjX9WdAIUEqHbvRnqKSg1rQxIpE2wwzTypPIRC4RC7t/njVopUNNO0S7GHijsWuEMeAYQc+IM4CmQM+faUA/2BZoyVLEFHcCoUfHM1gWxtMKCzxYgCnxTLfslubtU/WD43ukL+krRZy8uxw/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4keweodBi/zqfcOb3c2Buow2UUqNJjKMteg/uCswx0=;
 b=SWV9nemwA8Z588CYwmhQWmlUt0kgp5gVYJ0zQcpkzcZpx5LcK0EwAC8IMSK3YRmdhCA67BAUEUG1GeZdXHIHbkmEv8IylotLH3kURWTQPk4NCbwTX/PoH/L9/+9zir83R/yDDLlxxyraIR+u0bHj7Pe6jH4J6W5+3JCH/clIT8zGnOIPA2rhuOMKyAQ/9oAKWSMuic5HQFm48Jo32vJzOheeoJIsUtca1Tpo0MX+QJXS2rSnJBPHLHo5ps6bjYtiQdnt0WlqYKtWtdbYQcC6AR5xxJ6yVLlnz7ICcJIpbciA5vlP8jqgcNEyM8TzWk6ceOT6bdbvg6Oy4b7exsKKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4keweodBi/zqfcOb3c2Buow2UUqNJjKMteg/uCswx0=;
 b=eBR6nophdIQVYcp2mS/6/mS7mw7uYAxaMv3PGqL2rjubqaNAIicQ7oaHQ9DZ2ICPjgLzyGeY97IqQY7aKF2oAt/Q3N2AyCcTxwRnR3ZLTUD2LUvZcA5iFP/NL37mP6pL8PyMH9gq+D9mBz2s3lAYqnHLk3rf60YPlJAxp5qvLjqfUJxyG8nkKle5X31F8/lfc+Bk3Qpxbbkud5K6VWBjF0uhAc6axeJRyKtuSQXl1sJcv44OMUbFj2PTNlLfkS96c2xHTwym5+n7emPlc6Czp2subDkcziHb83KTct2iAZzYaXbbn5hVhG8Fzq2YpMhJdnBYa+/RdsSokiinluY5ug==
Received: from PUZPR01MB5044.apcprd01.prod.exchangelabs.com
 (2603:1096:301:e5::5) by SEZPR01MB5207.apcprd01.prod.exchangelabs.com
 (2603:1096:101:f0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 13:25:20 +0000
Received: from PUZPR01MB5044.apcprd01.prod.exchangelabs.com
 ([fe80::9a7a:2c72:8250:67be]) by PUZPR01MB5044.apcprd01.prod.exchangelabs.com
 ([fe80::9a7a:2c72:8250:67be%3]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 13:25:19 +0000
From: ye4 yu3 <ye4yu3@outlook.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: nftables problem consultation
Thread-Topic: nftables problem consultation
Thread-Index: AQHaLP57Hk9Vc87nx06u5VjrLfHSxQ==
Date: Tue, 12 Dec 2023 13:25:19 +0000
Message-ID:
 <PUZPR01MB5044183AE828E0A504D4014ACB8EA@PUZPR01MB5044.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-tmn: [wsXcMAG9pXu5FPA4lBn/21m+gSSc8TDJ]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR01MB5044:EE_|SEZPR01MB5207:EE_
x-ms-office365-filtering-correlation-id: 67b3d95f-b4ac-47a7-4942-08dbfb15c94e
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DG1gjqC1ZCQbu73PWSbkVLhI0waC43CkAeW4cQhsyz9A4DaaUVoq7twjdwxaVotQIt6iWOvJJTEPpVGKWLg8eqNtUT4AJ+Fr0r3ksYSFXQEyFdW1L/b+xhXslA3ibRhdwKQmLgrblc/fbQi1s9USOqLVRO29QqZsll+ThWyoNc8dTqslAPHkEMQvp77Yu7FrpZdNeiozWDZihSK4qkmJ4ESUa5A2S6If2acxPCBd8CJrCon+1pSQtLnKYYOWjoRCOL+/3tqFj/rtzWkwHOnloFC+5HZ5JJCTyu+oYsdKe/+J0CLUbMve7AynLRIZx+T0vMq/+ynU2Bj39/EAnl+cYwXCve12Dm2OHCgRRDlZlcoH6BjFr/N2Gay4B/IYrP5WTqjRTMGNUHQE3QbUi8vV0TSgrTNde3vSL37k97u7tzqzIasE8MXQsAAIsE2xwPKYg4lyXV6pL9dOWhc3JRPSzMg9o8Yzsu3jHoUJ3VB8upJAkOCQ82/3r9pKyEj4vpF13w8p7URhcxtFkdUQOzgBNVSpO9FEKBUSkNsVrmH61FI=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UC9xdjgramhXVHQwQnFNbjROdzNlb2ZuSDY2ZnhSa3pQVjZkS2QzN2NqRncv?=
 =?gb2312?B?U21HNzYyVlo5MGxERFdRK1RDYWpqaEtVMXNrd3pLeUlUd2N2L1lBTmNHcnVp?=
 =?gb2312?B?WDd6UDFoOUlJcFJQREtra0x6cVdkYWREY01BUk5maVQ5NndTV0xDUkx6VUVO?=
 =?gb2312?B?VE5VTGgySW9XK044bnhBWi94OW1tUnhFUDd3S0pqSGp0WWsrZEhGSFcrTmc3?=
 =?gb2312?B?bXVKYnJReGM5VHZPODk0dWk5UlZVMGJkaERqU3dPZ0VXUGpDRGh3bXUwUDRN?=
 =?gb2312?B?M1liamYvUUszMVBPU3RUWWhlUmNtYmxOeG9aR1BTZDQ1UGdjekN6VGRFLzNS?=
 =?gb2312?B?MFAzcnN5RGN2YnhETlJBWTE1L0pXRVBoVHhUYTlqckVuNEVWVk9YNHJ3dVMw?=
 =?gb2312?B?dks0MFIyVFBKbTJ4Mk1SYmljL1ZRTS9FT21lditDcVk3S0dqR3hQT3YvWnNH?=
 =?gb2312?B?NDBQc01yYWk0OTdoWTYrS1RCU2I4VUVScER2eEpheWI5VkYxc0ovVW1OUFFy?=
 =?gb2312?B?ZEVvN01WMWxBOUlCbDd0Z3hlaHdtaG15Z3FYV0JiTncxanAvVzlRSDU3NFFW?=
 =?gb2312?B?SGRlZWZsbUZmYTFMRHd1Wkh2amZ1LzVwUkhhNXE3VzF5ZEpmbGNhNDFNWUsy?=
 =?gb2312?B?SExxOXdORFgrcERveGM4Nk9STHFnRFdYcHNOR1lQdEpTZTNUKzV4Mk5rTHFP?=
 =?gb2312?B?Y21xSkQ4UERYOTVTSUdYTk5NUUQ4ZFltNVMxb2hsbjdzZndsVkcydzlqNDlV?=
 =?gb2312?B?cVVKZHNoMXhwdVpaSkJtOTV4R1haT09PWjJkd0hCajhOV3F6ajdUN1ZvdzlX?=
 =?gb2312?B?SHF0Q3hUTkNUaXRkZFRGdmR4ZG5RVmFRZmdLaGVGbkhFUEJMN3lSSTZPOE02?=
 =?gb2312?B?b1QvMTdiUnA4OVFmWFRaVE9LWERKRTMyczlhOWdrMS9jQkFLejFlODNwc0hL?=
 =?gb2312?B?SEFFYWMwOFlkVDVrd3hTMlVlSkU2V3dYOFU5RjVlZzVmODdTb0ptcm1RbDEz?=
 =?gb2312?B?eXZGdlpySkFGd2RSR3RFSk5DM2FKcHErRVB2SDdhdEVtVU9lUy9NODY1cFN6?=
 =?gb2312?B?MVhZWFp4Q3d0ZnZDdXlQc0hJYVN2SFR4RFRVRHFKazJZRmNmSUxPcDZCUWp2?=
 =?gb2312?B?MWQrY0p3eDRmVkN4ak9CSC9rQkdwS0tlMjR3Z2V4WHdTenpyOTl1dUtNcFlp?=
 =?gb2312?B?cVhWeGRPVkwrWmk4YnRNN1RRK1JIbE4vWFFGa3ZsYkY0aUtsdmhGa2c5NjQv?=
 =?gb2312?B?TnZ2Q2ZiTkJQSFA5bVRjZnFnYmlGNFNEQXIySndkVGN0V1hITnM0by9NaWIy?=
 =?gb2312?B?cENHK1lITmtEak1hd2lsZlp4djhsWWxkaHR0MXk4VGM0NFZLR2dDNEN4NXhh?=
 =?gb2312?B?SC9jancrdHB1Z0hEZGlQdTg4U1Vyek1hR20wQjhiVVg2S2xqa0U1aGxQdU1w?=
 =?gb2312?B?M3ZlcnFSdmdGMjk0NWlTMGh0NDF1K2loRUNOV3ZYbFQydGR2RElZMmVwcGFa?=
 =?gb2312?B?MFBtR3NWZ0Zxb0N4ODBGWkI0MzdkM2orTHpqMHArWTUzZXNiZ3pXcVMxcFlB?=
 =?gb2312?Q?63IIHSCompRdz1bKqQTZwSZjqeD6t+s9QNGn1ftALupiEN?=
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
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5044.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b3d95f-b4ac-47a7-4942-08dbfb15c94e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 13:25:19.3099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB5207

SGVsbG8gbmV0ZmlsdGVyIGNvbW11bml0eSwKCgpJIGhhdmUgYSBxdWVzdGlvbiByZWdhcmRpbmcg
dGhlIGVncmVzcyBob29rIG9mIG5mdGFibGVzLCBJIHdhbnQgdG8gbWFrZSBtb2RpZnkgaXAgcGFj
a2V0IHNvdXJjZSBvciBkZXN0aW5hdGlvbiBwb3J0IG9uIGVncmVzcyBob29rLCBJIHVzZSB0aGlz
IHJ1bGUgaW4gZWdyZXNzIGNoYWluICh0Y3AgZHBvcnQgODAgdGNwIGRwb3J0IHNldCA4MDgwKSBp
dCBzdWNjZXNzZnVsbHkgbG9hZGVkLGJ1dCBpdCBkaWRuJ3QgaGF2ZSBhbnkgZWZmZWN0LiBpZiBp
IG9ubHkgCgptb2RpZnkgaXAgcGFja2V0IHNvdXJjZSBvciBkZXN0aW5hdGlvbiBhZGRyZXNzIHdp
bGwgaGF2ZSBlZmZlY3QgKGlwIGRhZGRyIDEwLjAuMC4xIGlwIGRhZGRyIHNldCAxMC4wLjAuMiks
aSB1c2Ugc2V0IHBvcnQgcnVsZSBvbiBhbnkgb3RoZXIgaG9vayBhbmQgaXQgd29ya3MgaW5jbHVk
ZSBpbmdyZXNzLEkgZG9uJ3Qga25vdyB3aHkgdGhlIGVncmVzcyBob29rIGlzIGluZWZmZWN0aXZl
LHBlcmhhcHMgdGhlcmUgaXMgc29tZSB3YXkgdG8gc29sdmUgdGhpcyBwcm9ibGVtPwoKVGhhbmsg
eW91IGluIGFkdmFuY2UuCgpCZXN0IHJlZ2FyZHMsCgpZZSBZdQ==
