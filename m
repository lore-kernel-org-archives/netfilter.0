From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: -j DNAT doesn't accept nonnumerical port
Date: Thu, 25 Aug 2011 16:31:28 +0200
Message-ID: <4E565CC0.6050207@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=m+OxpJoaXd7kPZQ98ceqdKODSSo42FoUVPpJx3OUeok=;
	b=e/Luwfxbr2OcsunAKDHEqU9PXPxEeptAHLoXiwKa8VZbQ82cxuK7wY3gdEYVZo+58rI8etZKAFUlZ3RuCbJb3LOBS0drAUC18zqreDhWQKVMGWEQfqp+N6cHNhYj6w34;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello!
Iptables accept such line without problem:
iptables -t nat -A PREROUTING -p tcp  --dport pop3 -j DNAT 
--to-destination 1.2.3.4:25

Destination port is defined by word. So i wanted to use use the same 
trick in DNAT but i've got:
# iptables -t nat -A PREROUTING -p tcp  --dport pop3 -j DNAT 
--to-destination 1.2.3.4:smtp
iptables v1.4.12: Port `smtp' not valid

Is it intentional behavior of iptables? I can't see any info about it in 
man.

Regards,
Marcin
