From: Chris Cross <xcross59@gmail.com>
Subject: netfilter/iptables dependent on kernel version?
Date: Wed, 6 Aug 2014 17:09:52 -0400
Message-ID: <CANadqDe2xxtt8An5SRt+wT_dRXWXvgAnGHHJhKXdtX43Asc-1w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Hdsod/VMNODZfx40BBAB8Xoc2ZzcnCnSAddVPfecFQU=;
        b=mwVvsKSE8TyBBpcJMXGiJ+GzBR5I3yAnRuJKLtjN5YDTQKK2wHxhdYKdQ0S4ZqJsgn
         YrVBjE3POq7e7T3iPeRn+/xakUJPt9ldMMIvFFP1QaXWgdm+OmYay3YUMQ7vRuHRlZfq
         WZzz6Z4PR4GnegPBSLAZ8y7RpDmTOOspU+JvZF93C7V6d6vXJCjJtp0fVaY93vkVQnCL
         uzliW1lPNPIi2OIlbs3BkFrluqpqDjjMZmWxphRFw3OIcqY/9W4LaJTkR4JIvxQKExZ9
         TBCxX0WZxWbjsV7Zyb44os76dVZu5CMH6ElquKjK+7UaD6G6ZkkwYMQVL+XCKlhWc1ry
         sPQg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I have a naive question. I'm attempting to run a user space program in
a chroot that execs iptables within the chroot. The version of
iptables in the chroot is 1.4.7 from and the chroot contents are built
from a distro using kernel 2.6.32. The host iptables is 1.4.7 and
kernel 3.2.0. Is there a dependency between iptables and kernel
version that would cause the routine use of the older iptables to "not
work" with the newer kernel, i.e., to cause unexpected or unintended
results?


Thanks,
Chris
