From: Flavio Poletti <polettix@gmail.com>
Subject: nf-queue.c as an example of libnetfilter_queue
Date: Fri, 12 Apr 2013 15:38:39 +0200
Message-ID: <CAM-TR1qfrCA-SvkfpNbdFr9dYTpc53FmL4WOvzxJs9_M3f6H7w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:mime-version:from:date:message-id:subject:to
         :content-type;
        bh=PrhTM0mxpP9450cH9EslZBFj+6TuAL2SL+m9l7EdjOo=;
        b=cT6KZt/P7XJnDRikunp2N3NOVwKvtPmGaofnFCPAoeAVir5rHXO4UYi6oZkLakmVSx
         4C+NRHzejfua0Ul98hyXbwGJKSzf+Y+PdEX3CB74B7x/sthcETeiijP5AK3LoIhpRD58
         m0nHDZUzQJGwE8YuW8TsmWyxKGmgM3g9TXV6i+mMIV8Fdq36+EonajQFkd0UAfu0oueM
         9Loo2VqLUZTzkklG/6GbGfoIpgoAkhNTWrMSnJ0oPnMntSjvyQApe/MD568iVjiNwCLD
         mvh4W3upZOICq0VsXzT8rpptE8g5g3FuPmbHFT27AGUCySllk/2K6e/ekikKbHd0OUnE
         yEwg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello All,

    I was curious about NFQUEUE/QUEUE targets for iptables and I
eventually landed on libnetfilter_queue.

As documented by the doxygen stuff online, the library provides some
functions (e.g. nfq_open(), nfq_handle_packet(), nfq_set_verdict(),
etc.).

On the other hand, the example nf-queue.c program in the examples
directory does not seem to use these functions at all.

Is there some place where I can find out some examples of usage of
libnetfilter_queue functions? Are they deprecated and should I go for
the Netlink-based solution as in the example?

Thank you,

    Flavio.
