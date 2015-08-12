From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: unknown option "--map-set"
Date: Wed, 12 Aug 2015 12:42:24 +0530
Message-ID: <CAA5aLPg=UhPp0wODZc8qtx3FwnReM+3Qs4zFm9_8Fgap8LMvtg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=bIwehTlbYPpUuj8aJhUBiJCfY8r+haLQ99k8Bpw+ZPQ=;
        b=Q3bCaWe/KlPLmY7R7YlqNkCvDcffnRSpUCdnI/RlhNvHr0RtuA1fr44/zEdqHWz8jK
         nTcVO7bhGJMv2wWWFBbO43SnXP/4TBhsJg+07eI3D6lgwrpH5uQ8j86zaVlC3nOzolgR
         yBsRn3PbCghJpRPW8vo7iZHqhSqpNRvIDcmZOGvYJkABj+3M6RxD/tT8IynJvGL7q40r
         9XJiBEWFnf/fm4xcINe5xcwR7qq2uMotaahIx1jqOm2OgYF8UoOqjXUfRPJ1S8Q5xD8A
         yOhUc7ko+cyh1S3c/FUKIdy4LC0QsqeIn0xFn02R2/qiAm9eUDJhAeOINEQQdQXHTOai
         F0cw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am running sl6.3 (i.e. kernel 2.6.32-279). I upgraded the kernel
using elrepo to kernel 4.1.4.
I downloaded iptables-20140916.tar.bz2 i.e. Sep 16, 2014 snapshot in
order to test new functionality of skb-priority added in ipset 6.22.
Prior to this my iptables version was 1.4.7

I installed ipset .6.25 and create an ipset named test (ipset -N test
hash:ip skbinfo)


Then I Installed above mentioned Sep 16, 2014 iptables snapshot

now it shows my version as 1.4.21

when I execute follwing command
iptables -t mangle -A POSTROUTING -o eth1 -j SET --map-set test src --map-prio

it gives error
iptables v1.4.21: unknown option "--map-set"
Try `iptables -h' or 'iptables --help' for more information.

prior to installing iptables, i execute follwing commands  to stop
iptables and remove iptables modules, so that old modules should not
confilct.

service iptables stop
rmmod iptables_mangle
rmmod iptables_filter
rmmod iptables_nat
rmmod ip_tables


Please help.
