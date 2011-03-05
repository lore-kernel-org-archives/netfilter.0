From: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>
Subject: Re: Analyzing DNAT traffic
Date: Sat, 05 Mar 2011 11:19:12 +0300
Message-ID: <314641299313152@web72.yandex.ru>
References: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1299313152; bh=yZx57Z5GCXmxgp2GbNt3rcaEaSGyNmEyYt3t4wmSXx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=SfuZPVJ7cXtiun4UYuq4oMB/byg+DFQQMlyB2xuAU+EtnfuEW5CWtsCngArBRP/Bi
	 qiBrnk0Ln1hIrHkfDsSjvho7sZAulxKt0AST+TvVRBkfOW9Gf4K8lyBe1T72LYtoV+
	 JxVwao9UzrJWukg+KM5toybT+wh2kdsIZGNwbE3I=
In-Reply-To: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex <mysqlstudent@gmail.com>
Cc: netfilter@vger.kernel.org



04.03.2011, 23:13, "Alex" <mysqlstudent@gmail.com>:

> How can I analyize this traffic to determine if it should be forwarded
> on to its intended internal recipient, or if it is completely
> unrelated traffic that should continue to be blocked?

Could you please check, does such packets match the following
rule?

iptables -I FORWARD -m conntrack --ctstate INVALID -j LOG

-- 
wbr, Oleg.
