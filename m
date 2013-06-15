From: Alex Flex <aflexzor@gmail.com>
Subject: Quick help with stateless firewall
Date: Sat, 15 Jun 2013 17:38:47 -0600
Message-ID: <51BCFB07.3060408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=bbaV6a8AbWZ2t/i8JhSWkmW2W/gndc5u97vTRkvRDmg=;
        b=Uc0Q9QoY8UEbvwUKUCcba5DlCVXB26ggE66pPk8FmiiyX5FAo0a1gnt+GZtgkpGtL1
         LbiAWBhqow8oRfZfKYRgQmMfgJYCGQo18OpOUO0jqoujSYdOeSGM4MxPEP/0Y5mGooT3
         8+dIjnv/uAnvltOesCy0lCta+ZKZNXLRUFAgLPucVGeFMGWPTK0Een0SRYimn21C4PS3
         4lS7cFPMx3BSdRI8LY0GPuIgOLCn+4kcBJfG6/5r6GL86PqVpak0QFlgph1DKrJx2qE5
         81Mbc4bfJHg2uqKNAYGQdtRO8uLfhHo/HST952T/pcOFkAx1QB4niH9Dg//OUEQH+WuW
         Of6Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I have the following simpel stateless firewall... the issue is iam not 
able to send ICMPs queries from within the machine. What could I modify 
or add for this to be able to happen .  Also iam only intending to run a 
HTTP service and DNS service is it fine the way it is?

Also, I intend to keep the script stateless not wanting to use conntrack 
at all.

Thanks
Alex


#!/bin/bash

/sbin/iptables -F
/sbin/iptables -X

/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT ACCEPT

#Accept SSH
/sbin/iptables -A INPUT -p tcp -m tcp -s 204.199.62.74 --dport 22 -j ACCEPT

/sbin/iptables -A INPUT -p tcp --dport 1000:65535 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 80 -j ACCEPT
/sbin/iptables -A INPUT -p udp --dport 53 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 53 -j ACCEPT


