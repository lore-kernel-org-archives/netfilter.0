Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2139.outbound.protection.outlook.com [40.107.237.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B256A144304
	for <netfilter@vger.kernel.org>; Sun, 31 Mar 2024 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711886432; cv=fail; b=ozUBsILv0p57UGGtqeN8fJnmhRyxIr8FjiWNFomWde5d/4Rx69IpKcErNJOewzs8gXdGA/pgFBYcBx+vwb5tc3qVCitgY/r3sui/Mx0QhMDq5St6KWcwho68qgxjvQ448pKSXC5htRpTB5uRlTEbXWbGEql+PTtFsaI8UToYPXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711886432; c=relaxed/simple;
	bh=adpiBBbolKfKeyLVHHhuaPKIT/e38yUXGvTNczuK6rk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sv0BR/Xb57OBeXtjtVD6OOIY08jyQrUzf1Aac7DpP24cxeWlSBRsn9K2hdBKYS9CYpAnsnV3TK9UUyq0eac++C2XF5N9Tu6t3As/Gu0x5CQiqteEKliZNkfWleuRq7PW5SIHT8EcbxkMQdZrgWobsxlvzsiTAdEV/1EbkUDFLqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cygnalabs.com; spf=pass smtp.mailfrom=cygnalabs.com; dkim=pass (1024-bit key) header.d=cygnalabs.onmicrosoft.com header.i=@cygnalabs.onmicrosoft.com header.b=GhDje2Cl; arc=fail smtp.client-ip=40.107.237.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cygnalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cygnalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cygnalabs.onmicrosoft.com header.i=@cygnalabs.onmicrosoft.com header.b="GhDje2Cl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZHCRZS4SWITbasow3+9xKjyhZDfpEdv8iYJbCkYsLMSh0fbHxL5SASnHVYVK+f6xREUTqxEvqFPsKffflzWyZcaaeHRoJzSrMTbQDbN9Rfv5tYKTI04k7WLg4+zfrApojy9WHVlPo6k16KwSI0ZzB/d3VPYl92Zo9pO9MaPjPBQSKgsrRrhk9YlOCEFw6lqDU2WBnBayD7Gwju3/o/LXjAM07LVNN+wO1lsxxG1+T6nzVJpd4J5fyqbIKvIf5BzRotnfi2I8NeRYFgPNC7kjALVdNpmbJLYYt4cZL6OfhUffQB4RNr4S7ZwwwfNK3egWE6J6DqQbpd4vOlU5wQZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VzVrSvF51JuBrzt07+ENkBvbrh/xsJjt41zvMbg0D0=;
 b=O3yclwnWkI+AcaKUwUdpJk1aipGPUdTAck3F32Tq3EFheqyyDzTuW1QnsPSKMncKh1wEWogZFvdHfCjKas0tQKOyU9bxyKb2VGPxy5OhQfxyRdONHcj3GhHQRdCht+JFxwQSWZd+ct8ijz8qiJ5HKK+sh7Aj6SSdPv0WvZdHx+eUvLio1WudAFSV8Hs5ZyXR1BwygX6lZyrDAF1dx7bB5gsupyDywrW4IQpybHj3GYF4BMTU3y2sDS89Q9/8oAhXriOZWW3YjNOorRaA1tpZtFjwn8bQvNT71ZInaWfuCISSNK+/iexZrouSfE0zZFrmyoU8iX8ylEdY5jUaM04S7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cygnalabs.com; dmarc=pass action=none
 header.from=cygnalabs.com; dkim=pass header.d=cygnalabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cygnalabs.onmicrosoft.com; s=selector2-cygnalabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VzVrSvF51JuBrzt07+ENkBvbrh/xsJjt41zvMbg0D0=;
 b=GhDje2Clmd165rFUedvahIwlHvOEz7kBmz1we3z2P2oPwRv311HaJFpjzLYpfe6T6LM+fYPF/YWGcw4oh4edfXmupxFNHMCKsEvpJMxxnXpzm1m7ZFU+NAtCnga/yPwJRZGAOxgCSoZo2Asp3W4UXqe+HOz183P6k5VQFiumZZc=
Received: from SJ0PR18MB3884.namprd18.prod.outlook.com (2603:10b6:a03:2ee::21)
 by MN2PR18MB3480.namprd18.prod.outlook.com (2603:10b6:208:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.42; Sun, 31 Mar
 2024 12:00:26 +0000
Received: from SJ0PR18MB3884.namprd18.prod.outlook.com
 ([fe80::fc05:62bb:a21:caa3]) by SJ0PR18MB3884.namprd18.prod.outlook.com
 ([fe80::fc05:62bb:a21:caa3%2]) with mapi id 15.20.7409.042; Sun, 31 Mar 2024
 12:00:24 +0000
From: Blaine Elzey <Blaine.Elzey@cygnalabs.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
CC: Kerin Millar <kfm@plushkava.net>
Subject: RE: Rocky Linux 9 with firewalld and nftables always tracks
 connections
Thread-Topic: Rocky Linux 9 with firewalld and nftables always tracks
 connections
Thread-Index: AdqCWwLiZxLG+wb/QdeaTIIFKBfwWwAEFukAABAd/AAAIIJyAAANQXBw
Date: Sun, 31 Mar 2024 12:00:24 +0000
Message-ID:
 <SJ0PR18MB3884BDF8D35BA2C98732E54E97382@SJ0PR18MB3884.namprd18.prod.outlook.com>
References:
 <SJ0PR18MB388483F4136B4AEF9FF7F8F097392@SJ0PR18MB3884.namprd18.prod.outlook.com>
 <20240330062742.abeecf69e3c13c6faa45e276@plushkava.net>
 <SN7PR18MB3887FC43932FD714B8C8864B97382@SN7PR18MB3887.namprd18.prod.outlook.com>
 <80c37117-e985-4657-a73e-675e52777bef@app.fastmail.com>
In-Reply-To: <80c37117-e985-4657-a73e-675e52777bef@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB3884:EE_|MN2PR18MB3480:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mFmRdER1LXxkX6VvW/Z9bW6O2b94fDkcINr2Bqmkmam3LsgfcXMg1T3EmMp4176Hxt+bdbJVwNc+LZzlDaMvI5Sa5o6Rw2/gsuMT5v+clwFVgLEef0FzFS1RTBf02z84ojkQyp/Go+Oq5r0Y/uNZ/qk4LISenaP+54S9rpredSOFsibwk7EfIiw4maisJAl0hQn6U9W/pbrKyECsxr73UQxdJEc6CvrJ4k3/vRH/BYUGt9wTg4xh3+Gp2WMXOVYtXj/PV9jMSSiu/bjMj579Q4MiFudVbaM24/OeucHGNCv+NCSZvmdwjD/FXYBxpFpen5v9w1Hkyh30qdMgDMnoZy9Scn1xUNk5r+2g82I9jWze2JXRML3Tz8kWzRfhcIAlsov4FvU9wHbz2tFF9XKPC+kxx0zKE3kGuUhOFSAshLGcvk0Ml4axxU0rK191P+M9s5KkuvPj3q+oi2u8dIcOG0Efg4mrjgF4YMsa8IeoUY2Geo13TJsCJddn//+bwPzhBMfxQ0K+ViZj5AaxslvH+A5u8sSkBw/QbHR+ZiuYN4fUJnqrvdyhldXg1DsDEm++NXOOhJPqBYDwtwGwH2nlao3v0PZEjqGkGW2anbhoTv751W5tYJmPMVYkOyU8rj90R4NUsI+l9kMv6miJuz/PWKdMOfLoZPN861ZCEpPMz/w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB3884.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?F1TBR/Ar0dFY4rFmtL0XBeZxlxL6/8x7GZ3gMVTUYom+ZmlV8XtO3pSFbw?=
 =?iso-8859-1?Q?ldSWskxqyyCgOgaFAhSR21tUyX8XZFdQXFMk/38DCx0lzq4mudigR36zH2?=
 =?iso-8859-1?Q?vF3zHmc/4GisMD9qyuUG2YE07v4hRsAwPglNeXNbbDdr96Vi1GlsKeBHcH?=
 =?iso-8859-1?Q?toc2A9w+Pe9BqGmmKCBl3KtaJas/NdyjsAAbiaEWdY/uP7XBNwYExsUJyS?=
 =?iso-8859-1?Q?Y3V1vyjxOHGuikOPXKdlppmY5Lu/NPcc+R2s3tLSDyYIDeQOuisqGly1D5?=
 =?iso-8859-1?Q?awu0QwqvTlettiv1bvRO0ekRoBKqao/PtwxkEkrguOD20j6Z8LaE9otvAk?=
 =?iso-8859-1?Q?xTsdpHBk4bx4GCGroSx7aGpPYY0b6rlUThOx/dKqHM7dc+gY1Fd35nbhXT?=
 =?iso-8859-1?Q?DG7DiaRnxpM70Vn9cGzcOL/VH+IgzyuOSqB4M7YMauv3KclF6Ma4fx9ipL?=
 =?iso-8859-1?Q?r7oj2wWCCEfDKcS7TASIk8t7n1XPxOBgqy5YnkH6yp92uwijGFQ2Qh+Yrq?=
 =?iso-8859-1?Q?NyxWMZVtBRRO/pcL1jaMPuYXrzklvMldGR8pTM6znodhgd0IAbUf4dqbJ3?=
 =?iso-8859-1?Q?w1SXFPqnVFg+OJIsn2zMf74l77O/tUXa0EIgBR7KJ/++LcXZQHojv1CU73?=
 =?iso-8859-1?Q?EH4RUuAyutujp8S/RF8bdSiJp6vJ1liXRwM/PqeGqOXBDwgGnlrhX3R4as?=
 =?iso-8859-1?Q?+IjwuQEcuyne9dI7GJCAsp9Ttb260gcZaYSkHNkX3Fy0pCpIhcn0gYcEOr?=
 =?iso-8859-1?Q?B9KAHcbNi1XdZIVTQdQE8NNt3o/vljLX2FnPvC2qNilase7ffAfXf37n5N?=
 =?iso-8859-1?Q?uRsbIlczA9+eNjkU+dJl039jVw1WTTbKuBrY71Mohf6WeOsrQVHUQdfXEm?=
 =?iso-8859-1?Q?Da7WRYLYTgY918L8Ocvevj+955mOLZ3s2AmkKVbrmHl1+3dy9THhh+RRJR?=
 =?iso-8859-1?Q?rQEREbPPyKzeXw9VN+U3MQfsYcbjvLX9ugXw/Hgofd8Kc051S/iQMb0nQM?=
 =?iso-8859-1?Q?JyMsQ87BryKOu/HRHzrJLo4S9cuauvkFBBmwElTCmtF566bqJ0lsN27mES?=
 =?iso-8859-1?Q?9x+wLT3oZ28EWxiaGvVRNEsd1/NuhDD13aQxbiJ5gch9Q2cKl/sydSUahR?=
 =?iso-8859-1?Q?G7qsbWUKkTkOcKkzJw6PSJa0v5eJXI1ChndvliR8MGUCwSJY1c0Rb8CDPs?=
 =?iso-8859-1?Q?SkTXTIfwjsSttzX6ghW/ZaivpZsmsjagiMGOTROG2DEo2ogmN6Yp6g1irt?=
 =?iso-8859-1?Q?mY7zyXB8ewToAqLMpYd3/m2URYeDJTw00bARCax45QKhhaaa+hCYrmsCIN?=
 =?iso-8859-1?Q?FkY/VLz1HTidYIlW7YoxE1CN61jSo7wJ5XBKT4wItnN5ecBBZvS2WVf2XY?=
 =?iso-8859-1?Q?2ZxB1vc/C0UifOdlvl94Nad4aZew4kMPzH8MPho0ooyfwNf9bc7xCvh/P3?=
 =?iso-8859-1?Q?Es43GLT3Awl4ZeCUl3/TynzEQ2PsFmLSmNyp3deH47iHRlUw4h0qsfs1lV?=
 =?iso-8859-1?Q?Y16ZPPMnJ8026kUb3Mrla0aVRGLgGhuDaMJ1HcaNHPNfvayLvK2pioN6ke?=
 =?iso-8859-1?Q?rsskOFUhYiS0WOfimCy60BuZhvDD/fx8oJXt99+Who6PZPeO1v+7QuNrph?=
 =?iso-8859-1?Q?RoF/wK+70GqXzosTERxEG8c4KLE/GhUrLHM8XTXfaXqpaMnXjJFCDQPA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cygnalabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB3884.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93ea4c1-f707-4b0b-2e68-08dc517a25ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2024 12:00:24.4766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52aaff49-9322-41f9-ad11-aa09e87f6af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CX54sJRSRDmLSfzm+gDBuEeynZ+PLJ/MudjPObj1cBBDhwdVlu//EohEyqn4MTFt2ioggkATgExGOLbuEEbN9jUR9jRiq67+qnpuJlZ+JSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3480

Thanks for your time and suggestions.

--
Blaine
This message is confidential.  The information is intended for use only by =
the individual(s) or entity named above. If you are not the intended recipi=
ent,=A0please notify the sender immediately by e-mail and be aware that any=
 disclosure, copying, distribution or use of the=A0contents of this e-mail =
is strictly prohibited. Cygna Labs monitors its e-mail system and may recor=
d your e-mails. Cygna Labs Corp, 1111 Lincoln Rd., Suite 760, Miami Beach, =
FL 33139


-----Original Message-----
From: Kerin Millar <kfm@plushkava.net>=20
Sent: Sunday, March 31, 2024 1:40 AM
To: Blaine Elzey <Blaine.Elzey@cygnalabs.com>; netfilter@vger.kernel.org
Subject: Re: Rocky Linux 9 with firewalld and nftables always tracks connec=
tions

On Sun, 31 Mar 2024, at 12:22 AM, Blaine Elzey wrote:

[...]

> Now that I know the underlying nftables configuration, I need to=20
> incorporate this configuration into the firewalld configuration.  I=20
> understand if this is off-topic and I may need to post in a different=20
> forum.
>
> I see that firewalld says that direct rules is deprecated, and to use pol=
icies.

How very helpful of it.

>
> Unfortunately policies do not support notrack, and the necessary=20
> arguments that I have tried in direct rules are invalid.  I have also=20
> come to find that the firewall direct rules only support iptables,=20
> while my firewalld.conf is set to use nftables; thus, unable to see=20
> nftables tables and chains setup by firewalld.  Maybe the nftable=20
> rules from firewalld override the iptables rules from firewalld direct?

Rocky 9 offers iptables-nft, which uses nftables as a backend while continu=
ing to support xtables extensions. Unfortunately, it cannot be relied upon =
to translate the syntax of a given iptables(8) rule to a native nft(8) rule=
, even for those rules where it is technically possible. Consider the follo=
wing.

# nft flush ruleset
# iptables -V
iptables v1.8.10 (nf_tables)
# iptables -t raw -A PREROUTING -j CT --notrack # nft list ruleset # Warnin=
g: table ip raw is managed by iptables-nft, do not touch!
table ip raw {
	chain PREROUTING {
		type filter hook prerouting priority raw; policy accept;
		counter packets 0 bytes 0 xt target "CT"
	}
}

This shows iptables electing to use the CT extension from xtables, rather t=
han produce the native, equivalent nftables rule. Consequently, one ends up=
 with a hybrid ruleset that can no longer be safely managed with nft alone.

So, should you wish to try the firewall.direct(5) syntax, be sure to define=
 "FirewallBackend=3Diptables". Further, in each case that the backend is sw=
itched, be sure to stop the service and run "nft flush ruleset" before star=
ting it again.

>
> At the moment, I created some workaround scripts from the information=20
> in this post, and call the in the systemd  ExecStartPre=3D for DNS=20
> service start.  I remove them in ExecStopPost=3D.

I fear that this might prove brittle. Presumably, firewalld can be instruct=
ed to interact with the ruleset in such a way that the necessary rules are =
lost, well after the systemd service has been started. Still, I can think o=
f nothing else, other than to forgo the use of firewalld altogether.

--
Kerin Millar
