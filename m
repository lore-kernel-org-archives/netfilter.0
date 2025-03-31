Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6009E1DF75A
	for <netfilter@vger.kernel.org>; Mon, 31 Mar 2025 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437986; cv=none; b=k0ULu+1FcG3yL9NUlqVdK2BKOaBkPIDr7ohx9G9SN+OLCAsepNZExry7PuEDnLSwvXGv8wyXyqfWlfDI66TdbUonOCeGHh3xAbzOrbv7Onc2ZE8PpAefMrQp135jJe6izo04uVmb2pgyJiZOZrpCr0fVYFQAfBLUNBqAOoRnL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437986; c=relaxed/simple;
	bh=kKbXZPOWm1s4WDRrRCtn9E+GSYcOVVqdLudw63+DMxQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=TWlOMczHLAJHxEKKqmpSDGPBKmDCSaephildme/EaFi+vPLjZyb9hhemo8+CsyS+EitQnN6c1eCDSclclBtv/xOsUra4nh2sdOMTUwlCsme4YPk0coglyMzd2NFSCN41/JQgu32O0iMaw5Nl8Km494Zy5+IX9cY5HO5purFSx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kansasdeaf.gov; spf=pass smtp.mailfrom=kansasdeaf.gov; dkim=pass (2048-bit key) header.d=kansasdeaf.gov header.i=@kansasdeaf.gov header.b=UzrgEMYw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kansasdeaf.gov
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kansasdeaf.gov
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kansasdeaf.gov header.i=@kansasdeaf.gov header.b="UzrgEMYw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22928d629faso51322925ad.3
        for <netfilter@vger.kernel.org>; Mon, 31 Mar 2025 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kansasdeaf.gov; s=google; t=1743437983; x=1744042783; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cvWYVHVAB20YX2Q8CJAVN3aq02swVzlmKFfkKtpc+lU=;
        b=UzrgEMYwrLk9krb3/X0x35iVhkaIT4f1X6RlNqOFtpq7Tib1v3fM4AbufWnhseYGwA
         RjWtwF5Nlx/vUkrXlwxx9pHymh16SN1Q2+gzxOmfeWQPVbjcPCalyQbGsSV7qTVOOnql
         oM6OLk/MzFHvbNo/EGMkD9PT3DKUqaLREx8P/YImwQ70+CAGNPmLbo6ZkMkL+7sv/lWO
         b1WJUOUwlY17asKv4pLo3b04KCulYEUjPLrkw0fqOy3OEPDTyjXLD22kOQreCBaoGmu7
         QlNHLKEgGSWctSgwFy+zHJT/Z2zF9lZpBPMlMR+y13P9a5YyFg49LvSkeomc6gpMme2E
         ZBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437983; x=1744042783;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvWYVHVAB20YX2Q8CJAVN3aq02swVzlmKFfkKtpc+lU=;
        b=WX0sxlF0G2J0sRCjr2E4oFbtxxtTJPOYXdW5rxdri0RxBICTQ1ZUlv+jeTok3U9Fi5
         G8m+0ynIt6R+KTcotbk4fxf5B95GIjDZJxkzibZbTrlIJFjC4xqZiw7Ha0+wivq/CyoP
         UQ98EqiJZhkvcdxMGXgB8MB+Dy/jIJlZmGDOES0U/VSZx01w1bw3LKEVAMwKw2SgbPgK
         aZCg//dD8sgHyew0dhDToiW8uRwIn7WUWt83JU+gHOLxsypT9dDlIZS981An0K+/h2ok
         iSKZgISKxuAwtVPRdljFYQnx8NFjTAwk9IO51bg503bDrQuYE6d2WYuJsR3FQ+oWFXcS
         BEEg==
X-Gm-Message-State: AOJu0YzIZU9Fn8WAl10G/FP68DBOEmVllKfYOoHcYdyyX2CZVlFj9cx9
	SDSlZLQ9RV9JwUrQr2jtU01rw+cZn/PN640vV+5kjVySk1uqQ1PdZTr0/BAU5TItaNdQVWeNjuh
	qmm3TVo/4ptVSbWm02ROOQgPH0VL7h90kxRoI3eVDXP5ujlO2zvmmNSOCbiL0HNL6FFRyu9xYWJ
	GzdqDf+kfJ67HG9y99aYNxUbEAko1YJKQu/U+OBQU=
X-Gm-Gg: ASbGnct1iNFohgSdm1pnh8uk3zV98DZATD5KLJjYUHHfnznXmQOQWn+iQ119PbIAwZy
	QEoRqipHJmUrRJ576OUQeYH1Ukn7Xhqo7KyFlYtk91P9YuQNmNE139GAerOytJj8lsZ8T3cIqQ+
	0d5SSYpKch89GJGtv92aXTRlbBhU4=
