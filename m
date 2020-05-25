From: "ad^2" <adsquaired@gmail.com>
Subject: Raw Expression for DNS name?
Date: Sun, 24 May 2020 21:02:29 -0400
Message-ID: <CAPdGaa3XsTm1rjUFjUoqKG=fO+9w+xOWvxTuQRL8D+3QXk73fA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=l94FQY27/TY37Pvt1Fk7SFoEADkUVQZEC59c/95Q7xk=;
        b=B8onkvt9FJxmVTk1f+3HWU+/s43imYYd+uU9pJIQQkcrTyMj/FTbbRx6nTyF7snVI1
         caXWBwxrytfdMUP5sXyCISh3K647zgnJu5euKEoCVq/o31q+WijVQpNJZcmxUgeP+4/v
         JUmgMZ0rlbzTZnOTi52gr52DLyKyaa7WpgI3bFQFvdwPKNVbJ7JxOmPl6qqkzRV2zd6K
         cXwlugigd+BcE22r1875eSvpSjXmLZKSM95UMn5EYwvBwd2ngx6tcKjfxXjNUsX5owT1
         XeszHGN+tFaOhtGBWBYCgvFIjWHyiDlPpvGpWMi+0KxNkYKakcU6kpzkuNEb6W1TcV57
         0/rA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Does anyone have examples showing the use of a raw expression to
filter DNS domain name information?

I'm trying to DNAT a packet to a specific DNS server's IP address when
the domain name in the query is a match.

Ex. if the domain in the query is yahoo.com then redirect to 8.8.8.8

I am not sure on the hex syntax.

What is not working:

    add rule mytable prerouting meta l4proto udp udp dport 53
@th,160,120 0x057961686f6f03636f6d00 dnat 8.8.8.8

and

add rule mytable prerouting meta l4proto udp udp dport 53 @th,160,120
0x057961686f6f03636f6d dnat 8.8.8.8

I used the hex values directly from the packet capture.

Thanks in advance.
