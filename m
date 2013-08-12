From: Alex Flex <aflexzor@gmail.com>
Subject: Help with stateless firewall
Date: Mon, 12 Aug 2013 13:28:59 -0600
Message-ID: <5209377B.5030105@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=j7KqBkF44iqkVWrARWuHk9bPWCOLmGpgoBP3WsNDOHg=;
        b=b/rbJw9go+rrK+TLx7cALH4IRbnsYqZs1RvEAE8lKFC3tzpfou8iiVaQHc+y3FfBZk
         O8UN+edgfDr9k5YsVXLzY1F6GQBMmpynMw3LbPkoaXahDGYS2Wu6wwZufHClqnWHl/eZ
         OlMb/vpsL8OdT1I9k5ePsNDqcDS5ZTUa7XsQILahQgAM3AyQEFF9EPXyJr0OM/5YVFbq
         R2u9hJPvmTlrsQK/qBHdVDutiv5hFMWmvArzLTI+XQEia3w8VjZNIWS1a1wMiOkG8mZd
         mpA/STB+LINBDBPVD5HyoIB7nwo+1uOE9muisqv/2uRlkGFwQD19CyhMlFDTOsE44vsN
         HNcg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello NetFilter,

Iam working with a stateless firewall to help keep up with DoS and a 
state flood. I have a few doubts about my setup:


a.) When allowing web traffic, is it neecessary to allow port range 
1000:65535 ? i saw that due to this rule sending packets to those ports 
directly respond with a REJECT instead of a DROP which is preffered. Any 
work arround and still have a stateless setup?

b.) What is needed to safely have a default OUTPUT DROP, apparently as 
soon as i change it to that iam unable to access it via ssh, even if I 
add a rule like this: /sbin/iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT


Thanks for your help.
Alex

#!/bin/bash

/sbin/iptables -F
/sbin/iptables -X

/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT ACCEPT

#ICMP IN
/sbin/iptables -A INPUT -p icmp -s 178.174.50.29/24 -j ACCEPT

#ICMP IN (TRACEROUTE)
/sbin/iptables -A INPUT -p icmp --icmp-type 0 -j ACCEPT
/sbin/iptables -A INPUT -p icmp --icmp-type 11 -j ACCEPT

#ICMP OUT
/sbin/iptables -A OUTPUT -p icmp --icmp-type 8 -j ACCEPT

#DNS RESOLVERS
/sbin/iptables -A INPUT -s 63.15.64.91 -j ACCEPT
/sbin/iptables -A INPUT -s 63.15.64.92  -j ACCEPT

#SSH
/sbin/iptables -A INPUT -p tcp --dport 22 -j ACCEPT


#WEB
/sbin/iptables -A INPUT -p tcp --dport 1000:65535 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 80 -j ACCEPT


