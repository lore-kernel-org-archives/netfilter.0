From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: multicast packets
Date: Wed, 24 Feb 2010 20:13:46 +0530
Message-ID: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=fnm8rnA32WntRS8DmhDWgYcbr028FETY70PuPpMai6k=;
        b=Rfy8lC7vSUzK4iN2BqPvxefhbp3WgS87ca9jQ95jALgJPiGOjk4rfTfep7/IGfnXQX
         EvnLBRSeZzFbPJgMuzcSJiSEpEV2BH2p+9cCOYCgCGgqvlJ3FiyWSPy4BwkHaMkgAm/P
         TtUJC5ZRGNGaKVdsNFjh66C6uVFp9F79+QDe0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

multicast packets are udp packets . But its flowing only from
upstream to downstream . So packet state will be always "NEW" . ??

my question is : whether we can see multicast data packets in
ESTABLISHED state ??

Thanks,
Ratheesh
