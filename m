From: "Karthik V" <karthikv.vk@gmail.com>
Subject: Error when IPRANGE used on 2.4 Kernel
Date: Thu, 6 Nov 2008 19:55:52 +0530
Message-ID: <13c27d00811060625v7da1b917t37b0dd8a84c58f71@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=ElHdhBREj3fyWrT2dlC9Dj1niDTIHD76ppiNKwMg7/M=;
        b=n1mY7peDMThT7bydeE4cRTZn5HvVJmEaQCyM7zeSarUoAeDVALUjcXuTIIM9qJSw7n
         n2nQxBPruTZ5KZ6QXx3hqFlF7fuBR/HpRULF8Brik/5KdpA2nMXYRNLZeQt2NG+A95Z2
         s+L3C7DKSOKN47K+8kfc9+sftwmlGu/Wr/x14=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,
I am faced with a weird error for IPTABLES version 1.2.9 on 2.4
kernel. The following command:

iptables -A INPUT -m iprange --src-range 192.168.0.0-192.168.0.0 -j ACCEPT

- fails on 2.4 Kernel with Error: No chain/target/match by that name.

- But the same command is working on other systems with 2.6 kernel
viz., Fedora Core 6 Desktop and OpenWRT router.

As per my initial analsis,
- if there is a syntactical mistake in the range, the library
extension for iprange is getting called. So it would not be a scenario
of iprange extension missing.
- If there is any issue with mismatch in range should the above error creep in?

Any help with this regard is welcome as I have reached my wits end with this !!!

Thanks and Regards,
Karthik
