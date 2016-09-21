From: Khawar <shehzad.khawar@gmail.com>
Subject: IPSET: programmatically implementing ip6tables snat rule including
 ipset matching
Date: Wed, 21 Sep 2016 17:11:26 +0100
Message-ID: <45031426-e79d-d687-ddae-2e6f9219ff9e@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=hS3fiOgIx0ErsZmKPFJG4j/AVAyxLdLIt1jYNZP9bkc=;
        b=EFtxdxn7LzapLu3PqjDyUhYtw/kkTvACNUD3+ILHRkJCAKKzCSZiLuIjckl5FmH5EB
         r+0hGMC5Fy37TBIPTc7RdVIL39H5xGNz0lpi6OPBbR5hEbRXX/uGv3Se5juJVzNoopA3
         0Htj1ykQ3yez/dN4YA5pUKXxmj79l7b06D9B4NtJNKqxbJsuTZF91a7quTAdfqN0ZZ3K
         qvOc9VAWnDqwK946V8ULxUpb5IBUydJK40fAlj0gpqnDuwd5sTxg5JnhZDXq9uO8Df2b
         IOlqz0kEK1RxBcLiTCgY/pYPyM0GTFUcuzpyteWkGGieSEcz+dKKSJWa5sgQKEKXsCND
         FV+A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

It is a newbie question, so I would highly appreciate your time.

You can also view my question here 
http://unix.stackexchange.com/questions/311373/how-to-programmatically-implement-ip6tables-rule-including-ipset

I want to implement following using C programming

     "ip6tables -t nat -j postrouting -d 
<ipv6-address-in-destination-field> -m set --match-set xyz -j snat 
--to-source <ipv6-address>"

What should I take into account?
I have already installed the ipset userspace and kernel modules. I can 
easily use ipset specific socket options etc which mean my compilation 
and installation is somewhat ok.

Thanks


