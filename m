Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95D3171C9
	for <netfilter@vger.kernel.org>; Sun, 29 Dec 2024 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735478336; cv=fail; b=LcCA9n30D2F4vMKCnx01yrhphY8cKTLs78GzsfEEE2whEITT1yutemnIAKDR+0ok+VTWcg2B6/5sWbz/phsoc+UsLRnXUT7vsZkTq6rBq/ybLEVvpuXi+KsNjVhg2sIkQuTo7YFpmojAqtB1bvxK4sjKe5YJoixArQEBBCh60Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735478336; c=relaxed/simple;
	bh=/s859I10+GH28UKQ8eWrvFfUTkgxJ8t70EFxOWKWpyQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WNYOkXWjTQiRXlCfQNvR7I9w5kxdDyApzDe3L99Nep1S9wntQsye/Gl1uzyXDLKfk1+hAZ0vix8gBuEyIZVbXY59bLyP1yhxkOakpYbc8i7Wt30E4VSnhJNXBo3tQz7Z8DO1PP6Wp+xnDQJ1hqpiuiCAwChYo3sagBAhwPEXs5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D6gggCsa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kAjvaWi+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D6gggCsa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kAjvaWi+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTCxX9V011008;
	Sun, 29 Dec 2024 13:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=dMx+2BUiCcdlSSFGKLULSckgSqPvLBC+1Hz1Ds6ZzAk=; b=
	D6gggCsaWBVIENuNe07mh7y1shdyzcm2rfhKmA7CKrswVtOnhNJZoOashD616ABB
	00Q5xi3OfNULIbRUZDFvRCBds4ovLRiuoFMAJfr2bTiHNM2dkqFhykJcmltm5VVO
	zvNPamo0tsFGp1PZ2H+4NO4CRBwciRHYgLsLanBBHlPyums2drHx7gmvhq+8pN43
	T/TaLm7GPlApG7bwTbGkvzRT+ZEusXNio5Gn0ehg8oVOJH5RA7FU7sKgDoAJ51Jx
	8ntCUQuh90jtV7ECg2xiR3LAfpAomhVXjynIVv8yIfIYA14J5IO8eLDS1Gm3MFao
	ZOc5AMT482up/xq0YHIfsQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t978h500-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Dec 2024 13:18:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTA5GdB009108;
	Sun, 29 Dec 2024 13:18:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43t7s61wyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Dec 2024 13:18:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4rrdwJkj5CdZT9/5xJ82WAxjW719/G32nFlfZQmDX5QxuxGuCem52Cyxbuqf6uF3zYJgjpEVd1u7UQBtQEFK8GdgB40Br920OuXWq3UfSnsCa4pU/1ztA7di6KesyW9eH1FrXNajNHuU1SfprywHl1rY/WqnYos4NY0B/obbdyTUxGvEXWpbYrW7jHL5OFixx+iN5RVU7Ih42oREwKAgcwie8FGjkQmYvQ0sKSAUoJIQoY+GYExJ6WnoRLaNhUHCsx1hgvnG7WH0ZpSYhFZCvHF+RM0fgBg3qxGaXr0Nj8r2ZXX6c6qTzzk9+w7LP4jXiK4wQev6NkBhDy9I+oABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMx+2BUiCcdlSSFGKLULSckgSqPvLBC+1Hz1Ds6ZzAk=;
 b=FTPHYEQz+iOGgaCJFD/TUU5tvYFvgX6tnhbaDBOMcQ+W1XX33upW1ocMOynrFhRdl9zEqFOE3LTYpRtQ9iW54wxOcy5cD2LDephSaUjHwSadQIlaATg+/EkirD+rBxxbCeZgIY0PodJT6bD0r60PoJKkpM9zecOMzvbPmQ6qQ3zX9wAqAxDfUlNiHgSQ9jZ3cRF0JxgmnLirpXumIgxeUXHCAm6rOat5TiYksh7JCVnt+JkJ3uUm9FfsuN+A/Y8A3VgBVdoJLZe2NJVZuBUQmfOP4FCGvjBmccFqpBY3moM8jRETEhhn78Gf9rj+M+XnX1znf0YJiRyrO4ym1bIMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMx+2BUiCcdlSSFGKLULSckgSqPvLBC+1Hz1Ds6ZzAk=;
 b=kAjvaWi+ytF4i0diyApjg0JfKcxfTaBaC26dXel+Aw2X/JY3R2jae4mQd0pNMJzVByVxHWzbHM0umjx4Qr7OBvj9NK6frB70FKqxbWAOFTZ4tscGkMOyXCmSX7v9TSZm/IjjS528+YXG0y1NR+8tAXYR882JJh3pvPsNL+dyG2w=
