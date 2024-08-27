Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0A1C4EE6
	for <netfilter@vger.kernel.org>; Tue, 27 Aug 2024 15:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772188; cv=fail; b=QFNUmflNAhBnCY9PS4eUMC8NzVN21DiGyjdU2uQfNZKtwkD/uuivo5HG7wIt0f3ROP4jaUhtCsqiBUx3JbMRnWL4kPnsL6KJwZUVQZWj1PSALhAW9OT+QheMMjuqeFlXjWawPNSaP18BVz47WKg1BM77frTfHnjPNeiyyGSOak8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772188; c=relaxed/simple;
	bh=c3AAI51KMhdRNsbZ38Tju3zgjOJabI9jPZku5k3AkUg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sxdSZvg54RLPx1kKKx31gamwOLoSSYTHNNVxLii7KzN3HwHglfZblpD6jBwp5GqJp1i7zEmgUExDlFCmEgosFmefI0NktfHdfh73FA3V3tsTavuzRrLBRnXtrE3tTmMLktuH7/lE527XED1qVv4MFPtOJlnzkcOrNs2qwVrpGR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com; spf=pass smtp.mailfrom=netapp.com; dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b=o4J35fGl; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netapp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b="o4J35fGl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuORt6pI1vguKA+dsNaK7Y5MqRwd3Sod1QjutEXdw1vxrR8l3l8xMDmmJj32NEBAuUOpTCFa6ubsh708Mii8nObCcByPhzy9MccUoMnj+5VZAz497GqvOZM6wOK7J7FyqTZaYEuvgNyTCnsjPETVogugj/lYRJzy5GmRNZo90MKHakWdV/IDFV2NJKnjyABCztLyGqXTFrBR8ltIsa4aTJ9OJflCou3DhCwKvlK92u+ScbTZVio0KWqvDfL+YbrB8NVBz5Waycf/OtPAGt+POlt7hNSqUB/pcoopsv2xCnehng1S1sdfxyVe0f5/BZN34D8T/PXfPo6VA3UtOg2OcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga3BviaXdtj1ROgUcoX02TRDMzF96YugHvq53gCuZNg=;
 b=foKP4GsQ3HDFYB90lC2dP+E9ENHcflKTugcWpD/ni3ATnlKky95oyyXb61pCkivHVJavu0ywEIQ4gZJfHhRwweRBzkiX5wntU1Cqc1fKZS2yju4Mc5ft4aT2JR4ttpeTuiwF4YKRiWkFfW/+pwAoIm4wKb0CE1Due+JOy0145ZeE4+WJM5gLzkLNi368Yd17iSoVnW66fwpYg9woT1Qs8AXGVIIEkIQPtHDTmKoXRi4eGd3zziW/DUSLi+7rAQmnSjaBTIM/oCGpI497hQ13zvdpNzMGrtFm5kmtewBx46rK8z/DQIvylpmc2fDQqDK+1vyIdkldwp3XONwn97P1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga3BviaXdtj1ROgUcoX02TRDMzF96YugHvq53gCuZNg=;
 b=o4J35fGl2Py/YCutNUfI+y5O8ZWhkKz33IO+6pWrp/RDRNzrI0TTWWBttvudOwPNo4tZ9n97tgGJ2KgEULz0qrOjahe3ciUrYnEyOorGvkMyXhdUVy4kP+1CwZog56CN8hSUpXTq2gcesQkX7SbakAe/yIftgWUISUV5W14oZovc9P6hhOVGbE7E2DYaR9pzxZiIrC9MF4F+3I1Nk9ogmRuGD+i2p5TEYbR56FIp82dk1XOPZDBUUaIMkMOk0O3X9akFalqzg1j6UZzz/2cARXi64d50RqrxFrnR/fEdl9OW0Dp/EndwSWQxM9k6kb9M1gfE8+G7pdN6td2FaQSVRg==
