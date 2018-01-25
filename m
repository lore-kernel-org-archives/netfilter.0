From: Renaud Drousies <renaudd@gmail.com>
Subject: Slow 'connection refused' on REJECT rules
Date: Thu, 25 Jan 2018 12:31:40 +0100
Message-ID: <CAEHu7ET=6osh9-Njwdgqo4RW5jqGju++hHZEV-spZjZ61fiuXw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=P2Pe1Qp5kdjYPcDBPaQj6Z8b9eB3utacEBzAqPTEBPY=;
        b=awrgang/v/lsUcBup8agLw+vN4SVIQv0+Lfq3mNdGMhBFJNEnI+BFrbfiw+En8q4rp
         9KbdsdV5l9zrRisl+pSJXjOTMCoeOIj/tNi9NZMOeZancN3eObLjv8+JWdJaCsNbxrw8
         uBctkEvbhCSJcRvLBma5tDyB4mlA8NsDfaCj0prKkuSDPuW+uifOYhNw/P9xoCWFsK/d
         nTd6akfcKpRCjs4zZM7HoWAsEzJs5BLt/ZM9eV6Kbnda5rf9yobPvsqzwUu3PoZKAW8W
         C2EwfUXw1Q9nbK+miKrdtFDZWvBa/zpNknsde29t4r/CRAsiKe8PZw0JNbYrdRTQplc1
         6Uzg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I would like to force a 'connection refused' when connecting to a
specific host/port and to do so I'm using the following rule:

iptables -A OUTPUT -d 10.99.12.15  -p tcp --dport 27017 -j REJECT
--reject-with icmp-port-unreachable

This works fine except that it takes around 1 second for the reply to
come (I've straced it and it's really the call to connect() that
hangs). I've tried the following rules on multiple kernels from the
2.x, 3.x and 4.x branches and the behavior is always the same.

There wasn't any other rule in any chain when these tests were done.

Would anybody know what could cause this delay and how to address that?

Thanks!
Renaud
