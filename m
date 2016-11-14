From: Tarun Khanna <tkhanna@akamai.com>
Subject: regularly publishing stats for a flow in ulogd using NFCT_T_UPDATE
Date: Mon, 14 Nov 2016 10:56:48 -0500
Message-ID: <5b8b2708-2647-ff02-cf2b-dc2c3e5f57f5@akamai.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; s=a1;
        t=1479139009; bh=FeUKY0JYOGYYFQ2jtGW5/ForTL51ap3pYwfYvEXLAHE=;
        l=632; h=To:From:Date:From;
        b=wY8x2DVeD9tdmuZWxc9ImRdVGA2N4tlIgT0br5aHkUdiHEGDMX6w6xNIICHNNeN7a
         Ml4O+W7pykR6Qfb1EU/MTi9QIn0tYU41Gq7NtvaYvBfB9JEwHDhGxrde6BrncjiG/t
         KhiGAAjapAZURCjDSzKjzY4NAmalNtR6lQJZGW8o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am trying to configure ulogd, so I can get regular stats for flows
currently active on the machine. I tried  NFCT_T_UPDATE mask, but it
doesn't seem to help. I only get stats when a flow is destroyed when
enable_hash is true. When enable_hash is false, I get stats when a new
flow is created and again when it is destroyed, but not regularly.
Browsing through the source code for ulogd_inpflow_NFCT.c, it looks like
the stats are updated on NFCT_T_UPDATE only when hash_enable is true,
but they are not published. Is there a reason for doing it this way. Is
there a way to regularly publish the stats?

Thank you
Tarun
