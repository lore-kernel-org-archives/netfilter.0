From: Arif Hossain <freefall1986@gmail.com>
Subject: after setting verdict in netfilter_queue packet is not reaching udp
 server daemon
Date: Tue, 13 Mar 2012 18:03:07 +0600
Message-ID: <1331640187.2239.10.camel@arifLaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:content-type:x-mailer
         :content-transfer-encoding:mime-version;
        bh=aKdP0ENW9tgCpLzcyXJGeAKs/IBlAnPvVbO9tXLM7z8=;
        b=L0MNrg7FwmqzPWwN93SCuFsxUhrF+IlIIxwqGe3DzTiANySwty3jHT6psxKhtoWKBE
         40j8uEi4C8pThyz8WbPdkwmGu2yP+ni9jd3uJg86xMAe/4aUQ9736hdEDBTw5a0JkXc5
         zrDo3bk65sO8/Bqdo31f6EREwz9JevPVI9B29/YQFKGQTFHzv1pOnbrZmMHItZoQk83X
         66SLs7Jm9wlYCNcOsVsLDRU3lHV9EiVJqMESIFk+U4fQSixECikA3C+i322/irH492/u
         VoXg7hx+O1c+ygUEGe/nW5SqQjcsOaUPJawY/H3PKfhwDZgGTAqANFeQYbuWoquqpeTo
         Ynow==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

I'm receiving packets from NFQUEUE target. after making modifications to
it i'm setting verdict with nfq_set_verdict. nfq_set_verdict() is
returning nonzero values indicating there is no problem with it. but my
udp daemon which should receive the modified packet is not receiving it.
is there is any way to trace it packet from nfq_set_verdict() to
udp_server?.

During development i have seen sometimes it does not work. if i restart
the udp daemon it starts working again. during development we were using
a simple echo udp server. it worked there more or less. This is not
happening in a full blown udp server(which is udp packet relay server).
if there is a way to tell what happens to the packet after
nfq_set_verdict()(i mean after returning from the registered callback
function) i can find out what's wrong with the thing.

Thanks in advance.

