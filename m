Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A1B1A2C21
	for <netfilter@vger.kernel.org>; Tue, 10 Sep 2024 17:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990554; cv=fail; b=tsX3UczVU7C+SmfUgv9DFG5RrKmLErmd4pVrsipvHjWRI3Fr693AoWLgIv/331KLN6binOQ53t1uvuxzk7qpiGzmW47Sms9x6igUXhNeGuA0KYh/h7GkiQkPFuJFF8BhKuQu9jGND1fytVNXSe4Zy/7x1llv+LxFGIcEulnPOM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990554; c=relaxed/simple;
	bh=Dq/Ea3my0wJy6i+RL9CMFSS6Eh4DgcVO1TGDYA604xM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=La7ZuRV/Qb2wxj0hhjEgYfruXjrRMazKG4j/Jek2L75wtBu91RGUt3gU6QpBB4dWO2lA7JPVT+vKkSVPB5YooWRDnarXxpnN/ekgSw5ptC3CRxSb3zps7wEV2Yrb2TxpPnau0wThEoHmEX7xRf6YgrI8TPtBgityMMcI7mo8bdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=educatalysthub.tech; spf=pass smtp.mailfrom=educatalysthub.tech; arc=fail smtp.client-ip=148.163.129.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=educatalysthub.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=educatalysthub.tech
X-Virus-Scanned: Proofpoint Essentials engine
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01lp2240.outbound.protection.outlook.com [104.47.74.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id B68CBB800BD
	for <netfilter@vger.kernel.org>; Tue, 10 Sep 2024 17:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQ0HO1xzDJuFbg/gdmfnPClR+qVJClL5IZ2Egfti3J2MfZMg1KIemol011gEllafiNM+nrXVYmL0ez5w3XLv1UUv9mjVZ90fiHsqnxCGMp9vyj559gzHWplTjwrnLZRUMZc2TinSO//HL6oSDaN8lJiluCMbNRcRa1ncSqFXBuUI7/kzFvYiWFiipSDpOYO6Vb+JlQKRZSnFQ/lJSH5veQ0PA/RKJ0q+wUYRz7XsbvX40Z/YqQAyvA1NLLZIV/jlLiPUcqLUNlHcodb2VpamFRp7DoR0Zf5n9RRh5JbX4EPDE/2USI81c3/dOvMssKVa95EufouV41KB2DVortdajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSusEUBMhKGx0wHye1aQchXQ6ve4FHMwcnwKqPfdPL4=;
 b=C6a6FDoP7N+EvSaY26vvWQNOsARzOAHEWdl6wOMM/yCeq2PvsqyfcmHH73hNmQLz1svJu5kCgvp40RhEDSoL+XPZzQur2ANIFPz3Bhw7px3/uda4ce0I13eK15gvcp9uMfGjxIxP/y65tMZFpNTYmJDgtTV91qxblrnl6QURzF53iiZtfbcqxqemktOC0kqrlQ7A/whRmQgMsd1me/N9VaMbSQ9/XB3i9bNQVtoauwOkBb5jRcw47+KVdJt6RSRgvFDnovnymi+LdH8H0vbGHqaqXSDdWRu4ov5mqa1+MxUyQIsAbDZKArTijAQWwJDR2h4AJC2TvHxp6hLXYF1gKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=educatalysthub.tech; dmarc=pass action=none
 header.from=educatalysthub.tech; dkim=pass header.d=educatalysthub.tech;
 arc=none
Received: from PN1P287MB2834.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:216::6)
 by MA0P287MB0565.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 17:49:05 +0000
