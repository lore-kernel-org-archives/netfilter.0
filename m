From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Automatically maintaining unique list of addresses
Date: Wed, 19 Feb 2020 09:44:51 +0200
Message-ID: <ab8bf7b2-d135-2e4b-b9a9-7c917f113ddf@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582098292;
        bh=r9K2yEP1Qfzieb5ZHnL9kpx9a6m7M+bYHgvaAOnQQg8=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=LwYx2kijbDX/qhzZlmh93o6LZdt/9I8LNhUuO/aQ64+TcUJlRYeU+lJIumrjKZx9W
         pV4BAfa3vOzE71mWCieffdD6foZ5HVeduYXmhWFeOqPcg9znSH2a5wHHFm/TDqrN7b
         snMXsOfiiksMLsGQS//1tFXzjq7gaGxlXpOVsQvs=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

If I add an IP address multiple times, I end up with it in the ruleset
three times.  Is there an easy way to try to add IP addresses such that
they aren't duplicated?

/Lars

$ sudo nft add rule ip filter4 input ip \
	saddr 198.51.100.209 counter reject

$ sudo nft add rule ip filter4 input ip \
	saddr 198.51.100.209 counter reject

$ sudo nft add rule ip filter4 input ip \
	saddr 198.51.100.209 counter reject

$ sudo nft list ruleset| grep 51
                ip saddr 198.51.100.209 counter packets 0 bytes 0 reject
                ip saddr 198.51.100.209 counter packets 0 bytes 0 reject
                ip saddr 198.51.100.209 counter packets 0 bytes 0 reject
