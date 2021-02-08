From: Martin Gignac <martin.gignac@gmail.com>
Subject: Unable to create a chain called "trace"
Date: Mon, 8 Feb 2021 10:37:47 -0500
Message-ID: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=HV/I7nPUwWg81Oajs+5KZioUnZ+aw7luwm1Xuao3q5k=;
        b=SVNtNuiHW4ld76j9eYEYDLjIInj2i6yfucP4h0cpkRIMhC/I87RAQkvma2zLbJS20x
         tkFO+lc7mRT6OndK7cqIwnteh+85b0pF/WkHzL8wa1JPhk2tjPyzKyuL1NDUryquD1Ig
         dCsBjXgWn1tcSOJuBtLGEVN+nmYwL2GUH47YiIhryw+iiqG7vm8wEwrZFWGsOekSHxQA
         XCZ/vpM1AVa4DDiVS14ooMjULZbRtgE9ZkLrXYimADcVfxufHF/6lY936A5qPy3O3a4G
         kwDQky6B4EVwTbsjrBHfy791Y6Db0C6ixPPPQusQ690y1tGmyALkyv2jonkd92R1hHvg
         kxkA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Out of curiosity, is there a reason why calling a chain "trace"
results in an error?

This configuration:

  chain trace {
    type filter hook prerouting priority -301;
    ip daddr 24.153.88.9 ip protocol icmp meta nftrace set 1
  }

Results in the following error when I try loading the ruleset:

  /etc/firewall/rules.nft:40:9-13: Error: syntax error, unexpected
trace, expecting string
  chain trace {
        ^^^^^
Calling the chain anything else doesn't give this error.

Is 'trace' some sort of reserved keyword? I thought chains could be
called anything. Can they not?

This is on nftables 0.9.8.

Thanks,
-Martin
