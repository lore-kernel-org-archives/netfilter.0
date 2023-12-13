Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="STYNXTwh"
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2100.outbound.protection.outlook.com [40.92.52.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43CEE99
	for <netfilter@vger.kernel.org>; Tue, 12 Dec 2023 22:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHbQGRKtVBFzRDDweE9fJe1V5NX2jz37hhW645JlC4J0sYfyxMti9ZHToVqnluEKMKU9kR4a1L2QAqjLInJGg0/IJrTnZzEItX2M6a1D5vmmnjpSvVg/mh7/Epe3EC+HlYMunHeNP1h++RSRiebdqkW+CLIgoWSXLnI1g3a6hsYEUtIY3zYCL0yWwne/8J1Dc5/lAJ8Z9RZ0S0S8VefHKTnFxp+HxbYUjhcrkQbpkZjJO/JPiBmyPc1lydG7Es2Ps6EzZGLDQIt059UCoxhIdOzZiybepE9r9WlPEU4/oj5DTR6BDtm0TniIZK+QAxZvdlJBu3Fq5ZVQQrY2Ym5vUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ita7AKyzmkUjxHCLRr+W/8lXf4zigddzQgI9lFnL+4=;
 b=SJ0yWjFm0VBBTnHCsFAvNDGO2zWvfQ5JVlmLTOOf+eXmwEF+1oySbt3gtOqGcgchwcWVEG8886E2qx7VjDa/M8BuqdcRvECtWbu0VkovqpXO8xWFPstX7QiD8+kXwo5CgPGJ7ZbpDEGSEoTD+8RFv8NejE/jnVyq7AEC0gtYPC/q51OmbEXmLIYPeW0uFDkgjRZyXmkcHwXtS0P7OktP/bCtJVaZsZjkDqvsc8DoCal+LNfsUq3Jrf+6B4i/YsMtuAXZSlkf26UbJv8fagykOvpLwmai9KJgg8si6aWBobWmMJQWcc95rFhpw33B3BkxK9TvbFtx3Hdv9vYmYCfFRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ita7AKyzmkUjxHCLRr+W/8lXf4zigddzQgI9lFnL+4=;
 b=STYNXTwhpnOEBIMoT9LaPe5/TqzLooAW4zVCzxonaIrsxmS7LHjjCL3fbbmPpSfFBgx8ERe2DP2SL35msrVHmxb78/3CYlCAc8jIQ04n/5E3KyZx2UgPqIeSPJZQw4md7XSIOH5GErf0JW9nROpxepp4dHlxhaC8Lle+9lbRx5e+7FnM6pEu+hSR+KfDJuGUXzlApxoWRCt5bCAv4FQ/ovt2NTKALdAVYq+DolK9DikK5+c3BclP2tucV/kx9BhNL+v2idbhsc+Q3M8dThKn4SOkY8RqUz2k37Lj1agWoprPBH0C94ErirX0JkGq6gXmjwv4BRg/njvSi0EVTVr/lQ==
Received: from SEZPR01MB5047.apcprd01.prod.exchangelabs.com
 (2603:1096:101:97::11) by OSQPR01MB6126.apcprd01.prod.exchangelabs.com
 (2603:1096:604:27f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 06:56:40 +0000
Received: from SEZPR01MB5047.apcprd01.prod.exchangelabs.com
 ([fe80::aafa:dbfb:b7ae:b35b]) by SEZPR01MB5047.apcprd01.prod.exchangelabs.com
 ([fe80::aafa:dbfb:b7ae:b35b%7]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 06:56:40 +0000
From: ye4 yu3 <ye4yu3@outlook.com>
To: Eric <evil.function@proton.me>
CC: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiBuZnRhYmxlcyBwcm9ibGVtIGNvbnN1bHRhdGlvbg==?=
Thread-Topic: nftables problem consultation
Thread-Index: AQHaLP57Hk9Vc87nx06u5VjrLfHSxbCl2FWAgADwhTY=
Date: Wed, 13 Dec 2023 06:56:40 +0000
Message-ID:
 <SEZPR01MB504716A57016E9B43D326034CB8DA@SEZPR01MB5047.apcprd01.prod.exchangelabs.com>
References:
 <PUZPR01MB5044183AE828E0A504D4014ACB8EA@PUZPR01MB5044.apcprd01.prod.exchangelabs.com>
 <zg20uRQPjgqpXOGX2T-AaXxj14SLjreS1CgEezKdQ8MOE_u_H3zY09OM4qYxEjKF_LJW6yrotM0eChbOChTIYLH_PnO7YmemsBXMvdz1b0U=@proton.me>
In-Reply-To:
 <zg20uRQPjgqpXOGX2T-AaXxj14SLjreS1CgEezKdQ8MOE_u_H3zY09OM4qYxEjKF_LJW6yrotM0eChbOChTIYLH_PnO7YmemsBXMvdz1b0U=@proton.me>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-tmn: [MjkXjUjkR4r1xwkn28tTsgXIOlbDaAZY]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR01MB5047:EE_|OSQPR01MB6126:EE_
x-ms-office365-filtering-correlation-id: db6ebd9e-26da-4a44-6ad8-08dbfba8a890
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 naxDMRwJCqadrj9/6lKk2pKdtsKVxBH5uAJOh1DBt7CxM8fonKIy/dhRy5jgGyljLxYvgv9+kwcQlO5b3xmTu6j8AFVfu4d1Bge3gzPAVN62LYdn4zVlkZjhxQCDkHTX+6qlKj+h3R2ovg/WW3vhWkD3fsAsdejiUZSOisUJerwFr04HT4/LiP8mNoLoFKu1OYw3CdnenlQdn+SWtOe4kIR7LsVFNOsihHZAMyWu4ZboLZ82E6jbgnxKkREi4vZH2hSOz6EsWoqPqUW5qE49quUGkk4mu1JNwASvE0DuvhWcUfWZu4JJzr+BGImOXPA7MPM2sW6HL5oV6eRYkiJrgX1Rh1oAq7iFTWXd8tOf0RSidsKrbvdwI6y8wZktOevwPSIe7jNGC1nX8zUpFB/JEZPnKGX9hU39rAL2bXY7O4MFWM2o9OgJwUx2by9moLu/Lj7bfOHWGxLPv8Zq6KB/0RzULqa3oBCnLFLT7UhX9GOXwW2lG0MB3goKKT+00UxGp77PoUnu50xgk7FAaF/qAY5+ocj62XDGw0ffGOAcFFVYdF1gGocx3j2ByRI05WfP7BBvQ3IkWHslHd7oAAkA9cxINRMGLWeYZUiVQ9K+ZZY=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGVYU1laU05pZlVEU3NVQVViYlhCQlgxaVpaSTAxYUdoU1FEcGlYWjAwOFNv?=
 =?utf-8?B?cXFnUkJxUlBNQTZrd1gyNUNid3FVU2JoYm9RaEoybUdWNWpEUlVIejhQdFk4?=
 =?utf-8?B?bklPajlqempyNHlmZWRlVHA2b1NkNjNhMUtYSDdXTy9HQ1JZYmgvMEN3cWlu?=
 =?utf-8?B?OHFEeUZ5V0dGanpRbjZTSG16cCtuYnlvNVFJYk9vMEp2Z3FIVFZxL0RBWnh6?=
 =?utf-8?B?OHFhME9la2RCNmRPOVZkWE5kVFNDbjY4dWlvYmswWFB2S25JNU9RUXhKMDh1?=
 =?utf-8?B?SlU1cUFoNm5SR3ZMdy9xMW9ub0lrK0FFMlkzV1hlQllGSWtNYnJ0QnRLayth?=
 =?utf-8?B?MmNRM2kyR2Q4RjluRHdCekcrbDZsMmY1THJhZjFrZW1jdnczSHNmd2tpNlNo?=
 =?utf-8?B?b0YrSExGSkZ5citDUy9YM1dXTWxzZ3FZd3NOV1ZDSHhJMVBnaGRTZjg2VG5w?=
 =?utf-8?B?YWdackp5eTN3QkFORzVEK09lNUhFVENwYWw1cFpNWWwrUmthc3dsSDhtT2tV?=
 =?utf-8?B?dHBxdnBKcStLNm5yZThXWXY4MGhpQjdneFpXanRmT3ptWmdrc211cnJrRnVL?=
 =?utf-8?B?ZnpMazlKMHhnWExUS1pQM3FqbjNFVGVSaHhOZFM4SWJKWnJTZjVtNlhBeXhT?=
 =?utf-8?B?NXVJWkpCNCtLWjBkUDFFNVFjVmthbjdjZ1dnVmNRcEVCbWdWd3ZFb3E4Sk5N?=
 =?utf-8?B?Y0ozdVAvMDZOdHErUk5ZR1FvOEw4a1h5OXUxWlhhZytwS1BvNlgrQ2N2S0FW?=
 =?utf-8?B?eThBYXE1Q2E3QUVKMGloTVVPaEdlNnc2OGx0ZkpqVE5EQlVMa3JVd3JLZmRa?=
 =?utf-8?B?Vy9vYVRGazR3Tk4vN0ZnS3prU2JLNHpuQnN3ckoxMlMzOTRlWGh0bjExT09Y?=
 =?utf-8?B?WnU5cHoyaVJBR1hrVVBncDVRSk9zK25WOHVIcEVVQ0RPMXl0QmdybEdWaDNO?=
 =?utf-8?B?V1BPOWpKOXZGUnhON1ZVNE8rNnRkOE9CY0ExN2s5K2VPcW8wdXhQR2EvSGhP?=
 =?utf-8?B?UE1wVHVOdEZ1Q1kzTnVpUFNjcitoSEp0MjBQWW5WQnlxNTJZQUpvTlFNUzhB?=
 =?utf-8?B?U2cxK1plMnpmOXVLNXcwclU4eGRpOUcySVhvRlA5SmRodUFjQS83cjNUYXJS?=
 =?utf-8?B?dVFzb0w3L3Q4RDNpUExCN0tIQ2I4TUdHcSswUFpQemxJTFJJRDY3Y0RFZmZr?=
 =?utf-8?B?anltNlFTSjNvd1NXdkRocHRQZDdOUUhBaENBNGprWnR0SjlScmxpeVhDWmRX?=
 =?utf-8?B?ckNjNVZlSDZWeDNlOTBPb3RrTTlFZHZURU1ZSzRMN3AwRGVHS21ucmUzRStN?=
 =?utf-8?B?QlI2cHZuMmExRVlSS2Y0bkM4RmtiUjV5ZnBOYXFJUUV0TmZrVWRsNWVkWjZG?=
 =?utf-8?B?Qis3Q25ISjU5MDZyTXB4TmxYVTBvQVM4bERIMWNMZlpQNjlVMThlQ1Q1b2FP?=
 =?utf-8?B?NU9FbjRHNnF6bjlvaEhGcHliSXRNSURLb1pib0gxRHRVV0hENEZwKysxUUpI?=
 =?utf-8?B?REJkUXVnNGZMZW1UaVBzTjRQQUVnMFpHK0hDb0p0WFJKdXBqZG9BVElMK3pU?=
 =?utf-8?Q?ofV0XzUxoomVDPAV8sLmfdp0pifDb4kXC8CFXSrgb1C38/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR01MB5047.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: db6ebd9e-26da-4a44-6ad8-08dbfba8a890
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:56:40.3883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR01MB6126

Rmlyc3Qgb2YgYWxsLCB0aGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgpZZXMsIEkgdXNlIGtlcm5l
bCA2LjEsIFNvIHRoZSBydWxlIGNhbiBiZSBzdWNjZXNzZnVsbHkgYWRkZWQgd2l0aG91dCBhbnkg
ZXJyb3JzLCBBbmQgc2V0IHRoZSBzb3VyY2Ugb3IgZGVzdGluYXRpb24gYWRkcmVzcyBjYW4gYmUg
c3VjY2Vzc2Z1bGx5IGV4ZWN1dGVkLgoKQXMgeW91IHNhaWQsIEkgdXNlZCB0Y3BkdW1wIHRvIGNo
ZWNrIHRoZSBzdGF0dXMgb2YgdGhlIGlwIHBhY2tldHMsVGhlIHJ1bGUgdG8gc2V0IHRoZSBwb3J0
IGNhbm5vdCBiZSBzdWNjZXNzZnVsbHkgZXhlY3V0ZWQsIEFuZCBpIHNlZSB0aGUgaXAgcGFja2V0
IGFwcGVhcnMgdG8gYmUgZGFtYWdlZCBpbiB0aGUgdGNwZHVtcCAodGhleSBubyBsb25nZXIgaGF2
ZSBzb3VyY2UgYW5kIGRlc3RpbmF0aW9uIHBvcnRzKS4KCkZpbmFsbHksTXkgc29tZSBqb2JzIHJl
cXVpcmUgdGhlIHVzZSBvZiBlZ3Jlc3MgaG9va3MgdG8gbW9kaWZ5IGFkZHJlc3Mgb3IgcG9ydCxE
byBub3QgdXNlIHByZXJvdXRpbmcvcG9zdHJvdXRpbmcgaG9va3MgYmVjYXVzZSB0aGV5IG11c3Qg
aGF2ZSBzdGF0ZS4KCk9uIFR1ZXNkYXksIERlY2VtYmVyIDEydGgsIDIwMjMgYXQgMDU6MjUsIHll
NCB5dTMgPHllNHl1M0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4gSSBoYXZlIGEgcXVlc3Rpb24gcmVn
YXJkaW5nIHRoZSBlZ3Jlc3MgaG9vayBvZiBuZnRhYmxlcywgSSB3YW50IHRvIG1ha2UgbW9kaWZ5
IGlwIHBhY2tldCBzb3VyY2Ugb3IgZGVzdGluYXRpb24gcG9ydCBvbiBlZ3Jlc3MgaG9vaywgSSB1
c2UgdGhpcyBydWxlIGluIGVncmVzcyBjaGFpbiAodGNwIGRwb3J0IDgwIHRjcCBkcG9ydCBzZXQg
ODA4MCkgaXQgc3VjY2Vzc2Z1bGx5IGxvYWRlZCxidXQgaXQgZGlkbid0IGhhdmUgYW55IGVmZmVj
dC4gaWYgaSBvbmx5Cj4gCj4gbW9kaWZ5IGlwIHBhY2tldCBzb3VyY2Ugb3IgZGVzdGluYXRpb24g
YWRkcmVzcyB3aWxsIGhhdmUgZWZmZWN0IChpcCBkYWRkciAxMC4wLjAuMSBpcCBkYWRkciBzZXQg
MTAuMC4wLjIpLGkgdXNlIHNldCBwb3J0IHJ1bGUgb24gYW55IG90aGVyIGhvb2sgYW5kIGl0IHdv
cmtzIGluY2x1ZGUgaW5ncmVzcyxJIGRvbid0IGtub3cgd2h5IHRoZSBlZ3Jlc3MgaG9vayBpcyBp
bmVmZmVjdGl2ZSxwZXJoYXBzIHRoZXJlIGlzIHNvbWUgd2F5IHRvIHNvbHZlIHRoaXMgcHJvYmxl
bT8KCkhlbGxvIFllIFl1LAoKRmlyc3QsIGRvIHlvdSBoYXZlIGtlcm5lbCA1LjE2Kz/CoCBUaGF0
IGlzIG5lZWRlZCB0byBnZXQgdGhlIGVncmVzcyBob29rIGZ1bmN0aW9uYWxpdHkgKEkgYXNzdW1l
ICJ5ZXMiLCBzaW5jZSB5b3UgYXJlIG5vdCBnZXR0aW5nIGFuIGVycm9yIHdoZW4geW91IGFkZCB5
b3VyIHJ1bGUpLgoKTmV4dCwgaG93IGFyZSB5b3UgdmVyaWZ5aW5nIHRoYXQgaXQgZG9lc24ndCB3
b3JrP8KgIEFyZSB5b3UgcnVubmluZyB0Y3BkdW1wIChvciBlcXVpdmFsZW50KSBhbmQgd2F0Y2hp
bmcgdGhlIHBhY2tldHMgY29tZSBvdXQgb2YgdGhlIHNwZWNpZmllZCBpbnRlcmZhY2Ugd2l0aG91
dCB0aGUgcG9ydCB0cmFuc2xhdGlvbj8KCkZpbmFsbHksIEkgaGF2ZSBub3Qgc2VlbiB0aGUgZWdy
ZXNzIGhvb2sgdXNlZCB0byBkbyBwb3J0IHRyYW5zbGF0aW9ucywgdHlwaWNhbGx5IHRoYXQgaXMg
ZG9uZSBpbiB0aGUgaW5ldC9pcCB0YWJsZXMgdXNpbmcgdGhlIHByZXJvdXRpbmcvcG9zdHJvdXRp
bmcgaG9va3Mgd2l0aCBOQVQgcnVsZXMuwqAgQXJlIHlvdSB0cnlpbmcgdG8gZG8gc29tZXRoaW5n
IHRoYXQgc3BlY2lmaWNhbGx5IHJlcXVpcmVzIHRoZSB1c2Ugb2YgdGhlIGVncmVzcyBob29rP8Kg
IAoKaHR0cHM6Ly93aWtpLm5mdGFibGVzLm9yZy93aWtpLW5mdGFibGVzL2luZGV4LnBocC9OZXRm
aWx0ZXJfaG9va3MjSG9va3NfYnlfZmFtaWx5X2FuZF9jaGFpbl90eXBlCgpFcmlj
