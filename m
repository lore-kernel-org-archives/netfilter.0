Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788BEE9370C
	for <netfilter@archiver.kernel.org>; Thu,  5 Oct 2023 20:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjJEU10 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 5 Oct 2023 16:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjJEU1Y (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 5 Oct 2023 16:27:24 -0400
Received: from mx0b-00007101.pphosted.com (mx0b-00007101.pphosted.com [148.163.139.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A8595
        for <netfilter@vger.kernel.org>; Thu,  5 Oct 2023 13:27:22 -0700 (PDT)
Received: from pps.filterd (m0166260.ppops.net [127.0.0.1])
        by mx0b-00007101.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 395J1b0p025040
        for <netfilter@vger.kernel.org>; Thu, 5 Oct 2023 20:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=illinois.edu; h=message-id : date :
 to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=campusrelays;
 bh=I79MBjh2TTWTuSYpqQcXeqeuc6D7ekFVxB7z/AEnSSA=;
 b=E4ya3Ovqv0BA639Y0mavW2pgOrbsBzsqhTPcaZ0+vLpVlxciRH9M3I0gC6yphC9AKQdo
 gqYom844tEEbQzN/vVEcLGwOxYJNOGu26sZshE2UcVuYHNeLtt4rpA/YmjOVJHMDZIUx
 8aiBnxJZDiiQV0/IWYcHW52//+RcoRGOlbW4HilLzOFTqXVOsppqYaAFpzNoB5s5XemP
 X9QQTYGU/fnbWr50rYMTzaPeSZPknKZu+rCUcqDaoKh93u7GELD0vfBNiva/bIKhNhZG
 KxlbCfyfW2juDcIVA/xoas2KDcNg5GCgrXJNNHcjT1uSfzzK0sXVCowCgiZdCK4h9QcQ gg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        by mx0b-00007101.pphosted.com (PPS) with ESMTPS id 3tj2xh8r3m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <netfilter@vger.kernel.org>; Thu, 05 Oct 2023 20:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4nUjFju4uAu2zE8iEl0mo9RJ+CgfD3KYNNSfZvo+2JZEhWlQvBFIshPEJQO1p2mO+HORN7imF3f5bZ+V4R/CYDDUIuuOoMT/twHDinaF+wCehqbE27a0688+tI/3VD2yJednDwLGigpVYDVce5B146AQkZPae1xZWy1k/AU9KACOrX71eEU9i3eBN6pTHNw+IGIfq3ECVSx/PpCN87m4JsUdL64kJAoRLILMIIF0cqrUwVEfXSC9nNZHxhr835OOqxKqszAu4FHQA+SGeKUqwZrY2YVOkrj/qPeUXyYAvJxJryrQdI5mU2qCcraTPBdYxi/fylTaI/B9f91vAiZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I79MBjh2TTWTuSYpqQcXeqeuc6D7ekFVxB7z/AEnSSA=;
 b=n72t09FfSjXaq214/GnkOKBfkGMtJJ/29JApd/v+4uCQy11L+bySZ9kEC7ZHU//ZpWwvRkg8lrhgPpF8DOCfE2+mwKJlptzAb3NvpBf8nhZ0Y9lZIQBkr6SyC3kOaf8lnMwpX8/3sTXrS8hFVPBv5zrNqV0uTHXFwLvZxOB0rVOFIjQEwujozG9urF1sL9I63dg+jN+2QHv2KAlcyh/XWA9OeDtkkbGUBzdVPO0cB0MScLee44MCTUtV8SEGhwaocGCeYkwFetbVNgilUeZUmo/N+nnvnlB25DDozHlKfzSbTaR8I/SvsglYDZO68OS57isy+liVhg0ELXQT4Dxd5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=illinois.edu; dmarc=pass action=none header.from=illinois.edu;
 dkim=pass header.d=illinois.edu; arc=none
Received: from CH2PR11MB4453.namprd11.prod.outlook.com (2603:10b6:610:43::19)
 by MN2PR11MB4694.namprd11.prod.outlook.com (2603:10b6:208:266::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 20:27:20 +0000
Received: from CH2PR11MB4453.namprd11.prod.outlook.com
 ([fe80::13dc:9772:d3f9:13db]) by CH2PR11MB4453.namprd11.prod.outlook.com
 ([fe80::13dc:9772:d3f9:13db%2]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 20:27:20 +0000
Message-ID: <dabe538a-62a6-46be-a687-bc1716d26782@illinois.edu>
Date:   Thu, 5 Oct 2023 15:27:16 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     netfilter@vger.kernel.org
From:   David Zych <dmrz@illinois.edu>
Subject: doc suggestions
Autocrypt: addr=dmrz@illinois.edu; keydata=
 xsBNBEzhY54BCACshPg2bhEF9ClCK6/V3ojo87M3m8W+e/axsTIOGkv6NBbcshmDAa4v7TPM
 qqdYtixJdeDFwfrvLkepLQjmDTpeSBkJvV5ETHh72+5BpuXq6XcF6Up/wFOfZF2bPVk+Cvn1
 F56u+Zivv0a6/kcs1XuUHgoiS188Q2pYgi6oUF4ya3vUD4CbW++iUs6QHF8vu093k4md6j7k
 NgEA2b3aiTcPcu04FkMOMYuO3uAeZNHKcfHV7xATw2d9iMcYKwLXE/DpRiIaDmXVzStREPJT
 yh43BJhDXL5eImbGgtSeHGmJIqZjiKxWVwldHYnuY89YfvzQee8bCpT8s3ngS0cMlq8bABEB
 AAHNHkRhdmlkIFp5Y2ggPGRtcnpAaWxsaW5vaXMuZWR1PsLAfgQTAQIAKAIbIwYLCQgHAwIG
 FQgCCQoLBBYCAwECHgECF4AFAlZKONkFCRw02DsACgkQAX1tzYLst9grrAf9HhmEGnS2uyA3
 Xy7zINW9K6mAMTxDQWym0ra/7AjeWBqVLGc1O53vlibs+S7v2rWYdf8UKvWyDAhTMEqq8HTu
 o5hH9yKcW87NIQbaboBk8tg/q1eeX9XTK8iisjT+DVQO5NYx8L1DqWJFFwnTsPng46DB52B2
 T8ulTCkDZd/HQlHQilEtviY4nvmi0VQkR6S7+yFdPFGAPTYFqqbNM0QIaedDkeka9Qm3m09U
 eZWrpVQhGzWZrb43i+Odfw8Tvec7+vJvL6777yjTRGM6B8/DFGCxoEMD2avwc2Vl3tT1nukJ
 N6LgPNlDn/xzbsFM1IhmCGaMCgFHAFF3EEmQwZFakM7ATQRM4WOeAQgAvRzmiYOp6FulRCOj
 sdD9bNC/Sey36wP9zlCdzKnE+exrtmI9xysiudSunEP4HNOdqrozIFEZiVEQSLOtTpGt59wm
 kQP4VNxOXdXUNj6P5H7tsqxs5TwLqVsVxHLD0vpgj5Y4qNgMGF1Q+8i+z9KI06KFCLFS0nIB
 mD9VpHImprrGaRw+7QKaBYBnVbw8VyIFd5iAkXlW6agGmaA9CMbB/Fhtf+fOiO3MuvrOJ0/K
 o7/UEJQFIWym6K51Ek81jGTJY0kiYda8EjnCNaiPahTZ0yejnF5gm8cRHU/7bLB0KGvgE9nU
 mxrlSEjilIkVMjWN3aCOehq+1+H7O9DoAjd71QARAQABwsBlBBgBAgAPAhsMBQJWSjjdBQkc
 NNg/AAoJEAF9bc2C7LfYajYH/2I6ZSXBlj5jr4bNz7NQhDs5aqiMY3hG2nrlYxECnfebsqjO
 vskoNdDKHFf6qB5CGDebJ5EJ43W8s9cNSt+FeQbaMh/tnyI6pS0JpcMoHfm/AZBsc8Wn1FIr
 oX30ZJ1VfYLVWkW1Y046wNxJ6wweqxlXC2LAdqJBlwsmRzlZP3d5OEBAaFoguMkyYV4WTlTt
 +73+tbSrC5PnxLfigo48X3YZpg0U0WZ+JWmgUu6zk0NxSa+bCXbIG4RoDUcRKIXemhcTDl7J
 UmKCzOh3LSE9NzFnexzvGy35OV91Y24mUDuRPYzR+ErWlxjWGpYyehrrBfo7uQnyNer0Fu8y
 JD781qQ=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:610:5b::27) To CH2PR11MB4453.namprd11.prod.outlook.com
 (2603:10b6:610:43::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4453:EE_|MN2PR11MB4694:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af74a7a-6c03-4566-88a2-08dbc5e178c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MsLuFP2piyIinFRVMxt8gnsNPWrmY9dZMN6HxASyllnLUm7QM3wiT+xpjCuretjU+SW+l8QxSMt1/xJ9SsAHO67JaFtFExaj86jPbxJeqme9sDXuou/AVcZ2zPzwvYKzyGDpnjPFLEd6b2fmh2W7rlCyvrAmPPAxySLYMRc3WtEJlZAXGyz8e4+FbbcvhFSYS6/hkJpfRw1TP9yoHwL1nZyVp/QPXSe8ZwEyf7FZLcipHyjV3wukAtXkyPaV1ZltpsfsjXwldrOxtUAe9wNWfVKbvBNP34YiGP1kHk9HuOI9zWauoovffUniXWQ1OlSsYirBk+O729JRy9dOgSh7Lmu/XiB+WkUQBVOLQgv9rwRI02pwYR9OE8omboNL5yxM5pvriwLwEtgeucZOswb4TomCwlQs6HSvvqAjPt3KUXAUuX06EkV5kVYsabYFz7/rJVs3nz3w54T/B84UUoSwX1JW+ws+o6MOUxgP6MVYL+NvsaNNObEJCNOYIBx/CLwp4I1DXevwXRuLuUR76r4oUCXiZDBh7rUTzim6nyCptGyOq9ht9jcHkvJefdzjlzCKiPLTs5aDiaC7yzRCK79gLjj9FBl9cAI0joDj/ucqWLcPQ9oO6Sh2TiX0kmriYwoORuJeosKB6MBCV5DMX06kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(31686004)(5660300002)(8936002)(7116003)(2906002)(8676002)(41300700001)(786003)(316002)(66946007)(6916009)(66476007)(66556008)(75432002)(3480700007)(26005)(36756003)(6666004)(6506007)(16799955002)(38100700002)(2616005)(6512007)(83380400001)(86362001)(31696002)(478600001)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNhUVgrWm53Rm5EVHc0bUQzOUd1eXBteFFRQlpLanFqQW9iNVNmQnNiZnR1?=
 =?utf-8?B?eFo5NTh4YnRFSjJGZlI1QTFUNkhlV1JrWGxHb1FDZ1djbUZRaUtOOWJldTJU?=
 =?utf-8?B?YmxYREdiU2wrZmk5M29qdytUWTlaZlZERGNnK0tiTE9rcjlLQkJiSld6aUZr?=
 =?utf-8?B?K2dCTllaNWNTMUhTbi9nVFduMHp3MU0wbG9WNjIwa0hBb1dtVHErQk9zNUFu?=
 =?utf-8?B?OEh0bmlIQWZIaUw3S0luWmdzcnlpQVE3NnptV0hVcHVKNXBSTmQrZzJMNHVY?=
 =?utf-8?B?czNmVUhOckdpeDl4N0dwSHg0LzZqRGIwYm1zQVg1NXlyZUc0NjRLWnZ2bHVJ?=
 =?utf-8?B?L2ZranhvbUQ1Q1VqQm1DQUYvWjlhSmJCbXdpanc3MXZXWVRPcTNXekZkN3FQ?=
 =?utf-8?B?Q2ZrdlorYmptT2J1bUNwd3ZoaXJTdmdqQ3lXK2VOM1N3K0YxRkpaNm9lUlg2?=
 =?utf-8?B?OUptTTlZSU5sOW14OXhVRjE5Z3Q1Uko0N1NaUEpEQkVJUFAwdng5eXVzTUFX?=
 =?utf-8?B?Z2hzL0d2eExSUUVZWFBCQi93Y2JJbDFXMmFQSVo2UnZvcndOdWtLaHhncjEy?=
 =?utf-8?B?MEZuajBwWFR3OFZpdDJ0SU1XM2ttNnZta1d2N050Tm1JdFo3dnkrVS81ZFBl?=
 =?utf-8?B?RXdGamR5d0FmRlJqcWN3WkVTdnpIdGFWNjdwL1UxN2VHWWhTOWhOcGRDWUhU?=
 =?utf-8?B?NEt0WFRnZUVTOSsvaGNuSjl6cWU1aWhsa295ck8rY3A5VE1JYVlVdGVjQTRQ?=
 =?utf-8?B?N3ZFMExaVCtWR3pxMnhVcEdXcUVvUGZwc2RRQXpqMkhIdnB1T2dzTTNJckVr?=
 =?utf-8?B?SUhlcTFHMTYvTTN5VnlxTzJUb2U2aTNOVVJWK3F1WlJYMkQvM3FzQVJWcUU4?=
 =?utf-8?B?RkFrTnhYdm5WS0FqMzRDOGorSTJnVGlHdXdTdUlFVjc0cXl4RW5LN0ZuUnQ2?=
 =?utf-8?B?RmtNSzZhVG1penZsc0hkclJZY3VjaFVRbUZ4Vno4aFFTQ1prN0krYjlRVVli?=
 =?utf-8?B?d0tLYkZNYk5MWHJDTjRxSHRxOTVmSGpYUW1ZdWdNT01SU2YrTE5ERVY0c2Ry?=
 =?utf-8?B?VXFHci9FNEZPMnBSYXpaK1IvVUdNSkJRL093RVgxdDV3eHRQcEFoZU9XdE5V?=
 =?utf-8?B?MjZDcjE3SEtsNVNpRHlxNXhWSnNOZ281WVNsYkdLSGNYdXJTakt3UEEwMHo0?=
 =?utf-8?B?M1BXNllXZ2c3S05EOWs4SFpxeEhFNUJPbmQrOXk5UEE5UzhnS1N5b09YeWVn?=
 =?utf-8?B?eStsbXFHOVdMb0tXOG52UG9yNkEyM2VKRGYwLysxdHM2ZlQ3YkhiN256V1cr?=
 =?utf-8?B?SDJFV3R3SCt2RVJTRGtEREp6NE0rWVZwYXhoOVF6UThXM0dQUEg0anNZdENW?=
 =?utf-8?B?ZkVkUUdVYVE4bHlYbDZucU10L2xSdGNYOUlJWHlmcjRVZk5PSURIbXVjNkNX?=
 =?utf-8?B?enpoY2dINmNSZ1RldzVPNVlGUzVFSTZKVVdvenhYV2JWYThBcWtRaFNlMHZl?=
 =?utf-8?B?cG50WDFpR1o0c0hrQ1N5TEdyWm1ZdU5yQ2o1eGdLQlpVVHhscDZvQ2dxakhK?=
 =?utf-8?B?TE4ybC9sclB3YkxmUlJod3U5ekhDUGJ1b3pZY3IyQjFBUmZnREQ2ZUdYZkh0?=
 =?utf-8?B?UjZRZjNNVWxhOGhLZk9vR2NBYmE4NEJTSDhGaE0rR0Y5NDlBKzRKSzVvSGky?=
 =?utf-8?B?eFlQQjl3eXl6MU9qVVVsZ3g4NnlkWXBOYTJxRGcveWE5blp0ekdmUlJtVEJn?=
 =?utf-8?B?NHlFbUVhN3h5Q256MVF6bFBEZ0VvRWVaMlM5NHV4Tm5tcERzb1dYR0wzWGl0?=
 =?utf-8?B?MkVucFJJNUcySk5UTFNWNTE2dlpMM3B3eHNKOUNSSEZOcDhFMnZRWlBlNXBF?=
 =?utf-8?B?a2NxVmJyYVpKeDNUNGg3d1FUZHRPMW9GKzhxVzhXNDFMSDVmejdPSVZ4Vno3?=
 =?utf-8?B?SkM2TzFnZjMvanpFT09yRmNVUXhTcGw4NjlEK3pOY2oreXZKYWJLZ0xRdnNX?=
 =?utf-8?B?R2tvSmh5OWdkQXgrMy9oVFdZTHBPOUQ1ZnhiakhJeUFCaC9UbzFoSkN5QkIv?=
 =?utf-8?B?SFdJZVdpMjB3dU9MbCtpbDROZWtRaFRWaGR2TWJyWDQ0N1BCUHdoRDd5T01y?=
 =?utf-8?Q?cX+NP1jFSxJhY4I39KwBCdWf6?=
X-OriginatorOrg: illinois.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af74a7a-6c03-4566-88a2-08dbc5e178c6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:27:20.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 44467e6f-462c-4ea2-823f-7800de5434e3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4cVWyWH+2R/zGiMWCgejJbllLkBVWwX+t1UdXp323kR+bsZqM5Ng4HcwnYrG7ruIy3jqX00q9LqCKYsYqqOyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4694
X-Proofpoint-ORIG-GUID: txQBHX0m95eN-nKPhX09y50U4sQ8HuyS
X-Proofpoint-GUID: txQBHX0m95eN-nKPhX09y50U4sQ8HuyS
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

A couple of documentation suggestions from a reader who is new to nftables:

1. Please document the slash syntax for matching on TCP flags.

Coming from iptables,

# iptables-translate -A INPUT -m tcp --syn -j RETURN
nft add rule ip filter INPUT tcp flags syn / fin,syn,rst,ack counter return

but https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers#Matching_TCP.2FUDP.2FUDPlite_traffic makes no mention of this syntax.

This is especially confusing because nft automatically translates from the documented syntax to the undocumented one:

nft> add rule myfilter output tcp flags & (syn|rst|ack|fin) == syn counter
nft> list chain myfilter output
table ip myfilter {
         chain output {
                 tcp flags syn / fin,syn,rst,ack counter packets 0 bytes 0
         }
}

I did eventually find an explanation in https://lore.kernel.org/all/20210514211035.5567-1-pablo@netfilter.org/T/ but my last couple of work days would have been much more enjoyable if I hadn't had to look so hard.

While we're at it, I suggest including a slash syntax example in https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes#Tcp

2. In general, please document all the available operators and their precedence.

EXPRESSIONS in https://www.netfilter.org/projects/nftables/manpage.html#lbBD states "Expressions can be combined using binary, logical, relational and other types of expressions to form complex or relational (match) expressions.", and other bits of documentation allude to the same idea (e.g. "To match on TCP flags, you need to use a binary operation") but I have been unable to find a full list of these operations in either the man page or the wiki.

https://wiki.nftables.org/wiki-nftables/index.php/Building_rules_through_expressions is a start, but doesn't currently mention `&`, `|`, or the slash syntax above (if indeed that syntax is more generally applicable than just tcp flags, which intuitively seems likely though I admit I'm still not certain), nor does it mention operator precedence and when parens might be necessary, or even state that parens are permitted.  It may also be missing other things that I haven't personally tripped over yet.

Thanks,
David

-- 
David Zych (he/him)
Lead Network Service Engineer

University of Illinois Urbana-Champaign
Office of the Chief Information Officer
Technology Services

Under the Illinois Freedom of Information Act any written communication to or from university employees regarding university business is a public record and may be subject to public disclosure.
