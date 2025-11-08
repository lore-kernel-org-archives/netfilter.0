Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664C427B50F
	for <netfilter@vger.kernel.org>; Sat,  8 Nov 2025 06:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762583547; cv=fail; b=J74EK7JbEVBC4EUys7WwOmEj12tUjFHTYnJY7WJOzdd0zwaQM9JL4w38lneI9yuVugQh8AWX/OWeCA8JTm/CuwULXVey8HXEzDsem2WdjRTqzgrUd90QVLeXbGTFNQ3f7encpVI4FI9UPCQ+5BsnzOjxyuQxPZEFGoBIzHYYb9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762583547; c=relaxed/simple;
	bh=sOQohBO1yQbKHMe4ZvddvyWKDFe1o5fTh/16wJVBb8g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gh61AACqZuTOVAi/6WwrNoV7aTQ8eSnZaovieDLVFsRLqFxshG1atT0RBeEhK7WnDc0/TOJ3sPahyIjMFNWvmdiZ2ZV5+J35oOWwIWIZauRJruG4SanFZsl0Gz7ikBTr/uMlwjcFQgW0Y7syMP3z4x/aMZCQ5QHfIDcB/sPA4PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelsplace.sg; spf=pass smtp.mailfrom=joelsplace.sg; dkim=pass (2048-bit key) header.d=joelsplace.sg header.i=@joelsplace.sg header.b=IHM+GT/K; arc=fail smtp.client-ip=52.101.126.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelsplace.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelsplace.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joelsplace.sg header.i=@joelsplace.sg header.b="IHM+GT/K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnTZDMrWtkUdZcJiU48hV48pUGjxlbMlSo6pQN+U/Ao7mDkRozL1OA6Tzu0aAB60GRAFZLX7tMiWc3YqZP9MvobmqIxpe1UgHigWJtQ4wA0yCHwV0V3L/6pNG1R/mjX/K3umyblzAYvELjgXz3q5qPIfkiZ4D/kMBg7qectHVb9YmDSIsqnnrCCb+UvbM0ka9HzlV73GrxGDwQpZnASsuesbSVoZgqTucSO0Obty6V8QhM9QjOjQ43MN0IeqQCIHBJWu186TWrp2DvSH3OK37IctT0jvhe+nqo5D7Xur0UtntndaCJ1jF81Auz9ExSXN6atsXIfVZxoofAtMCE/ZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc53opPVkHhweEc2ikDprX/MU+oXZ4IraVRiv3WCAu8=;
 b=kCdAQSFp+fJFWo8l9AzIxpgQ6c4GixjQmUHOyaWb03ueBWYZIeN4JO4SVvclqlUtzSxtxEO+pb3JreIAi2g22uSjtYaPh6vmEepxnir8MkGdLKmn+IHdoFPzenlbQhx81bxYqQo98hDd3RcMxVZyBt78cu1kgetzywYUkWVS4Rtuk+rdQUah4gDRbPq/XMYmFefWFrTtGCKBb5OYavPOuC8aEpBe6mXcp6/QtKzrwkYEjOkgyUDyte7EqVy1MmjWVG1yiANzGBZWBo7SRRhPx/ABdFD2J2mvRBX47XKg97/c4LC+TUK5zy6x6UgSDe13VU2MGS+SWTp6OfoQTo/cWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=joelsplace.sg; dmarc=pass action=none
 header.from=joelsplace.sg; dkim=pass header.d=joelsplace.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelsplace.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc53opPVkHhweEc2ikDprX/MU+oXZ4IraVRiv3WCAu8=;
 b=IHM+GT/KayEcTN3jTGz7xKRBhxgPFwXQjza2+ZFgRv7a7bDWZB/jbSD8IDkq/ojvxOx59l9ugmtnAmBwkLOwB2xNJGQU2o/4n33rrDHCvY3JlOv56588+pxtdHiKjb21basHHkUEjMH+2z7qIKTG2i7T37hFjox7UJY4LZTVlJf1mVsZCs2Kn/5z27uTED470pFKY+AqxUEmPZGn4ijmwZmO9Dufkk0oWJBOh2/U68IPQDA+fIubQR+1BxdKS1N+QtxZioekl3uL3hQlM9fUg/hK33rRYd4bk1DsZCAPh+ZL9QFO5n4G0R0rvb+1deD68P3QnspzZsmM5D65SGMEQA==
