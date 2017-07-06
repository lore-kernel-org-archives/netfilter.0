From: Joel Krauska <joel@krauska.net>
Subject: Userspace HMARK sanity check?
Date: Wed, 5 Jul 2017 23:37:03 -0700
Message-ID: <CAG0G1BKnfUH1dp6KvJR_LrCurnDTQv_jwbZfG25tBbwCyEtT9A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=krauska-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=kDPl8NxYkYEM+aECIawC1zux2R65dyyuV3Om5pIkqUk=;
        b=AWRQ4cmhdcRY/DwbE4xk5HlhXKrHwQouZBcu6w0tZO4fgZZmizkVi7oe46Sr0FJjvq
         d6Fz3w/4MXWDVl/POrKUYyjL2pfWcZdI9BqlnjXvo03Wr5Ic2qlpaAG5QCTihgjDYDae
         OwaZgUUc001ZE5ktLkcGwnogLtLBkEsMIsHjE0AbRP8tPtJojrlYKuQ8UMV++XccTxOZ
         B/FWoBfJEvXo/zMmytU7qbDmYXpMxBWipIJaDdlrq92Lw4WkBX5lHyn5VHU/Eoqq0RW0
         eFxh9CJGBCDMwKl5hJF34kcsd4KEOTpG577GVrMgU6n13HwhSTjEmJpMWh4dSJu704KJ
         w0Hw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

After spending too much time trying to be clever with masking, I
recently fell in love with HMARK. [1]

My use case is simple, and I only need to hash on the src ip, and the
balancing has been excellent.

But now I'm a bit at a loss because I'm not sure /which/ MARK will be
set for a given source IP.

Is there a user-space level tool or other technique that would take
the HMARK options as inputs coupled with the required fields for the
tuple, and give the bucket ID for a given mod?

Much appreciated,


Joel Krauska

1. https://fossies.org/linux/iptables/extensions/libxt_HMARK.man
