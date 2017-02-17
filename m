From: Darshan Ghumare <darshan.ghumare@gmail.com>
Subject: Can I ask Conntrack to send stats my to own process instead of
 dumping to /var/log/conntrackd-stats.log?
Date: Fri, 17 Feb 2017 12:06:24 +0530
Message-ID: <CAOr=3U_Sbz0n9tYAwN5bo6-BLLy1OR8cYy74X3LpZJJNx_DkCg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=mw/GYqepyrH2i/QTtuVLkQxP53i69i5kpU2lx2GyFRQ=;
        b=cZyQQntiCjn5R+g8wEX4CLADA93cDDHj8yb0sfsA1uigaVRIC1uolZqJBV1f4EQWkW
         A9f1Ik8xfHfYijLyJO6Yhf5ZiES08J5a7odkylvohjcuFTaOev9ZYy7OjMZ9BnR9SwgJ
         aoF7rgs91IgyL0Pru434rTWpxT35A1LI3nULY/IozgWU9t7cOVounIlMU6kFwu8juvkv
         aqeEasnnZhGk3+mZbbmy0TDpfqxDP3Dn7xt3Wi1j1pWNyoD4Y9Q9PCWGbNNQEIK2+SA+
         4N56o3rOmYt75LLo5AVEdXi4W+avkf4y6waDBDUMq6UZfq8HIJr2remQZ1vzhFjUpQKT
         poUg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Is there a way wherein I can get the stats into my own custom process
so that it can process it in memory? Currently, I need to parse it
from /var/log/conntrackd-stats.log, which is written on disk.
Please help.

Thanks,
Darshan Ghumare
