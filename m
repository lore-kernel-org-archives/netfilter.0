Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A8C18E057
	for <netfilter@vger.kernel.org>; Mon, 26 Aug 2024 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724695983; cv=fail; b=k6mpOVzzS4oql70/XxmKjqpnv06omxQcJbRYVKP3yABhGizSQ9jH8E/6xVLMAfnB7yzna2tmIG80+6jIviNff/Woq6GJXqwxisQts8n/2byc7SVNV9/jdA+R7jbI4sAP4mcxu9c9GlucD/V8F7svTdqe6R8J6525ffHR7KEpuOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724695983; c=relaxed/simple;
	bh=OUFje496x0SyJCSNSz0EoecipipqroGLWd/6PeIx2tk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J2yMWa3dw40M1i/jK5t1Kgx08rx7es3Jm6VXfpC4On0gLtXuovh/41rIRbUf7jPg7sfSoueVzs/E7SECqkisU9ZBReTV1HW/SkaQ/VZX9zWmECB9WGEJi9nQhb6RS9/RTNneh19yrXiREGePVMepZeFC0saY8xGhp2tuwb+6NkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com; spf=pass smtp.mailfrom=netapp.com; dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b=jO1tCzdW; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netapp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b="jO1tCzdW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioaBBVGwdDgu0yt2VYkR5nlWiwV/AwlrtdbFm47tQOYoVFkqIFCokDZz2J2wnuvQq891YUWyWDgyy/rH21nVQXe2NpQHksOFPOl1b/Bc2gMDi5XVDs61C7pJu154VJNidkrP+bZOOc/rsv8Mxd5MOpPR4RadUEXhJhpsKf6b1IxddhGyFZIE5Xg1/K8h2L4dG+m8mTaVAmBPMBKieqjT6lOgweV2zUOZy0sImJzBpx0o3xWpjmW0Q5OTVqId4cOUUJDWY2c5EDk3tfc6+DyHSLG3GJiNLqvkuXDUFKvtwMRrOpYIYjfXY7KegyI35s79aAxp31vko9ToXzd7edoZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoUFVZ8BrpHnxZleCeFeyJmkXbDMUtgGaxibaK0TcXU=;
 b=MRm2M4wUYLjLzfPLODvG5PDoaCuyN81IJQtsr7VdMnyX655PCaDIytnp+HMsBs9u0jCgjk+O8MpNPc9iPdeMsMEL5Ra8nAUBLwJREbvXqijfz9qrSu61+VOAyjbIpBBpUmqT40PkP6W9mYB/uUu9/rUsWTcaGh/kbSKb5K9FFQOnGBv0iu2ieHqpgTbiA4Zna627oWCCCC98s13HfN82NgO/qx6lkqQQoiEZYE+OB2g08V3GWjxysnBlVRW1/cwawyFubWzqWBrCH2yZuMoHDu1Wbup4yn77yWjvV2HLxo3glRGz7BKD8ymVwDTqPhVjeEeOBuOCGNEWC4QPH1RdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoUFVZ8BrpHnxZleCeFeyJmkXbDMUtgGaxibaK0TcXU=;
 b=jO1tCzdW7Ule0Mmdfx0K/ryjLOhaXnmEJM5XjXrh4sp/KUiuSVI3cMqis0NhcSpZNJ5aHPQ6RXChZlXpPyro5rdTPh0rYwbdIWOkQ5Nw2T+hdogaZVRwzpYJFYzb7dMsh87UFPB0hEIjCM2HJ0X0+wI/CFJcHEnPK7mEQA+D24Y9CGEOPAe7Dfyac4mkTLzuejLEqaYwFuEX9JKw4fjKtKwboh4ng1Mj5FaVVHSw3sxIfN+Z7QRorf7URTw4AEhtWLxOBLKD87uraDuO5JDbIKH1Ck8RIhnxNoPbM7tekPHK9kl9OLPeG1tmlPu8+OXR43vBm+CLEigc6FCJwbRsAA==
Received: from DM8PR06MB7717.namprd06.prod.outlook.com (2603:10b6:8:37::11) by
 CH3PPF952E2DBE1.namprd06.prod.outlook.com (2603:10b6:61f:fc00::417) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 18:12:58 +0000
