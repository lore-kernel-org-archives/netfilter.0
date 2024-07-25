Received: from mx0b-0019e102.pphosted.com (mx0b-0019e102.pphosted.com [67.231.157.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB5A181
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721866221; cv=none; b=glomIXeCTO3Y2d5u9kY3XnQv9lebO4FKF2PS7vGUmdAgNhxdzQvgDsRKj0tmPnpkyxtlpfGbG0YkNHW/CBI15oE+8IK8lkv9LPJ+w/4BCCH1FIE9geKOuG6vSA7j5kwyBDuRyXm43A1I4d7/oCuSSLF8dQfetyau1zAkyGbdeLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721866221; c=relaxed/simple;
	bh=UjCMDztIP8uUPTmsQ8aA0QrYDYc6Iz3LoJoZASyc3yw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=k59Qqg35lFI/q//s8N1YQobaaFGM+Pmya2U7Y0CO4kyEFTwDj2b6smaai4kMXd6zXzjZuuvPOKJpBrW33aQsPK/IrrJylRVNjWpqIJ2oB8NdAQN2qh/FWm2ZYH0dNxQSJ15SvD5cgG2X86L3POXavsUrycu2Fcgmd2HeAvNz0vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=motorolasolutions.com; spf=pass smtp.mailfrom=motorolasolutions.com; dkim=pass (2048-bit key) header.d=motorolasolutions.com header.i=@motorolasolutions.com header.b=hxzb/Tqr; arc=none smtp.client-ip=67.231.157.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=motorolasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorolasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorolasolutions.com header.i=@motorolasolutions.com header.b="hxzb/Tqr"
Received: from pps.filterd (m0074416.ppops.net [127.0.0.1])
	by mx0b-0019e102.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 46OI2pHu025715
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 00:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorolasolutions.com;
 h=content-type : date : from : message-id : mime-version : subject : to;
 s=PPS--2020-03-17; bh=Sn8hg6raO4uP3gvrKjvElRScVUfvRbZVB6509RLo6AM=;
 b=hxzb/TqrD23bR6KeqjrmX4DfFe3+cZ+pPYGAkK8JFDqFX36wwhbziZPb7p82o/dyZLYU
 ROs72GP63zGqtZ93skLpRC0VCewTBKUY4+tL7UaL2RY+yDBeC+sj23Dr0OU8jvf9+Vaj
 qEAixPjukRSufYxfxxThyqf1ezRlW/gxekYJlT5Ztxe5LVNgBKtDCISQFRP29B1t7cwR
 Oxibgyl+x5v/4rL5gz/KthYACUVa10ejo63kdCOjxMz+Cq16raoXcsbmcnqMPpMxZFFu
 pOt4v/sBPrbCy/MAxLk8OC5kf6pEnf59kYrYCbuqkorVJY2wIMVpo2160XIJqfAkq+yb 0A== 
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0b-0019e102.pphosted.com (PPS) with ESMTPS id 40jet8assp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 00:10:18 +0000
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-70d19a4137dso329251b3a.1
        for <netfilter@vger.kernel.org>; Wed, 24 Jul 2024 17:10:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YzFz30i/OZdhwgxluwJ9kzHI2aOugXzVtmbFOOUgR6f66cLgigu
	WRqYaQUeHbLmujr4Ofcy734kmYalcrZBoW86l3suijoB2uNDXpxRv7tDxFXSLkE9J82FbvJx1Wd
	kVOMWe7udVOGvPsrHCSu8YU6OlBuHdR4cT+SPVFK7QcqVywXe+YfQnBHAFG5Sjl2v7uDCHhfQ57
	oobijC+3lFDd/JhthbE4LhJyef4CoAkO8uLRjK45gPAoo=
X-Received: by 2002:a05:6a00:6f29:b0:706:1bfd:4e8e with SMTP id d2e1a72fcca58-70e9ed109b1mr5467439b3a.0.1721866216685;
        Wed, 24 Jul 2024 17:10:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVoCfjVSbi2oH5eCWNKpVnpK9ZjQ1Ba3BmIsdlc3kuSINkdDiTRLnSxcnRzyfW1kujD3NlnmhggtQn4FYDUC0=
X-Received: by 2002:a05:6a00:6f29:b0:706:1bfd:4e8e with SMTP id
 d2e1a72fcca58-70e9ed109b1mr5467402b3a.0.1721866216077; Wed, 24 Jul 2024
 17:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tom Isaacson <thomas.isaacson@motorolasolutions.com>
Date: Thu, 25 Jul 2024 12:10:05 +1200
Message-ID: <CAMp_5HbpSmy4G0-Aty9dD4FnwvvNU-iQfTtzYhysQSiL6jbA1g@mail.gmail.com>
Subject: 
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: kTmyC8LiPjJvspflcEFXTkz-lc5K5oWD
X-Proofpoint-ORIG-GUID: kTmyC8LiPjJvspflcEFXTkz-lc5K5oWD
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 impostorscore=0
 clxscore=1011 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407240170

Apologies if this is a stupid question but I'm stuck. We have an
embedded Linux ARM device built with Yocto Kirkstone. It has an LTE
modem (connected via USB) and Wifi. These are both working fine but I
wanted to setup a Wifi access point that shares the internet access
from LTE. A colleague suggested https://github.com/oblique/create_ap
but when I run it I get:
    # create_ap -w 2 wlan0 wwan0 APTest 12345678
    Config dir: /tmp/create_ap.wlan0.conf.XX59Vdf8
    PID: 537195
    Network Manager found, set wlan0 as unmanaged device...
[46988.754925] ieee80211 phy1:         DONE
    Sharing Internet using method: nat
    iptables v1.8.7 (legacy): unknown option "--to-ports"
    Try `iptables -h' or 'iptables --help' for more information.
    Doing cleanup.. done

The offending iptables commands are:
            iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
${GATEWAY} \
                -p tcp -m tcp --dport 53 -j REDIRECT --to-ports $DNS_PORT
            iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
${GATEWAY} \
                -p udp -m udp --dport 53 -j REDIRECT --to-ports $DNS_PORT

I searched around for a solution and found
https://community.unix.com/t/iptables-v1-8-7-nf-tables-unknown-option-to-ports/385377/3
but this command also fails:
    # iptables -A OUTPUT -m owner --uid 0
    iptables v1.8.7 (legacy): Couldn't load match `owner':No such file
or directory

iptables links to xtables-legacy-multi but it seems to have all of the
necessary files present. This
https://github.com/istio/istio/issues/23279#issuecomment-620776006
said iptables had been fixed in 1.8.4, but we have 1.8.7 so I don't
think we need to upgrade. Is there a kernel configuration we're
missing?

Thanks for any help.

Tom Isaacson

-- 


*For more information on how and why we collect your personal 
information, please visit our Privacy Policy 
<https://www.motorolasolutions.com/en_us/about/privacy-policy.html?elqTrackId=8980d888905940e39a2613a7a3dcb0a7&elqaid=2786&elqat=2#privacystatement>.*
