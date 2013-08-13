From: Alex Flex <aflexzor@gmail.com>
Subject: Quick help with NOTRACK rule
Date: Tue, 13 Aug 2013 16:57:35 -0600
Message-ID: <520AB9DF.7060207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=BqsCQZc7YEkJqDivVY1fWZM+/zNqKt/hY8nGGOY0lwA=;
        b=Oel7Kp5flHOAXYdXHaX6isLOKr4ANmnga3aju0vX5Iqk9zzcPw9ybGIlfzuzb/dqyD
         w7bemKTHcrXm4v9zvNVxvlvIQJhqhsPWu5AlEnZIZl383yf/FoHIEDPX496EpMrjlW0O
         Te7egYx7QmUNBetr1/5UwpSy988yAcKFWSZF1j99qWpvfAKQig+hIFA4X+VEz/uRMlFj
         QaPOHvN0aKl8pW5NOisMasnkaoyGGEjlOBEge9aVwW/MevnPtw3b+qrEwftYByBCBOWa
         llumkTe0JqKhxXeQGLUoWCeGd4ohiXvtVRyIB9yVqUiRpyXR0L4nLWIfske48ZF0mUER
         npGQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello all,

I have a simple ruleset (for testing purposes) iam trying to exclude 
only the SSH service in being tracked at conntrack. I have not been able 
to achieve this.. iam obviously missing something?


#!/bin/bash

#### CLEANUP
/sbin/iptables -P OUTPUT ACCEPT;
/sbin/iptables -P INPUT DROP;
/sbin/iptables -P FORWARD ACCEPT;
/sbin/iptables -F;
/sbin/iptables -X;
### CLEANUP

# DEFAULT POLICIES
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT ACCEPT

# LOOP BACK ALLOWED
/sbin/iptables -A INPUT  -i lo -j ACCEPT
/sbin/iptables -A OUTPUT -o lo -j ACCEPT

#KEEP STATE BOTH INPUT / OUTPUT (STATEFULL FIREWALL)
/sbin/iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j 
ACCEPT

iptables -t raw -A OUTPUT -p tcp --sport 22 -j NOTRACK

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 5666 -j ACCEPT


After applying the above, and reconnecting via ssh to the machine i 
still see this in the table:

ipv4     2 tcp      6 185 ESTABLISHED src=221.199.62.74 
dst=26.38.165.111 sport=1063 dport=22 src=26.38.165.111 
dst=221.199.62.74 sport=22 dport=1063 [ASSURED] mark=0 secmark=0 use=2


I also tried adding one more rule iptables -t raw -A INPUT -p tcp 
--sport 22 -j NOTRACK  but i get
iptables: No chain/target/match by that name.


Thanks
Alex


