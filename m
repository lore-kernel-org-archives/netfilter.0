Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498E313D291
	for <netfilter@vger.kernel.org>; Mon, 26 Aug 2024 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724716525; cv=fail; b=T/XGuI+gGBL7THZqJZLN+v2QcLwIW4wNze3d5hzZnEVz73B7LDayySnTioqvABGz+Opx0LfseUBLVQ7xFz9KmcVoApNPIOK2tT3rJNORlxG/9rmMb4idbSMaA3ier8OSjTD+xxWABWHzYKFzGZu455yvcVcdm3K/OUII+J8VoOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724716525; c=relaxed/simple;
	bh=gIPqZr/cu52lfJO8juB9NPWUrN/TPaPv/33vHTNCQbg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HwBITrGfz4lMaKz0s5s4KDMzkKmfLlaqDVaYMy0Tej6SYJ9ORspCqa4Km3Km2N6Rinn1BF1MruzilVlAl4hKYcY6GFjoDCCS4PA7574yx+OFIgloRW1fJavb+3Lrwrn64SMkeFlKHyuDxxkc/XOndpWWFgL6E3SiGBAe8xKMtdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com; spf=pass smtp.mailfrom=netapp.com; dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b=I6q7Rp/H; arc=fail smtp.client-ip=40.107.102.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netapp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b="I6q7Rp/H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPoP9HmtKYXnqea6cZxtpVLph5DsYK1sCeA20QveoY/OHQcLe31cY2ndyxnOWS6vk2o8FcQpOtVqvxQA3P7QS/191sXZsxS/Fi1h9ApWWZbu7F/Me/Bypyo1RzDollqylZQXXYdJ4XwlGl/8TyqK7fidc/vabAOHyav7aJVA35SNbMyNwuVpKsqDDl3n9uAC2ekBs/g6XA1vrpvSxp3UbkOF9yEAI3qwmwcQtmeHeZ96CQpBdMe5IqlzaVS658nWFAE/BZvKH2Tz8t2DEbKZlaTGEcHkPI6XSMl15Rskx8/bMz20fNaQwdV6zv/p6SJhgaYN+893Dsf11Fy+tW5nNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY3KapDbCGZQLU0nrT42lvwPnUmgrkQcD3KEeY3T7qs=;
 b=ih2eZpbYLrykZ0crZkirce1/bOvQjhT/+Nbf8bPN1Zoip+SkDJWis5QLHm+EMfdOBYMr9AkNHzXpxlFnDZYdZqlV0wUz5Ud73JLnjHHTc1H+Xc6cg5EldRpmMSkunkdBjAeQp0TIP2cDxjliyoLF0RG8J2vHvfSL4fNE43yDpl6a3vO8qse1WORK37Q9TPvhD5He/aAFfSD5n61HEVcD83wNvpH5hA4qkoA/IiysCrST4Z1AApF+rgVto6yPKyAS+E4OoxDKIbr0jg8B+lhdgekMkaHPIoEg6qmocDhnghpDqVz/g8nRfuuDzjrf1PkUfV7CtmUbC7FInehzX1vUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY3KapDbCGZQLU0nrT42lvwPnUmgrkQcD3KEeY3T7qs=;
 b=I6q7Rp/HFI2mHjs5L7tWbwM/xZl4WHSZ8s390N1qlIMUcWLtTEvSzchn1euxEfpbOjRjKuyiMlF/jl7RVwWjzGcr7/9JKyNF4K4qJlwQH8Q/dUKCi8xpTWR2L4SDqzmb+Uv+2vkTezixvKQmye2furrxU/z0v9Ha5n6zSi4pAI8FDcuGhBS7M1fDuMGMEbdvLUTJ9Qu6GpveCrUOAUM70zSQr12XetWdsG09A+ppSJEOcwd92C4IUlh37YKSEh1dJqImPe2SWSCa8bM9hkPxiIJW/qIvoJg0X+CwpbsS/caPQUK+thWZlBulAmFMDvrOxFRXbKwxn7iWwjECCBK9aw==
Received: from DM8PR06MB7717.namprd06.prod.outlook.com (2603:10b6:8:37::11) by
 MW4PR06MB8947.namprd06.prod.outlook.com (2603:10b6:303:1be::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Mon, 26 Aug 2024 23:55:21 +0000
Received: from DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3]) by DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 23:55:21 +0000
From: "Atkins, Brian" <Brian.Atkins@netapp.com>
To: Slavko <linux@slavino.sk>, "netfilter@vger.kernel.org"
	<netfilter@vger.kernel.org>
