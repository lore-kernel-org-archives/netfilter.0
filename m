From: "Richard Hartmann" <richih.mailinglist@gmail.com>
Subject: iptables, NAT, DNS & Dan Kaminsky
Date: Wed, 30 Jul 2008 16:53:31 +0200
Message-ID: <2d460de70807300753h6673017i29374763ca9f763@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=q4c5RSj2rVsT3Ak6RX1X0cbh2CJULkVUb9IRVZvqdBk=;
        b=YOWQ+MaxZ45Q6BErkpT2WkFSbSl8s7aL5F+iUMiNkwRLz8Kv6LTbffLxpbuX2wds6j
         cQvSXP0tiGROhkpnn7pNgmtbjMzmDgm41ZkBYnJa1pnQo6Ucb7F+XNadL7fTEbLWpBqF
         FcQU2uffwvx9wcWc9PaInYymy9E1dY+vG60VM=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

as you are very likely all aware, Dan Kaminsky uncovered a major exploit
in RFC-compliant DNS caching servers the successful execution of which
relies on port prediction/guessing.

After quite some research, I have come up with the following facts which
I want to cross-check with you guys so I can be _sure_.


1) The --random target for SNAT exists since 2.6.22 to allow 'fixing' of
broken DNS servers in your NATted LAN along the lines of

iptables -t nat -I POSTROUTING 1 -p udp -s 1.2.3.4 --dport 53 -j SNAT \
--to 1.2.3.4 --random

Is that correct?


2) Unless there is a collision, the original UDP source ports for
requests are kept the same. I.e. boxes within the NATted LAN which use
random UDP ports are secure and neither the 2.4.x nor the 2.6.x series
of kernels will make those ports predictable while NATting the packets.
Is that correct?


3) Ever since a commit that went into 2.6.24 [1], UDP ports that are
NATted are randomized by the NATting forewarder, anyway. This means that
any DNS lookup made from within a NATted LAN secured with iptables to a
DNS server outside of said NAT is secure by default.
Is that correct?


Thanks for any and all input. I am sure many people would like
clarification on those points.

Richard


[1] http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=32c1da70810017a98aa6c431a5494a302b6b9a30