Received: from DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10)
 by CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Sun, 29 Dec
 2024 13:18:45 +0000
Received: from DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38]) by DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38%6]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 13:18:45 +0000
Message-ID: <4f26107a-b1f7-4832-a7c0-b86264732f78@oracle.com>
Date: Sun, 29 Dec 2024 18:48:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: expires larger than timeout causes error
To: lilydjwg <lilydjwg@gmail.com>, netfilter@vger.kernel.org
References: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::20) To DM4PR10MB6886.namprd10.prod.outlook.com
 (2603:10b6:8:102::10)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6886:EE_|CH2PR10MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f4b28b-a32f-4c28-79f1-08dd280b52ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MElHVFZNQ2dOWGhlQTRLWFptaFBKQldTVUJYSm9qbk5EZEkwdFV6ZXpYZUhO?=
 =?utf-8?B?Rys2ZnYvWUU3emZwWkRmS2RhNUJUc2s4MUhVQnZIcnBuOGxBUFNMZVQ4a09i?=
 =?utf-8?B?czZ6MG05R2RFUENKT0pEYVlBM2RXanNpUDkzcWttVHdjMTZVTWl3eEtQdlF5?=
 =?utf-8?B?aWJlTmJBc3ZrV2NpQmIvMWova0FadmdYMG13VnJsdXdJTUFhKzJSaTRpMXFG?=
 =?utf-8?B?SnhkTXMvSEF5RFdrL3dPNm5NMmJoVEZ1bWhJTGVlZVJSOGg3K3RBcUppN3Iv?=
 =?utf-8?B?aEhHNlRKMlppeUh0Qm53WGhHSVVqTFRqZXFKeEFYamVNd0p4TWl2UE5LQ09L?=
 =?utf-8?B?ZXoySlhhWEZWNUQ3RERFdVF6TkNvcnlsZFVKbytvcTZRZzZkdmFwaks2STFX?=
 =?utf-8?B?VjFPS2hIMjVuT0d0d3VzY0d2SHV5VFhFVnIvTUd0eGc3OGtGWFF0emJLQzN5?=
 =?utf-8?B?bCsxT2I3M3c1c0xBWU15VlJDTDlwUFlqcDJLbktUcGlINC9HQkNONTNHd2Y5?=
 =?utf-8?B?SWpLNWpObDROa0o5TnNCTm1pVmdlSlFsLzNvYk5EdGlDUUdOS29xZUJlRWVl?=
 =?utf-8?B?YnBCNHFBWGxaVW42Tk83Lzk5SGMvVHBIdld5eU11UmNKV1hxZU51eS9wTWgx?=
 =?utf-8?B?NHErRFdVaVJvVWFjenlscHZLK3Fjckd6ZzZuVWQvb2lKT2JENTg4OUZFSjNC?=
 =?utf-8?B?SVpib0w3dDVMYzg0ejNBQmxTamRGUHE0V3VENm5rOEdyUFhhSWNzNmdnb2Mx?=
 =?utf-8?B?VG96ZDhZaUZXc3hTci9GTTJ6TC9nZE93bHRkL0JwalRjOUpZb0pkQWdqcnJ1?=
 =?utf-8?B?VDRmKzdFeE9kbTljS212Znh1cjh2MVRtVDMxTU9jVWJ5NVdIWmxtQ1ArN0tm?=
 =?utf-8?B?SkZHb1BkOW5DWnEwTVA5Y25wMUNWd2ZGbll4ZUIvVTU4Sm5UR0kxdEJsUTlO?=
 =?utf-8?B?NTQvbUxHQXFta3plQWg5OWpmSVRwUnpnanZMem5xVWdkbW5BRlV2MVYzZ1Ba?=
 =?utf-8?B?dFdDeXYyOFdTNWVJMWgzaWRMUzdvNkl5QWQ3a3ZmT3ZxWFRCTVRZVXlzc2Ur?=
 =?utf-8?B?a1JqL2h6ZmkyMEtLWmJvNzFsL3haMytTKzBLQ2Zvb29vQ2t6Q1YvZE52YUh3?=
 =?utf-8?B?ODFyYUJOMmxYUnBzRGFxb0YyVmVmdTJ6bi9MK1hkZ0RYb1lYN3NrbDBTMEN2?=
 =?utf-8?B?Q08wT1NkTmlpTXNVbnJGTTZhWVZDSkN0cEZMdkFOM2l2cSsrdW1iRklSNEp3?=
 =?utf-8?B?WHA3SjVMTTNGOUlvWVc0UVg1RDFmb29aL0dNU3lWK2ZTb1pjQk9SVCs5KzdJ?=
 =?utf-8?B?NzBkY01reFpnYmVCN3htVDlTakRSUkhTVEV4NWdGSmkzSm1sYksxTk14K05V?=
 =?utf-8?B?ajRkUXViNmN0VUdZeWcxMlRpdmZuUUJXNG43SGhnbzMrZ29sajNHTkhialNR?=
 =?utf-8?B?d1ZUWkxUUTBJZEZSQVNDMzNkMkdZMVdtbUM5R01XWlZUUUN6QzlWVkExbHIx?=
 =?utf-8?B?K3hQejJxNGtqKzJEV2k0QmJmS0hPT04rZkRKUzAwd29sZVBTZU5yN0xwUXhs?=
 =?utf-8?B?YUl2NHhMT3pUUTlqbFlQNlRrcnFseVY4MFc0dkVUa1BINFFtdGhEUjVVT09j?=
 =?utf-8?B?MDlxSGNHSXlOUXBMRGNzakw5RTg3bEN6TUxZenA2WWVmNDUvVTMxYmZybWhK?=
 =?utf-8?B?TkhvZGt5aUE3S0QzaC9QVTJoRFhtZ2pjb1JPSG5FNjJweEptbm5WVUU5NXMv?=
 =?utf-8?B?ZmZvSzM1QncyckwxZTdRV3pUU21DRFlCbjdmRjZCR05GdlE3akVyRlpiN1FL?=
 =?utf-8?B?blk0SUZEUWt6VURIblFmVFQ2bzN2NVRxL3NES1FwRGhITFh0SUdnR2gxZDVr?=
 =?utf-8?Q?y+lwXeyAqhIH5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6886.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1BaRnFBblpoWnJMM1hTZmIwa0lEK05XRVc2WlZSc01xQUdnZmtGemE5QVJ2?=
 =?utf-8?B?VGNFQW8rbFpGMFdKekgyaEFKNkN2R0ZWZ01oUDZYUjFzODBlQWY2NUd6UEZE?=
 =?utf-8?B?d3hhODJtV2prZzc2ellmZnRmZHlTODhFZkdBVE40c1BiRnpxa0IzdFhMNGFI?=
 =?utf-8?B?c3FUd09XTmxLa2dQMzNha0xjWXErcnMzc0RJZDZqOEhlUVU5SnJYTkhmZ1VB?=
 =?utf-8?B?Zkw4TFFzekxEWW9MM3JkeWZaRStuVTR4WVZOaEZNQ3dqZHBSdWlIb1VGL2hY?=
 =?utf-8?B?SWhpZ1E5UVVuMFR5bDVSbFBhZlRGc1lZODZ5RjVpZjhoRGN0bHQvemNWUnp4?=
 =?utf-8?B?Mmg4cW0rTHdkS3BmMnYrRXRucHk3ZWZOU09IeUFGSGhnblIydk9CZ2tLanZt?=
 =?utf-8?B?RXRmd3pvOFQzeEdPS285Lzkrc0x2dHR5Q2dWTEI1U0dmdUcxV0N0WFViVWVL?=
 =?utf-8?B?enRsUG5nOGpabnlTVzFrM2hCUkJFYmF6WDdkM3ZKQU1ERS9wSUtqREJXYlpS?=
 =?utf-8?B?NnFEWEdpaE55RHNZbVhCSHJYWFVJK0l0N3BJS2o0VXl4cERLUmgwcDdDVTVw?=
 =?utf-8?B?QmV4dXhTMFJTakUyemQ3QnFyTFNOdUREMW9BT3FZU0I1cmk3VUMrdnVDdjRi?=
 =?utf-8?B?RW40TDJ2Q000SHcyNm45WFlCRE9weEN4RnlUWmFJSTJDTDhkKzdhQ0JOcWtn?=
 =?utf-8?B?WVlwRjhxdWg4WU5JOGZSS1dTbWt0WTB2ZXFFQjV0VjkvZEsvU2hldlZmQVNw?=
 =?utf-8?B?dTdvMnhTc1NZVmNrYVZoc29kTmJCakwzWk9UZXJVRGw3eVNUaVA1YndYSTBG?=
 =?utf-8?B?bjUwU3kxQVBVMjhoeXp3Y05EVVlGQUcwcnR2Titaa1ZXQUhwZlcxbi9EVUxE?=
 =?utf-8?B?bEFtalMwbkJOZ1NHd2ZsamZOWG5aU21IS0VqVVduRWtWUEFBeHUxaTlSSER1?=
 =?utf-8?B?eW9VSXovNVAxZ21wUnpvMHMrWmJOOU1xODg0YkdXdEhjbC8reFFvbTF6VDhm?=
 =?utf-8?B?ODhWODluY01UWWF4WUNrQjFRLytpWHJ5RDNOS3VKVUV2dk1LYkxUQXo2NndF?=
 =?utf-8?B?bDdwTGJ5WUE1Q2Z4SW1penZnaW4yb2d4VWFPRE1KVTM3RlpXSktrRGFOTkFK?=
 =?utf-8?B?eFRmMGZLNGM0b1o2ODlIbEpKY0poREV6SndPRjc3Q1laZmRlNFl6QUdJQ0xN?=
 =?utf-8?B?WGNMRGRMdmxMNklxS2UrUDJzMFdVVEVGRG44S1pHRFVKbW9iZFFhcVVzQ2c3?=
 =?utf-8?B?SWx6YU1raUxzUStrTTQvZWdSeHlPSkIvMXBYZEJwbUloOWxGejVHZ1lFU09M?=
 =?utf-8?B?MHFrNVAyZDVqbUZMZVArU01lKzM4TUtSTHNLd2gyS2tPamR6ak1hWExMTXNV?=
 =?utf-8?B?SlFSNVNOYzRtTy9vSEJja1l6dHV2LzVjMnROT0lwYmJQUzUrS1l6amUwL2VC?=
 =?utf-8?B?dzdoQ1Y0dlZ3YnpTc1lnNjV1UnFLcVJFNkxSWE0zVGxYQ2JWb3FtYmt3elRN?=
 =?utf-8?B?a01OZFFITFRlNm5BdDdjaVdzTkh0UDZqaHNtcjhrNCs0Wm9ZV2ZtdzlPMVov?=
 =?utf-8?B?dmwybGdpamxpcElMWXZOYThGRDZuc25HcmROTHBLMWNWVUEwVlJ0YkpNb1NC?=
 =?utf-8?B?bWxteUNaVnVxOHhrTjNWd3duYU1wNDlUeTFwNmw1eVUwc0g4NlFPNUQwMkp2?=
 =?utf-8?B?Y2crbEdaZHNjQzI5VnMrM0NWNUd3RWl2OThCdTNJUGZ2NmRsL1cwZnN3UEhw?=
 =?utf-8?B?TDRldngrYlRadXZtZXdqLzBKNlpHWmxOTCtyNmJCaXE1S1p2MzBZTHRhVWE3?=
 =?utf-8?B?V3NDZEhlZW1SS0x6K2FMbHFjcUNKbVlKeGsrb3dsbmtIZlhuWmFvRU5IREVO?=
 =?utf-8?B?NEo0N29zNFVWMHp6Y3Z1VGsxcjNLTXFQRDdmQllncXM2blhmNXFUU2tldnlr?=
 =?utf-8?B?UHM5RnZVSzJQL2xyNGJSbGc2Y2dMNzU4cTJ4eTBOQVg1SEF3UERSU2hnQ2Rp?=
 =?utf-8?B?aDdRdEhSU0drLzBwT2l1bXpLVWh5VzZOaVFLSFRoNU1mRGNjUStnSkZpU1p6?=
 =?utf-8?B?bklKdHVVM1dGeXRUTURYaGNSTE1LTGU5KzlFYlJWQTJ3SVJsUUtxU1hzSFE3?=
 =?utf-8?B?KzBzMG1nMndwSWNYWkpmeUh5T3ZCdm9sZGhmNkZWWTROSnJGM2xrQkxMcFdC?=
 =?utf-8?Q?Ha7srWIUrnuKGuWcLxrTZdc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Rj6lAptE9e/bMLivbvxgHmZeyY5Wxa8QXf8W3n1MaMZoqq+An+g0/iWDdP8mR/J6NSbqcpU000GxlUSEDG+Z383JZOfaMfpDkhH4PbndBqS24KPClOFKaScxYwn9n2hD3J5rdQmnR9auxsHXFWUImJ8eHYtuPVlx6oKhYCfA+aXKv0Hez3y5AM+yEADtPxbuudcyWKCx4warRKrIZMznKW2cFyEs0lp8S7hQEELqmsQf4Jl6Qm3JIXkIMnaZmuW1tWRMokQqHX7/dMwKM0yawjPHoTWhlu46KtIrvAo+9gGl3PDo4sIibp1bUvsRqb0wXPbcoGzwqaTlR1EhPf67vEAygEEPeMuSsfX2SbTOgMTnsgFSxd9ftIiDEsH7ZczvwXg68cURCuABFVPOahlLUcKuTSgsAGDZWUD4dddapDWPjWlBWa8GVU/l8fJhnQHWEBhY7vklSgynJ3DkrMf5C7gXsuOpouqh0l8SWossk6C/2QnNmnVFoZowiO37VNZl8U3wRlWLj9Cb0KSMtBwxGvVk3+d4e91nVXu8EaVCS6ofp0rexnPzVeq/UDe6w/4B5jFzNKxBIedWYIAba2fnjqxAPoPAXCKGC7CM4U9/vE8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f4b28b-a32f-4c28-79f1-08dd280b52ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6886.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2024 13:18:45.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpgR05fNGKcGYxOaLp6a8KizpXttLP6S7xHLvMel22w3VHRxAcJRe5vjqRH6M/eHE/7g570uFHG4oWMCF/HyIxmz8ujXoe91HZWJK2Lxi+nxe5318dbJZTFNJs4kzImb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-29_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412290118
