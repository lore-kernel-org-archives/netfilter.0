From: Roberto Carna <robertocarna36@gmail.com>
Subject: Filter source IP with UDP/514 destination port and change to UDP/9000
Date: Wed, 1 Jul 2020 15:11:38 -0300
Message-ID: <CAG2Qp6uj10nb0tFcQBTGKJ5KcNhwJwJsRK3UKyceb0=WEF+nRg@mail.gmail.com>
References: <CAG2Qp6tcb1Ak=0utrF54bLLc5UEqFHWu1WhD9CH3KE3JAG-Q6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0ExE2KdJBgkO4lrv88zOzpt/9N1NRYHHxd0KEaNJkCQ=;
        b=WV6uTEr0FhuT82EdLCzHO9zJv9LO9G4fXIBEnPTHya8RpR3nCYayaSwRdXGDbxG53I
         rIdO+ijVeKtYHCRfGlxUjP30+NAN1UoC6IdgQzB/G3QXkr43BPd2TdoeFHz/lmskjVXQ
         i04+4v8Oh/NjTI/bfUZNMYKOwCHQyU7K9Xtk6yMqLeBKVOIBZyBgGtTfx1M4IuW0V3MG
         GtRsUCFnQfecF1FgdbGoPvSIaGZLXUF2tiA1qugAfMZdLpBkxes0Cb6jIGuiUQ26NQbN
         HpPIsHCax5dgoDfpk/HFGcE6/146MW43hvDlRnSLC6X6AyM8lVyKtbSteqKCW3PHxoV4
         dsdQ==
In-Reply-To: <CAG2Qp6tcb1Ak=0utrF54bLLc5UEqFHWu1WhD9CH3KE3JAG-Q6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi people, I have a log server with iptables, the IP is 10.10.100.1.

I have several network devices sending logs to my log server
10.10.100.1 on UDP/514 port.

In the log server,  I wanna filter incoming traffic only  from IP
10.10.100.20 to UDP/514 destination port and change to UDP/9000
destination port.

How are the iptables rules to achieve what I said?

Special thanks !!!
