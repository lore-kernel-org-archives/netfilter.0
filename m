From: "Charles Romestant" <cromestant@gmail.com>
Subject: Port Forwarding .
Date: Tue, 8 Jul 2008 17:19:48 +1930
Message-ID: <5078d3df0807071449k730a33cxe31e0b34078f5794@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=S7uRfdJLCNmzEfy98pud/VmllF2iycAd3iFV/OzEz4s=;
        b=MZYivBHvn71KyYzLqXIX/ZBwQiLV2BDMMJKxxncBXooNaMHNtbAuDqruVOIZ1x86ku
         Onl8QU0hz1F48fNDmNZuXtysPc+SwqJoOyBJWzZ77nVNgobo0gcc7lcEIwHQWa+0EhDa
         z3bBRZ3oxwtZmvlHVNDJCmQ7Q73YrrT1cBVUk=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "<netfilter@vger.kernel.org>" <netfilter@vger.kernel.org>

Hello to all, I write here after having tried to find the solution to
this for about 3 days and still no luck.

Let me explain the setup

                                                         eth0           eth1
10.0.1.200                                  10.0.1.192   10.0.10.2
                                       10.0.10.1
        |______________________________|__________________________________|
     A                                                             B
                                                                C

so 3 boxes, A B and C

on C there is a web server, running on port 80, I want to be able to
access it through B from A.

So basically the ruleset should be on B if its port 80, forward to port 80 on C.

have tried these :

iptables -t nat -A PREROUTING -p tcp -d 10.0.1.200 --dport 80 -j DNAT
--to 10.0.10.1:80
iptables -t nat -A POSTROUTING -d 10.0.10.1 -j MASQUERADE


no luck, using iptables -t nat -nvL i saw that the first rule did
match since the number of packets went up, but i still can t see the
web server.


I also tried this :
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 80 -j DNAT
--to-destination 10.0.10.1:80
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT


did not work.

Any helo would be appreciated, thank you in advance,

Charles.

BTW : a little more bg info, this is a box in which i m implementing a
Single Packet authentication sistem, so the INPUT table s default
policy is drop, also i have a usercreated table called SPA which is
called upon as the first rule of INPUT.

for the sake of the forwarding experiment i flushed all tables and put
the policy on accept, but bear in mind that i will need to use that
type of restrictive ruleset.

thank you.
-- 
Charz