Received: from DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3]) by DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 18:12:58 +0000
From: "Atkins, Brian" <Brian.Atkins@netapp.com>
To: Slavko <linux@slavino.sk>, "netfilter@vger.kernel.org"
	<netfilter@vger.kernel.org>
Subject: RE: Understanding output from "nft list"
Thread-Topic: Understanding output from "nft list"
Thread-Index: AQHa9a8A7wNOnrpOpk29yQ7RtfXFErI1iD2AgABLewCAA9Xr8IAAG7gAgAAUBKA=
Date: Mon, 26 Aug 2024 18:12:58 +0000
Message-ID:
 <DM8PR06MB771745C3C21BA67F1D90C848F98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
 <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com>
 <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com>
 <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
 <5F6FBD88-BFCF-41EF-8B7A-5047ABC992CA@slavino.sk>
In-Reply-To: <5F6FBD88-BFCF-41EF-8B7A-5047ABC992CA@slavino.sk>
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
x-ms-traffictypediagnostic: DM8PR06MB7717:EE_|CH3PPF952E2DBE1:EE_
x-ms-office365-filtering-correlation-id: 995ab571-2cf0-4513-3c9d-08dcc5fab746
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?l1Fxr5mb7hAgmYqKFlL28psDjLvs+UmS8PAfJgwAZAeKNzXCcYfrmPwekQ?=
 =?iso-8859-2?Q?nE+QNelKbgfk2rO7bvsHWSUMA0AS4OAh8QblOtVBv9E2BtOKLyzezg8JoV?=
 =?iso-8859-2?Q?ofIAljgcbHIt8MfYudOqB/9RiMZs136Ze3Nn97ySkyRddON/OB47SGoRVi?=
 =?iso-8859-2?Q?iWXaEXO4ma1JlQ8fxQNq1vGNPemUpZBHHFWnFotIkEw0/TZr22sMHEMg4R?=
 =?iso-8859-2?Q?VczVi2j8WQr2wUQwkFwtnn4yP79pI5bHDkkhofdTDpxkKqb+vDz5HjRySL?=
 =?iso-8859-2?Q?3ySPjA49BbB2HAgZE4oF/jlGE35b2dBKfg4xbOSKvHDEjCZHr4aphG7aK+?=
 =?iso-8859-2?Q?X+ufM3j078+UwqDGUOhskF1pKV6qHdF18aDaRzMRzzt8yGXXB0j+SufMTE?=
 =?iso-8859-2?Q?mA5idvTy5gdPAn4MC2ctqGTzprgNWSrPwTs5vmQDd5lkNK9uRLIn2QZgpG?=
 =?iso-8859-2?Q?5trrn2aeAXbDIQGOF2mBllV/5q7cbTqQCORTHQxcu/Wls4WynArZw6Fx84?=
 =?iso-8859-2?Q?WoEbBWCblyEkVsHCDsyMFM2W+dJQVQQgImzLScp2/5QoBuU121JudiH24R?=
 =?iso-8859-2?Q?izFIZazPLV4GgHLmghXJjHzQXQpW0P3xXq1MjUjAdWLLO2WpWiKzkkLVnk?=
 =?iso-8859-2?Q?aU4TPQ5Aziz047r4DTAyemr4iKVYKY3pCJptcM37XyhK+lQebDxPMO1R08?=
 =?iso-8859-2?Q?60li3yHRAwGa8h+TD7r1ko2cFVG+voelf0vKc3L1KIFH7eMk0Nn8SC9cB6?=
 =?iso-8859-2?Q?74iYwZ10Sjcvu70lnPVZyutoxT+5Ji4z9WGStdcASnCfLWh6TpBNpuCytK?=
 =?iso-8859-2?Q?Kc0or/U3/dvvsegiVGnkpWcbSC3d+FgH914NaGX+HTH7OG6qJJKBT5WNei?=
 =?iso-8859-2?Q?3NcYR87h3mF2ds1txXRR9fjT3FWzDuwGxiOxCo43t+E5oAIeS0C3oglEN/?=
 =?iso-8859-2?Q?dDrQOD0IKcdbSFN4uuSxR7OF+nzkzU5FiYUyv2f8Zq2Nupx1NR8oMAUJWG?=
 =?iso-8859-2?Q?Xtdrnf83tMcLXVLmEFbLvEeYd9J+Yp3tuTtvj9q673JcB3csWW4muW5gJT?=
 =?iso-8859-2?Q?REtlzAaM9rU5UflZGC/BZMGAKQjz70Dh0jpRnDBUSKOMh7w0NXR8oE3JSB?=
 =?iso-8859-2?Q?sBoBjhsTm79nujhAh2lRVZQp5epwjS/DHkdoEQjFgVbBxs21gx5FD9+lVI?=
 =?iso-8859-2?Q?bV1OASZAjpNOU7h8jpSWM0qvEtKcI/tGMe8E3Qmz/JAdmhfLxuDARu+7Hb?=
 =?iso-8859-2?Q?Q5VB4FBPr1O/YMjq6IC0cSKZvm2vGCe3dIZQwKNb4pnStDmJBSQRJqdkB6?=
 =?iso-8859-2?Q?ck9JhDwScB7yzYAZJRxkiTf+CPGmWt51CeKuYFaTiXgyvxaZwfGzU++rhn?=
 =?iso-8859-2?Q?HkCBcAFVsEjC5OW80fVsOKbXboUOUl6A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR06MB7717.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?PATKAvVJg1IGBhtFhCRsG09N51N77ML3qkes2HOaPiL6gDRlTppzlZ1bi5?=
 =?iso-8859-2?Q?KXb/8+7PiIUskU9iDo2ugx245mJ4EwjUZJmbvhxAX7k+Edq4mTNFfTy6pa?=
 =?iso-8859-2?Q?o4HQcH7op92XbyFZIn8jnVSEeO91WRInBFzkxWNlNhPHDsw8oYhkqK6FKa?=
 =?iso-8859-2?Q?YTldl86QJ9K2c1+uIIOsGbrFPtOTU28tIUpHJAGCvSKu429efQh/DLU0aN?=
 =?iso-8859-2?Q?eS3iLnO7A3ZMjuifOd4GZ2haMTYIsOiJIdo5UqVn9Gz0v3jt2dMS5QmIra?=
 =?iso-8859-2?Q?oqtAdbbPEt9ilrzD/e8VNruL9enrswMIWvaTUOAWovr+MOBkdeMXAy3TMD?=
 =?iso-8859-2?Q?8VVqKIqRqg0ZETLDabha7lw2yx1j9q7hMRrXZwpbJNbXRgMGGQKeUPBUy6?=
 =?iso-8859-2?Q?32Ijhf11gKyA5C3SV3n6lK+L8AGVHsBoDXha2T4wnZhijScaQ4aisLKhVs?=
 =?iso-8859-2?Q?A9DGJ7XQ1d/CF+P+evA2x1HWuE8rRhj1cdI1j9ulWAcmINy9QtHQ6WdY24?=
 =?iso-8859-2?Q?nUEQ9ZkZzG+Fxt/DglUBQ+HDQHC5ErP1y/7uMaNsPwQx1/RfX+sjR2N9U8?=
 =?iso-8859-2?Q?JmA3x1xL1w1gO8oXzVVFCDsp1iN9t4ceJvDyEMtbLXnN766iya2GLahfZy?=
 =?iso-8859-2?Q?RlcxaIVMAYhCQoUvZjaCpKrHeyTpp19Bm3P7ILuAjmlef4rozHMkfbz60V?=
 =?iso-8859-2?Q?jvLekTATCTxGoXzZwmPExmrCWc4z63oyflCW79N/VHlgtJcm/WxB++uUq6?=
 =?iso-8859-2?Q?6YNYIB5dTv6bPJZeMBeZ7EQqFvQebo7rfOCnQN9ls6HlfrhPRc2ggvMcFe?=
 =?iso-8859-2?Q?VZwNV+T6dgrFP9xeKjl8zzScL3gDR8/8q77TT+2DntcEWAPTbJ5zH4QPgD?=
 =?iso-8859-2?Q?stfrb+qRIwb/OaGOJc+H4sp61Y3qASpv9MS59E1vdQ0U6Q80XaSnMLA6lD?=
 =?iso-8859-2?Q?4Z03qwViWKVwYhrPSn4z37OcUny0lEM+dfLukehEc/19A59K3A/mtDEXux?=
 =?iso-8859-2?Q?vspJ0Jad5U9Mpd9ho8duL5a3+yzMyoT980L6GPLR5CtD67ghtXYsCdi6QT?=
 =?iso-8859-2?Q?NadK8ehozUHr6yczgVjn9Dz/kbOkBbnvXBBbfhDRnz53/67POmBCTUhxJg?=
 =?iso-8859-2?Q?XqDZFpHk0uTv5DPgHXMJwvOR7I3n8ATXlMcDByID8WgkgKA4eyQsY/5nxZ?=
 =?iso-8859-2?Q?uE7s+UqOqfwu1yAT2K1kS9FzJf1/ii4Tn1+TKHN6F7690Ws7/huNIWnQkt?=
 =?iso-8859-2?Q?hkVSD4E2b9+2tdVnq9dohLzoUg8f/Mpo4Ib65ISQ3vy4HU9L52sKweRMTX?=
 =?iso-8859-2?Q?eP3yFUJ+EcH0oXhool5mhnkHC29xfXXP1ZqDFWGXTusXjdbRqWd3CbapA3?=
 =?iso-8859-2?Q?Kvj8E1OpwqXOpPY0kp0ZC5Iaa+5eNs0MZCku+qB8InNCQisJRF3WMOe9jn?=
 =?iso-8859-2?Q?9PJrmeaIp90jw7jSLWpNXodndB3u/PTZf0qTWOlArFulIdloCSzQyVg+bz?=
 =?iso-8859-2?Q?Tc9JopMVF0erugdcDGcpccEq2rS6/N5kpfmOxot14Xmqf9Zh/tVorWaWZl?=
 =?iso-8859-2?Q?51eaK7gs9FTVtr2zr9kfbTSf1e+fyaamCRSqyN/paOIu1hRmjoBgqd4NQE?=
 =?iso-8859-2?Q?BllzQ2VueGINo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 995ab571-2cf0-4513-3c9d-08dcc5fab746
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 18:12:58.7027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q95IhmMHqSOXjf4xuefg8prBWfq6KsHcvpmjwsBE8mLImrF2q3nAoHqS1+0zq41MEFCklK5q4ncPPM4QUFBQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PPF952E2DBE1

