From: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>
Subject: Re: Analyzing DNAT traffic
Date: Sat, 05 Mar 2011 18:18:06 +0300
Message-ID: <514701299338286@web59.yandex.ru>
References: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com>
	<314641299313152@web72.yandex.ru>
	<AANLkTimhvRGUd-_tb6C10UH8c-cqzcaQFb-OeamMgeuA@mail.gmail.com>
	<alpine.LNX.2.01.1103051538150.6933@obet.zrqbmnf.qr> <AANLkTikUyPPHcUv9XRPBmyUDX1SQO-SSvyS-d09VutGt@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1299338287; bh=y2ILqefa9/TxecCV6NgzeQI5nIk+TRthn57bIyCgYIE=;
	h=From:To:Cc:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=iq5noCDgA38Psioua9LV6XnE1BA4fO7l1YdQJ3GMCoJdyLhEfQp6DQMdYEF3MKG6k
	 K/SYqSGHkaxQcFEOHU02e4K1QzV2jEXlvk3rPu6P/lp3uGZPtfVaIYRJw1bgtUUkF5
	 pHKMHMFOljAEfqz6Nv7NwBTgrNmKhNpTuALwcMPA=
In-Reply-To: <AANLkTikUyPPHcUv9XRPBmyUDX1SQO-SSvyS-d09VutGt@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex <mysqlstudent@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org



05.03.2011, 18:13, "Alex" <mysqlstudent@gmail.com>:

> The last two are just regular requests for access to facebook from
> another PC on the internal network.

This packets can be out-of-order or duplicate packets with FIN flag.
They are not connected to any conntrack entry, so there is no way
to do NAT transformation for them.

-- 
wbr, Oleg.
