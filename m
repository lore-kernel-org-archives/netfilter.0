From: pedro noticioso <cucnews@yahoo.com>
Subject: is it possible to mix iprange and multiport modules?
Date: Sun, 19 Oct 2008 21:04:16 -0700 (PDT)
Message-ID: <219949.10508.qm@web110412.mail.gq1.yahoo.com>
References: <48F8CF4F.3010704@riverviewtech.net>
Reply-To: cucnews@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48F8CF4F.3010704@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi there friends!

I am managing a 15 node vpn network with well over 500 pcs scattered all over, so I am looking for creative ways to simplify and better control my traffic while replacing the old IT guys 1600 line-and-10 seconds to load  firewall script, so I tried a trick that did not seem to actually work:

/sbin/iptables -A INPUT -p tcp \
 -m multiport  --source-port 22,53,80,110,443,2525 \
 -m iprange --src-range 192.168.19.25-192.168.19.100 \
 -j ACCEPT

So, am I just dreaming here, or is there a nice trick out there to achieve my goal in an elegant manner?

thanks a lot!




__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
