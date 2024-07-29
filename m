Received: from smtp-outgoing-1802.laposte.net (smtp-outgoing-1802.laposte.net [160.92.124.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7B23CE
	for <netfilter@vger.kernel.org>; Mon, 29 Jul 2024 05:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722230812; cv=none; b=UNvYriX9HPh16NLqVSd5pcmg/7mLVm2Zs8SwdO3/OKAoxOQdq559bar+wXAvKDvgCuep+DOs4ZnOnd91UnhIUmip89tQXkXPhYB+BFZU24TUCgg//TDY7dkVo7f3WMpZrcLxW0gcy4EZLG/qoAhLw7FYduIbLTmD/2Du3aDv1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722230812; c=relaxed/simple;
	bh=Aons+u6U3tW33/H8ntiEvD1fu0I8tObH4sSxs25GW0w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HzgH81l/1Q5BHkXjSXSduPpqIvJeFXfv+5ijYGHJpSQTeyvTur5PmkV3689FnmLnf63vJ1recNTYmFMa0Vn9xYVHyyI0sYpeVWJYeo238ldBBKnEyTbTRkWi+tR6maoudvs6er3TcGdQpYRwkGoYAzvEAyFqlh6NJpVsBRR5jtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=RR+7lOCM; arc=none smtp.client-ip=160.92.124.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="RR+7lOCM"
X-mail-filterd: {"version":"1.8.0","queueID":"4WXRg81wGXz1spV8","contextId":
 "6cc17114-47ff-4205-b928-cd314d740753"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0111.laposte.net (SMTP Server) with ESMTP id 4WXRg81wGXz1spV8
	for <netfilter@vger.kernel.org>; Mon, 29 Jul 2024 07:26:44 +0200 (CEST)
X-mail-filterd: {"version":"1.8.0","queueID":"4WXRg816lhz1spTs","contextId":
 "cf321778-032a-48bd-b91a-917df9051872"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from B550-AORUS-ELITE-AX-V2 (lfbn-ren-1-1305-231.w86-229.abo.wanadoo.fr [86.229.152.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mlpnf0111.laposte.net (SMTP Server) with ESMTPSA id 4WXRg816lhz1spTs
	for <netfilter@vger.kernel.org>; Mon, 29 Jul 2024 07:26:44 +0200 (CEST)
From: Kevin Vigouroux <ke.vigouroux@laposte.net>
To: netfilter@vger.kernel.org
Subject: How do you set packet priority in the netdev table?
Date: Mon, 29 Jul 2024 07:26:43 +0200
Message-ID: <87msm0wyy4.fsf@laposte.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1722230805; bh=Aons+u6U3tW33/H8ntiEvD1fu0I8tObH4sSxs25GW0w=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RR+7lOCM3mSr/Z50L3cIPrfca5cDQXDlRgs0YemRGHxOn0Thfb4dk7xhvCgCizHoZFGz3D+hi+BFyjkAjZIc5CsVOEN3CYd+l15qlvnV91IjQPD72pnGtV71q4bPlnZmULeQmdlTbRagCo99+6s1yX/s2y/CeCWAfXfcxkyClCWEmmtHH0m7U0ywF44ilsoovFsyES7xL5LoE6YKOPs3VvpQSwSvxSy0Izxdz1hGz7mxn035pvkHvBkmSJiVz3zhNHnfosPZ72tveJWC7OJDd6IHWtSpmmsGMk1JAnueoP7iZhc+CVIcLmsM12cGjvndEBiG+t+rRUtD8Q0As05ljg==;

Hi!

I don't understand how to change the internal priority of packets in a netdev
family table in order to change the PCP.

My DHCPv6 client sends Solicit packets on VLAN 832. The PCP of these packets
must be equal to 6.

#+begin_src
table netdev filter
flush table netdev filter

table netdev filter {
        chain egress {
                type filter hook egress device eth1 priority filter; policy accept;
                udp dport 547 meta priority set 0:6 ip6 dscp set cs6 comment "Set CoS value to 6 for DHCPv6 packets"
        }
}
#+end_src

In my tcpdump capture, I can see that my rule modifies the DSCP of DHCPv6
packets but not the internal priority, as the PCP remains unchanged.

Should my egress chain specify the eth1 interface or the eth1.832 interface?
Knowing that I can modify the DSCP of packets encapsulated in 802.1Q frames by
specifying the eth1 interface.

"type filter hook egress device eth1" or "type filter hook egress device eth1.832"?

Note: I don't think you received my previous mail. I'm sorry if this is a copy
of a previous mail.

Note: You can see my original post on the OpenWrt forum: 

https://forum.openwrt.org/t/how-do-you-set-packet-priority-in-the-netdev-table
---
Best regards,
Kevin Vigouroux