Subject: RE: Understanding output from "nft list"
Thread-Topic: Understanding output from "nft list"
Thread-Index:
 AQHa9a8A7wNOnrpOpk29yQ7RtfXFErI1iD2AgABLewCAA9Xr8IAAG7gAgAAUBKCAAAteAIAAVNwg
Date: Mon, 26 Aug 2024 23:55:20 +0000
Message-ID:
 <DM8PR06MB7717BFEA7F827B53CD0FA03CF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
 <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com>
 <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com>
 <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
 <5F6FBD88-BFCF-41EF-8B7A-5047ABC992CA@slavino.sk>
 <DM8PR06MB771745C3C21BA67F1D90C848F98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
 <F385FADA-1F1C-4F41-AEEE-C6BF2312D29A@slavino.sk>
In-Reply-To: <F385FADA-1F1C-4F41-AEEE-C6BF2312D29A@slavino.sk>
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
x-ms-traffictypediagnostic: DM8PR06MB7717:EE_|MW4PR06MB8947:EE_
x-ms-office365-filtering-correlation-id: 7467b328-1a1b-492b-3cae-08dcc62a8b68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?dh3kUy+J7eOEn67qkaOblt1FsNXUubmVSvUuRur+pZ/xbZmS35uAkWkA/p?=
 =?iso-8859-2?Q?hcRAX6NEkwj7+JULlP58Xh1mc+d6172ctukQieBC3pYnF0PAzqLoVoKGcK?=
 =?iso-8859-2?Q?piw8eha+y/YrCHVcGbVm1Q0RR1CqFxXqbghBdCf/MF3qBnBwsR3VQ9aGPZ?=
 =?iso-8859-2?Q?6KngUhmrLMAZDjQOlBs1gk3rzZmHAWs6uuBlq2uH/P8uJpI81GINhoQFS5?=
 =?iso-8859-2?Q?EuUVGCPihY+hOIzYfTxYc+Bwl+uchxUccSFhtkt5ASQFRhxyXxlakZsmIK?=
 =?iso-8859-2?Q?xnSeni0kzuCYKa296U25y8TLiL5HNcNfsd/FMFsRXTXnkLSlkGGSQDkPXW?=
 =?iso-8859-2?Q?SLBL2ZXSo2bS27HGMpnvsGkVyLngNOCHy/WputhCr05PG4El+n2ssCfIKU?=
 =?iso-8859-2?Q?CDsDQzwi0fwT4s7ZhdmQaa16RQjtKsQLlry1izRDAFucg5fOEqPtdN+bnz?=
 =?iso-8859-2?Q?JQevNS2rEwBPH8tK/3Ieyy/kc2uNi3AoZ0p7qL33jnC52XUipb3a+ywYRZ?=
 =?iso-8859-2?Q?J2TKmxI9LuTNBS2JoNroyYIoXKJgJTBnMN62P43tJ3pzwKkNH8EFtfg4dp?=
 =?iso-8859-2?Q?kKlMnGf50ayjk+Q+kKmn2H0gECqIzZDAzbEOWH4EHfGRgG84ofkzCTlFnB?=
 =?iso-8859-2?Q?XS/vIiEGQ9li5fZQ8lXAllDBiDSl8Gz/kHTBBQ2RyV+2QQKRjK8sMgCtx8?=
 =?iso-8859-2?Q?svms8Eua9Rrtdz9yYlsGXDd7jXprcKdPVAFEySdh0yDaAXN1+GVXT8VlfY?=
 =?iso-8859-2?Q?jn8cT+PsShzJhqhfOcKIVLCr7ux+PL7PhKOGYE+99JPh2TdvV4Ut+k2xyo?=
 =?iso-8859-2?Q?caZ4q4TkEhjTfOSIFq5m3nYhO2BV8QgJ4Lk1WNy7rU+LrK4wIAWa213ngk?=
 =?iso-8859-2?Q?MhbbWn1ylFbjLH76Ag58p5WMpsvrcpy8At3c2ys7lTKtGxQpxI48COGgMX?=
 =?iso-8859-2?Q?pKdMXiAIK/XNJuzuHOZiiPMdF8AcPz978SwlIsfyTcZ3EPtTXeJLIx0cf8?=
 =?iso-8859-2?Q?n2jh2yvYBohydb68vWUgMksUDePVgY6V61RrrP+djPIwY1iZz3Rm8gvV+X?=
 =?iso-8859-2?Q?H6fLHs3rELHdxYcqxxpZeHuwcejCj6cqInPolJ3CsDCzHNNlj7kq7vbxOn?=
 =?iso-8859-2?Q?zqpb73uENp3e+papFgdozDCt09CDIMwrhI85nq2IMXVXvT6mrqIIPRlzP7?=
 =?iso-8859-2?Q?+FJM48hq2GP3/XSHgOWJF0mhD0sUX5Oviyu0+vSGS4qa1OvbU5cVZ8m1OJ?=
 =?iso-8859-2?Q?l8z7OLQEnBw8yd8ELeuP5TIHn+1GtErv4spE8VqdiGCPRgU91lC8k/Dmco?=
 =?iso-8859-2?Q?/L+HXhuS6YjGiORqpT3uiYfPUufD6VrUcQ8Wc42LvYmmW4A1XEKhAbaO+t?=
 =?iso-8859-2?Q?1dF8z9rwI8GLiiwlw4vLe/IyIWWXksZw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR06MB7717.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?qhq9bsShdatq+t9+aWi7M28KEf6VfnpQw4/tRSEN82TnNnfDVQOQsGDU2T?=
 =?iso-8859-2?Q?UuDNUmmXQ5zO1rFlg+kvXeoaRC8yiHwTcFqg8Y+vo3/xNFUBtsDjy+xKU8?=
 =?iso-8859-2?Q?ZZScrTDW6Xim0CRsCncvWQMQlqTzKbXx8gftW7r1NC03AHojl1qzbCwZIB?=
 =?iso-8859-2?Q?BgYqbhEo3IIvnhBo1a4u70rj+SJ8xbDa3vrulxZEs1xTUsljAAcuWHAdFW?=
 =?iso-8859-2?Q?RDOyhdC9+H1Qyg0bIVYE2qxBY2YyZWF7bfTILB1lj5Ly3e45u19WFPsZF9?=
 =?iso-8859-2?Q?xVH9pE5W9c2M0mR9sU9TENPvZlHcMp3DH72h99bbwdSCJhF4HZQ7ZNSh1V?=
 =?iso-8859-2?Q?xfzS+34dgQQib9rGncPLpReYz761d2b30nPpdjAqEFPmeSzdN8lbz2MURt?=
 =?iso-8859-2?Q?JjjnoEcxbhbkK+C9XdHAFnVbPAJWQ9khpc97YE8/1IiWtc3ums34m0pH5k?=
 =?iso-8859-2?Q?fjgAsaMC8lpk/568sVGu4jdyxYyFr6nBKDBawDMHIe3uKJJuXn3ktnQ+Ey?=
 =?iso-8859-2?Q?uavqzoHibDIFF7U37ne8Go5U34Xvh2dyM65tl3H+QCfZ+Ve1XD4AHJ3jYA?=
 =?iso-8859-2?Q?xMncVWdyOExGpp0PW+6gUyZ7iyXJs53JIlIQmmjM6+reU/UDNKXiYVw7m8?=
 =?iso-8859-2?Q?BcwHQXzvVe7F47DQMPP5H79qDPURwgpg3F9hePyjdE0H6fDieqQfdw5Wr0?=
 =?iso-8859-2?Q?BSqw0hMVVtUjHEjlUp2hxNPYQjsG3DH3V6q2QyJMnEoFOF7H1N4EWaEV3m?=
 =?iso-8859-2?Q?NA5d9smq2qyLOAxHHSx2UJJQZBatjnSgR3JFTMoQ84qKxf7lUAYZF2eTBZ?=
 =?iso-8859-2?Q?jYlNG3VKkRelbXSbXX1k86wQSDIXU6giLX8v7H+aasW1CqeGTxz8hyFDvc?=
 =?iso-8859-2?Q?DQL0zqFGujnlLOGagg+cqhvdE9IAuaR6lKOLySKTWLahNNyhqFqXBapPBd?=
 =?iso-8859-2?Q?qkOMlkn4TQvbr2N8JiE55Y/SQEXcxrxTXHC0TwJgg/3XRINJKXTZt0IoGn?=
 =?iso-8859-2?Q?jdo8U3q2Rjifw+8Z6HjSCWDxkskjVwajdYjGu18toxg67KPMO9AoA2fxbW?=
 =?iso-8859-2?Q?6uJvqsXpg5FDerkZ66LhKuKXx0mBl3MNUpWsByUKgIqkzOBr7xDa3+lZBf?=
 =?iso-8859-2?Q?/HQUNxZNwlkqmMrUIEGoErHZid2LI+teevQXtWqzOQ2U8FRDeJe/gjuO+W?=
 =?iso-8859-2?Q?zOL9S6gzy9N8FkKHxgwpXzf/vRBFr0DN4PHd1dFtcTe5g+UE1iIA88IcXN?=
 =?iso-8859-2?Q?ejxK2g0WPy2mpJHjP6DeXzOj+tGU9kesYQLjO8isQp2o6r2qz1lwSdjs6S?=
 =?iso-8859-2?Q?oEymIEvJdABwIMe77VHFjVueynRXui3wMmg4ubQyWRCKhZbZiJz+Efb0Ao?=
 =?iso-8859-2?Q?QM9dR7JHPJes0xye2bk0Rji99mF6jdch/y964QqAs9ZPtJ26mK8pCkPtP3?=
 =?iso-8859-2?Q?gFvEqX9nolxs1/UUF8OJ1k2q1BmZ+SW7vjvyF5sIKvcQDvhaqVxLEiQ5ed?=
 =?iso-8859-2?Q?FrvtC1UaBNPh5iZ/MHjZ9Nn8cx/KA/azdP5YAxrQmlGvloUQa4Rm2ffRPU?=
 =?iso-8859-2?Q?IX+9iU1RqEly7RmAcVq34T0SndiHOjGkPJ2TDM1N0Y5jchDailh5fLfu2/?=
 =?iso-8859-2?Q?oPetmHPE+dHHU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DM8PR06MB7717.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7467b328-1a1b-492b-3cae-08dcc62a8b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 23:55:20.9179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0G6y/nBKxW+dsDQenso7fvoaJaOYKV6j2JsR4ikr8kXntOsO21iHKaIvvyDH9jByyjka+1agXiufSs+KQnEDSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR06MB8947

