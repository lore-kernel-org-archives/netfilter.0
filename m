Received: from smtp-outgoing-1701.laposte.net (smtp-outgoing-1701.laposte.net [160.92.124.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB87E785
	for <netfilter@vger.kernel.org>; Mon, 29 Jul 2024 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722232849; cv=none; b=n0ruxrBuvSIay+e1rI99HNkephfzd1HOSmZrH3jAYx16Bd+Nyo04WZUjK9/mOmHHvl0GbGNrkj+odSX1NYbREW3CdhZ+vMJjO55wIF71e19Ta/7RtNtcep5Xc8Yqima/a3Sxv9OInMe1vTxWyS2KweD75kDk/uZNO5jfKx+6Cak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722232849; c=relaxed/simple;
	bh=9Qt4Zs4qL0CN0taIlVUurlt7tC6K+YEc8HsAnKXdMt8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RLh3N2pdOqjyi7yFVo9EOaDJg9KQZ+PbvK8ISOBjV2SUczHobriS3fF0z0K0saWOoITI+h0Dvgm1sWOjFouKDA1KYLDxk2tWm/FzetnUJqfL8sDbOX9w+0MQArpixlboJMXQLMgyTq2yx5747NTm9s1l5wnuIEL6CALNzFyL6NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=dBJOoIHP; arc=none smtp.client-ip=160.92.124.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="dBJOoIHP"
X-mail-filterd: {"version":"1.8.0","queueID":"4WX9kz4FLzzdZLg","contextId":
 "b72f77a1-547f-4cab-bd03-7aaf87c7909c"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4WX9kz4FLzzdZLg
	for <netfilter@vger.kernel.org>; Sun, 28 Jul 2024 20:59:07 +0200 (CEST)
X-mail-filterd: {"version":"1.8.0","queueID":"4WX9kz3B82zdZLZ","contextId":
 "d1d17ba9-d71e-4105-bcf9-31fbdef71a81"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from B550-AORUS-ELITE-AX-V2 (lfbn-ren-1-1305-231.w86-229.abo.wanadoo.fr [86.229.152.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4WX9kz3B82zdZLZ
	for <netfilter@vger.kernel.org>; Sun, 28 Jul 2024 20:59:07 +0200 (CEST)
From: Kevin Vigouroux <ke.vigouroux@laposte.net>
To: netfilter@vger.kernel.org
Subject: How to set packet priority in the netdev table?
Date: Sun, 28 Jul 2024 20:59:07 +0200
Message-ID: <87plqxuyv8.fsf@laposte.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1722232843; bh=9Qt4Zs4qL0CN0taIlVUurlt7tC6K+YEc8HsAnKXdMt8=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dBJOoIHPh3O+KVxgmFgO6NoMOvmqzPYkSniaqhsuWNvPu+BDD//MEQR4D195P6z2JTG8g0gDmWTE5+RLIxxxfBTSAncWMUiyjvtRmDwgTcHBysFCfY3Lf0Uby5HLplYvVXKqhDddr/RgTZglypCqkSVqhz19vCRKck/DtdLav5a3Cy5BGVqsRgEUj+p9VnkPpCgaC7ZuHl7czl3oZ72fwB+nS+dXLmCDB6/5vBXOfnaJojORKPzaBjzs3E3t/IdWgpWqCK1tHGhPYBSCzAtH/8IwGaL6rtFf5HkZE2hic3IuNCH0KqvT0RncwTSw2Rb0msPwIlh7KM8+7AYfppD7HA==;

Hi!

I don't understand how to set the internal priority of packets encapsulated in
802.1Q frames.

#+BEGIN_SRC
table netdev filter {
    chain egress {
         type filter hook egress device eth1 priority filter; policy accept;
         udp dport 547 meta priority set 0:6 ip6 dscp set cs6
    }
}
#+END_SRC

tcpdump shows me that the DSCP in the DHCPv6 packets is modified but not the
PCP (priority code point).

#+BEGIN_QUOTE
    NETDEV ADDRESS FAMILY

    The Netdev address family handles packets from the device ingress and egress
    path. This family allows you to filter packets of any ethertype such as ARP,
    VLAN 802.1q, VLAN 802.1ad (Q-in-Q) as well as IPv4 and IPv6 packets.
#+END_QUOTE

Source: man 8 nft

It is unclear which interface I should use?

eth1 or eth1.832 (VLAN 832)?

I've asked for help on the OpenWrt forum but they haven't been able to answer
me.

Source: https://forum.openwrt.org/t/how-do-you-set-packet-priority-in-the-netdev-table/205371/4

---
Best regards
Kevin Vigouroux
