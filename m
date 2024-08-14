Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697061BD514
	for <netfilter@vger.kernel.org>; Wed, 14 Aug 2024 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.63
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723662589; cv=fail; b=cbCkLPeR0XrLIoIhYdWoMVGN1L3f7csQHYOnuAgLEz47PfHZWxObS61dHRnNG/0rqpSACyXhOy0UM8yjC2PeYQ0xfkSbPWh4aN1wjaqnr4tdFE7FzY4wH5XhOeO5MfXNFUp8J0/3tp27ZLqyZbNP0mQzAu972PuXFyilPv1dEYI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723662589; c=relaxed/simple;
	bh=uduXflNQ0XWJtfpvpP1Yft1bXrXHrIPbC+A2uiGbzyk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BYsiVohLB5VsUMbgK2YnIp14hPFpv8470pRDl7ZESgNeSF6GFfPqtMR/o8lHKWO6RX+nVd7n+Nvi3rNhJizvncNKb/l5+F6WhlHu6HdYKe4l+xr2wzT9YepFekNnUuU0ihruhVYT3xmNo5UPdvz+zo3O5YNuW24VlxB4XBV4XSk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com; spf=pass smtp.mailfrom=netapp.com; dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b=W75Y2yrN; dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b=W75Y2yrN; arc=fail smtp.client-ip=40.107.244.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netapp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netapp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b="W75Y2yrN";
	dkim=pass (2048-bit key) header.d=netapp.com header.i=@netapp.com header.b="W75Y2yrN"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jGJ/l8Kx2VrkGimir1z1cXGEy9w2u1Tg+JC3IzNg+pl1Dn4v8iiU+y3MEXjr+KZAazuYGtdH+mI0vaC3xFvj/lijRjtQnpMc5LshwxGWCtbApUPCsg1RMzK2QOWoTPTyD9Q5RdF0GipUiKXtueHg6q4slDFJsSdZRMI1+YRBiebaLe97LdDGBKejF2iXMPiIvf39oFDA0yGvSEubbC4+S7uPdWekfQ2byHfQQP4Tq6oOUMNqml9C/sooJWZDYyAHK9L5yJpL+R4B72nLywp+RN91qb7E/40HXcADJczFEvsZ+5rqRcTDFLfASugXt5zAesUcjMdbVPMGbLLhtwMRLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsqvJRY214FG8Hizb7EippFZCtd4WhlPT5OuicmrSDI=;
 b=NOh5zQemfuIBbjZsBoKVHD9lV0eqh1na6vtzeTmzDNkznOZ+UlD8uz2+3CnBXXznYahWRgQhLnpmsP0W7QoLOha4A/mWI47/XKk8LVHIaKdgfqarP0t4eKssbSBmtppLDnsmJflnbBqLvT+iGRizAEm1VtbG1ef1RCGKuNrFQ9cCvv2PzN0ZTYxFjYgcZ/8zgN7Dcge9JPg88Zl20+6/URyR7CI4XTDbbaNc5cyNpGPBk785yj9gq7Lhw+wK0WcBGVkTC6SZO3Hl5JJcIpfZfiR3uk1aL0NB05hbiEjicY8nkJg8yyLIYw1U3P4GTGU+KRFP5n/8YpKczUI80/zEPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 104.47.66.43) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=netapp.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=netapp.com;
 dkim=pass (signature was verified) header.d=netapp.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=netapp.com] dkim=[1,1,header.d=netapp.com]
 dmarc=[1,1,header.from=netapp.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsqvJRY214FG8Hizb7EippFZCtd4WhlPT5OuicmrSDI=;
 b=W75Y2yrNg7EzgalXe8Ep54e2+uOXeniivPf0lQjGaqLlAu5YHYT5CU6CJiG6t7SYgyjS9e9iwfkWCvFOVq9w/jx/jKpJfKMRnXxwnCPT1AQ6YW+vlg7lxmtjRfkrlF7hKeEy/NqPqh43+iFGQv06LAa/WkfCCPurkEkeD4c6qOsY0jw4v1uWmAj9D3aCH32N0XVO4tOaGR011DdiQQCJGn57Qa/N/gYE5yTISmmRFFPHANUdzXH2vSwGnXDd+JCd6mOZY6Q8HpH5QQzy95B9O7c8Ds2dDa4yVYeHTlBQ4WjuqTDGwcmWIR19KNpTJq+OxIdL+kOVdnsWPIM37z4a4g==
Received: from BN1PR12CA0025.namprd12.prod.outlook.com (2603:10b6:408:e1::30)
 by BLAPR06MB6945.namprd06.prod.outlook.com (2603:10b6:208:297::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 19:09:44 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::34) by BN1PR12CA0025.outlook.office365.com
 (2603:10b6:408:e1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.24 via Frontend
 Transport; Wed, 14 Aug 2024 19:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.47.66.43)
 smtp.mailfrom=netapp.com; dkim=pass (signature was verified)
 header.d=netapp.com;dmarc=pass action=none header.from=netapp.com;
Received-SPF: Pass (protection.outlook.com: domain of netapp.com designates
 104.47.66.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=104.47.66.43; helo=NAM12-MW2-obe.outbound.protection.outlook.com;
 pr=C
Received: from haraka01-inline-api-pop.vpc-50c51735.usw1.shn (52.8.140.255) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 19:09:44 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by haraka01-inline-api-pop.vpc-50c51735.usw1.shn (Haraka/2.8.24) with ESMTPS id E1222DEE-DD8B-4FB0-93C6-263F3252897E.1
	envelope-from <Brian.Atkins@netapp.com>
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 verify=FAIL);
	Wed, 14 Aug 2024 19:09:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytuLTyzshGPCVMXaIguVLB2q6YaZ+jAMe8iAAgwgynvFF+VDR+VNAfwgChV6Ph2F6gZ934unv3es7fRbzSLAuh6/cPgL7jeebTxulor5dw81YEl/J8/v9BaPEok48NpiNNuN0C+wx9BpX35LoySllKrooKy8Obrq4xsq4K1mgX8S64QG/9rEGMeDY1zNUX+qYReW5cB1N1EPKlx9nir/nbYgpWgls2bXraKkesHJHQsr3mweITz1U+uzU8Hsu/Y0kZuU7tK1A/3sBIT9WuDALySw5LpKz8QQHhbLjbeQNYcVNek7zJrZLPkncz6U16lttdyjuQJcBP1woXSgZTLxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsqvJRY214FG8Hizb7EippFZCtd4WhlPT5OuicmrSDI=;
 b=szirOJiVi3x50i3xe7H1Bb/whspu5buRO854iN/XvHNoBVxtnSkEszIrLjEfFsyaMJvrs8k8oqohaUNbqqtvBh1WYsBUgkeZjz2mRZsEiU0j4MV/BCCtmOLCnsMjFMj5GimorbG+PESvpx0WwZ70YmCHuGfw5kc+iUgo3UwJIhOORFAWrRdjeUV0e4QP+Tghs7aYWaOcDz7oqnG/W9Y1mhCIzthaSMUFdIlEdDENCVzDwV2EB8NDyWxFN6gIPUuzcH84NVLraPC2ghVd07VAI8c5I3LbNdPYtaPkyxkp11C5eH/gcSAupnHznXngxLaJt2pKeLo3m+bV+e/ogSyIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsqvJRY214FG8Hizb7EippFZCtd4WhlPT5OuicmrSDI=;
 b=W75Y2yrNg7EzgalXe8Ep54e2+uOXeniivPf0lQjGaqLlAu5YHYT5CU6CJiG6t7SYgyjS9e9iwfkWCvFOVq9w/jx/jKpJfKMRnXxwnCPT1AQ6YW+vlg7lxmtjRfkrlF7hKeEy/NqPqh43+iFGQv06LAa/WkfCCPurkEkeD4c6qOsY0jw4v1uWmAj9D3aCH32N0XVO4tOaGR011DdiQQCJGn57Qa/N/gYE5yTISmmRFFPHANUdzXH2vSwGnXDd+JCd6mOZY6Q8HpH5QQzy95B9O7c8Ds2dDa4yVYeHTlBQ4WjuqTDGwcmWIR19KNpTJq+OxIdL+kOVdnsWPIM37z4a4g==
Received: from DM8PR06MB7717.namprd06.prod.outlook.com (2603:10b6:8:37::11) by
 PH0PR06MB8914.namprd06.prod.outlook.com (2603:10b6:510:168::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.17; Wed, 14 Aug 2024 19:09:41 +0000
Received: from DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3]) by DM8PR06MB7717.namprd06.prod.outlook.com
 ([fe80::f36c:51e0:3f10:6ac3%6]) with mapi id 15.20.7849.023; Wed, 14 Aug 2024
 19:09:41 +0000
