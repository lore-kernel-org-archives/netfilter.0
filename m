From: Vladimir Nikishkin <lockywolf@gmail.com>
Subject: Matching metainformation cgroup fails on input, works on output.
Date: Wed, 08 Dec 2021 17:07:39 +0800
Message-ID: <874k7j31no.fsf@laptop.lockywolf.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:from:to:subject:date:message-id:mime-version;
        bh=zhut/4F1pTVEOg3ySCEKfCt4OKP4KOXa+DdNWhBLDm4=;
        b=pY9QWs70dKimZVVIpguLuciVL3U6nJY/Vn0hQjVecov4jnEMTW6SUSf5nUZNe/9Zvt
         YBn4sk6MSyyFSMBjpv77PhH1tjE7JvEjpgEiRk265Jh62utJmGbACQcrtodyJ2zAjE13
         IfE+h797jQpDefZPlH/it/kVjwic1IdkiPyBzW78DbZQTipaJ0vgEy///7nUzJKiQZiu
         +BsvrklasAAaaobxXFI9EglV8QYHQ9isRr2LjwR8ypRkUbIafOFLLFYtGjZm7U67fPlL
         tC4aCtawEw/wSYihT1GsuWznIl2fOn+OYghaF/geWk/G4TBL658rpi0lmkWcXLf0QYis
         inWw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, everyone.

I have a weird problem!

This is my nft code:

```
nft add counter filter test-icmp-output
nft add counter filter test-icmp-input
nft add rule filter OUTPUT meta cgroup != 0x001000 ip daddr 8.8.8.8 ip protocol icmp counter name test-icmp-output
nft add rule filter INPUT  meta cgroup != 0x001000 ip saddr 8.8.8.8 ip protocol icmp counter name test-icmp-input
```

Pinging 8.8.8.8 works. The packets are visible on tcpdump too.
The cgroup id 0x001000 does not exist, so every packet should match.

Still, the output counter counts the expected number of packets, the
second stays 0.

What am I doing wrong?

-- 
Your sincerely,
Vladimir Nikishkin (MiEr, lockywolf)
(Laptop)
