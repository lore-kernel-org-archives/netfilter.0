Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022133.outbound.protection.outlook.com [52.101.43.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A91C1386D7
	for <netfilter@vger.kernel.org>; Wed, 20 Nov 2024 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732137389; cv=fail; b=RXkUNQ5x5qDFs1+omDGuK+3d+Cg2/OF6J+ap3mIYZxXUdZJCCpwyxdqAvjOzqnfEcnRxumANe7OFTHCfi6suaa6W9vlBcVkZkSrOEfBNBzn0PXfrBv1aaxY5pETZN1zKUtadfGj//kv2ZrvsKnDjALlBt+3RvQDlo2NfGrFUfE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732137389; c=relaxed/simple;
	bh=Qyd6hMohtNe9r9M1ka5vnvgwyPFLGhIAvI1PoRnES28=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VMdo+POefA6P6ZbQr23eM3N0t6rkgjWzl0x6bZZicSzga311Ov83xMzxj0Rr8i+UKr9fyzFNNO7G8gzVttjBqbN0V6UbRVKcfMVzI7x+z078UPt9M06URIiekYmewFF+JlZBE2ML2wcPx1dL3DC4k9b7Zeu/qd3DEXlauJQqP0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=craftypenguins.net; spf=pass smtp.mailfrom=craftypenguins.net; dkim=pass (1024-bit key) header.d=craftypenguins.net header.i=@craftypenguins.net header.b=kVN2aVU2; arc=fail smtp.client-ip=52.101.43.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=craftypenguins.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=craftypenguins.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=craftypenguins.net header.i=@craftypenguins.net header.b="kVN2aVU2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UunzHX4iAT4NpgO6OVeERDqyEMIz+FvOc9Y1rC7XTdq/D5+TbQ5TvWNOg3VBoUDAdu3+iiaZPlXPwraVROZb3N1Mf66Q3T9gTPS+VDJlBvuJu3UrSUrUhyxw+N69Vu28n2WEnRUAZ0D8OBUt/sXyFIkUOysZtUXvuum8ZqoOSEmDE8Rk8+jotXdrXnTEvdOaUVKUfVQJOfiH2zGpc5afFnEsv/fjfsXxfutnr1wLpgZSKraarvQn1BPCCbucvAoYl4h20gahXOCp4Zku0KJFzzkD7Fdw7YKB08zT0EpTHY8hvRQ1ay3eraJYCljBlHZ5jRYnLWUcEAwkseWwGhU3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qyd6hMohtNe9r9M1ka5vnvgwyPFLGhIAvI1PoRnES28=;
 b=y1qjml7uWXR24cJRHgP5CmxYUorxoHYTGBW8XRioh00vLS5IlNr7uUrDe255ebcQVAMPqAjWrVnqCLMuJuaxeRFInRyYRewSHi0S2eyZGDLYJEA89plHKsbHBW6RDLrJz60E1iCV4MeKUYSZwYDm/rEzO3MOAmIbHfJl0h0ELxDGuD7t/kI+Dev+4IwwgkveMZrpent2d8UoS5B7kERQ3hZdbKHS6QFaDHsiELaTU8sd5DaiBR+oC8arZtHe0ts9/oxVmui88RT8cWFRGA9gspbC4kJKHBB0X5bt197L9w07T3zsWsKBMrVVtRDAdRgmeOUE5FPx9Mqtbya0AF79mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=craftypenguins.net; dmarc=pass action=none
 header.from=craftypenguins.net; dkim=pass header.d=craftypenguins.net;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftypenguins.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qyd6hMohtNe9r9M1ka5vnvgwyPFLGhIAvI1PoRnES28=;
 b=kVN2aVU2AYtyHvj/J2eAk1eO+s4UR7pnJNdgNM3pbDJ7JjK92Rpv5HRaz4vcm4SCJqZLrNnEDunS/mk0qTJeP0ruaI0scGys0G9DlKJ7x6LSrNJZdQiiVDq3YAPmXk5GUm79L5aXMU3Hbc9BtDA6fOG5v+7niaUDLbbJiqeU07A=
Received: from PH0PR05MB8159.namprd05.prod.outlook.com (2603:10b6:510:aa::6)
 by DM4PR05MB9415.namprd05.prod.outlook.com (2603:10b6:8:111::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 21:16:23 +0000
Received: from PH0PR05MB8159.namprd05.prod.outlook.com
 ([fe80::b0df:21ec:206f:1190]) by PH0PR05MB8159.namprd05.prod.outlook.com
 ([fe80::b0df:21ec:206f:1190%5]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 21:16:23 +0000
From: Jordan Dohms <Jordan@craftypenguins.net>
To: Marco Moock <mm@dorfdsl.de>, "netfilter@vger.kernel.org"
	<netfilter@vger.kernel.org>
Subject: Re: logging to a different place than kernel ring buffer
Thread-Topic: logging to a different place than kernel ring buffer
Thread-Index: AQHbO4fCBhy5YSZ1fkO8fx2stOm60bLAq2/q
Date: Wed, 20 Nov 2024 21:16:23 +0000
Message-ID:
 <PH0PR05MB8159CBBE2D2E312B17D08365B1212@PH0PR05MB8159.namprd05.prod.outlook.com>
References: <20241120210636.6df71d81@ryz.dorfdsl.de>
In-Reply-To: <20241120210636.6df71d81@ryz.dorfdsl.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=craftypenguins.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR05MB8159:EE_|DM4PR05MB9415:EE_
x-ms-office365-filtering-correlation-id: 0e192b18-fdd8-4b4c-4ac4-08dd09a8962c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bbR9KJCcJKkOp4HX5iYd+DmJfCQpSam9eowlJpgVhS/dQBfjTwBPWOp4v3?=
 =?iso-8859-1?Q?b1CAFPDnQKTIRp21nWfo7IG3N4OFFN015u3CWG2TVVUzaPvCXjbUic+U83?=
 =?iso-8859-1?Q?sxO0COiiDn7TIaSohmmt7amzNVB/DTTdwfftl9+ihj4w5icXRQbIpL2kCj?=
 =?iso-8859-1?Q?An1PQthw/mJG1RMGdFJf+2rYDnHZNUyP8o1a1PXOQkSGM3bARuW0vj+gvg?=
 =?iso-8859-1?Q?SqSaHSVL+LxJ1q8vN1qSW5fKpLErAPj9WA8pdLSIkqhqBfPY/KShpwfM2h?=
 =?iso-8859-1?Q?gnJXCnsheigCTbZghgJkTT02Y6KEFMVZuriZydxIYfYyKSvn+SdONS6+cK?=
 =?iso-8859-1?Q?d2UXViAH902r1G21fUinx0a1Sgv2TRzSm5EpfqTiX3bmnFzelaXGBWcBZb?=
 =?iso-8859-1?Q?X8/FXERz0T4NYdcpsrPT2L4iNoL7xjYgsaYFBEMEYdV3bTMOMjoktpJco0?=
 =?iso-8859-1?Q?OAT/e0emPnbl0ATBWToie9kq8SFy4sqPSTUJlEHDehMu2SAQ5o4ZaulJqx?=
 =?iso-8859-1?Q?sQORRr9ZQF28TTUh8wYimRGAjh04469aJmM95jBu5yI+s2VfYMrmDJhDfI?=
 =?iso-8859-1?Q?D7Z2aBIlFq8+EvRTyOUaHW+1Wb5H8Tu6fOX0o4hGYwNi5qJMar98fGRW4Q?=
 =?iso-8859-1?Q?C+j6oZYrbafMCYtoke2s88zX5NhZDiRtHKwxW8RHIqhHe2JmdMJjd10J0j?=
 =?iso-8859-1?Q?sZEtKWDUw3RGk4oTXxObBeYwINg0FjW9N+PFw5janW3yprMNFunIioA4HM?=
 =?iso-8859-1?Q?ynL5UWRK3RqzUh/OvJQCm4r8FWXXL3Pskx80lwFHS+OZBohypsWkEwhZnc?=
 =?iso-8859-1?Q?AKDkFryG7NbrYGB2SiW9lQuPBExHr54lj/ivDfb5bTBxN7sdgFc6iykIYG?=
 =?iso-8859-1?Q?2mWEirYtUONhd5psGWu04m/L9Gv/mUGr5VACNIyv/9rJarGrD5HCJLujzx?=
 =?iso-8859-1?Q?alZm/YDLoTHbPNaeyVZ8ia/PYVLuzdF0RSnUdEc6lcCIlyIiVURs7pT6pr?=
 =?iso-8859-1?Q?1d50znhlWMZzeanjcc7+qruQEfjaVzSmKod/9PWAnWIjBA/mN1A02yoxnq?=
 =?iso-8859-1?Q?38JjgIWHPS4LYxWw6TLHElVbV0nzTywCxjSefXXMd5aVREa8i1DaUs0Wm6?=
 =?iso-8859-1?Q?2tIYXc+aTpgxKxciZfrrfj1ALKM+kavbYj8VZlkqQK2HE9aK5pxLBqmgzc?=
 =?iso-8859-1?Q?5ViI4Jgrlr94xBBZyS+z4Nw9g2TM4t3voU4eoEJjuugaqfXHRzpiqefivS?=
 =?iso-8859-1?Q?jwxcVPF8kebAwrgLytY7TkYveZz+/wvqnzOhPVO6sp0qyWsEvsHsOygGKw?=
 =?iso-8859-1?Q?CyBxhyvmggi9oGp2Z8uZGpv+N/azuMa/KNUcyLHwl9/5fB+qZdvhfFOK7r?=
 =?iso-8859-1?Q?q0RQnLIua5JUl7LxGltZof879JEew5oSPbTbeP4gdPJWO5ySOm0Ys=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR05MB8159.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bkGJrVgkbR4E7CDUsFI8hfsWW3+tJk1K7p/3qhig++4dTio1Rdios5FWH3?=
 =?iso-8859-1?Q?+B2FBvLa3MJb14OSJjRruhAIhtzXKksAhg/UbLLrKA3ejyNzQwL3ywJBYP?=
 =?iso-8859-1?Q?j2pzY23u9928/VGI4m/pladtPU9zZjjXAdKw076rImx1ewixNGf+0zNFPA?=
 =?iso-8859-1?Q?u/vOitPe1aQTaBx3moL9zYqtMeyWo8rOXpksvapPOqomRdxKflmBNFhJsX?=
 =?iso-8859-1?Q?JXtdPla5jaBcjgcghnQ9LpeoVyxRvXjvJZ7dXnAUvtC3mdwNgVbQF8BYDV?=
 =?iso-8859-1?Q?V5lv9hV7nVakEU0Ws84q8WKNnU+B7XZPPW6hwcbvzJnlOjVjq56Z0Nw5Hb?=
 =?iso-8859-1?Q?c30veGGzZH0x3A778rkAikeQ19ZoowD2qB6QUJ7cJLqmfxHcMJdM1v07jY?=
 =?iso-8859-1?Q?xBqhFFV2pj4QDSwolXUFhoEfKoXtnnJlD8kbyFn5cdvvhbSquIcU86BRKE?=
 =?iso-8859-1?Q?vktnnKQ7oSUrq0ku8NoBMnH5SYuooxdJuaekFexQnfRTnkKm/jTD8NZRDn?=
 =?iso-8859-1?Q?D+A4IUxrzTpHq5bNwkyAg0zhBKCH6kmSUUc1lhU4MfYGhDWBQPt/OwrJTO?=
 =?iso-8859-1?Q?7FESIzQ5wOOSOmk87QoHAZaSL/aAiwGXqlryXEf4RnJP3GpZaECmNJx/Nr?=
 =?iso-8859-1?Q?AWjeNJ7UwjQ7iDNsTlQ+7FH2dBtM3DT/HiVXssg8jIUf+etVascj2HUX4L?=
 =?iso-8859-1?Q?7LWy6bQJuXHT7PtfErYU3gWvDasn7DlZtvoTAbL7RL4I6cJRw3I2GQfPAF?=
 =?iso-8859-1?Q?iYudwKmJCzFqjQoyHymynz52MBTm329GA7/soRWp4ibUvZk4InqcS0r//E?=
 =?iso-8859-1?Q?kOxUR36L652lmm0sNqahR+GJAzfgCWG7ljpUp9Q+oXXPajTsP7IzJQ7+wh?=
 =?iso-8859-1?Q?BfY0toc1MSJW+NX6MQGjPtP6r75NUYo2zqCrPO2ogjZVgcmInNO4fYDt37?=
 =?iso-8859-1?Q?6+Hj/rNmLOEPLTa0frSgPbvpIJKa8tbxod3hDviwmEVNh7lmt7Iasx6xac?=
 =?iso-8859-1?Q?tcv7z952SnNioMlIDrvj9e2KupFY/m5V4blOtUmTv1aek8ObG0W0TlG2Fl?=
 =?iso-8859-1?Q?8M9mhhZCgmflNaJp7XPaQoaEGag9UES8E2GOHmW7cS3ajFLT/8ERgZ2lf4?=
 =?iso-8859-1?Q?ENkOOZ1W+GBiIDYVv3ot/DIj1WPf31nXbmqlwi96cuo8IFbesYoc5rhrpQ?=
 =?iso-8859-1?Q?AZCXLoF3d9O2sXGjHiNmC8/hfekXFrS83lQgmXWRTqeY4y94yn0PGyDLl+?=
 =?iso-8859-1?Q?L9PbRC5yZlwxkQnLmtxu7/9/sDGEgDjwzp192p4ERvuZOza5mK0IQ3wY0O?=
 =?iso-8859-1?Q?wXhT6VVRk3ISMVuh6Nkw95UcU8fE0wwLwtKybFgMgcqfw+OWkUgF5/2Ht8?=
 =?iso-8859-1?Q?Pif8D22rwOIjAaP5HYld7URcfEv+Oz3s0r68/afQTpgwqKeET+kT2US3fy?=
 =?iso-8859-1?Q?R41bp/7kTzAGk9dLPFx8mK53PwHmMb/QpemtQilUBzSfXZlyISwPwnWz/D?=
 =?iso-8859-1?Q?VODqvy9xvI5fxpdaVynDZxRR/Zk697N4kTvzkygvi0XWeErIg5tXkQcPuv?=
 =?iso-8859-1?Q?l5xNmUm/AbjrQ9dhDPkPpMxiunamIIzXjcyei/8Fs47yXiqhdmoznStfrs?=
 =?iso-8859-1?Q?4+kvFMmOzQWZ8zl+XuXrJaD4e7PQRfktGn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: craftypenguins.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR05MB8159.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e192b18-fdd8-4b4c-4ac4-08dd09a8962c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 21:16:23.4562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 225d5c8a-108c-429e-ba97-faffde32f012
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLBRHQT7pGnLflERSlovhenKHP3QqxuQUTECgD1nqquxwJBpKjjDCE1zS4eSFsMhTALO9uqL5gu0jf/+LS8beRI8pJ4hDiYyVnOb5CHvhKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR05MB9415

Alternative to ulogd2, I'd suggest:=0A=
=0A=
Add a 'prefix' to your logging rule(s) and you can build a syslog config of=
f that.=0A=
Specify a 'level' in your logging rule(s).=0A=
Change the kernel.printk parameter in sysctl to not display the log levels =
that nft logs to in your console.=0A=
=0A=
Jordan=0A=
=0A=
=0A=
________________________________________=0A=
From:=A0Marco Moock <mm@dorfdsl.de>=0A=
Sent:=A0Wednesday, November 20, 2024 3:06 PM=0A=
To:=A0netfilter@vger.kernel.org <netfilter@vger.kernel.org>=0A=
Subject:=A0logging to a different place than kernel ring buffer=0A=
=A0=0A=
Hello!=0A=
=0A=
I want to log denied traffic, but to syslog or a file rather than the=0A=
kernel ring buffer because that messes up the virtual consoles.=0A=
=0A=
What is a good way to achieve that?=0A=
=0A=
--=0A=
Gru=DF=0A=
Marco=0A=
=0A=
Send unsolicited bulk mail to 1732133134muell@stinkedores.dorfdsl.de=0A=
