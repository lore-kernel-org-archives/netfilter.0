From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] log flood protection?
Date: Fri, 25 Sep 2020 08:31:00 +0000
Message-ID: <a3a88c99-9164-f56a-6368-d59230c647e6@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601022716;
        bh=KsYvt/Ep3zoIYcubCbS7aPY+5PgnsLSR03Kbj06H2wM=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=dWCMslhNiCW/cmPVbKe8TBnTkB3sU1mxlRGqKWp5CQ0RQbWkaJ9Ya3uS3RbA3HqNP
         1VRZg/p6AJtkEW4bE7d0zNNRRn4f0veRYreKz8FHGl9x6fVR4tzTsPRAIxB6Tgxw8q
         SSh+fTD1E9ghTY1Fs0paY2H8FRDZrTP797PpdVZM=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

kernel 5.9.0-rc6 armv7l | nft 0.9.6
_____

Trying to limit log entries as a preventive measure for log flooding with=


log flags all prefix "foo DROP: " limit rate 1/second

however that does not work, i.e. the specified rate is not observed and=20
more than 1 line / packet per sec is being printed.

Unless missed it there is nothing in the wiki or man about it, man=20
(section LIMIT STATEMENT) only stating:

 >It can be used in combination with the log statement to give limited=20
logging

but unfortunately no syntax sample.

How to implement log flooding protection?

