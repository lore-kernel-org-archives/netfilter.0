From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= 
        <socketpair@gmail.com>
Subject: ipset hash:net:port:net
Date: Thu, 22 Jun 2023 17:50:43 +0300
Message-ID: <CAEmTpZGTbHcd84vA5VL6FfDc8+n+E0VMt+GpPkVLw5Vijp5iLA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687445455; x=1690037455;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h8i9k7iv1RVJET/Cr/juNPiq2j0xcHXuSj+X6Emo+kQ=;
        b=TR6LpoiLpjDe4ONbyiH/m3qEgmQB3C8zRmRRQZUq3ZyMsIWg9cr1iem7vnC6S8DsFS
         dIxVIm3xtHjWFOKe5Z7/UUHd5LEYQbXeeQ+DDxb6aIGtp2ZhQAcjs7nXDg1DMc6P1O/5
         QPpkFNsEWP60Zg1JJdJqlCPYOqCUncsMySfoR1jkuh3O6Wnmpc5ff5WQsKhuRnctC4Sq
         hLKBxrPheccHBRGUlEAytiJa4mzHz7m6ZRUWr8srJS2xCi/HRVJUfK9DC4kNWE2dRXDt
         u7qNtBv/IuEKEtIONF8psmei4YIYstPhxF3srTq6/VQRqW70/MkBLvuCg8+eXRULXYQP
         uIhA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, kadlecsik.jozsef@wigner.hu, kadlec@sunserv.kfki.hu

Hi everyone.

1. In the latest ipset, adding "1.2.3.4/0,tcp:0,1.2.3.0/24" is not
allowed. I would like it to be allowed. It should match on any TCP
traffic that matches source and destination.
2. The same for protocol number 0. I want  "1.2.3.4/0,0:0,1.2.3.0/24"
to match all traffic that matches source and destination.

These requirements come from the real cases, where an administrator
adds rules to control access to his networks.

Is it possible to make such changes? TCP port 0 is not real thing, as
well as IP protocol 0. So we can give them special meaning in IPSets.

although icmp:0 is not so clear in this case. Possibly allow to set -1
? as protocol or port for matching any ?

-- 
Segmentation fault
