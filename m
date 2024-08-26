Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8070818D64D
	for <netfilter@vger.kernel.org>; Mon, 26 Aug 2024 16:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689949; cv=fail; b=kV5uWiLbN7ZBBUgFOmNUH1/5n3DSEoaLlbC9UrBeYB9WaVmFDJtRYkEUsecZMluItooPN2gB4SGmwdHsHfJsOERHr+z/Uee/1Ppw0A2ZODvxHWqGt9LJ0uSxjMwbOoIZrRqri18YLlITOy/sXWSUwK8pkwIzsqF7J4qyVRk4S3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689949; c=relaxed/simple;
	bh=RBvZGAahlykOGTtGAjjZZ4qHPbvnTAE8gT8dNW0tL6U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ScagmkIHI5tLeXTnZlX+XVjyhtwyAVEtctYGQsl2ZfE6dv2Kp4p2gUM1gzkniFq8iZQ1F5NoxsixV6nOV+wFCXhwrIdnyrHYcI7AQIT6FV2u31CapZFjqgp+ih1sytm0P6GaAE+Z0+0RONhhpuzHUNqJBMXLkmZm18SV7Rc3c5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com; spf=pass smtp.mailfrom=netapp.com; dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b=WMnLCTCP; arc=fail smtp.client-ip=40.107.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netapp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b="WMnLCTCP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUtqX/3yFbEAKST1Q8aOZb8QO57Q2plLWMfYXNQDhkhO6+pjK/vzhZs61wKkC8pcd/ULRyMxyRn/kzI4CyA4tGbxaOxCdO/oy8q+RV2fyIf1KZOemHoqB8jr4y+KY465B4ioxxv4q2Bwy7cSB8r12LPRTkMcc82p8NbIe0nRtqu5ajrSNR0yEah5H5zL6RzzMlRNqEbeznoOVEDneRGdqpsNSs2VgzbsHREoeoUvANEkBHy05fS68/aNv5t+pnLQhK1NndHh8/80GKI3S/U7AWnyeV4k/TwX4AbGqT/ncSbZPACatEr0WC25yBWSCmQqI7/enkijdCSdJVEzkPQGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18tHCrHv933YaMdUtmIFGFa6YWnsNAuQ0Q07CRTxfRI=;
 b=WxLUE8n4zgH2t9DBybTxLsr1Ys7i4mJutHi/R9XARcYW9T6DwMngZyceylfqH6cPdlw24cFeIYPYO4L9mDFYrL1hE8ThvNEaGUXXdJv0z+leDHusR02TmyP9CuFjK13s57KRQ1GXmNykOAZMKLBpIfqLxbmGGEqyTxO8uIQucrwwtMareoS8oe7IKOKm/GMmohTEN/3bNwQAl2wAarIZSZUbOUnaHTuD8cpF4evv180gx3/ZKjede7FUJGfwMca3qGaGg68/tyts0nmGg5pbvt7g26o9NO9F8ByGEeNhGMx+WbZxMK2sIgznp84P22QS2/rn/ivgl43XPKmtEcXRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18tHCrHv933YaMdUtmIFGFa6YWnsNAuQ0Q07CRTxfRI=;
 b=WMnLCTCP62/m4eR3lGevOru15WN/6uwjf2qMCbNXDMHIA6oPFfY1rd4ZaisSBC/ysj1yBaZUaA2NlWMg0XzB32dozMFdzh2MBDsKQiG55eM/yGJedCc5AzgfcWY693/aw/fV4QY9D/AzroSPV8IzA8eqJEx+a+rcO+WsAx7btMqQYpWhl1ZDZS9ZBuXqkt5+BGZNRhSslc+LrSAwBah+Lj8gSJmJ8zQOwO2E+XZ/a9mwlsyj9V9HgnR4VnNgZYF3o8W9aEMAlymlJEjfemerAUhR1CN6edZuvUGCtm/xioab+Qo+WE1EL8MZLvHpmeUnXEy17dhJyW2Oep7OStpCqg==
Received: from DM8PR06MB7717.namprd06.prod.outlook.com (2603:10b6:8:37::11) by
 CO1PR06MB7946.namprd06.prod.outlook.com (2603:10b6:303:fd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.24; Mon, 26 Aug 2024 16:32:24 +0000
Received: from DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3]) by DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 16:32:23 +0000
From: "Atkins, Brian" <Brian.Atkins@netapp.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: Understanding output from "nft list"
Thread-Topic: Understanding output from "nft list"
Thread-Index: AQHa9a8A7wNOnrpOpk29yQ7RtfXFErI1iD2AgABLewCAA9Xr8A==
Date: Mon, 26 Aug 2024 16:32:23 +0000
Message-ID:
 <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
	<a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com>
 <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com>
