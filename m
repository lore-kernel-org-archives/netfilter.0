From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Proper way to ipsec filtering
Date: Sun, 17 Apr 2022 08:37:47 +0200
Message-ID: <878rs48bb8.fsf@alfa.kjonca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1650177468; bh=pG2oWTRwDdupWzFYgRn3HTzyYpBzeUjUjfFb3O1Tqow=;
        h=From:To:Subject:Date:From;
        b=eF4yEL4ymTPGKuJHaYVDtJykLmM4tHWg2+9jtDgrB0T9SasPYhPpuS3w2l656phyX
         mRhw4LGoYoKEwbuTa9FDQ8d3WF8vhYeKhy7lyBlayO02Me9zRpofff3TwlUqOsDL5U
         D9fNi5FoPV1U7tCSZ/o1rkT31oy6jAx467otxEvo=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


What is the best way to create rules used to ipsec traffic filtering?

So far I have bunch rules created per reqid like that:
table ip filter { # handle 13

chain INPUT { # handle 1
                type filter hook input priority filter; policy drop;
                iif "eth0" ipsec in reqid 1 counter packets 100672 bytes 11492891 jump ipsec-in-1 comment "ed19af3c-f504-11e9-b59d-00e081736ba6/1/in" # handle 326
                [...]

 }

[...]
        chain ipsec-in-1 { # handle 323
                ip saddr yyy ip daddr xxxx/24 counter packets 50871 bytes 5614784 jump c1 # handle 325
                ip protocol ipencap ip daddr zzzz counter packets 49801 bytes 5878107 accept # handle 324
        }

}

And insert / remove rules from INPUT  (and add / delete ipsec-in-*
chains) during connecting disconnecting clients.
This was I configured when I migrated from iptables some time ago.
But I believe this is not the best method for nftables. So has anybody
suggestion what is the best practicte to handle this situation?
I tried to use maps/vmaps but reqid cannot be use as index.

Am I missing something?
KJ

-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
