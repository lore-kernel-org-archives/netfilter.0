From: David Buchmann <david@jazznetworks.com>
Subject: nfqueue: Get pid of socket owner
Date: Tue, 8 Nov 2016 12:32:35 +0100
Message-ID: <2AA7640B-E6CC-43FA-A0A2-D057FC224235@jazznetworks.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jazznetworks-com.20150623.gappssmtp.com; s=20150623;
        h=from:content-transfer-encoding:subject:message-id:date:to
         :mime-version;
        bh=9Q9Z9KMDaZrkX3lkQNMvIFFHjHD1OIKwI/wP6OcXBMU=;
        b=fxyONoGVWVnFpx0dLCA4D8gz5Lnepi8jkbwEhw2tMjs90+xMyc6x95vZZ5U7k0b9jX
         p361tlkGq6zo3y8DXGKtqt8wJwBnOuJkqw19vEUwftsS4BXalRJkpspGwy/sfkbc7Jvn
         KWt8RHpbHx6PlXSOjPOxOxnumSZGGCBYy1oOPKk4HotgOIzZka76BrmdBuG+qS1efu8g
         Sy+KQCgOeuQ8Z5HCcbESLvC1v0LiI5t9aCzWdfkr/tlVcayluqGpTFSt9qEbsjCixCvY
         g42VoyLMHOQxCN9RH2xRdP8GSGbTUFzr4DMmao9BZw8zre3Ia9qTcEYoyvgz8k+gbhWn
         8wJA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I've started work to add support in the nfnetlink_queue kernel module =
for
sending the pid of the process owning the socket triggering nfqueue, and =
I
want to add the userspace support in libnetfilter_queue, but before I =
get
too invested in that work I just want to check whether there are any
objections to such a feature in either the kernel or in the
libnetfilter_queue library?

=
https://github.com/wuurrd/linux/commit/79d12e93ca2a28c0939937a5a690943311e=
4bf6c=