In the nft(8) man page, I see the following.  I have not tested this behavi=
or myself.
accept
        Terminate ruleset evaluation and accept the packet. The packet can =
still be dropped later by another hook, for instance accept in the forward =
hook still allows to drop the packet later in the postrouting hook, or anot=
her forward base chain that has a higher priority number and is evaluated a=
fterwards in the processing pipeline.

I was keying off "another hook".  I think another base chain with the same =
hook type but a different priority is considered a different hook.  It's ha=
rd to describe 'the set of chains reachable from the current base chain' wi=
th a single word.  They are all executing within the context of the current=
 hook+priority, which is what is terminated on accept.


-----Original Message-----
From: Slavko <linux@slavino.sk>
Sent: Monday, August 26, 2024 10:53 AM
To: netfilter@vger.kernel.org
Subject: RE: Understanding output from "nft list"

EXTERNAL EMAIL - USE CAUTION when clicking links or attachments




D=F2a 26. augusta 2024 16:32:23 UTC pou=BE=EDvate=B5 "Atkins, Brian" <Brian=
.Atkins@netapp.com> nap=EDsal:


>  'Accept',  on the other hand, accepts the packet in the current hook.  N=
o other rules reachable from the hook chain are executed.

Are you sure with that? My understanding of "accept" verdict is, that it en=
ds processing rules in current chain, not in current hook. Thus rules in ot=
her chains (with lower priority -- higher number) in current hook are appli=
ed.

regards


--
Slavko
https://www.slavino.sk/

