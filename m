From: Patrick Greiff <Patrick7878@gmx.de>
Subject: nftables
Date: Tue, 28 Apr 2020 09:38:28 +0200
Message-ID: <c8a517b2-3e1e-f7f5-53d6-b3e4daf638bc@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1588059512;
        bh=XJP3e0bpMoyHMNwhrgG5639sfgTYLvirLuvdOjZ1NL8=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=C1AFIgp+zJu5mIZAhKsJ90Yv485DV+1CQCJN/PF5y1Cf5rRRI79ALZTulAW+dMIb7
         HmHx3xmF2605UcOnW9PqotvB8o79SjvP4kiHNf+IzK4QhEsMP0n+7dT8bbW2zDSNax
         eJAzvdM+9RRp0AKIk8P5xOOItRbRPRBY7cjnJx2U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everyone,
i have a question about nftables.
at iptables i had a blacklist where i wrote in the ip that wanted to
hack me.
how can I integrate something into nftables? and also restart when the
ips are updated.