Received: from TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 (2603:1096:405:9b::13) by JH0PR01MB5636.apcprd01.prod.exchangelabs.com
 (2603:1096:990:13::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 06:32:20 +0000
Received: from TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 ([fe80::f8ab:e32a:aaac:9ee3]) by TYSPR01MB6756.apcprd01.prod.exchangelabs.com
 ([fe80::f8ab:e32a:aaac:9ee3%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 06:32:18 +0000
From: Joel Low <joel@joelsplace.sg>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: conntrackd user-space helpers for multicast/broadcast
Thread-Topic: conntrackd user-space helpers for multicast/broadcast
Thread-Index: AdxQXIQiScm/X6EhTUS44wy1sdYfGw==
Date: Sat, 8 Nov 2025 06:32:18 +0000
Message-ID:
 <TYSPR01MB67560AF00CC17680A5DF6175C8C0A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=joelsplace.sg;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR01MB6756:EE_|JH0PR01MB5636:EE_
x-ms-office365-filtering-correlation-id: b8dba378-36f6-4c80-ecb4-08de1e9090b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/R+sHWSOQaMNbn8hH9enHgKcAO7sehi07WjqBE+AZGyuTlblsw3zyMZMvrVO?=
 =?us-ascii?Q?tEN5TZ8gk7eDgL4DfmRUcBi6Zbr2svPHSq/xrSk8bJcRoeMdlJHBADRhE5kN?=
 =?us-ascii?Q?Y4e5gHR5KkBcnrtGbNjmu7+V6YiMLCvRjtzyN82gZFJevKCngg4BUSfWks71?=
 =?us-ascii?Q?OgqhCqJeyHqWh2xNe+bno5hiFxYTwno60lXsRBqtAf5Fjyg9sC5LPkUPFlwo?=
 =?us-ascii?Q?2yRc267yoByBsRcLdAIdE9PID6IxnIe2m+bXsO9tIjXeSHU0/TWnTI5j7iPx?=
 =?us-ascii?Q?grUfSWOUFk4lxlfde3lKWHUaBX5e5ERu3uJkJGc+jq4JMj4Hxi1KDk3jL0SD?=
 =?us-ascii?Q?SaFHEEmBMUQfFr+jxZcZZKBgSITZ2Q5mNPe43rN1zkWxOX4eWT21bmpz2oNf?=
 =?us-ascii?Q?Hh8IQLDqT4QfY8krmUnNzdnQ0B66+f5OCWyDfC3EpjfjTs/L4wA1VfWcarEg?=
 =?us-ascii?Q?5q5aDRij3WnO8ILDEc9RXkyfJ54Gs7wE4hgPrKdWFDZuQUypL7ANTRakugvk?=
 =?us-ascii?Q?vObOpJLmT5qzF54ZJ1QtaKOLMomCVUo+p7hbapWtug8ODVGCphKDesfCmkz+?=
 =?us-ascii?Q?I939D26hFh6UkzGDfXHVA/fMGD+T8aT6TYR2rBXLLwErN/5KMfpjmR0/Sq6R?=
 =?us-ascii?Q?bDIEVwFx69S8eT9HnsfMUtsQqGjLGxKm0mGPJoL38ZZ4coA4uwyYSYTu8prr?=
 =?us-ascii?Q?GV1+d0fZdQAwRpcc+XRKyQbjGMaej/Yb6vpT+Ir1bBURqCbdJDu9AQ3XttWB?=
 =?us-ascii?Q?k7iejg7065EKF1aEgmSx/5W2HI0mPHV1Artn5jhq/hIQXAv67RK5Nl7NI9ni?=
 =?us-ascii?Q?EVESzGidRc8eYHMn41Wm6iJb9LOA8gd+Fre8DL1kJ87ZL0VHawn23duBQIFT?=
 =?us-ascii?Q?3Y3/vEfE5z6Et/AHJfs086acW8jZQC3s8XxKorRfinAhyGgX/h8b0car1gB8?=
 =?us-ascii?Q?A60sAPKpn9WSjFzmC47ep0pfZn+UvqgPZh3aas/KrqmfMSOAaVPaFX2kr1nz?=
 =?us-ascii?Q?hHPxBjQ6nUwuffnLaTLITG1HCBD+DMKkdam38RqLdUFApkmK6+QhhqIOTqVi?=
 =?us-ascii?Q?Q5y7Vl/mMCfqWNc7GKW5HW5D3YwdNOXHkCbHD1UG3EEkWN/7RiuAD9YHfSS0?=
 =?us-ascii?Q?eLZcepwDG3ZpccNASvYD7JQnM6CkCIvQkE+rQdrO9hoc2MDDlrDYPuggXOGC?=
 =?us-ascii?Q?C8UNBcYk5gjfdmny/m/ejEuTXcD9tpvZX17Xrtzztd6GocifW7ybra3p4R9g?=
 =?us-ascii?Q?lNGeUvQNEO3Z6xER1DFCgiJ8+ubG5ZRJXCldoDXXhdoxqJEwZfui18erMUN0?=
 =?us-ascii?Q?QZnPzLYHVkUz6zJ4EvrYWkh8qB+QDMz+FLM0MMR85P8xRMDeBAR+EyYWPa3C?=
 =?us-ascii?Q?l8yhMvzi1iNd8BjqAergUkrnMJzwfz+zZRbD0r9xc6M7Ymr+A8xfAcnU+VXw?=
 =?us-ascii?Q?biisNMa8YG0XqVivA2tgyIEFNMOgyA4YelvoJQ4BPmar54t0KmlkUCPqlzlE?=
 =?us-ascii?Q?bf+lHKh/3ROncYN38cXCQc81PH61HgohK8gw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR01MB6756.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ENfYNNSjQgSOfBDhCurVP7xttBw5PbrIAvPvxB4WX7uCO+nwTtAVU855G4mz?=
 =?us-ascii?Q?SO7QHovBbiBRzaa3R6N8MPymdYnOeVNQrkIdhsej7fn3I8dukVpO3deVqTDF?=
 =?us-ascii?Q?8715wYKsKpuycaTjDekpZIAPDRbOduVqTngbO1BnCYNalS0TAJ+Eja97E2V5?=
 =?us-ascii?Q?SwDYof3A9IaS6QIYP7fcZQU4c2+v9bbNw+fnJ7z1wi9HyiO0GL1NaYIwq7Um?=
 =?us-ascii?Q?UBn9AKMamWbKcq9IhwOKlmEOTrXf/wI+rQyzPo+qSHPT43wntkXwCLfZ/eFC?=
 =?us-ascii?Q?8b0WQsg1gLQeWtPci6mNoojUI43fYSvwpclmbzg7QsHgUdBDXqjscVZOiys3?=
 =?us-ascii?Q?Fy03J2IIhKbq0PD7UBcvFsLOS2e4+GUBlwmaET3Wx4r9GRmlD2Bo1/LjxJUO?=
 =?us-ascii?Q?r1cWd2vIE8CejZZD5drP3R2S8eQCOg1qcT3kWfKI5MyVzQ3mCxDgR0tRhRig?=
 =?us-ascii?Q?wSoH0ucELwjImiT1THT5AmmCYcNsAj0Zj1eu+xZpyXueF1TVPp+muKXSUKeK?=
 =?us-ascii?Q?Ca3Ekcv4XArMzPiiU74t7aRrD9IlZlH9tRWF/rzIMfdMUpXJOlg5Lxsb4/S+?=
 =?us-ascii?Q?gXjXVgwd/4BncvnScOtSGg1IlHvCu9bJ77AnBRqlZjuS1vGLItNO+Mk0M64t?=
 =?us-ascii?Q?bKUoWh8tXGVNBn19Fuepg3f9jWpgCdGtNBQU/O6YsqeWvnbTJEiirnzk/z/l?=
 =?us-ascii?Q?sQZkqzh5E5Zj13e0L0h4VGeW+qMYCsx8zqsJcNII++zT23uWpwl+vAoQZpZk?=
 =?us-ascii?Q?SyNRgftdesEJo2fJAgYYAs9RwptZGOFOB6SVI+HZ/4+RIpkHrKONbToyl/1W?=
 =?us-ascii?Q?if/beMje4hGcizAvliZ5/BJhMz+cA2Bnu+Sr4JgxHXyMcAWn0mKTcQeU8mFg?=
 =?us-ascii?Q?30tCenJf85aIwmgnXrLrkPmhFBUr/dKDR3pXvbcwnbGWAOpQRkkbvL25YZ+/?=
 =?us-ascii?Q?FBkfcopxJhC9d9OyyrKjOWo3/cuNUMejzjRzBMYF8imtti+yfnKkja7D6zEN?=
 =?us-ascii?Q?kA3z0RTTbxtBKFOZlVmDKMzoS62FxHqBPiiQA0a7rzxGTPdStE5hxn1g6mDf?=
 =?us-ascii?Q?eszHlzNDd+J+Ovc+FBqTaaJye4IyhqimoL572UQ6oYs00TzVg5J5WwkPznvf?=
 =?us-ascii?Q?llVjReIGb5s9+0duYhEw0V0AJLh1KhiItijPwo+Zzr8DN7cexq/UWdUfqXhl?=
 =?us-ascii?Q?p6EAwobeEztnKRG6TgJGfHIcUBRWqLe5Xs/KLlpRzyBGoJ30ST2Bb5ly9UhL?=
 =?us-ascii?Q?GegV6n94Ga4H7YjIx79Ae+7MPK8F0PSNDDMBy9wdaxSjToShxf5Ev7ekGjUD?=
 =?us-ascii?Q?68CrnP3DmIVtVw9ieEuDNZhe5wTuwWckmFjMKr9ngljkaBDNFVzT0QrOxjtE?=
 =?us-ascii?Q?98f7UttxGRA6y5LfqXoGVkckC6cj3aNApO0o0KCnpl0USXgwBl17xN6GXKCw?=
 =?us-ascii?Q?RW/vA00YO1X0YaT4pTu1FNsuGJPnJ34PVMYrCQv3bR8ZqTVc4wuk+LEay1m7?=
 =?us-ascii?Q?ysdZEWDSYoy5tbDzg8tJpYqjqVOUfMWOvSLFIHpogGw80yqst+kKpiOCQZVu?=
 =?us-ascii?Q?aTkBftUcmdnSqQJIxvM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dba378-36f6-4c80-ecb4-08de1e9090b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 06:32:18.4882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d3cf250-83cb-488b-b882-323bc2027851
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zOwBV/XuYwJptCMqEiMytkOmBMJGUBinkcnEbfnOHZYcVNHMur3cklnIJSmDf8afIuluqO4TVycyBirUApsKmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR01MB5636

Hello there!

I've been trying to configure a conntrackd user-space helper for multicast/=
broadcast SNMP (using the slp helper, relying on the same principle) and SS=
DP (using the ssdp helper). I was briefly able to get it working last year,=
 but after the changes made by 7d8dc1c [1] it seems like the associated mul=
ticast packets are not being reliably queued to conntrackd. I do occasional=
ly see a packet or two making it through (both conntrackd and to its final =
destination) but I cannot reliably pin it down nor explain why. I am aware =
that I am forcing an unrouteable SNMP packet to be routed (they are sent to=
 255.255.255.255 -- but I have placed my compute devices in a separate subn=
et/vlan from my IOT devices, 1024/1026) -- but should this work?

What I have done to debug this so far while running a kernel containing [1]=
 is to trace the route of a packet through this set of chains (I'm trying t=
o keep it minimal; my apologies if this doesn't reproduce cleanly - I'm run=
ning this on OpenWrt).

```
table inet fw4 {
    ct helper ssdp {
        type "ssdp" protocol udp
        l3proto inet
    }

    ct helper broadcast {
        type "slp" protocol udp
        l3proto ip
    }

    chain helper_svc {
        type filter hook prerouting priority filter; policy accept;
        ip daddr 239.255.255.249 udp dport 161 counter ct helper set "broad=
cast"
        ip daddr 239.255.255.250 udp dport 1900 counter ct helper set "ssdp=
"
    }

    chain raw_prerouting {
        type filter hook prerouting priority raw; policy accept;
        ip daddr 255.255.255.255 udp dport !=3D { 67, 68, 547 } iifname "br=
-lan.1024" ip ttl set 2 ip daddr set 239.255.255.249 counter meta nftrace s=
et 1
        ip daddr 239.255.255.250 iifname "br-lan.1024" ip ttl set 2 counter=
 meta nftrace set 1
    }

    chain mangle_postrouting {
        type filter hook postrouting priority mangle; policy accept;
        ip daddr 239.255.255.249 oifname "br-lan.1027" ip daddr set 255.255=
.255.255 counter
        ip daddr 239.255.255.249 oifname "br-lan.1026" ip daddr set 192.168=
.20.255 counter
    }
}
```

(I've tried with both overriding the ether daddr and not, it does not seem =
to make a difference.)

With that set of chains, I've run `nft monitor` while observing the output =
of conntrackd that I've hacked to print messages when it receives a packet =
on an nfqueue.

This is a packet that doesn't get sent to conntrackd:

```
trace id f347290f inet fw4 raw_prerouting packet: iif "br-lan.1024" ether s=
addr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zz=
z ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 =
ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 =
udp checksum 13152=20
trace id f347290f inet fw4 raw_prerouting rule ip daddr 239.255.255.250 iif=
name "br-lan.1024" ip ttl set 2 counter packets 703 bytes 250905 meta nftra=
ce set 1 (verdict continue)
trace id f347290f inet fw4 raw_prerouting verdict continue=20
trace id f347290f inet fw4 raw_prerouting policy accept=20
trace id f347290f inet fw4 mangle_prerouting packet: iif "br-lan.1024" ethe=
r saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx=
.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 346=
62 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 3=
67 udp checksum 13152=20
trace id f347290f inet fw4 mangle_prerouting verdict continue=20
trace id f347290f inet fw4 mangle_prerouting policy accept=20
trace id f347290f inet fw4 dstnat packet: iif "br-lan.1024" ether saddr aa:=
bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip dad=
dr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip proto=
col udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp chec=
ksum 13152=20
trace id f347290f inet fw4 dstnat verdict continue=20
trace id f347290f inet fw4 dstnat policy accept=20
trace id f347290f inet fw4 prerouting packet: iif "br-lan.1024" ether saddr=
 aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip=
 daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip p=
rotocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp =
checksum 13152=20
trace id f347290f inet fw4 prerouting rule iifname "br-lan.1024" jump helpe=
r_lan comment "!fw4: Handle lan IPv4/IPv6 helper assignment" (verdict jump =
helper_lan)
trace id f347290f inet fw4 helper_lan verdict continue=20
trace id f347290f inet fw4 prerouting verdict continue=20
trace id f347290f inet fw4 prerouting policy accept=20
trace id f347290f inet fw4 helper_svc packet: iif "br-lan.1024" ether saddr=
 aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip=
 daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip p=
rotocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp =
checksum 13152=20
trace id f347290f inet fw4 helper_svc rule ip daddr 239.255.255.250 udp dpo=
rt 1900 counter packets 837 bytes 337357 ct helper set "ssdp" comment "!svc=
: DLNA" (verdict continue)
trace id f347290f inet fw4 helper_svc verdict continue=20
trace id f347290f inet fw4 helper_svc policy accept=20
trace id 557a86d6 inet fw4 mangle_forward packet: iif "br-lan.1024" oif "br=
-lan.1026" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip s=
addr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip =
ttl 1 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 19=
00 udp length 367 udp checksum 13152=20
trace id 557a86d6 inet fw4 mangle_forward verdict continue=20
trace id 557a86d6 inet fw4 mangle_forward policy accept=20
trace id 557a86d6 inet fw4 forward packet: iif "br-lan.1024" oif "br-lan.10=
26" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 19=
2.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 i=
p id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp =
length 367 udp checksum 13152=20
trace id 557a86d6 inet fw4 forward rule iifname "br-lan.1024" jump forward_=
lan comment "!fw4: Handle lan IPv4/IPv6 forward traffic" (verdict jump forw=
ard_lan)
trace id 557a86d6 inet fw4 forward_lan rule counter packets 891 bytes 27948=
1 jump accept_to_lan comment "!fw4: Intra-LAN interface traffic" (verdict j=
ump accept_to_lan)
trace id 557a86d6 inet fw4 accept_to_lan verdict continue=20
trace id 557a86d6 inet fw4 forward_lan rule ip daddr 239.255.255.250 udp dp=
ort 1900 counter packets 703 bytes 250905 jump accept_to_iot (verdict jump =
accept_to_iot)
trace id 557a86d6 inet fw4 accept_to_iot rule oifname "br-lan.1026" counter=
 packets 1630 bytes 376326 accept comment "!fw4: accept iot IPv4/IPv6 traff=
ic" (verdict accept)
trace id a2926568 inet fw4 mangle_postrouting packet: oif "br-lan.1026" ip =
saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip=
 ttl 1 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1=
900 udp length 367 udp checksum 13152=20
trace id a2926568 inet fw4 mangle_postrouting verdict continue=20
trace id a2926568 inet fw4 mangle_postrouting policy accept=20
trace id a2926568 inet fw4 srcnat packet: oif "br-lan.1026" ip saddr 192.16=
8.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id=
 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp leng=
th 367 udp checksum 13152=20
trace id a2926568 inet fw4 srcnat rule oifname "br-lan.1026" jump srcnat_io=
t comment "!fw4: Handle iot IPv4/IPv6 srcnat traffic" (verdict jump srcnat_=
iot)
trace id a2926568 inet fw4 srcnat_iot verdict continue=20
trace id a2926568 inet fw4 srcnat verdict continue=20
trace id a2926568 inet fw4 srcnat policy accept=20
trace id 557a86d6 inet fw4 mangle_postrouting packet: oif "br-lan.1026" ip =
saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip=
 ttl 1 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1=
900 udp length 367 udp checksum 13152=20
trace id 557a86d6 inet fw4 mangle_postrouting verdict continue=20
trace id 557a86d6 inet fw4 mangle_postrouting policy accept=20
trace id f347290f inet fw4 mangle_input packet: iif "br-lan.1024" ether sad=
dr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz =
ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip=
 protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 ud=
p checksum 13152=20
trace id f347290f inet fw4 mangle_input verdict continue=20
trace id f347290f inet fw4 mangle_input policy accept=20
trace id f347290f inet fw4 input packet: iif "br-lan.1024" ether saddr aa:b=
b:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip dadd=
r 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip protoc=
ol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp check=
sum 13152=20
trace id f347290f inet fw4 input rule iifname "br-lan.1024" jump input_lan =
comment "!fw4: Handle lan IPv4/IPv6 input traffic" (verdict jump input_lan)
trace id f347290f inet fw4 input_lan rule jump reject_from_lan (verdict jum=
p reject_from_lan)
trace id f347290f inet fw4 reject_from_lan rule iifname "br-lan.1024" count=
er packets 898 bytes 280311 jump handle_reject comment "!fw4: reject lan IP=
v4/IPv6 traffic" (verdict jump handle_reject)
trace id f347290f inet fw4 handle_reject rule reject comment "!fw4: Reject =
any other traffic" (verdict drop)
```

This is a packet that does get picked up by conntrackd and gets routed:

```
trace id 030d8487 inet fw4 raw_prerouting packet: iif "br-lan.1024" ether s=
addr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zz=
z ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 =
ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166=
 udp checksum 16095=20
trace id 030d8487 inet fw4 raw_prerouting rule ip daddr 239.255.255.250 iif=
name "br-lan.1024" ip ttl set 2 counter packets 403 bytes 144885 meta nftra=
ce set 1 (verdict continue)
trace id 030d8487 inet fw4 raw_prerouting verdict continue=20
trace id 030d8487 inet fw4 raw_prerouting policy accept=20
trace id 030d8487 inet fw4 mangle_prerouting packet: iif "br-lan.1024" ethe=
r saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx=
.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 343=
71 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length =
166 udp checksum 16095=20
trace id 030d8487 inet fw4 mangle_prerouting verdict continue=20
trace id 030d8487 inet fw4 mangle_prerouting policy accept=20
trace id 030d8487 inet fw4 prerouting packet: iif "br-lan.1024" ether saddr=
 aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip=
 daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip p=
rotocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp=
 checksum 16095=20
trace id 030d8487 inet fw4 prerouting rule iifname "br-lan.1024" jump helpe=
r_lan comment "!fw4: Handle lan IPv4/IPv6 helper assignment" (verdict jump =
helper_lan)
trace id 030d8487 inet fw4 helper_lan verdict continue=20
trace id 030d8487 inet fw4 prerouting verdict continue=20
trace id 030d8487 inet fw4 prerouting policy accept=20
trace id 030d8487 inet fw4 helper_svc packet: iif "br-lan.1024" ether saddr=
 aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip=
 daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip p=
rotocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp=
 checksum 16095=20
trace id 030d8487 inet fw4 helper_svc rule ip daddr 239.255.255.250 udp dpo=
rt 1900 counter packets 471 bytes 190003 ct helper set "ssdp" comment "!svc=
: DLNA" (verdict continue)
trace id 030d8487 inet fw4 helper_svc verdict continue=20
trace id 030d8487 inet fw4 helper_svc policy accept=20
trace id af150fc3 inet fw4 mangle_forward packet: iif "br-lan.1024" oif "br=
-lan.1026" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip s=
addr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip =
ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1=
900 udp length 166 udp checksum 16095=20
trace id af150fc3 inet fw4 mangle_forward verdict continue=20
trace id af150fc3 inet fw4 mangle_forward policy accept=20
trace id af150fc3 inet fw4 forward packet: iif "br-lan.1024" oif "br-lan.10=
26" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 19=
2.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 i=
p id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp=
 length 166 udp checksum 16095=20
trace id af150fc3 inet fw4 forward rule iifname "br-lan.1024" jump forward_=
lan comment "!fw4: Handle lan IPv4/IPv6 forward traffic" (verdict jump forw=
ard_lan)
trace id af150fc3 inet fw4 forward_lan rule counter packets 513 bytes 16160=
5 jump accept_to_lan comment "!fw4: Intra-LAN interface traffic" (verdict j=
ump accept_to_lan)
trace id af150fc3 inet fw4 accept_to_lan verdict continue=20
trace id af150fc3 inet fw4 forward_lan rule ip daddr 239.255.255.250 udp dp=
ort 1900 counter packets 403 bytes 144885 jump accept_to_iot (verdict jump =
accept_to_iot)
trace id af150fc3 inet fw4 accept_to_iot rule oifname "br-lan.1026" counter=
 packets 909 bytes 208517 accept comment "!fw4: accept iot IPv4/IPv6 traffi=
c" (verdict accept)
trace id dfde2134 inet fw4 mangle_postrouting packet: oif "br-lan.1026" ip =
saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip=
 ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport =
1900 udp length 166 udp checksum 16095=20
trace id dfde2134 inet fw4 mangle_postrouting verdict continue=20
trace id dfde2134 inet fw4 mangle_postrouting policy accept=20
trace id af150fc3 inet fw4 mangle_postrouting packet: oif "br-lan.1026" ip =
saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip=
 ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport =
1900 udp length 166 udp checksum 16095=20
trace id af150fc3 inet fw4 mangle_postrouting verdict continue=20
trace id af150fc3 inet fw4 mangle_postrouting policy accept=20
trace id 030d8487 inet fw4 mangle_input packet: iif "br-lan.1024" ether sad=
dr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz =
ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip=
 protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 u=
dp checksum 16095=20
trace id 030d8487 inet fw4 mangle_input verdict continue=20
trace id 030d8487 inet fw4 mangle_input policy accept=20
trace id 030d8487 inet fw4 input packet: iif "br-lan.1024" ether saddr aa:b=
b:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip dadd=
r 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip protoc=
ol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp chec=
ksum 16095=20
trace id 030d8487 inet fw4 input rule iifname "br-lan.1024" jump input_lan =
comment "!fw4: Handle lan IPv4/IPv6 input traffic" (verdict jump input_lan)
trace id 030d8487 inet fw4 input_lan rule jump reject_from_lan (verdict jum=
p reject_from_lan)
trace id 030d8487 inet fw4 reject_from_lan rule iifname "br-lan.1024" count=
er packets 515 bytes 162031 jump handle_reject comment "!fw4: reject lan IP=
v4/IPv6 traffic" (verdict jump handle_reject)
trace id 030d8487 inet fw4 handle_reject rule reject comment "!fw4: Reject =
any other traffic" (verdict drop)
trace id c46a944a inet fw4 raw_prerouting packet: iif "br-lan.1026" ip sadd=
r 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl=
 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900=
 udp length 166 udp checksum 16095=20
trace id c46a944a inet fw4 raw_prerouting verdict continue=20
trace id c46a944a inet fw4 raw_prerouting policy accept=20
trace id c46a944a inet fw4 mangle_prerouting packet: iif "br-lan.1026" ip s=
addr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip =
ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1=
900 udp length 166 udp checksum 16095=20
trace id c46a944a inet fw4 mangle_prerouting verdict continue=20
trace id c46a944a inet fw4 mangle_prerouting policy accept=20
trace id c46a944a inet fw4 prerouting packet: iif "br-lan.1026" ip saddr 19=
2.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 i=
p id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp=
 length 166 udp checksum 16095=20
trace id c46a944a inet fw4 prerouting rule iifname "br-lan.1026" jump helpe=
r_iot comment "!fw4: Handle iot IPv4/IPv6 helper assignment" (verdict jump =
helper_iot)
trace id c46a944a inet fw4 helper_iot verdict continue=20
trace id c46a944a inet fw4 prerouting verdict continue=20
trace id c46a944a inet fw4 prerouting policy accept=20
trace id c46a944a inet fw4 helper_svc packet: iif "br-lan.1026" ip saddr 19=
2.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 i=
p id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp=
 length 166 udp checksum 16095=20
trace id c46a944a inet fw4 helper_svc rule ip daddr 239.255.255.250 udp dpo=
rt 1900 counter packets 471 bytes 190003 ct helper set "ssdp" comment "!svc=
: DLNA" (verdict continue)
trace id c46a944a inet fw4 helper_svc verdict continue=20
trace id c46a944a inet fw4 helper_svc policy accept=20
trace id c46a944a inet fw4 mangle_input packet: iif "br-lan.1026" ip saddr =
192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1=
 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 u=
dp length 166 udp checksum 16095=20
trace id c46a944a inet fw4 mangle_input verdict continue=20
trace id c46a944a inet fw4 mangle_input policy accept=20
trace id c46a944a inet fw4 input packet: iif "br-lan.1026" ip saddr 192.168=
.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id =
34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp leng=
th 166 udp checksum 16095=20
trace id c46a944a inet fw4 input rule iifname "br-lan.1026" jump input_iot =
comment "!fw4: Handle iot IPv4/IPv6 input traffic" (verdict jump input_iot)
trace id c46a944a inet fw4 input_iot rule jump reject_from_iot (verdict jum=
p reject_from_iot)
trace id c46a944a inet fw4 reject_from_iot rule iifname "br-lan.1026" count=
er packets 68 bytes 45253 jump handle_reject comment "!fw4: reject iot IPv4=
/IPv6 traffic" (verdict jump handle_reject)
trace id c46a944a inet fw4 handle_reject rule reject comment "!fw4: Reject =
any other traffic" (verdict drop)
```

Running a kernel without [1] restores the proper queueing to conntrackd and=
 routing.

Am I doing something wrong here? My understanding of [1] is that it only wi=
ll process the last reference to a multicast packet. Does that mean that th=
e only way to implement such a helper is by implementing a kernel helper? I=
s there an alternative approach I should be considering? I saw that the ini=
tial author who implemented the slp helper in kernel mode was asked to reim=
plement it as a user-space helper [2] so I'm not sure what the current reco=
mmendation is.

Regards,
Joel

[1]: netfilter: nf_queue: drop packets with cloned unconfirmed conntracks=20
[2]: connection tracking helper for SLP https://lkml.org/lkml/2013/5/7/830=
=20