I was thinking of non-base chains (chains without a type statement).  The b=
ase chain can have rules that jump to non-base chains, which can also have =
rules that jump to other chains, etc.  The accept ends that entire chain 's=
tack' (for want of a better term), including the original base chain.

If, say, you had a table of type ip, and another table of type inet, and th=
ey both had input hook chains, I don't think accept in one chain would have=
 an impact on the other table's chain, although I don't know that for sure.


-----Original Message-----
From: Slavko <linux@slavino.sk>
Sent: Monday, August 26, 2024 12:45 PM
To: netfilter@vger.kernel.org
Subject: RE: Understanding output from "nft list"

EXTERNAL EMAIL - USE CAUTION when clicking links or attachments




D=F2a 26. augusta 2024 18:12:58 UTC pou=BE=EDvate=B5 "Atkins, Brian" <Brian=
.Atkins@netapp.com> nap=EDsal:
>In the nft(8) man page, I see the following.  I have not tested this behav=
ior myself.
>accept
>        Terminate ruleset evaluation and accept the packet. The packet can=
 still be dropped later by another hook, for instance accept in the forward=
 hook still allows to drop the packet later in the postrouting hook, or ano=
ther forward base chain that has a higher priority number and is evaluated =
afterwards in the processing pipeline.
>
>I was keying off "another hook".  I think another base chain with the same=
 hook type but a different priority is considered a different hook.  It's h=
ard to describe 'the set of chains reachable from the current base chain' w=
ith a single word.  They are all executing within the context of the curren=
t hook+priority, which is what is terminated on accept.

Perhaps it is only terminology problem, or my English is not enough to see =
difference, but it seems that we both talk about the same...

When i start to use nftables (switch from iptables) i read that and "anothe=
r hook, for instance accept in the forward hook" i understand exactly as ex=
ample points, eg. accept in output hook mens go to postrouting hook. And it=
 works exactly as this, if (and only if) one have only one chain per hook.

Then i start to experiment with multiple chains in the same hook (really it=
 was mix of ip/ip6 and inet tables) and i was surprised, that accept eg. in=
 "ip input" chain can be not enough as packet can be dropped in "inet input=
" chain (both in input hook). The same applies to multiple chains of one ta=
ble in the same hook.

Then i read somewhere (perhaps in this ML, i forgot), that accept ends only=
 current chain (with hook definition), which was more undestandable for me.

Perhaps one have to distinguish "hook" and "hook type" (or so), and perhaps=
 my "chain" suggestion is wrong, as here are "user chains" (without hook de=
finition)...

regards


--
Slavko
https://www.slavino.sk/

