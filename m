From: Brian Bostwick <bostwick.brian@gmail.com>
Subject: Re: dnat port range to single port, udp, between two local machines
 on a LAN
Date: Fri, 3 Feb 2017 11:04:32 -0500
Message-ID: <CAM9he-WzEXUf-oWa3yV6-raXudF6ce2TYn2qFbiq4xXDVx_5nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=XgHQ88w2RIc4XbYIk/QopmjOQk+67U5+aYL002CAN5I=;
        b=PxBgAwRfURLA39xkfb/08pybjbXdgNhCSiyZc99i4X7oWchFx8LkvkE+/gZKsT+evK
         1+ITnVnmlxzbPgUVj6Q/R03o/otrPKjdQZctWA+/cC5D4ILd0h7fr08hVqydCoJH0/uP
         Tk1bzyPdewZmKjazioA39Ha2+dwaGOxYk0d+WxpgZSbFAiweegSJgAx+2LlnCejgiyO7
         rgwT5OOvWMbZboDaVU8iFdTp+c3ZGsaNDr8HZET88Z7mGxdml/p1vJqtB5mjLrAwUyhd
         dJbWkyTBjX5V2vpvpBXHe4NqdhgieItZPXZjqIv34byylteAr7oaJUkbpqA253fibsrT
         c1tw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thanks for the help! I realized that my goal is not attainable because
I do not have control over the initial connection. I believe your
suggestion would work if that weren't the case.

However, I came across this picture, which seems misleading. It is an
example of how not to use NAT, which is admittedly what I am doing,
but it suggests I can change the destination. Can anyone confirm that
it is just meant as an illustration of why this scenario is improper?

http://inai.de/images/dnat-mistake.png