Received: from CO6PR06MB7713.namprd06.prod.outlook.com (2603:10b6:303:13a::15)
 by PH0PR06MB8224.namprd06.prod.outlook.com (2603:10b6:510:b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Tue, 27 Aug
 2024 15:23:03 +0000
Received: from CO6PR06MB7713.namprd06.prod.outlook.com
 ([fe80::6dca:8e7e:b5af:6be1]) by CO6PR06MB7713.namprd06.prod.outlook.com
 ([fe80::6dca:8e7e:b5af:6be1%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 15:23:03 +0000
From: "Atkins, Brian" <Brian.Atkins@netapp.com>
To: Slavko <linux@slavino.sk>, "netfilter@vger.kernel.org"
	<netfilter@vger.kernel.org>
Subject: RE: Understanding output from "nft list"
Thread-Topic: Understanding output from "nft list"
Thread-Index:
 AQHa9a8A7wNOnrpOpk29yQ7RtfXFErI1iD2AgABLewCAA9Xr8IAAG7gAgAAUBKCAAAteAIAAVNwggADA5ACAAEP7EA==
Date: Tue, 27 Aug 2024 15:23:03 +0000
Message-ID:
 <CO6PR06MB771303D89E9ABF03BBBFEC38F9942@CO6PR06MB7713.namprd06.prod.outlook.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
 <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com>
 <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com>
 <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
 <5F6FBD88-BFCF-41EF-8B7A-5047ABC992CA@slavino.sk>
 <DM8PR06MB771745C3C21BA67F1D90C848F98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
 <F385FADA-1F1C-4F41-AEEE-C6BF2312D29A@slavino.sk>
 <DM8PR06MB7717BFEA7F827B53CD0FA03CF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
 <DCCBA742-75FC-4731-BFF7-02243C09284F@slavino.sk>
In-Reply-To: <DCCBA742-75FC-4731-BFF7-02243C09284F@slavino.sk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netapp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR06MB7713:EE_|PH0PR06MB8224:EE_
x-ms-office365-filtering-correlation-id: 080c8678-d544-4472-d7fc-08dcc6ac2503
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?GCgDrlWP+yT3IT0mSILgjsKG1u8SWIpqnsipBn08l0HAlLS1f/m4uAaYAi?=
 =?iso-8859-2?Q?NsQVao1qQwIi0MD4n6/ePF04lw0nrhCIhv23VTHL8M+NQDbV/qypHtdyM5?=
 =?iso-8859-2?Q?g3Cl3jjkMaxXLOfq3E8ckynW3yBqefjLOxcnsXCDvHrVTZdh2kYUHq/UJ2?=
 =?iso-8859-2?Q?zL09ygGgE9pygA7v3zEFSYRVmAiEBvUyihr1xBI4YGB8FpKpfh7CjmqSWU?=
 =?iso-8859-2?Q?rJb1qguqkJJe7YTkjJgpR4A33hJTsGoIqkhzEOo77PZAgFh0koobGV6ajD?=
 =?iso-8859-2?Q?+THJ7kBafEDUFfwkRFaNx3yu7hOzvt5a0BIyE7leNF5LpyC5e9sQ7vGiO3?=
 =?iso-8859-2?Q?Gm7MtToj+Db+LIlxQeZv4h25Zz9Jo8IPbBweGIbpEVyubBhM9P+oVnpwhk?=
 =?iso-8859-2?Q?bGvI8hZN9Lb/9y4pdXZ26DaMw4E0t3BCIOT1wi32rvmcscYXwykPDqmVJ0?=
 =?iso-8859-2?Q?XGzsfTp57Q/gmVmRe/nQcvS2zgvqmv7Cdz6yy6hxbI16WpL0wIYTKjq0BC?=
 =?iso-8859-2?Q?0OvkKFlhAlQa6edpM8omZ9h684fWuaDYdzX8K0FyA6MDnpMaKcDpWQRKLP?=
 =?iso-8859-2?Q?LvIrCv1CkSSfpmuvj1EJuEOwhVrBeBk++SxYMinwP+ElwZRk82a2LnkH/N?=
 =?iso-8859-2?Q?mGtXHiVAQau0qNkFj4wkoyPjZybH/KrxSZd87EUt+Z8MwC0NuKLenoY6BH?=
 =?iso-8859-2?Q?Ec39qL5EmPXCjuw6/KaneeNcEqoI7cPJY3dJrxhCB9xs4rJYSYNQBG8vWK?=
 =?iso-8859-2?Q?VRoQF5PZZsjtmdonslJcpujhywdRLQKYN1zw/beAnutzPuSzHzhtHHeuvS?=
 =?iso-8859-2?Q?wZwMmUeujpzjwwmqHLjbNMvwRoVx9so+pGq7HKetx3X+4rLAOI5xrwS/hZ?=
 =?iso-8859-2?Q?gZy04/QjckPet6zZ68YzlV+TY04nNxCilPvZgEpLGs6F+qhq1jbX4b1XCl?=
 =?iso-8859-2?Q?0Digi57jvIN/xFts/mXcricdl00+jildRDtTL/Jl9VSp2gvPMOx0BDljJ+?=
 =?iso-8859-2?Q?dwEJSs/DKc+QZHZroiHGf8t6s570auuZnnKQwxZ6sf10ZAFaq49YfrNfOs?=
 =?iso-8859-2?Q?5DVnfZeaJv5Ji9CiNOecXQPzijppAcE1FEmOdIx6028Vi3O1CUV10LtM+P?=
 =?iso-8859-2?Q?Ngxf7VlFzhcliBly1SErAH7rtdJGulI+dMnh60liH0FDMbnHR2y8H/ftbf?=
 =?iso-8859-2?Q?hNZ7yKY9lqzWsXbCEAq3v9b9QjmTukygERTnWqmb+kZ1saa57+rye9k25O?=
 =?iso-8859-2?Q?PSvpQ9ig5vCpjCHA3xC4F5OHjYnv6+lmj+HDGZyCfJ3Ghdi9gVCTXz28lM?=
 =?iso-8859-2?Q?3JO/37ZV5hnCkBTjumf3fBIzIbx58kvdqt5Zr7YSuFP6PMpE/acWh/oYQr?=
 =?iso-8859-2?Q?vnWN/OjVDBvNnhonglT9tug/IHqT+dEA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR06MB7713.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?8IrT1A7c6jTdyN1n4v/ZpMVuVumELu8CcfzqGJoUPGIsq5ZtCqkZ3CT8fD?=
 =?iso-8859-2?Q?Dz0Zu9QkcOqHj2h8xAqMU53+ZZUxoUx4SEvzmLOaZ5wQ1ZBmowYJE//ROS?=
 =?iso-8859-2?Q?B3dFAtLLg/7kSYzA+oRHi4i7vrYdfTxrhwGbb1vrDmhXmxcObCWPKpXLgY?=
 =?iso-8859-2?Q?BQDybUWo16Klau4LeNhZ+9c3ELKGDxUOfV8qpF0ORYr66CQQJYy+WP/njt?=
 =?iso-8859-2?Q?o2dgunFLk5H1a+vsFIePU9/W4LMKB46ScoeMI039HknAgsj39Rg9sbt6MI?=
 =?iso-8859-2?Q?gcn+P/etH/wJMsXiXtz6vznVmUHTc6GiA7bxjHxJYNzkHEfd6UXJx2dz1U?=
 =?iso-8859-2?Q?SofnjyyO6R42IQ/eDHeiyVr2tQqwxvnyumOkbhvp+IPXTbu/HXfh4METCD?=
 =?iso-8859-2?Q?8yQYYyXUw3SabggqzRXseQlpj+qFH6B0WuE222uTLB0gSI4dGjvPjPbZje?=
 =?iso-8859-2?Q?Gb5Qd5LWbMZynDTIRbTkQ9mB6zhPUbl6dqnOjFxEdQbYR4Vyg8LllHE4il?=
 =?iso-8859-2?Q?jZjtx1BIK12M9vnSmxgvuNllmZ1ouO1MmRQagxt3poicSdNXKSKOBxklDI?=
 =?iso-8859-2?Q?mNYMABqI9tW3JS7RZRLeSZDw0Lrceo7aTq69ykZSWgci1rLH441bOgVG5J?=
 =?iso-8859-2?Q?jZceQc67iB/mIvcRRsSh0y7ARCSyFFGtvQTJB+1bHk92pMMDexmFlzlmmD?=
 =?iso-8859-2?Q?kFYcP+yFWNvB0l4wKSD5hZdS8AEMq5GGjItnDvRDGMFhhKRBvAPsvP/QhS?=
 =?iso-8859-2?Q?6YWvWWcOfB9k3G7+doIBAiB133FR/7K1v5IFlvnTt/0jM6604iCqz7HRWX?=
 =?iso-8859-2?Q?6R3Khi7NxPx0lKQckzNnD/28BIFPTNCT0ZsrY/hQgIh5BvIICNshQ6n05z?=
 =?iso-8859-2?Q?PUj38Y3RrpNjjXph5Rq+ulSzpR/syeib2gUEuax9Yz/1449ZCcHZOJ81Vm?=
 =?iso-8859-2?Q?Ocn10hLvntwrC5HpbeKuB+lfy1kWGwTZvy2VJd4I5HGjeb7jP5VzAZ4DR0?=
 =?iso-8859-2?Q?z46/gu6pt21zjPridA70dLn2mCuQDM87u+U6wLzjLXcSrmsmPs7DD5c3SM?=
 =?iso-8859-2?Q?db7Xn38cXkL34Jp3zDLauJid0ppEzyjhRPBLP/2FpekLo1XZOPvzv+IXQJ?=
 =?iso-8859-2?Q?HNaqutps9zz9kfaQ2OlNKpJpy1N9utDZ0ERdY0AesUjZuSc+Yf2D9kYrN2?=
 =?iso-8859-2?Q?ppp9d0oWQWnOKNtwwV+dAYIcCmwLgUAB3oo2iPrDFbKALPwgJZTu23QDLe?=
 =?iso-8859-2?Q?VQpKAmcdCdETv3ABJpR0ZLmyWLwgySADiHiaPsQqqaugA8mN4wi3J3s018?=
 =?iso-8859-2?Q?gVTBq2W857/a1p/Eq6Yb39whPD45TuGjxj1nvPzEy2d2KyJ1L6S0fMUblH?=
 =?iso-8859-2?Q?nsKwmI4/Mj83aVs3IAwK+p1sohcdRV7nMtrfBJagXmpa9D4XP6BFxJ176i?=
 =?iso-8859-2?Q?Xks1l+bnEv7yocW7HG0I+pRmCEEqhWDWxrEkayxxmxsMmZ1LS1KmzfVUnT?=
 =?iso-8859-2?Q?495cIB40mdCs/ngviS2DfDVrwH/lrecaYU5vjjnD8xG1tGZ57IMyHu8vjr?=
 =?iso-8859-2?Q?WnnEWIl7LE1kMdGEvdchT8ustIlkRk5qMu3LTnDEBabwB/PW42feZnlpJp?=
 =?iso-8859-2?Q?yDSn4zdbVwt70=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR06MB7713.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080c8678-d544-4472-d7fc-08dcc6ac2503
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 15:23:03.7322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+NID+vjfl7WtkM4Aq8KFl57RO3ntkj083t6FDv6MsDfxcqJieIn1pk1gkNxPx/i9BRa9ihQZLhV8zad/ofRFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB8224

Thanks Slavko, that's good information!

-----Original Message-----
From: Slavko <linux@slavino.sk>
Sent: Tuesday, August 27, 2024 5:19 AM
To: netfilter@vger.kernel.org
Subject: RE: Understanding output from "nft list"

EXTERNAL EMAIL - USE CAUTION when clicking links or attachments




D=F2a 26. augusta 2024 23:55:20 UTC pou=BE=EDvate=B5 "Atkins, Brian" <Brian=
.Atkins@netapp.com> nap=EDsal:

OK, thus in our topic, the chain is in mean of chain with hook defined, nes=
ted chains (jump/goto, without hook) ends whole chain.

>If, say, you had a table of type ip, and another table of type inet, and t=
hey both had input hook chains, I don't think accept in one chain would hav=
e an impact on the other table's chain, although I don't know that for sure=
.

I asked about that in this ML some time ago. IIRC, it doesn't matter on tab=
le, all chains with input hooks goes into input hook. The inet family table=
 just register its input chain into both family (ip/ip6) hooks.
The order of processing is based only on priority value, in case of the sam=
e priority, the order is unspecified.

In other words, it doesn't matter if input hook chains are one eg. in ip fa=
mily table and second in inet table, or both input hooks chains are in the =
same table, they both ends in the same netfilter hook. If packet have to be=
 accepted in that hook, all chains (in that hook) must not drop/reject it.

You can simply test that by enabling trace and then monitor it, i created i=
p table (for you) just with one accept in input chain (redacted)::

    trace id be75f3b8 inet filter input packet: ...
    trace id be75f3b8 inet filter input rule ... (verdict accept)
    trace id be75f3b8 ip filter input packet: ...
    trace id be75f3b8 ip filter input rule ... (verdict accept)

Note "verdict accept" in both, in the inet filter input and in the ip filte=
r input chains.

Another note, both these chains has the same priority and the ip table is d=
efined before inet table in config, but packet goes into inet table first.

regards


--
Slavko
https://www.slavino.sk/

