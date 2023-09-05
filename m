From: Wayne Bao <herecomeswaynebao0811@gmail.com>
Subject: Is nftables thread safe?
Date: Tue, 5 Sep 2023 14:34:56 -0400
Message-ID: <CAH+uSBUVJuUEdGyHxqSUNkLm2a6TWUfECHfJZy53ZXiNCkxOuw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693938907; x=1694543707; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HoFby6/hmNhE1CdGCBVDL78vuptl7oQTEc3CcMgRKTk=;
        b=O34cz29hq88WldfOcTdzpq5F541q2Yog1Gr6lsam0AGQqyO7n0rMYnguJsH6g2ecHr
         //0frxNfgJNL4vKfNuhRTvGfY/dQiGdN5VKAI5cQLxW8p1HnvFWgakT6uScORhuibTD5
         n4CNdecZrqVR6t2SBIWr39Xncf2qaiWt1vX2Ex5tNRDqNiMVrDJZUEeZbZjcdQcpTQez
         boadMt4lxGXUElve8ddcgSMP8XFH3rSZ7NcUEd/bWUw1DYK02fGHDwz3704f7t5SDvGq
         HL6y1Txq1aAgOC5kKjXbwP2LbXs2a1eOFE+LESoQD4c/lYBh+sC8O35lnX+R9dIP2Wck
         KJoQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am using https://github.com/ansibleguy/python3-nftables which I
believe is a copy of
http://git.netfilter.org/nftables/tree/py/nftables.py?id=e760d200a4b9cd31928b68a1f2f882157344351e
. I use this python wrapper to add and delete rules to nftables using
json. Are these operations thread safe?
