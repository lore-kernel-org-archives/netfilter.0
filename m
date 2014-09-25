From: Craig <craigslistjobapp@gmail.com>
Subject: Challenge: subnet wildcard or range
Date: Thu, 25 Sep 2014 12:00:46 -0400
Message-ID: <CABHqCscbCwzxoPS7wzQL0ige9mp_FYW3TGpaCFyRAyyj03wPWw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:content-type;
        bh=heeqAuNeP8DwxtPDSDzbwfhd0OVF6KxVRHcEbBsnzGg=;
        b=GLbdYxRepA/u8Xn1s79LBZHmSsabm6zjSXiH0sfIQ8eja63pD2KCutkHOfhZCOqsQ1
         QwvmsJg9pRJxsyjyIEApvpVGK4nY/mWtlRykq2ayEOJEBSjrG0PoRvGVGLVlpHiZwgc7
         eL+WX1KbjnwvfxG5TgG6pVq92K3QLuSpd9DQeBvSvknSGBrMkOuyKX3ZgGnYUT+jOR3k
         QGHVkDoe4OLw6ZrqEzLhWi4eiUJLkUwWWyBIpA7ZtRA4aZopHBZPGedrVMphSpIMW/wN
         6VcG+wCVd3ikvUyB4tuZ2fq7VbFNA1cyaQWBdsLLjbYMRhC7N4m5Som8OCxApAkJGrIu
         tmOw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Lets say you have different sites 1, 2, and 3:
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24

Now you want to allow certain traffic to particular IPs on those sites.
10.0.1.11/32
10.0.2.11/32
10.0.3.11/32

Couldn't you specify a range or a wildcard on iptables like so:

wildcard
10.0.*.11/32

range
10.0.1-3.11/32
10.0.1.11-10.0.3.11

Please consider that the last octet must be equal to 11.

Regards.
