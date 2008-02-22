From: Casey Scott <casey@phantombsd.org>
Subject: verifying set-mark
Date: Fri, 22 Feb 2008 12:14:00 -0800 (PST)
Message-ID: <30567908.61203711240579.JavaMail.root@tomcat.phantombsd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

How can I detemine whether or not a iptables set-mark operation 
is working? iptables -t mangle -nvL shows packets matching the 
rules with the set-mark. However, with a tcpdump -vvv -i <interface>
I can not see the mark. I am looking at the tos field, and I 
don't see a tos field matching the marks I am trying to set.


Thanks, 
Casey