X-Proofpoint-ORIG-GUID: feio5wQ3hotW0X2a1Gm2kSDyaCuc3FQy
X-Proofpoint-GUID: feio5wQ3hotW0X2a1Gm2kSDyaCuc3FQy

Hi,

On 29/12/24 15:30, lilydjwg wrote:
> I have an IPv4 set with timeout 2d, but update its elements to 4d when
> a rule matches. It was fine until kernel is updated to 6.12.6 or 6.12.7.
> E.g. the following snippet gives an error when importing:
> 
> table inet blocker {
>          set spam_ips {
>                  type ipv4_addr
>                  size 65535
>                  flags dynamic,timeout
>                  timeout 2d
>                  elements = { 1.2.3.4 expires 3d }
>          }
> }
> 
> a.nft:7:16-22: Error: Could not process rule: Numerical result out of range
>                  elements = { 1.2.3.4 expires 3d }
>                               ^^^^^^^
> 

Note: I looked through the commits and this looks like a relevant commit:


commit c0f38a8c60174368aed1d0f9965d733195f15033
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Tue Sep 3 01:06:58 2024 +0200

     netfilter: nf_tables: reject expiration higher than timeout

     Report ERANGE to userspace if user specifies an expiration larger than
     the timeout.

     Fixes: 8e1102d5a159 ("netfilter: nf_tables: support timeouts larger 
than 23 days")
     Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index da75bc1de466..6c0c6f8a08a8 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -6930,6 +6930,9 @@ static int nft_add_set_elem(struct nft_ctx *ctx, 
struct nft_set *set,
                                             &expiration);
                 if (err)
                         return err;
+
+               if (expiration > timeout)
+                       return -ERANGE;
         }

         if (nla[NFTA_SET_ELEM_EXPR]) {



Thanks,
Harshit

> kernel 6.10.6 worked just fine. nftables cli v1.1.1.
> 
> Despite I can't import the set, existing elements can still be updated
> to timeout more that 2d.
> 
> A new bug? Or a new limitation?
> 

