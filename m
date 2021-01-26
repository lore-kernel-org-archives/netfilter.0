From: Andreas Schultz <andreas.schultz@travelping.com>
Subject: parser problem in range map?
Date: Tue, 26 Jan 2021 16:02:20 +0100
Message-ID: <CAC=ZbaS3H09px4EfJQx5gaWv9zthVxD3LQHjue9vfsjcfG_zOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=travelping-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=D0/OpGBTqjlfDFYtLVdQbYYpShEu+wjHiC7e9+zt2rs=;
        b=xoRTpNuNL7CN57leq8sTNU/W8CBKbkeOWuraGhfDh2WKyJYs8S+w0YNHN1ziY6AXYU
         cMHL1OPgFbnVbHn/OWGNwKzDdOjccdAe33nOcP7nFpHKiBxoKmsMJwyQSkWHCU9A1DUb
         ZAFjdxWiXiK0On3hiDPW73fwKkDvIq6fqy7gCoCsXViyj/LEp7q0II1suyIZjBL3Ty9X
         APBhT5eyZxcH0ZVi4eF0KyVrHIBNceedx/IssOcc1bgRcONth6kNRBq1UKY+nohaABtS
         cyNKCiFCVbCHqNkrHC2rr03ngqEdu4/hBFwzY8XdgEg4kuQrFOsvKkXCGdytadLZ+lfn
         0z+A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

The following simple ruleset fails to load on nftables 0.9.8 (from
Ubuntu 21.04):

#!/usr/sbin/nft -f

flush ruleset

table inet nat {
    chain prerouting {
        type filter hook prerouting priority -100;
        ip daddr set numgen inc mod 16 map { 0 - 7 : 10.0.1.1, 8 - 15
: 10.0.1.2 }
    }

    chain postrouting {
        type filter hook postrouting priority 100;
    }
}

It throws this error:

# nft -f test.nft
test.nft:12:40-42: Error: Value 100 exceeds valid range 0-15
type filter hook postrouting priority 100;
                                      ^^^
test.nft:12:31-42: Error: invalid priority expression value in this context.
type filter hook postrouting priority 100;
                             ^^^^^^^^^^^^

Is there something wrong with my expression or is this a bug?

Regards,
Andreas

-- 
Andreas Schultz
