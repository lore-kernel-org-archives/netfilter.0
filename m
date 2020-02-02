From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables v0.9.2] hoplimit mutually exclusive with with saddr/daddr?
Date: Sun, 2 Feb 2020 17:13:59 +0000
Message-ID: <af5c5ee0-ae0b-1832-73a2-35c34ed7f844@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580663640;
        bh=f/Kg4KdurKVOn9Vy1YXLNZI53TOrGKR9ERJ0DwsBURk=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=LGN50aIQc4hpbC/Dfj4BD5QSEKE6CLbGFJOgoar+WbE2hCs4v4FeohKYErGHYG+31
         H/N+60yiK5l9gzRlzszwIN7KSZ8c8zpX0tYKrBAysJ1A2yKqqcLh0qI2a4Od4UbHFt
         KdA6uzMZ0VzSJqY5BM0g2cNmZVspbTeWv24/I/Vo=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Trying to implement in the ip6 filter table / chain input:

iif eth2 ip6 hoplimit 1 saddr fc00::/6 udp sport 547 ip6 daddr fc00::/6=20
udp dport 546 accept;

However, that throws

Error: syntax error, unexpected saddr, expecting newline or semicolon

Is this expected since hoplimit being pertinent to the header whilst=20
saddr/daddr are not?

