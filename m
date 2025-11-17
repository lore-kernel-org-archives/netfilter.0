Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022077.outbound.protection.outlook.com [52.101.126.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC630CDB8
	for <netfilter@vger.kernel.org>; Mon, 17 Nov 2025 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383795; cv=fail; b=ixvRSRhuoSTx/1lNLdXt+XXYhK+9YSoOfovIAnU24LhdXnLSfosA4yGkVGtF4kI7vQSQ7zPL6yjBXZcb/J6irpursTjGv73LzwUxWubEA/JV5sLr9dFPOOPEN36gxaxn2GUECo1FbI/SVnQ8yqB8SoVFyp8A/rC3VGf9IPu+sec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383795; c=relaxed/simple;
	bh=xwA7uLvWk6RgshkhzXR2hk4trGvrY5R55+OfW0ybm4k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WYJBiU8tzCTCRPaoZBEzy/EUlQvkMIXSGIY7cV6PuagynRPobcK1aoRLY/CiiZdZsjgQjum9cVAwObzyLF2RQOnPL0L1WYf/WhX+zp27wUNf9Lh53iq5uvQsvJlTikmCxvd11E1ADC1qUMvVK9Anaqr4GmhzRS+eEh3n94EsrLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelsplace.sg; spf=pass smtp.mailfrom=joelsplace.sg; dkim=pass (2048-bit key) header.d=joelsplace.sg header.i=@joelsplace.sg header.b=q4eT9B1U; arc=fail smtp.client-ip=52.101.126.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelsplace.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelsplace.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joelsplace.sg header.i=@joelsplace.sg header.b="q4eT9B1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwOjcIWvmxsSn465ckcrWzxtYX/la+dYWdV3+xJQHCgS0Bg58IHtEdo/RkxK6FgvsPbYRi6rvSuR/ZcaOQfLnq+v7jXNaMUqkvdtd7up1t/5dw6Z09kteP6RgYmfLn8FE7Wbl8jwt+qtpJmCiJ1xYib4IeSEMuqOAmIahM1ZMNMKUR2MI092l0Sy1IVpTrThDxntYZpVoYIi4h+kXCQadyEHtxTxv5FoRHpsK9sBONGcOk1TM77aHBI8fxTnQi0RQgGmbm14TlUlFUxr9/0Ob4QUfBPig3Gvymy48VFzQ52UluNwqX6TlGrWpydysIytWo0MKh6IQZTaSyC7X+Rqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwA7uLvWk6RgshkhzXR2hk4trGvrY5R55+OfW0ybm4k=;
 b=XLcg+b6+VC7R9xBdrrspufVYD44wAQ0MgSL2FRVl7BOsgwNTWHyMw5B/UiZqBcMqva6ZU/eOrJHqT9szWSHJ6K5vtrsryzXVKkpNJRDZGZOUIAjz5UcnffkDo1Xn3XSHFF8EakEjEuu69dUs4auGFKbU0YARrJRlk3BNtjZBDSktVOdtx6mN60t1+hT4MPe7Ce7IN4q9UYMamddMoeXMTtV1NrvOmJyoen8fL9nAe0sLOEUFJ1sxYSfYB6wEsFbxh4FxUNjSxDG6nrwfwRS5XQdDxDlzExjZnm/1mxTfVW3XbVC8iuNH/Ywt0g8XeLkOGXYsAZwY+I9crYgO4Mpu3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=joelsplace.sg; dmarc=pass action=none
 header.from=joelsplace.sg; dkim=pass header.d=joelsplace.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelsplace.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwA7uLvWk6RgshkhzXR2hk4trGvrY5R55+OfW0ybm4k=;
 b=q4eT9B1U2+2zNUBDZCrzJruBTZZbm0X0JzM+6nLzOTu7iJwSgWP1TdkuLFJeUizrUPPdgxlIArTsVlF7LvyR8aCijMpFm+tXhR01ygjZmPnUJEiZKMYLFzqbC0DVQbaez/rEunWcsqJK5KKfKbLXMy+wLvD+oQCk6JM53HPLdSTlnTxa8z69I0kbzxSR1znvYjIDwEFCfnuj6P0jLr8twmuaqGDov03nhclUhTPN/BqcP0vBvY4zFrLXLTRs1pnLE4HCKbCOUxyxvvD7Wvc8dlbrRXt0B4nWrUhXhqDMoyv56Sj/DkyACNGRoVmr4Rb7J4VWeUiR32f9vzR8a325RA==
Received: from TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 (2603:1096:405:9b::13) by KL1PR01MB5270.apcprd01.prod.exchangelabs.com
 (2603:1096:820:ca::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 12:49:47 +0000
Received: from TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 ([fe80::f8ab:e32a:aaac:9ee3]) by TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 ([fe80::f8ab:e32a:aaac:9ee3%3]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:49:45 +0000
From: Joel Low <joel@joelsplace.sg>
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
CC: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: Packet misrouted
Thread-Topic: Packet misrouted
Thread-Index: AQHcVX0KLC6F7ZMjYE+kxsgy89PQXbT21RPQ
Date: Mon, 17 Nov 2025 12:49:45 +0000
Message-ID:
 <TYSPR01MB675613CCDC313B78014A55B3C8C9A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
References: <20251114120419.484a3145@pulsar>
In-Reply-To: <20251114120419.484a3145@pulsar>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=joelsplace.sg;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR01MB6756:EE_|KL1PR01MB5270:EE_
x-ms-office365-filtering-correlation-id: 72699700-585d-4b7c-a66e-08de25d7c92b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SoKWn2Or2gVN22GBRUvwwKZsujQftO59jfk9VGifY9li1wV4hu5xNYK05ToY?=
 =?us-ascii?Q?FlOfQW74PVXBP9+dR1pfAJ/ESAm0kvaFjGuFCZ4FhGGvH7A4+zS47phrMMnN?=
 =?us-ascii?Q?UDelcNhjQwuHjwLUaR6s/fonyjGc8B4Wxg4th2ETOmEQnqBefBZzLyW7F2YZ?=
 =?us-ascii?Q?H19RBoHMvHuQsIvJpoCOevsJu+jlpJDZ0dFQdi1KXFUH/iTq45H292IqKzaJ?=
 =?us-ascii?Q?KfdqNaEUsscLyXzTrSyXuqbkwSStyqvssm9W/NVkkx/4cHTu3pRBBRnY9iu7?=
 =?us-ascii?Q?3Z0llkKAKbKf6RgfYq+l3EnT9YuJVJ89B7TMulbIBNQbPjCCW8OEIWTOPJmm?=
 =?us-ascii?Q?3ZiJ70Q0iqhO4KtWQXBFuzHyqF2lhIPrj88VdUBwB1+5Z4HDqUvb3xIXelp6?=
 =?us-ascii?Q?QNz5wqW2f7RHdLmjEA7/ml69eFXPr657s3tI3lcOX62v8yMYCaky1NvgkfKO?=
 =?us-ascii?Q?7i7zYMKsTCu5JXolBmu/bhGBZeditoDajGsgCjWWEHdFwTNy+S3TsdmHj4b4?=
 =?us-ascii?Q?beAOB+DlIdS6nRzJ/hmdTaQOsldD/lEL3pf1VPI5xoa38uF4xIHPQA+HDHAs?=
 =?us-ascii?Q?d4exwWbACpezHv5CXwkiKkN78Q3Qi4BlPMqrIbqhRQJ2j8fCa7IACMuZjSL6?=
 =?us-ascii?Q?6W9zHoGUU2rfxCYJi6jljF3KzStykPH5wwjnkMeO/2K/qT/qbi7wuwzNf5TJ?=
 =?us-ascii?Q?Ur6J7pXIi7MOZYwhhpaaJnm4wZ/XZvMsGvChyLmae6HvTIY5pC1DhrEkUQLD?=
 =?us-ascii?Q?sCQdmOsADeya+qmB2MNfS23QTAt+1I0jS1qcjLHahBgoaTkVW4Nkzkn4i/YM?=
 =?us-ascii?Q?dMldiUO8ry37vPKciWMlg8ZIYDLwgzBIHW8GlVl5JQEMcC8QuTqE/Ff9HdqV?=
 =?us-ascii?Q?FCSglPAA7EVKhls8DuoB/9w+JBKFsgoKUZdBForxfL+vPLJRsfZke+l1c3sk?=
 =?us-ascii?Q?FLeDWdScF/9wjo6dzmzgC0Zc7YGxogqXbHW307g7zHhOSnmQq10hyvW/j/pq?=
 =?us-ascii?Q?PMO7AuhmR7DwOkyt8pTVVP0/NPkj1PoXOmMrRZHmy4r2+SRJYTorDJdX6oid?=
 =?us-ascii?Q?iZvKrJbqOcmyp7gamOPEKXbmLlM22WKJ0KTIIdhY/q0ObnVyeswML3BJBmax?=
 =?us-ascii?Q?x7KjwbnwFX+emeY0llG7wDNPyFY+NVbC7gR01iGL1DOm9Gq3vz0S6vCNNvyj?=
 =?us-ascii?Q?GGMW+DrQMBlTDB8Yl65csyF8fU5EI1mOqMCpUoNM7NEAnEAEi2ZsOVdnuz8z?=
 =?us-ascii?Q?iNvAlepHcRhfyR50kfOswnl94hUO0FI0Tl5cqYTkMMLPeNLNP4BIhSXXWBZr?=
 =?us-ascii?Q?5DdKsaZwyvOmyIyYifjVIjek8aF/HFMxV4F+O8aa4tp1cNjYc9HOe6w56ody?=
 =?us-ascii?Q?CYGrfpvaKIyXXlVqX3qV7qomlplHb3Av6MUa/YDd0dLQ20W55OdAn0PA3e/w?=
 =?us-ascii?Q?zY+vgU9CtmW7F9SGRzl7eT+GfCwRkFNfO1Ny0D9yhzXGXd3RmRKNhhvWhYDO?=
 =?us-ascii?Q?WrT5rISj6ne5a7UuIDxVFQw3IGdaYtGV+BSh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR01MB6756.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cOj6F6X4ajrsUNUh07TiBE57BAoajvEwkEkDdwE0qUcZzfdG7pRp51BPSYBu?=
 =?us-ascii?Q?4hWjxgN65uKV0I3MadfBzJtQfiF6lD47A0qn04PAlrL0DDPPtHoLo47I9TTn?=
 =?us-ascii?Q?kTI783Te+zY3fcZs9TsuxsMN7WZlXLXcNdtdc/SO2FaycSxlduvzNZSkY86+?=
 =?us-ascii?Q?rf3guTUK0NNWskd816FYUChwO1q63ngNLhWxo4LxK9w2bQ8i1M6GkFHR8lgd?=
 =?us-ascii?Q?goIzpL6cGQ+/KgAqPqURXRX12kIusgllN4jw+nOajxUGRQBQzxidqclylqhT?=
 =?us-ascii?Q?KgHJ9n0MIkA0T0QJ7e4/M1EotOtP+cTkFwc4zcYmTlUxc32nQZYg+PbBWVZZ?=
 =?us-ascii?Q?6SNotzOVGmqErqksO3dUZkTkO/b/qfd+5aUmU6JtGqMYbtkjxih/UsjaLYZi?=
 =?us-ascii?Q?Nns3LEt9PX6n/WWClmYeCSZhnp9oNKop58mvEntIvNOmcBZqylzy+zD34sQ8?=
 =?us-ascii?Q?aVpv2G+Tk8kh2uaNEwVoRoqPYMUHPHga8uMMHEtZpjSuRupZcmFp8mldLTiT?=
 =?us-ascii?Q?foGti4U7Q9pNQUwcmahsT3PhcGp6R1bLH502u1Hm5ENflPOGKzLHEs9WAf55?=
 =?us-ascii?Q?aEjnPLEOs5my4tPuQL1v7fgbYENZgGn8h64rqcYA+UsNG08AbiGuhOysUCad?=
 =?us-ascii?Q?lRNYgl6wCxf2PC7FPFUuUM2qdIGrQpFog5ueJv8w1o7wdZ2k4U8KD+l74NIb?=
 =?us-ascii?Q?w1zJg8QOsCfMuiN2a8b7W1CfVNP3amHyN4Oge5N12UF3cJ6af0W0/qPbG4g5?=
 =?us-ascii?Q?XJVSXhNRN6jdy/Xfk5alQPfFxDGUhPOwhitMnXql0S4d9VPjuSn0CrUcFsoJ?=
 =?us-ascii?Q?XunEv9Om8DMZlEuEHWttZad8JqO49Yl+zxPOgApNBgD/ozzk6EBHTujCKVWy?=
 =?us-ascii?Q?tQchx0LTPrUyeS5z7H1d1qIY9sQGZFf+OyBPjyIQ4QIxcm+RSfS+HtklO4Yb?=
 =?us-ascii?Q?OokOlCGG2rWY1fpj/PIITdBvQM3pcscrT3p646uk+/gSuLknRgqBf91PAiTb?=
 =?us-ascii?Q?OXRyUVJBYnbSeg7iaTrJg2QiOxzdzkE19ZYNZ9gHXYJ6vueCOzh2oOJdMbre?=
 =?us-ascii?Q?rljqifOmauwb6NEYuQP3VctoF7K84kYCK5mJdk1TQQQzKB+4NPF9aeNfvAJo?=
 =?us-ascii?Q?/F1YGXAxzvMFkS2mq7D4VpE+u+3E05iHhxGn7d3Xh0qViTwtK9YeV0cYS6Qa?=
 =?us-ascii?Q?ba/YzVowpz3/MXV852fWs2tcqBSwmrB3c3nezcyJLmRni/8ml+MHbdz49MGE?=
 =?us-ascii?Q?3SeTan+ff/Jo3vXa1Injg0z4oHzJmQpM0XqotbFBrgsxpg4+smOeh7efQyCJ?=
 =?us-ascii?Q?w1wLt6fIlympcXF1+1OtiDy255FiJeXLPjxX+1KWsu++rLuG8Hu67QujYRKx?=
 =?us-ascii?Q?0iuCtmagc0J9ea2U4aOU+f/hAoe+YPgyWPKuk/u+dQ7RfETX1cZly4ejsCOg?=
 =?us-ascii?Q?/eDU5heY0DyeZNw9dmDYNNTbwZkpxXyq9nCuOFp+MWnmJqSS7+0hA8Mg/nOM?=
 =?us-ascii?Q?hPtkPZbbxd5KXILeJ8CrQr2NCayqnMdc+EluH83Zyo1GM/Jw3AyVPQn0fqeY?=
 =?us-ascii?Q?PcvbIxQiNacC+vMPZ5g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: joelsplace.sg
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR01MB6756.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72699700-585d-4b7c-a66e-08de25d7c92b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 12:49:45.6160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d3cf250-83cb-488b-b882-323bc2027851
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cD9jqJYBfOzi5NEZMebLpzgZsfe22IU9uqfrc1KIlmhowIK8WJ9tltWfnmyhdrUGmN2eiho0r61hC4LvOvmLIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5270

Hello Ethy,

> -----Original Message-----
> From: Ethy H. Brito <ethy.brito@inexo.com.br>
> Sent: Friday, 14 November 2025 11:04 pm
> To: netfilter@vger.kernel.org
> Subject: Packet misrouted
>=20
> I see the SYN hitting the equipment coming from outside after being SNAT'=
ed
> and DNAT'ed, I see the equipment replying with SYN+ACK.
> I also see the packet being un-NAT'ed at the router.
> BUT the packet is directed to the wrong output interface and I can't find=
 why.

I have been using OpenWrt for a while, and there we have mwan3 which is a p=
ackage for performing policy-based routing.

The reason why this doesn't work is because the return flow does not rememb=
er which interface the original flow is from. mwan3 solves this by assignin=
g indexes to each external interface, marking the original flow with an app=
ropriate conntrack mark for the given external interface, and then using th=
at mark to influence the routing table used (so conntrack mark -> routing r=
ule).

This should allow the return flow to egress from the correct interface. If =
you're not using OpenWrt, then source code is available at [1] and you may =
be able to adapt it for your needs.

Regards,
Joel

[1]: https://github.com/openwrt/packages/tree/master/net/mwan3