X-Google-Smtp-Source: AGHT+IE0nSfPLe7AvrehYwGDbQQYlisGNE6VcocFr2K5hjRt44T8nU1FbzUkGrX63WgpaD48yBtjGLPWkdK+3iMkLPE=
X-Received: by 2002:a17:902:da8b:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-2292fa028b9mr133428215ad.48.1743437983100; Mon, 31 Mar 2025
 09:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bradley Hook <bhook@kansasdeaf.gov>
Date: Mon, 31 Mar 2025 11:19:31 -0500
X-Gm-Features: AQ5f1JqisT0JjdAlgx11Lz0qKjDIkulM4cEKDPhcTKgYj6xT1OGI5cXuDL3SjpA
Message-ID: <CAPrh4R458ZB8C5-Zm52FsnyGQMQv2EBp-pvkQ2wcZSeHhtoeNg@mail.gmail.com>
Subject: Packets not traversing postrouting chain
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

I've got an Ubuntu Server 24.04 LTS system that is doing some NAT on
our network. We had an ISP fail and I'm trying to reroute traffic over
a different link, but some of the SNAT rules are not being applied.
The traces seem to indicate that the packets that are causing problems
aren't even traversing the postrouting chain.

On the LAN side, we have several VLANs. Some are completely private
addressing (10.x.x.x), and others have public addresses from ISP-B.
I'll use 192.168.x.x addresses as a stand-in for those public
addresses in my examples.

On the WAN side, we have two separate ISPs. ISP-B has been our
primary, and ISP-A has been our backup. I'll use 172.16.x.x addresses
for ISP-A.

Due to various off-site problems, ISP-B is down. We changed routing
rules and added some NAT rules to try and get the traffic working
while ISP-B is down.

Private addresses and some public addresses are NATing just fine. But,
some of the public addresses don't appear to be traversing the
postrouting chain at all.

I'll use 8.8.8.8 as a placeholder for Internet targets we are trying to rea=
ch.

We've gutted the ruleset to try and figure out what is going on, so it
is very simple and provided at the end of this email.

The issue we are seeing is that packets from 192.168.122.252 to
8.8.8.8 are not traversing the postrouting chain at all. We can see
the packets leaving the interface without NAT applied. We can see the
packets hitting the forward chain with the trace. Other traffic from
other subnets are being masqueraded just fine. We just aren't seeing
the packets from 192.168.122.x/24 hit any postrouting rules at all.

Any suggestions as to what I might be missing here or other
troubleshooting steps to take?

table inet filter { # handle 12
        chain input { # handle 1
                type filter hook input priority filter; policy accept;
        }

        chain forward { # handle 2
                type filter hook forward priority filter; policy accept;
                ip saddr 192.168.122.0/24 ip daddr 8.8.8.8 meta
nftrace set 1 # handle 15
        }

        chain output { # handle 3
                type filter hook output priority filter; policy accept;
        }

        chain prerouting { # handle 4
                type nat hook prerouting priority dstnat; policy accept;
                ip daddr 10.10.10.10 meta l4proto { tcp, udp } th
dport 53 dnat ip to 10.222.128.10 # handle 9
        }

        chain postrouting { # handle 5
                type nat hook postrouting priority srcnat; policy accept;
                ip saddr 192.168.122.0/24 ip daddr 8.8.8.8 meta
nftrace set 1 # handle 16
                oifname "mvISPa" ip saddr 192.168.122.0/24 snat ip to
172.16.169.201 # handle 13
                oifname { "mvISPa", "mvISPb", "vrrpISPa4", "vrrpISPb4"
} ip saddr 10.0.0.0/8 masquerade # handle 10
                oifname { "mvISPa", "vrrpISPa4" } ip saddr
192.168.120.0/21 masquerade # handle 11
        }
}

Respectfully,
~Bradley Hook, J.D.
Network Administrator
Google Certified Project Manager
Kansas State Schools for the Deaf and the Blind
bhook@kansasdeaf.gov
Mobile: 913-275-9982

--=20
*Kansas State Schools for the Deaf and the Blind Confidentiality Notice**:*=
=C2=A0
=C2=A0
The information contained in this e-mail transmission is confidential and=
=20
legally protected.=C2=A0 It is intended for the sole use of the individual(=
s)=20
entity named in the message header.=C2=A0 If you are not the intended recip=
ient,=20
you are hereby notified that any dissemination or copying of this=20
information is strictly prohibited.=C2=A0 If you received this message in e=
rror,=20
please notify the sender of the error and delete this message and any=20
attachments.
