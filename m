From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: GRE protocol .
Date: Fri, 30 Apr 2010 12:49:22 +0530
Message-ID: <s2ycfeab66d1004300019ge75963b8vc3243c7d947e850e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=vbZHA1OOpKHN5ssCpwqgEsTNKqkPFMHAcat7zHSSkdA=;
        b=MPgCxLeeckf4sMzQlXjyAHtGdG+yd1GNayoT5qMo+APy5zEPFI+gMpP9vKigQb7d0y
         7Ii2MR/sIg6PJ6RZAUo7GjNA9g6ubxFF/0H+4JFqIaqMmiuOYE+EJM2r3F9GMKCehF3q
         YecyLm9YiLXeAPWgF0dIY1JLqLcX+VVMSFs6E=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Router wan interface is eth1 and lan interface is eth0 .

iptables  -A INPUT  -m state --state ESTABLISHED , RELATED  -j ACCEPT .
iptables  -A INPUT  -i eth1 -j DROP .
iptables  -A INPUT  -i eth0 -j ACCEPT

iptables  -A FORWAR -m state  --state ESTABLISHED , RELATED  -j ACCEPT
iptables  -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables  -A FORWARD -i eth1 -o eth0 -j DROP .

I dont have pptp connection  tracking module installed .  But i can
see GRE protocol packet comed from wan gets routed and reaches my
client machine   connected  to eth0 ?.

I can see message id is 0 in GRE packet .
I have only pptp connection .

Any hint is really appreciated ?

Thanks,
Ratheesh
