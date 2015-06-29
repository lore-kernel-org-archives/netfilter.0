From: Garret Kelly <gdk@google.com>
Subject: xt_mac and NF_INET_POST_ROUTING
Date: Mon, 29 Jun 2015 11:15:24 -0400
Message-ID: <CAAUC4VJhEAUpeHtducZma5QHtAtTANdEN-4aRHWYY6kt+R3tRA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=feOHPDDz/ff9TU8bkgDTCUhNlVnwkjpQvqsG2dmvXkI=;
        b=l6tj6MLic+GKeD28wdTWwgW+9NML2lCZriH5XYXgSAdz9lEL68ghjOzP4UP18yTVIh
         fNMBjf4DL/+qmqAYFZ5jOrZ+OvRWfztmqnOdLx4BDz8m3zV6Q+Gp4OFXb5FOauj4goNz
         0bwTvJv+NGOaqg+nSLY0e3eHYHhJKNqYtxsxohurs9WyyNl1ysOSO/XmD+4o9A2ASgTE
         tTjPoI5AC9UOj7ei9fi4fM+cV7lkElCrnfPagQ9Hn7Xb1wnYqbnymvSlzy/UvwXE+yWT
         WBZfAZnZlUE7SZnxWxal3hU/mejauXYq5z2m6W6sE/QpnrPLPpotht0FfNTulQiIekqk
         AmWA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is there some technical reason that xt_mac can't match in POSTROUTING?
 Or is it an oversight?

Thanks,
Garret