From: "Atkins, Brian" <Brian.Atkins@netapp.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Output port redirect going to loopback?
Thread-Topic: Output port redirect going to loopback?
Thread-Index: AdrufG2gtoXCMY8lSJmxnrEwEYZooQ==
Date: Wed, 14 Aug 2024 19:09:41 +0000
Message-ID:
 <DM8PR06MB77179054B381DB1DA67B0D4DF9872@DM8PR06MB7717.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.10.200.16
dlp-reaction: no-action
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netapp.com;
x-ms-traffictypediagnostic:
	DM8PR06MB7717:EE_|PH0PR06MB8914:EE_|BN2PEPF00004FC0:EE_|BLAPR06MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: e98b49e1-ae6b-4a16-e38f-08dcbc94a82d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?oYh6dSjv6ekgCh/8RMlBkBpVx06uDhEKCkEBuCWIsufbjCOFBkoiCNpWLaW0?=
 =?us-ascii?Q?rDcr+53ecH+zrrnSM5DeJMSOBQDYZcx7P+oFs+Cnpnh8KyEKyRN7chWRkv4Q?=
 =?us-ascii?Q?x0wCXqMKHQaC7KjBebtoJb0uj3dM5Gxzut+EbmpLhDgFHt0mN1e9LTx3ii/M?=
 =?us-ascii?Q?VGM4p6dhfL6uY8T5RBNZg70ibelr2pjfOwNM1TxFxB060eqZeEP7gbXpfIXD?=
 =?us-ascii?Q?mBnCa0BWstN8NCBbIJtLIn094jhLqjIgbK/NEZu6hxmSZpM3DVGEgUcMY70Z?=
 =?us-ascii?Q?7JNamnjfWKMkkJkSLKJzuqx4y6kLliZFYgRAn5ftslQ9EaOyteo8sIz5i329?=
 =?us-ascii?Q?6idGxF4vRfr0ZOjI061gKYYYxapzeLpwjgXP4Sj9kv3hwV2bR6ya3jQwY/Vd?=
 =?us-ascii?Q?2Jy6Ya6w5BskovRD2J6AqBspIPBfdmKfG7+xz7Pvgt4PMTqrSj74bJxeT3J1?=
 =?us-ascii?Q?4UBdx666AcWdALPd07WH0ik8g5l6lDCSOfBUpTiP9zMG2+QTTKMNsX6of/PZ?=
 =?us-ascii?Q?sAT9V/e+jycpEJt4ACCj6lI/YuqiEXx5piOY5zzgIRoYyW1x3QiBuIlNxw3n?=
 =?us-ascii?Q?iKSEF5J4ntiV4pq+paIjhr9Lcr9+Njjry+4iQpXOSVNcAMOkouCKVnYIjRmx?=
 =?us-ascii?Q?4KtybdDuvDKx6f4J9H+b3yEVpECASETxqcsy+bLmLFpUqCJsmRFynYStOl+f?=
 =?us-ascii?Q?W8LmsNJfnSSVxZNHeXIqoYE5aYZgGyt7vkgLIp9XeBGLxr9LDO8rR1UizAbG?=
 =?us-ascii?Q?0oh8zKI6bERlVHRGiLE9FrhAP8ku/Gco+TZKN9VC/K6VRImvweaoQVh5sCVF?=
 =?us-ascii?Q?Gw/MsL6wTydErJWXB/N53BLITowqEWBqv9zDz9kOkno/GWa1I2sCUqg6wz0d?=
 =?us-ascii?Q?mzRwITP4uPEXzEe9g6VJ8TkLQLS06CbNBHAEtzAwWyr9SQX99LfC0UEcx7u6?=
 =?us-ascii?Q?OtrNG5GuoZoKIh2Km+qftKj/ZTz877fOOY3GANglosqsjaPpk8kygaL312hQ?=
 =?us-ascii?Q?IeWu1ErN1319uUCPygV6HdQvDTgE8d4tw+McAIS47Z42PgzrZgrG7pMHzvtN?=
 =?us-ascii?Q?Dn8qmAAihpipRx05c5ETwSBZs84AabzpodDMYBjzusOF+thzfcky/rI/jiur?=
 =?us-ascii?Q?w5ye7e5a2oVpVIWuybqOZl1Y/ui5avL+uzAxif5YBIVV0XT66vBPZ/bwz0ZA?=
 =?us-ascii?Q?zRCzr5WbRoOutB/Ul0Gti36/aUzNQMwjwa2yUc7fqoDjdrxSlrUSK4WDvjoQ?=
 =?us-ascii?Q?VqmX+3hCJ6Joc8kjHr5dZaRG0jOfWECeAEs9B0jEnfzyt/DuA0iK/fgjRBO4?=
 =?us-ascii?Q?DWOHDjYUcqkgKLps7SVWkxPEprD5TaNHPnev5+gLC7YHejneLIOieuKMNeus?=
 =?us-ascii?Q?TpYA9iVdTBTpXSa9WLwvAqIR/zGtzPM6fu3mZ7QuIOgIMbajMw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR06MB7717.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB8914
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netapp.com;
X-SHN-DLP-SCAN: success
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[104.47.66.43];domain=NAM12-MW2-obe.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[104.47.66.43];domain=NAM12-MW2-obe.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6608ef5a-522c-4f6f-c6b7-08dcbc94a678
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	700UFlGdkSLukeZLmzxYrmu0fGw1w9InJ6Vf6wpitj190MDIWrslO6Suid2mlJ7xdElDX7MlfDAvW+eJ0AMH+T7A5xHUkx7rASUnZyAqpNuorG3M7Zsg6EyMEa7TUriWe4ggJRyMx2oWn8FuNUbFwCSSYmY3oVRcLAv8RPfiZgZwPDWR9JqveruIOKndfBauJZqMz5alVohHSjRiw/8L/W1k/WJWLdOE9MBzEBD0BuZrpeOAZDizS4GmqdeCHnYXue4eWcPQ53RV4ioJxmpXceoum3LNRWHTmR5khUqBcGXPVhpfTcLWsh3PO08wVNXVTZipag5JUrWrDMe7aYy6vRBkVniREq0AUPtLnjKUGsqcpVC3yB050HsoBWRssb6Y1eLMeqCaCeF/5C3XV2Cd3qJNPhL22zZEpOc4GewvooowjboPWXnloMRBbuY4fbkr4m340APTa+e/8Anz7IrChwDM+8LSgeJfLcglbqHkdulfAnFJvEOZjgJNeC+cPcr+FXxfnAj1Kfhjh9BwfNgU+qJTDTSORIpJXf5CQc4jSab1AVYrBS/MSRUj8+J+oukWw5IXVRBobfK875AtQNchN0L2MEG0qp6TQ0bAe2Co12CkI4BmtJQZIKKO2Y/2ZtRNsWE3NIs7C9010g7d6pR1lG/Fpl92ck6TOnqD5iaF7XT/pG1039zmrwoDK/pyEaSvxGVsIEbg00dvZntMg9OTjnKV96kpgpd/xo/Q0pojHmYI7WF/f28nn/BN63nzbiBX2IhoOlsiEgQ38612A1PlVdqnIUqRqF3T62LgcEIdnwFqATxtTG8w6x+kHhRpFv/C3pXjKhBwqT+5NUrdHLCFsA==
X-Forefront-Antispam-Report:
	CIP:52.8.140.255;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NAM12-MW2-obe.outbound.protection.outlook.com;PTR:mail-mw2nam12lp2043.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 19:09:44.0497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e98b49e1-ae6b-4a16-e38f-08dcbc94a82d