In-Reply-To: <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.10.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netapp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR06MB7717:EE_|CO1PR06MB7946:EE_
x-ms-office365-filtering-correlation-id: 29311a28-8ea8-4d3c-3b8d-08dcc5ecaa44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7IuZvlRmrwBy8xu743NzbH8sdqsOGn2rPH6r5qOAQttuvOS1Ov9fCGI/ks8H?=
 =?us-ascii?Q?YbukL6L52ol1XiAUCB3/lojuF+OtsZ/ruh+Hr32u/XnkUr8udu2L2r78/NSg?=
 =?us-ascii?Q?vb23Gf95milCboJQ7g741kqMb5UCGI4LRBcggjDLT/l9mk939GU9oM4qFUu4?=
 =?us-ascii?Q?QOZHw2Egr5DEax6zTf2f8ckdWSvMugQ4t1gg7RR3rjhlIrJJTusrrM/QP8U5?=
 =?us-ascii?Q?nN8wmnTj6sN6gKDhgojZ/LnJ6G6BGgHAjg3CuibJSOd8qH4doxoneJgpUW/S?=
 =?us-ascii?Q?1064+w2aDkGNedhULGEQa2uyJbWte7rl6yAFgO56BUVX7TZWleGIqbk0C9Cf?=
 =?us-ascii?Q?1AvUjKAaAUT+tTBEbCPT/wzUsXKYmQjZrNl+Oc4ruQkGfNPxAMlbfL5+pizG?=
 =?us-ascii?Q?4DVoAW05zTT+wfgPJBxigDmi95Dx9/KgvHJRrg88J85pPd0ohDQiodSHvOcS?=
 =?us-ascii?Q?IfHtTU/iNp348eDDLLcK8Ri68Nn73pESivezA9j8ZMAOhMwzW9jOrLEeE3he?=
 =?us-ascii?Q?n8MRWRawOJrrPXo70HMrrdlEjFVc4hGTRo5ZQas2yC2ap/ZTYgj6CcIZbhuQ?=
 =?us-ascii?Q?df8wLUG2LY/kStcJkVfqv7FQJJdstruoH0HhxfXUSFLbj+IZAyXBcequt/7m?=
 =?us-ascii?Q?b8PSmgLM4vRDiJy/syyaC/V5yItMUVBEZGvI8Jcf9eqSbfW/2wG1j/lieuqM?=
 =?us-ascii?Q?hSXquEW6IpUjlPMhsUVh5hPt4unlQAQNvB8gfSiTTnsjK2SJGcQQdFAQagFZ?=
 =?us-ascii?Q?knjzeyjuDjcFFZqWsNT0M+VUhN9QrGwk+N+dFPEYC6ogyc29Orf1zp1DJSLw?=
 =?us-ascii?Q?ASQlfwsd2KWzPLrUDzhEstHltNIidzhVAmkDboUx5yYs2PCW9xv9UP6Du1Tg?=
 =?us-ascii?Q?ZLFIjzXvzM9X63BUrLzrDj7PqmvclN62LHAMOfWWQArcUBug076UwIBwfTaR?=
 =?us-ascii?Q?sdNuXBfqoAt80hlWNemqWkQYVwDTB4AMdHCMJTwrVWR3azT4UFGsWhdLacP4?=
 =?us-ascii?Q?zHmzVBl4knXKLGs77KrOduXJOlVfFMEUjg3hmOolSbKBl+CTpfh3yIpRoR56?=
 =?us-ascii?Q?hrpdVaQZXTuE2Esh5f6yRjTtu4C8hZfwTbBj+WMEgi1qoSMT8EXcWM5jaft/?=
 =?us-ascii?Q?OuQqy6Qrp1OqqC+0lDoJdSqwFvEv89bhUaejFo+VnzQRk0JTq2QmD+r5EI0X?=
 =?us-ascii?Q?AOizTDSIlRyx0PWUA2hrrjRUZpLi1LXPSxIgXrLjIyFPWrA+GFE2bKiK4exI?=
 =?us-ascii?Q?Br/i8Zj2zpc0ll7bkBmSt7hnUCmy/8NXPkMs7qRbPzVtDWhqAa63PsNxNQIa?=
 =?us-ascii?Q?EpGoSLPEWUXjILPBMWjRHjK7zGW2gkK5puknI5Xe5wzlmrrVEpefPl6jzmOj?=
 =?us-ascii?Q?3zkeNMo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR06MB7717.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FLm45vHnBIDXhhkyrlkbk65iWitvfs+UEfVYp+0nYiitFU00xvXAbl3E+cn4?=
 =?us-ascii?Q?HMjOvG5fMwNEM76ctV+aAT97k4ydh2BySC6uhiCxGYnBoi40OgzuFuvP05dt?=
 =?us-ascii?Q?EvRm88znGHiH4OGufFLjxUJzG8NxWjv/gt0pwuGriJmol7GYLKuNJlHgtkAT?=
 =?us-ascii?Q?DKQx9wEUZS0LzkaQnyxKETq8/NgJYcakE1cFtNuNmDrFN9k+c4ktrKXknM9X?=
 =?us-ascii?Q?LvcbZOksPSLd9mGf/HVtsGrCFpe4EcrDK0MKCr84YmHyaVkVpIWLk5CxLjZ5?=
 =?us-ascii?Q?POnyzNY4CyJhGFBst0q7P9N5ew+UCLSJIrUQFfScc8WEPbntQXWdb6aEusiD?=
 =?us-ascii?Q?kkC5C4lz2qJKUCjZF5SIjUmdTI5192DurRcHAgMgSD1iE1RE/fZHsHun60ZG?=
 =?us-ascii?Q?jIcNRn0OUX6z7VE6BD522zYXUBpTNNINtgC8gS4wtYAhLZ9VrdwVmCdza47s?=
 =?us-ascii?Q?gnmqIn+NMD7HXy8j2Ls3hEI72ct6Dr89/6hR7C8AUd3p9Kjnlywj1xKC5QNq?=
 =?us-ascii?Q?ArCy2oyG+DxFsH0RJGugAaKFaJBZcKKqdsO7UXivAx6kcD2HYZWFNp5NuZPz?=
 =?us-ascii?Q?68trHTurQehsErxkl6XlE1ugydeslmg2iigTnNvoRn8c9UP31ZpgtBdVjy1E?=
 =?us-ascii?Q?IT29iGATgknjqamWulFc7KBTBoPjTfxKlcb5rks9tq+9mTX08AQM7EDzj7w2?=
 =?us-ascii?Q?fxH8DaVl5dH6FnJppMXegVNCb6wQekpDFU85phxvajr9jKIRs7jtKUHxRWe7?=
 =?us-ascii?Q?z8bFdML71mMTnTeDuzT4NFD/gRPgBM2Tcl+CYRhQhYzJq9M8ZoNpPaIFfHoQ?=
 =?us-ascii?Q?PbzEMnQvfahxneUu3TFs9Yj3HVmpuSctcxlNighCKtiU9Mv+7gbEN5CLoYy1?=
 =?us-ascii?Q?qXKE2O2M5rqZHSU6/eKFma3EF9XyKlcc4Si6F95fycVv/pBIfJW3wK8MV3FS?=
 =?us-ascii?Q?EZg/Xp6cyfzb97mwWZ6rgf1CeUycJ+xyvpWkJ6RMJ4eMr8kfyiLByboGBEE+?=
 =?us-ascii?Q?sqXDnjuBqGgCQ2h3wDcq/yGgCBqUitY0CbT454Daz0b3ip6ZMkYKt7MeM5J8?=
 =?us-ascii?Q?SzbZs5WrfR6eAelc9h5Y3z2YtpaO/1aWEq8dV98wMxk5SqIWnjn/7XiVVl2X?=
 =?us-ascii?Q?5/qhERvD6BRbnDNNXs893+yW+lJ+ikKCWaRJotdwrEnIdtdAiOm41xzL9DBG?=
 =?us-ascii?Q?qkvnMDd3D91GP/WnbB1D/tt7Sm+jo84dq15wBMBPp3oeu3O2UhQrf8gpm+9E?=
 =?us-ascii?Q?u0vMg4meuAcb7Rvh/Rr44Na2fL9BE2YYm9TIUhTaXNMJwgf1lJG7mc9qqCKB?=
 =?us-ascii?Q?/dvFInF6pQ5P6huXHMGcA7W4vbay6MuWy1JVFjPgOEnvAjQKrdTI5aGs30wL?=
 =?us-ascii?Q?9dbeiG3mEFdxewqtyaQDq7hicR5odE/41Y3ztRbQtPxvK0pHHGo+VYVokHkY?=
 =?us-ascii?Q?kqMDfJGnDNVFvh5hWXO4pbNXhFT/g8t/C2lfLV0djHf8WNFA/vKeW88xI26d?=
 =?us-ascii?Q?HscnClSNIIylIP6091EGza7lHLK0RiuERROtrRLxJdAU+N+lX6VuXKu4Q4UO?=
 =?us-ascii?Q?ORlP5uw4zpxuJBbsHqs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR06MB7717.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29311a28-8ea8-4d3c-3b8d-08dcc5ecaa44
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 16:32:23.9052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nt087poQYv95DJEdUEVamnm8nBH/N+9eA021RxDd87bKXODurB0qlQchoTSnX0G1eVvNRxniFe8UVVasO25mBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR06MB7946

