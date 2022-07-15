From: John Howard <howardjohn@google.com>
Subject: REDIRECTing many ports to one leads to 4-tuple conflicts
Date: Fri, 15 Jul 2022 08:15:58 -0700
Message-ID: <CAFH-bQzpRd+ng4=cEdJgOSApSQVbQPN1pT_Q7RZd3DFNJBCs6A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=mKEMXiKCO6JuO7fVZHZHsckj7L0ufoRBis8crsSvlNA=;
        b=L6eSxBlIXAs7WQEL55JpWOISV7yfJHshhfbUxVmXGqVKOoR/EPhlYbIhDKqYN4UfHu
         r2llsY0Rz838XPpnrK236CItvJEmFSx6tHRl29m6Zuwp1rCYWelh+q0dYbkqD214YU4U
         hFD/UacSk8KYal58U8Lp+cFI538hAQFmBhqswS443U1KWYomZfaaHwindcpyJwaI3qo0
         AXq1LSG+9NAW36J+MBssy7/O+QJrRBtKsGAawdsHWhFIXTr7FjVm5BUMZ0ej9GLNFhF4
         hmcWz1wZMgD+vbshWrf/z6QALGIEiRKVGmtCFV+BXivbo1QlHuBDEILgSW0hPGhz4xRl
         4scw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

We have an iptables rule like below:

iptables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports 10000

The intent is to redirect all traffic to a single port, where our
user-space proxy handles requests. This works in most cases, but we
run into issues when a single client makes requests to multiple ports.
Because the destination port is redirected to a single port, we no
longer have that as a distinguishing factor in our 4-tuple. The result
is the incoming connection will fail and a Challenge Ack is sent to
the other connection with the same 4-tuple.

One workaround we have successfully used is replacing TPROXY with
REDIRECT. However, IP_TRANSPARENT is not viable for us due to the high
privileges required.

Are there any alternatives that can address this issue?