X-MS-Exchange-CrossTenant-Id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=4b0911a0-929b-4715-944b-c03745165b3a;Ip=[52.8.140.255];Helo=[haraka01-inline-api-pop.vpc-50c51735.usw1.shn]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR06MB6945

I have the following nat table:
table inet nat {
        chain prerouting {
                type nat hook prerouting priority dstnat; policy accept;
                tcp dport 10999 counter packets 0 bytes 0 redirect to :9999
        }

        chain input {
                type nat hook input priority 100; policy accept;
        }

        chain output {
                type nat hook output priority -100; policy accept;
                oif "eth0" ip daddr 172.16.5.220 meta nftrace set 1
                oifname "eth0" tcp dport 9999 counter packets 620 bytes 372=
00 redirect to :10999
        }

        chain postrouting {
                type nat hook postrouting priority srcnat; policy accept;
        }
}

I would expect to connect outbound on 9999 and have it redirect to 10999 an=
d reach an IP address on my subnet, for example:
# telnet 172.16.5.220 9999
Trying 172.16.5.220...
telnet: Unable to connect to remote host: Connection refused

Note that the redirected port is listening:
# telnet 172.16.5.220 10999
Trying 172.16.5.220...
Connected to 172.16.5.220.
Escape character is '^]'.

Using TCP dump on the target host, I see no packets arriving.  After adding=
 the above trace rule to the output chain, I get the following:
trace id e99d6c43 inet nat output packet: oif "eth0" ip saddr 172.16.5.224 =
ip daddr 172.16.5.220 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 48255 ip p=
rotocol tcp ip length 60 tcp sport 56064 tcp dport 9999 tcp flags =3D=3D sy=
n tcp window 65535
trace id e99d6c43 inet nat output rule oif "eth0" ip daddr 172.16.5.220 met=
a nftrace set 1 (verdict continue)
trace id e99d6c43 inet nat output rule oifname "eth0" tcp dport 9999 counte=
r packets 83 bytes 4980 redirect to :10999 (verdict accept)
trace id e99d6c43 inet nat postrouting packet: oif "lo" ip saddr 172.16.5.2=
24 ip daddr 127.0.0.1 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 48255 ip p=
rotocol tcp ip length 60 tcp sport 56064 tcp dport 10999 tcp flags =3D=3D s=
yn tcp window 65535
trace id e99d6c43 inet nat postrouting verdict continue
trace id e99d6c43 inet nat postrouting policy accept
trace id 1045fc5d inet sgfilter input packet: iif "lo" @ll,0,112 2048 ip sa=
ddr 172.16.5.224 ip daddr 127.0.0.1 ip dscp cs0 ip ecn not-ect ip ttl 64 ip=
 id 48255 ip protocol tcp ip length 60 tcp sport 56064 tcp dport 10999 tcp =
flags =3D=3D syn tcp window 65535
trace id 1045fc5d inet sgfilter input rule iifname "lo" accept (verdict acc=
ept)

Note that the IP ID on the second trace ID is the same as the previous one.=
  Apparently, my outbound redirect is being redirected to localhost.
How can I redirect traffic to arbitrary remote IP addresses from port 9999 =
to port 10999?


