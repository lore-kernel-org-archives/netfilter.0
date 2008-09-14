From: Doug Kehn <rdkehn@yahoo.com>
Subject: netfilter/dansguardian/polipo slow
Date: Sun, 14 Sep 2008 07:49:36 -0700 (PDT)
Message-ID: <656617.35927.qm@web52002.mail.re2.yahoo.com>
Reply-To: rdkehn@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: rdkehn@yahoo.com

Hi All,

I have an AMCC PPC-440 based board running Monta Vista Linux 2.6.18, dansguardian 2.9.8.5, and polipo 1.0.4.  dansguardian is used for URL and content filtering.  polipo is serving as the http proxy.  The iptables rule to redirect port 80 packets to dansguardian is:

iptables -t nat -A PREROUTING -d ! 192.168.2.0/255.255.255.0 -i br0 \
-p tcp -m tcp --dport 80 -j REDIRECT --to-ports 3129

All components are functioning properly.  However, web page load times are 3 to 4 times slower with this rule in place than without.  I suspected the delay was with dansguardian/polipo.  Then, I left the rule in place and configured the browser's http proxy settings for 192.168.2.1/3129.  Page load times decreased dramatically.  Packets were still traversing dansguardian/polipo as URL/content filtering rules still worked as expected.  I also changed the PREROUTING policy from ACCEPT to DROP.  After doing this, I could no longer browse the internet (or communicate with the board).  I'm pretty sure the PREROUTING chain is being traversed; the rule is just not matching.

It appears (???) the delay is only observed when the rule matches.  I tried different variants of the rule to see if writing the rule in different ways produced different results.  For example,

iptables -t nat -A PREROUTING -i br0 -p tcp -m tcp --dport 80 \
-j REDIRECT --to-ports 3129

All rule variations resulted in the same increased page load times.

Unfortunately, updating the kernel and/or configuring the browser's http proxy settings aren't allowable options. 8(  Does anyone have any information, comments suggestions, tips, or tricks?  

Thanks,
...doug



      
