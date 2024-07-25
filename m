Received: from mx0b-0019e102.pphosted.com (mx0b-0019e102.pphosted.com [67.231.157.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EE7193
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 00:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721867707; cv=none; b=SCzvDghmYiKMFlUVSisnD0Odhcm34xhNv0KU6w7GRq72hpYNQBIrMQE24jJE93sOF/PXWngvGZ28i5DpvZO6JuIbXolPtG8F1dXqixnt0qV4ySBLblPLPguGWKtfW/EMPKPN04nvbjj4qeD2C3rAn7ybDIhdylI9gzssTMLxQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721867707; c=relaxed/simple;
	bh=YwpiG+sE7t69yyxUl/ZZgzCil5yFwjIxe1hqz3RbDvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nPo49PI15p9ypXyLfwms0o8hOodcwC9osXOLCF0+L2dGRqsv2kYGP/7wVtHmj2DYykMQFqp5GsTyrNi6+sn3kn+dnjgfhsMqZnDe/OnOWnl1yQxF5GDC0yr6UYT5KGYzSuYCgHvQx7diU0u4dXgT6l4eyWYPwOlBNiGrZVii8Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=motorolasolutions.com; spf=pass smtp.mailfrom=motorolasolutions.com; dkim=pass (2048-bit key) header.d=motorolasolutions.com header.i=@motorolasolutions.com header.b=X3AoSQTe; arc=none smtp.client-ip=67.231.157.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=motorolasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorolasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorolasolutions.com header.i=@motorolasolutions.com header.b="X3AoSQTe"
Received: from pps.filterd (m0074417.ppops.net [127.0.0.1])
	by mx0b-0019e102.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 46OI22wC022429
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 00:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorolasolutions.com;
 h=content-type : date : from : in-reply-to : message-id : mime-version :
 references : subject : to; s=PPS--2020-03-17;
 bh=Qno19UKu+pYua+/NMnrNz6odp5vfWiwIpWJxXtp2CvA=;
 b=X3AoSQTe3nyNlwcxojDWIbB01L7xt6AEYXlUfJkThiX2fnhL92xSkj8YQiX4JhxfflLY
 HCzDo6ePv1wetf1UfuHAORlkpLgCejRgsJ2Wtv6gP/t3SEqkI01xPEYXY7TO9TuPhT0L
 XEz/b6mj+BxFAc9lCj7IrEATPG4S8eNLEDFIoIPKdc/jqATSi+wU6bkQmsRDWYNkZsZD
 Z4hV9cSaOB8AivLql1LsoLnoirTDrpyiWK2OrF350flyreucmPESJnCSAUeknh+SuF28
 UHSksDaps1M2rh9gs7D/fVISFgDTWbgLJUA6cTw9vxbAcJVV1de3CAN++YIqo9TSFC2r 5Q== 
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0b-0019e102.pphosted.com (PPS) with ESMTPS id 40jmtrg7m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 00:35:04 +0000
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7036b5eef34so293275a34.3
        for <netfilter@vger.kernel.org>; Wed, 24 Jul 2024 17:35:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YxQc8ggGOpHoxaA2TP8fMRSt8lkLXspJcFlt7onY36qD/difmwo
	pwPJuSn9EGKFb/4XglO5RsiwsPxLaTi0/DFk0+Rq9i8I9l6Bwcsiwgy7LH/4nDFFL3Ub8fQ672S
	vaEVnlcqDX+wK/Svhk5ySXhT9rIq7Jo+dOunGLq42uWVJY6ppbaV3oWXX3ntcJl9Kjzt49pCx/c
	vVTtYS5H78zLk32f0Ie4tMsmEtj5wLnJlLgu7YrGy/
X-Received: by 2002:a05:6830:6182:b0:703:6ab8:1fd9 with SMTP id 46e09a7af769-70932117a43mr537268a34.1.1721867703603;
        Wed, 24 Jul 2024 17:35:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwbscBdjMOeL980gBUxzV081/zxwBHU9/4LdEVD3JjvCPqMQeMZCOyT6gIdvlbSCYd86e2J2ooSALs00Q63MI=
X-Received: by 2002:a05:6830:6182:b0:703:6ab8:1fd9 with SMTP id
 46e09a7af769-70932117a43mr537251a34.1.1721867703256; Wed, 24 Jul 2024
 17:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMp_5HbpSmy4G0-Aty9dD4FnwvvNU-iQfTtzYhysQSiL6jbA1g@mail.gmail.com>
In-Reply-To: <CAMp_5HbpSmy4G0-Aty9dD4FnwvvNU-iQfTtzYhysQSiL6jbA1g@mail.gmail.com>
From: Tom Isaacson <thomas.isaacson@motorolasolutions.com>
Date: Thu, 25 Jul 2024 12:34:52 +1200
Message-ID: <CAMp_5Ha4HGLqkWAA=syC3+U0M3xxq3OuN9b_WvYNc9dV=CvzDg@mail.gmail.com>
Subject: Unknown option "--to-ports"
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 6pO1Ktv3wA3IdwwAX38YS5c8bz3HYZBP
X-Proofpoint-ORIG-GUID: 6pO1Ktv3wA3IdwwAX38YS5c8bz3HYZBP
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250001

Sorry, adding subject.

On Thu, 25 Jul 2024 at 12:10, Tom Isaacson
<thomas.isaacson@motorolasolutions.com> wrote:
>
> Apologies if this is a stupid question but I'm stuck. We have an
> embedded Linux ARM device built with Yocto Kirkstone. It has an LTE
> modem (connected via USB) and Wifi. These are both working fine but I
> wanted to setup a Wifi access point that shares the internet access
> from LTE. A colleague suggested https://github.com/oblique/create_ap
> but when I run it I get:
>     # create_ap -w 2 wlan0 wwan0 APTest 12345678
>     Config dir: /tmp/create_ap.wlan0.conf.XX59Vdf8
>     PID: 537195
>     Network Manager found, set wlan0 as unmanaged device...
> [46988.754925] ieee80211 phy1:         DONE
>     Sharing Internet using method: nat
>     iptables v1.8.7 (legacy): unknown option "--to-ports"
>     Try `iptables -h' or 'iptables --help' for more information.
>     Doing cleanup.. done
>
> The offending iptables commands are:
>             iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
> ${GATEWAY} \
>                 -p tcp -m tcp --dport 53 -j REDIRECT --to-ports $DNS_PORT
>             iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
> ${GATEWAY} \
>                 -p udp -m udp --dport 53 -j REDIRECT --to-ports $DNS_PORT
>
> I searched around for a solution and found
> https://community.unix.com/t/iptables-v1-8-7-nf-tables-unknown-option-to-ports/385377/3
> but this command also fails:
>     # iptables -A OUTPUT -m owner --uid 0
>     iptables v1.8.7 (legacy): Couldn't load match `owner':No such file
> or directory
>
> iptables links to xtables-legacy-multi but it seems to have all of the
> necessary files present. This
> https://github.com/istio/istio/issues/23279#issuecomment-620776006
> said iptables had been fixed in 1.8.4, but we have 1.8.7 so I don't
> think we need to upgrade. Is there a kernel configuration we're
> missing?
>
> Thanks for any help.
>
> Tom Isaacson

-- 


*For more information on how and why we collect your personal 
information, please visit our Privacy Policy 
<https://www.motorolasolutions.com/en_us/about/privacy-policy.html?elqTrackId=8980d888905940e39a2613a7a3dcb0a7&elqaid=2786&elqat=2#privacystatement>.*
