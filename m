From: Murugan Venugopal <muruga86@gmail.com>
Subject: Issue in conntrack udpate cmd for UDP -- "conntrack -U -p udp -t xx"
 updates only unreplied connections
Date: Wed, 11 Mar 2015 17:32:40 +0530
Message-ID: <CAMVHObOzkWxn2ivJsT=R0xdT59wj2y09C7cxGYhh+Rqcnwz0kw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=kVy/igbUW/Y7yh9blmkusvXcl4G/2z+MkYMpe9vxtao=;
        b=EIpmdCHo5RXPdMxwDobgRWUfHsw/DWkBCmeE3431unaetCPOM0RKR8czg0vU/MYwg1
         t1SIYmy8RRGQB9mRx+cH+ZSMLxm1VGUJ1doaAiYqywXMZ72j2M1H3sEeF4TmejI+lNiZ
         X1y+JgubYkJbbBRCnmcT/NdeJkshPVQsQZvw9F+JIhK58fCqdTY42UskOmfeYobMJJZu
         xC82anpCQsbGpDpEowRADCNZPze5SLTWcD491l51LV92KNq445qr25hvpYiAc1tC0gJW
         4wBigwOGfZOwz849JPFatmAI1jrC6MmLlHuxYvqdiZXMO0Yd9hGIxfef7TBlIo7eLcve
         O8SQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I face an Issue in conntrack udpate cmd for UDP.
 "conntrack -U -p udp -t xx" cmd only updates unreplied connections,
while ASSURED UDP connections are left out.

# conntrack -U -p udp -t 60


# conntrack -L -p udp | grep ASSU
conntrack v1.0.0 (conntrack-tools): 23 flow entries have been shown.
udp      17 598 src=125.17.98.97 dst=8.8.8.8 sport=33029 dport=53
packets=5 bytes=340 src=8.8.8.8 dst=125.17.98.97 sport=53 dport=33029
packets=5 bytes=508 [ASSURED] mark=0 use=3
udp      17 598 src=125.17.98.97 dst=8.8.8.8 sport=49407 dport=53
packets=15 bytes=900 src=8.8.8.8 dst=125.17.98.97 sport=53 dport=49407
packets=15 bytes=1635 [ASSURED] mark=0 use=2

Packages used:
conntrack-tools-1.0.0
libnetfilter_conntrack-0.9.1
libnfnetlink-1.0.0
iptables-1.4.16
Linux kernel 2.6.34.8


Please let me know, whether there are any reason to skip assured
connection out of updation. If possible, how to update assured
connection too.

Regards,
Murugan
