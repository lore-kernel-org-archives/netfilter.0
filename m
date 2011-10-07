From: Prashant Batra <prashant0100@gmail.com>
Subject: Working example for NETLINK_FIREWALL protocol
Date: Fri, 7 Oct 2011 10:29:27 +0530
Message-ID: <CAG+XuE4feu1qKw4HGu5vivJRrFaZyFHFGRw362QvPJR4TGkNig@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=mT91pKhc0kVnJ1fYOTN05uiR2YG/p1F07nc2XkBezgQ=;
        b=pS65+5G4Eqsg1S3R12noDYRH35L7WCQO6V9GSx0nWiz5yJJXC/QGkrO9/lBKTycqGK
         8wYIwyScgHnBXAs1IJ5PZh62h/IuzNJcp9i2XdDCBRzwU0xWdEr1pCEacEyi8CxMugcQ
         juKIxCOXd+/JGtnjkJmrR+ZAR0bEuHT7ULo2g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Can anyone help me out with a working code sample for receiving
filtered packets using NETLINK_FIREWALL protocol in the user space.
I have tried out the things in "http://smacked.org/docs/netlink.pdf"
But these are not working.

Any help would be highly appreciated.

-- Thanks
Prashant Batra
