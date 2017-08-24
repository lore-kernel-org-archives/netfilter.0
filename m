From: Ben Higgins <bhiggins@gmail.com>
Subject: dup to gretap
Date: Thu, 24 Aug 2017 10:45:00 -0700
Message-ID: <CAMk_S4h-5x+gSBSE64TU11N1fr2iRswDXdvQ9yNgScQ_85J2pg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=lhcG7QD7LlP6l2orch+O3uInNFFazICj8ACaFr4+wKg=;
        b=bfvyBTnK0dlDl4r8mZzAqx+sNWsIUz5Ytla+DMifeb18/BRbBfsztWqhZDxHw7tu9r
         w0mJbkXd2d/fM0kenPFzSpoJ3daf+l50FoozLaWvEWevLK5D/MF3/Tbd9RCP+3WanYiT
         RzPg9MCjYj7l/prKbvepSahV3KnVWP8uSdmkyvjtHJ/GTNhvRbDxYcTaA1j23uJjKW+r
         WdrZlVo2aHRmTR3pHG0f8/s7RbEUSJSKZb3JQ2Wg7WLRysCVpbtWK/F/vabr81vBaGHf
         uyO2oa+RBQTgnnIwWSge4vbaBmFaR0P2Ae49Rqc1SAvzLkwWzvCxiW51TTLLmdEYAkSV
         85ZA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hey folks,

I was playing around with the dup functionality discussed here:
https://wiki.nftables.org/wiki-nftables/index.php/Duplicating_packets

As an experiment, I set up a gre tunnel device (i.e. `ip tunnel add
foo mode gre...`) that sent packets to a veth I'd previously set up. I
created a rule to dup to this interface and did a tcpdump on the veth
to confirm that it worked, which it did. Great.

I tried doing the same type of thing, but with a gretap device (i.e.
`ip link add foo type gretap`), but this time I didn't capture any
packets. Darn.

My goal here is to duplicate the whole packet, including the
unmodified Ethernet header, encapsulated in GRE. Is this possible with
some combination of Linux devices and nft?

Cheers,
Ben
