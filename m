From: Bastian Bittorf <bittorf@bluebottle.com>
Subject: Re: Creating, editing, removing rules from C(++)
Date: Mon, 27 Jul 2015 12:25:43 +0200
Message-ID: <20150727102543.GK18695@medion.lan>
References: <55AEBC86.5010604@fundamental-software.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bluebottle.com; s=fe0;
	t=1437992094; bh=Wg6Oi2CLLiwgSCYM2B8I8qj3S4Yfl3bS5YZcvVNgm1s=;
	l=329; h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsMcHZ4VEf+aQcKePFKD8vbcbdsD3nRSuaA/ddXgM9UrTUdlITcJi06mMlwzTTPb5
	 5/RMyANFg3zw+dqKNieKOFIVC/eHObcghAKQ0ydysb71AfiRGwmvxT8yKnLtO+GT4m
	 W9n8PkVJqZrnrgudHxsT6+7PGSkjUf37Ljv96L1s=
Content-Disposition: inline
In-Reply-To: <55AEBC86.5010604@fundamental-software.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Delrue <thomas.delrue@fundamental-software.net>
Cc: netfilter@vger.kernel.org

* Thomas Delrue <thomas.delrue@fundamental-software.net> [26.07.2015 16:41]:
> Is there a way to interact with the firewall rules from a C(++) program?

http://www.netfilter.org/documentation/FAQ/netfilter-faq-4.html#ss4.5

i you still insist, you can e.g. read the source of:
git://nbd.name/firewall3.git

bye, bastian
