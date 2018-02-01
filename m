From: Eric Grunt <gruntblue@gmail.com>
Subject: How to get rule handle when adding a rule using libnftnl?
Date: Thu, 1 Feb 2018 19:02:09 +0300
Message-ID: <CADB9fJF-rpjBo=DXeO7sxeH-9U4y5LytGWba5nUG_xfPkar-qg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=6DTwIYiTrLRy5oVPE1rteuYP6BhIqccotqSE7j+pMOA=;
        b=VcutBxIq9a1p5psq+KtkGBcjw91sX5GtZJkValOPVyasZTS/1asRc2o14OH/ZMM38U
         8Dy7oVYx/TPlZzwr3tytBmcXGtYR8CfjYDuk367BRuKKjX4+yI3UNyll4vJ9pChLpAY5
         xc/St3EdAxAw2XNgExGXKbw93Yqqp++8MGBQJoMGgxNsbXtp9sYiyO46DWYWNL/Tt2rw
         rGNR3rHbDfei0z3K94pJ4Wxp09WjXsheZfnjzFEhg+PhMkc0eTTZmUPrBkmoqA8uRy0i
         4R6SszCnW5VB1fxgl9/I1Wzvlqy1xx5DGMSWnsLGXbE3QOJNSkDDyGpvOpu5fajhmsOY
         25sQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

After adding a rule, one needs it's handle for eg deleting it again.
On the command line it's aquired via the -a flag (nft list ruleset -a),
but how is this done outside command line, programmatically?

As far as I understand, the handle is assigned by the kernel,
so it should not be accessible before the mnl_socket_sendto() call.
Can it be accessed using mnl_cb_run() or is a separate netlink command
needed for this?
