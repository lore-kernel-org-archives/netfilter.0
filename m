Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="b4gQ+T9R"
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EAAA6
	for <netfilter@vger.kernel.org>; Wed, 13 Dec 2023 07:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702482513; x=1702741713;
	bh=ts91so7LwrhbuFCgQWJGQoEbzuYBAmDgjdYZ0DltHtY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b4gQ+T9Rjnri6qrxyu/IprzoDGgIFZrFNgCz07WyPvh1gi7P/8xVFpxrIVFSedW6t
	 FIE333J8W0roTQsz8GmpEbJWPLY3E9enMa4dy7y2d2MQe8ruYPCb1ZEhlUdY7qPLdq
	 S/K0DrsZe3qHZQUErLSCgSKhku5acvN170QHXD5aJqfr2toUkYSw88JHYhJmqBbORW
	 nnv5Zl1+nfoJKK3QqQNa7lg3j5avSo7USKbhomu+0y+U8ihauy/Mp3szJo4mTb2UAe
	 8fSzwwNx1q0jRoTrHTeYk0k6tY8nniiqUy1VpzTHJTUMSwEyIc05zCSh9aHWqKpu/N
	 plYegCOjHviqQ==
Date: Wed, 13 Dec 2023 15:48:21 +0000
To: ye4 yu3 <ye4yu3@outlook.com>
From: Eric <evil.function@proton.me>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: =?utf-8?Q?Re:_=E5=9B=9E=E5=A4=8D:_nftables_problem_consultation?=
Message-ID: <X0U3OYDrZPaZhXRC3CS0pWaiYN7q9_seiIuaK6u7nQ05lq7ojtp0bIGhYbYfzKtIuZFapf0UgPtb5Dn7o6MaKpapTqTrslGBUenfWQOtgiw=@proton.me>
In-Reply-To: <SEZPR01MB504716A57016E9B43D326034CB8DA@SEZPR01MB5047.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB5044183AE828E0A504D4014ACB8EA@PUZPR01MB5044.apcprd01.prod.exchangelabs.com> <zg20uRQPjgqpXOGX2T-AaXxj14SLjreS1CgEezKdQ8MOE_u_H3zY09OM4qYxEjKF_LJW6yrotM0eChbOChTIYLH_PnO7YmemsBXMvdz1b0U=@proton.me> <SEZPR01MB504716A57016E9B43D326034CB8DA@SEZPR01MB5047.apcprd01.prod.exchangelabs.com>
Feedback-ID: 48716100:user:proton
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 12th, 2023 at 22:56, ye4 yu3 <ye4yu3@outlook.com> wrot=
e:
> As you said, I used tcpdump to check the status of the ip packets,The rul=
e to set the port cannot be successfully executed, And i see the ip packet =
appears to be damaged in the tcpdump (they no longer have source and destin=
ation ports).

That sounds like a bug (or by design?), maybe netdev tables don't know abou=
t L4 ports?

> Finally,My some jobs require the use of egress hooks to modify address or=
 port,Do not use prerouting/postrouting hooks because they must have state.

Could you explain why the packets should not have state?

You can remove the connection tracking entry from a packet with 'notrack', =
but this must be applied very early in the packet flow.  If your intent is =
to avoid adding the flow to the ct table, egress is too late for that (you =
would need to add a rule at or before inet prerouting at priority raw).

https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_connection=
_tracking_metainformation#notrack_-_Bypass_connection_tracking
