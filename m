From: Kyle Sanderson <kyle.leet@gmail.com>
Subject: iptables doesn't function properly with x32.
Date: Mon, 1 Jul 2013 12:44:13 -0700
Message-ID: <CACsaVZJWLLYtfcDnbAWj6N_8mi5EHPvf7zND5Csyi_UDMj0Q_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:cc:content-type;
        bh=1hd9WQffDNl9AFNM7XiB3/IAMoYLEkZQWpo9emUZxC8=;
        b=b+X/C5QNUr6Lc3IgP6FOzNJ2J0ITRtof8iqyr3LNw9nQ6zyb7+aC28djCLS78rFAHz
         RrExnxzA2B6O4eXT1mLVNMp5rcNq1/mrEzIz2WmAEV3wqkfeejssANCRfkVcsKnfh6Gp
         w5glT+hewf8FLwZKbXHX3dE250RjIPXm3WxLasFt/INwVFtDHY2aDD/888RoN7hjreUF
         3mksysF4jvDe8inXA7yU2DsADqZ2ZTpCXT/gPQCWp0jNoFYdr0x+qx0GWLqlXHxBjBxQ
         NhxM7megLWYQuno0HhfRcaAU5xoOjihvYInrSI5vtZ6C1HRAi/gLJlANrUoK133vTSQp
         pRjw==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netfilter <netfilter@vger.kernel.org>

Hello,

I can't seem to get iptables functioning on my x32 system. I've tried
versions (1.4.16.3 and 1.4.19.1), however both result in the same
error message: can't initialize iptables table `filter': Invalid
argument.

Walking through the error with gdb shows the failure is in a call to
struct xtc_handle * TC_INIT(const char *tablename). The function if
(getsockopt(h->sockfd, TC_IPPROTO, SO_GET_ENTRIES, h->entries, &tmp) <
0) sets errno to EINVAL, which results in the failure. fw in #Netdev
seemed to indicate the compat layer might not be being used due to the
platform change.

I've tried various recompiles of Kernel 3.8.13 and Kernel 3.9.8. I'm
running iproute2 as well, this is all on Gentoo.

Thanks for your time,
Kyle.
