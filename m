From: Rodney Beede <mailinglist@rodneybeede.com>
Subject: DNAT "--to" versus "--to-destination"
Date: Fri, 10 Feb 2012 17:35:53 -0700
Message-ID: <CALTCyaS0UHTTAB1rU-NhBWu6cU6gg6O=Ok1=JV93r1Ej=g_a-A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rodneybeede.com; s=google;
        h=mime-version:sender:date:x-google-sender-auth:message-id:subject
         :from:to:content-type;
        bh=UQEgTwnpMjg5fEXhGcPSj0fJOaJCqe+bftGSW2rntdE=;
        b=C3j1O3bffa90ttzA79Dz3XOx7bsAMBiEBrZLcbscXNPtN04G+fl3PNUvQaGORhXNI9
         qWKOFkyn+TTTdLa8crIEJxh03l2Wb4Vfb2t6XaOU84OFURO3lD0Uw34KBnSQ8LXKHb8b
         NxqQIno5Q7Sf0qVCi6S0DZrPI+MI4wDB/+V1Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On the web I see examples like:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT
--to-destination 10.1.1.1:8080

However in the documentation
(http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html#ss6.2)
I see:

iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 5.6.7.8


Looking at the source code for my iptables version (1.4.10 on OpenWrt
Linux distro) I only see the --to-destination as an option in
libipt_DNAT.c

Also the documentation calls it the --to-destination option, but none
of the examples use that.

Why is this or what does the difference mean?