Rule commands within chains are somewhat standalone, like a python or SQL s=
tatement. They completely describe which packets are matched (the expressio=
n) and what should be done with them (the statements).  Rules are the only =
things that actually examine packets and perform actions. But rules don't c=
ontrol which packets are examined. The chain they are placed in controls th=
at, similar to how a Python statement executes in method. =20

The 'hook' chains define where in the flow packets are examined.  Where in =
the chain the rule is placed restricts which packets it examines (based on =
both the initial chain's hook and the previous rules already run).  Non-hoo=
k chains gather rules to facilitate control flow through the table, similar=
 to Python method.

A table is just a set of chains restricted to a specific protocol family (i=
net, ip, ip6, arp, bridge, netdev), which, in turn, defines which hooks are=
 available.

I find this diagram to be very helpful: https://wiki.nftables.org/wiki-nfta=
bles/index.php/Netfilter_hooks

The rest of the configuration (sets, maps, etc.) are just ways to provide d=
ata to rule expressions.  Rule actions can update structures like sets and =
maps.

I also find the --json option to be helpful.  The structure is what control=
s the flow.  Packets enter at a hook chain (like 'input', or 'prerouting'),=
 and traverse rules according to the structure of the chains.  The chain JS=
ON objects are analogous to Python functions.

Note that the same packet can come in on different hooks as it flows throug=
h the system (see the diagram mentioned above).  Another thing to keep in m=
ind is that 'drop' is immediate, and the packet is not handled further and =
will not be available via subsequent hooks in the flow.  'Accept',  on the =
other hand, accepts the packet in the current hook.  No other rules reachab=
le from the hook chain are executed.  However, the same packet can come in =
via a subsequent hook, and the rules reachable from that chain may drop the=
 packet.

Not an answer to your specific question, but hopefully some of this context=
 helps.

-----Original Message-----
From: Brian Sammon <bds@fourthriver.com>=20
Sent: Friday, August 23, 2024 10:39 PM
To: netfilter@vger.kernel.org
Subject: Re: Understanding output from "nft list"

[You don't often get email from bds@fourthriver.com. Learn why this is impo=
rtant at https://aka.ms/LearnAboutSenderIdentification ]

EXTERNAL EMAIL - USE CAUTION when clicking links or attachments




On Sat, 24 Aug 2024 01:08:53 +0100
"Kerin Millar" <kfm@plushkava.net> wrote:

> > The first questions I have:
> > Can/should I assume that each line in the output of "nft list" is a=20
> > separate, uh... "thing"[1] that can be (human-)parsed independently=20
> > from every other line?
>
> No, though it is possible to compose rulesets in the iptables-esque=20
> fashion that you imply. That is, by writing consecutive commands of=20
> the form of "add table", "add chain", "add rule" and so forth.=20
> However, the
> nft(8) utility does not have an option to list the loaded ruleset in=20
> that way. Instead, it always lists the ruleset in the declarative style.

I'm wondering if there's a misunderstanding here.

I'm thinking that the output of "nft list" could be like (90% of) python co=
de, where a line like
    a =3D b + c
can be understood (somewhat) in isolation, even though you don't have the c=
ontext to know what a, b, and c are.

Or, the output of "nft list" could be more like SQL, where you can have lin=
es like
  SELECT x FROM
      or
  users INNER
which are each, an incomplete "thing", but can be part of a valid statement=
.

Is the "nft list" output more like python, or more like SQL?


