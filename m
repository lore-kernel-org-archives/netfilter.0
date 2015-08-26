From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: checking mark values in iptables from ipset ...
Date: Wed, 26 Aug 2015 13:14:24 +0530
Message-ID: <CAA5aLPgf23fABFe6JuRxcoSoTE5=+bKiEeM+sSr+d_qBcY7B8w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=MfmvuW2Ov5KsAnTlxfVUPWDWEDSb/Ly5wpJ5tBJ7kEw=;
        b=l1tFiab31Fj3K7oUNuhoL9N9xCxBmGP6k91hs6Mkeude56bqSzjWITqO8cjE4N7A7G
         ZEJ5NQy9riu5The9ZsL3Ca3bXOCxXh+kfB/OgRbloT4A5tBCZQgWPOYL5M6coT6HV/eS
         rXBS0VAl8kHPT3OY4PiwNty9PKBRW1GTmg9FJgMi2N32scC60xKNBx57M5ejbJ2umskc
         nw1JbKFikPAGYz2NJhBMoCjC7nXAFNPgi89ABFtTSac44JaJ48wesmHAYTVNfxJnS4ee
         O4YM+ucfoc3MmeYABIfgvibm6emMOevCisLAtHl582jRHaOs8TwWuBzVWWk6OQsnfu3G
         NlTA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Since ipset 6.22 (Courtersy: Anton), we can store skbinfo in ipset
alongwith ips, etc.

 Is it possible to use ipset to check existing mark on the packet and
then use Map-Set option to select the SKBPRIO ?