Received: from PN1P287MB2834.INDP287.PROD.OUTLOOK.COM
 ([fe80::e9e2:a454:fd31:f28]) by PN1P287MB2834.INDP287.PROD.OUTLOOK.COM
 ([fe80::e9e2:a454:fd31:f28%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 17:49:05 +0000
From: Lily Green <lily.green@educatalysthub.tech>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re_School Contacts List 2024
Thread-Topic: Re_School Contacts List 2024
Thread-Index: AdsDZlrSP1Ccmnudmk+EJfr+acklNw==
Date: Tue, 10 Sep 2024 17:49:05 +0000
Message-ID:
 <PN1P287MB28341844657B71A69B82DC18859A2@PN1P287MB2834.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=educatalysthub.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN1P287MB2834:EE_|MA0P287MB0565:EE_
x-ms-office365-filtering-correlation-id: 4b6ea1a6-893c-4332-28c2-08dcd1c0dd5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7DSu86RT5hNsPZ6vwHxmF1whPaH4ZQwBP2+4WedjBQkZmd2EEsvGsQHNWuWQ?=
 =?us-ascii?Q?v5d6IGzp+CzK1l//Gm5d+Za/ueREVVmgz3z8NwUW8eQCCk7MflvpN7BR9lpl?=
 =?us-ascii?Q?VxNHZGOD9B+d1kGClnDVY96FPVWv59OLOuXo2BatdzbVzZomwG5T436IYjlD?=
 =?us-ascii?Q?ff/Jg6OuRGV4HJ485qIe9j93/C3Y2glAa8phzv9tupvYAmW5IwMnXMKsKkJA?=
 =?us-ascii?Q?rKERXvNjz10g5ns5bj3y8xI+mIEwVyY8zhsRIMrN644sWMXS3ZQAFdULmeWe?=
 =?us-ascii?Q?rzB8l3NDHBbw/cb7DjbOpOSBkrgpub8+PZyjaybfqyI76qk5k1gdJdSKvkMR?=
 =?us-ascii?Q?CcKJ9495N63hlVymhqev7h+c7iB5XXW3BEVlQuzA+dfL0uIJlNif+Tm0r1YY?=
 =?us-ascii?Q?pFqjjy9zsGeR4uiSTfrkEE5kH14rpwNMwMxkFDTfcSUfaWuefag1n5eJ6F5a?=
 =?us-ascii?Q?cXB3YtLHPMDmq5w2ZfWYfpFv45VjvJFbrmPTBHJft2YxptkvuckPVeSMcNsx?=
 =?us-ascii?Q?5JVCM+Sb6Uw10aTh4Z/2pgMbzN3RvlhoS859MZP4UQtFqcZKNxQSbcrqTcj1?=
 =?us-ascii?Q?QfIzW/PiI6rR2ikCGRmYmh4UdmoXn3RuuFghqcC8mlA6EYpyjMBUpVumLD9A?=
 =?us-ascii?Q?Q+CQBplGyBuV6hcA2jzlRX4yf82Sxuj8B14Rfao7ITrhQ1U/dRGbfYNKbZYh?=
 =?us-ascii?Q?tBHawes3VrhaqXd9LgDMcKmnOtJLtbZQA/v9a1YNdjrkHC7Ye6tbMJwn7FRq?=
 =?us-ascii?Q?spxnHAowxSWyvopvlc2A2x3nheBWo1FdF21WzrRAzL1JDM1q33hkbzysmkYn?=
 =?us-ascii?Q?TE6f20GP6n+rTkFvGhFbeXPLPqBA6+XXbZupVG3Yph4LS4hi5UFSpi+jOSVK?=
 =?us-ascii?Q?xbmO+36WvpVUh1WEsWoNkqD+4kVtMTxOJ/UXKGFkKMdIQCIlRq2CFuiZlWF/?=
 =?us-ascii?Q?x8FXdS8tqdZGx5tkTOj9dWwRXbt1Kd0x5rVsbPpNXKiPx9o0jQW7nIe3tzq6?=
 =?us-ascii?Q?JNB2/hxZqfeiXEGyDZc4i2zxQo1z7tCUHGJUYVCOUKc1wD2V6GvzUvtFHk1J?=
 =?us-ascii?Q?D6pX85vVCgI7rs9xRLNWvhC+pZLFKciuB03DQGFRfhnpkgP0ee6+pmGwXz2Y?=
 =?us-ascii?Q?+w3aBrY5T7E1AtFASYNyq8StvhijzPmlD+AG/BiUYjZ6+k64+P9naFcBS3Jb?=
 =?us-ascii?Q?Ns7QCoXcVPsPP1iqiEs/ufMuJJJZ+MIMXgSbLN1WvicLvHfiTSdF27bT4fGE?=
 =?us-ascii?Q?I98fH++8SyjyOBc466XMbpH+t2qlRQmHaPDqPG7V5YZdJgbaC9iiBDxd+0W/?=
 =?us-ascii?Q?eDSRsSV0DzrqeFPEJ6+OcRvnPuDJRZYQ8avYsNWkYKwHuMW57SDHvpUx8iPU?=
 =?us-ascii?Q?l7JVgb/kQ4Xhnplr2KMfcoqMO1apJ0+0WRbYhnSidx+k0SzIBQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN1P287MB2834.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Aokuyzbxz+iqZ5c3k7GMJWUlus5fMoSvTh1zg0e8qciaALmoW94PzxOgF9Dr?=
 =?us-ascii?Q?Ns6cnW7BjDECTOdCgnbOGWeQSLxeoRs84c+Gxnzoq+nXo1XOTUaN+GLl9Xdp?=
 =?us-ascii?Q?OH6F+ymkkkJ8J0E2JHP3rf0oDVQoyeAIcOVj1f5Ih+YuSN8MwwKwM0D6vM7S?=
 =?us-ascii?Q?lTwupUYJOnTaYzfS7fn1HEwWferUu09cIVmYLYRqRweqaOfFE+rHFYTJvJ+V?=
 =?us-ascii?Q?Jd7VfzXs+/Fv3RwbXD0b1PT9iQ/oojkANIgJWBURDIlMt7HeZqXtakYu1Sd/?=
 =?us-ascii?Q?wnnilF97RLqT/0FWCNrTQ8QVm+N66lUMfAMT3vOyXkbckyO4Qs/MtC0piJ6/?=
 =?us-ascii?Q?6A6R0eexa0mJDxKrmTGCSyY39OiZAUayDSTB/3AjsxiG6EJ8cFEjZMW67qpC?=
 =?us-ascii?Q?fgWIfAdhsoVoySjYp4VuZrYAH0JcKjvJPisIcM3SJKSP3QF2IXczNnbTe3/V?=
 =?us-ascii?Q?xwIHJa2SIXdViS/OiLJJZ8A0EH98a0r9nFYhqM7A4aTwrUeXGyE+TwTTo+1o?=
 =?us-ascii?Q?8PEusleGkL9KKsQTyeQ7CeM7HzXK41j5zUSwVc0OtXLWBSCW1Mw6w5oy8QAI?=
 =?us-ascii?Q?Rto0PuwoSfvdTgtAdqckJRIHHmarR8Xv3xF0VFnPkReVCoGaPE59B3G2Wb7M?=
 =?us-ascii?Q?HpW+NWOrAV6WynzptxV4w7rOLV1XTbv2PBybFcY2Ql5lU1HJb9ochIGQYes6?=
 =?us-ascii?Q?xubIKjOip35gqYgaCsxA7McHSJ+SPcQbyokEJU+z4plTm7SCEdGqN/volYJk?=
 =?us-ascii?Q?BBnDIi8PuUKRvGYlWotE3JIB9BM+K6e7ZOOPA830QNIFJOSNc3SiGOMmyNK6?=
 =?us-ascii?Q?jXEz0f+fXyRk/jl7HpP91QKT8WG315SzfuaoAK7T/Fa8vXE1gQztAKr1QWxk?=
 =?us-ascii?Q?Do8aGQkpyBL5d4HX8680vD9iTJY/Sa4Yh03QDiT/ktOZL9ORiDYR0uI4vsJn?=
 =?us-ascii?Q?Yrq5HaBJ4AmnbaX43dJ4BSVUQDVHMGR0HrvJdBSM0Rx0Po4XJpI39Bddf7q0?=
 =?us-ascii?Q?PZfyC/4Er6Pu4KbIYnNOP3pVEIErVwsMujBNulMNBOzutF1L0pT8SJXJpy31?=
 =?us-ascii?Q?S+eiOIwmaD4V8howJkplmzJkevIYRfGMWzayn/roS/kb24GQo2IetzCAsGzF?=
 =?us-ascii?Q?dYFe33R+cGkJ54FacgqVX0Gwj+cvH2o4yLvMBP32mlMW35g5ixr+m9LFoTbq?=
 =?us-ascii?Q?6Il98WsRKeVXSn9BUsOIiXjD6ADudRIhdz4WsvnqhPaak9Ob/ch8ZI5/uoqV?=
 =?us-ascii?Q?iSiQLM1eOnZYVnKNB3HwGRycW9ozPom3MBomYnfRAiX9H+F0/krkXSPX3f+h?=
 =?us-ascii?Q?lFgKxn6M2j6ml6PjrYQgMdIppT9/Kr5IAsDm3/Vfb34K7TFfVRdOLC67RZyV?=
 =?us-ascii?Q?2Cva3gHS0ZAFBgGvkJ0EeiVJkAZ0lsg/sZWw0Q8V4VjPeMwQYclk81nIcDnV?=
 =?us-ascii?Q?q7T480lXjYGHaxOgS6KPLYocP2s2LHuk1JpSz3zIrafjiw5MxdDCj9aUF6GG?=
 =?us-ascii?Q?TcNKrNfVYNhc5uhE3wSQ4axankPvMfHWTDWFdMjCUF7XpU42ZHuKVyXsfU8H?=
 =?us-ascii?Q?D39a1qPtPteK9gydNhtIsEu7x4wSHGL2eLRn5Xb/vdsZ2+Qy7AnCxgBSuvmK?=
 =?us-ascii?Q?VAKRzU2qcJcUQq5NG4C5Cx/RxWFRvxZtDiEXN9r7JtpizI8FUzLXkIV/XwiO?=
 =?us-ascii?Q?S6i1Yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KnIffDWDBwe3sNElgKZeN3emBnhp7MzsWmQJoQ6QZE6aewpnNf3fqvWUx68j1D3Y25CFuP7m8enhEmVgpZdl4xhmobi4ZteqRyxeVc1FqnwoI+KM0RXIIT6tiK+uVkPSp8lvk24LvuJXms62VIHUV1PRhS7UmIEiumSZBSJ9Chzc+TA6u7amXRQE0sI/3UgEdOsuG6wqAswUsjF+hTb03jEO5hyTPzcIhCmxti6DgBd1Yk4OciSY831FEDIVaPLTGUjYZVYZGkS8XnfZwb5dMIMYbcVenqMnB7YAF5jQCtzYY3uG7L8VMTqawrUM7LGSyV8eiK/l/uVx/ZsbwUi2bm9XEPOG/8eCIGX8LY0t1CZCbgLowys75hiNLU/4qY4KJgciSdsPsmxx25kZpjQnsBdlnAj8Xq4gjUa3QYJxImDb2X8ux94vQnmCrQIq7XgvAXDE4Jw0payDxwtFzsE9b6bRixDdVmRrmKniUTJp4rdCRh/YE3DsNia1dRNYVDVz/VchkfudvxpvwTH/LU7DeqZtS8OTx7ZMtYaTkhHBXVHmBRb7KR+qGNOM3Ct0BqmhXB71NT2bwHjG/CG5sxcF5fYg0nEzUouEdh6uPj79CGo=
X-OriginatorOrg: educatalysthub.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN1P287MB2834.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6ea1a6-893c-4332-28c2-08dcd1c0dd5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 17:49:05.5050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e365ff34-85ca-4d9e-869a-17889878f5ae
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9sRW0C+01Ofn9TamEQn9LzExiREpw6eGiiDZTLpi1AasiW0RrULNOEbhDh6SoEK2HSztV5UayNdrp1GeJoWSyHpmoPxBa0ERcS20Ehw7dHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0565
X-MDID: 1725990551-tXUW500GQffe
X-MDID-O:
 us4;ut7;1725990551;tXUW500GQffe;<lily.green@educatalysthub.tech>;cb99685c93c6ab8b565e3fe6acab79fc

Hi there,
=20
Want to expand your outreach to K-12 schools, colleges, universities? Our e=
mail list of principals, superintendents, and key decision-makers is ideal =
for you!=20
=20
Our List Includes:
=20
*	Principals
*	Superintendents
*	Board Members
*	Department Heads
=20
List Contains:- First Name, Last Name, Title, Email, Company Name, Phone Nu=
mbers, etc. in an Excel sheet..
=20
If you're interested, we would be happy to provide you with relevant counts=
, cost and a test file based on your specific requirements.
=20
Looking forward to hearing from you.
=20
Best regards,
Lily Green
=20
To remove yourself from this mailing list, please reply with the subject li=
ne "LEAVE US."
=20
=20
