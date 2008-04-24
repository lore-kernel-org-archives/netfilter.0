From: noa levy <levynoa@yahoo.com>
Subject: Dynamically adding rules - are connection tracking states maintained?
Date: Thu, 24 Apr 2008 09:12:29 -0700 (PDT)
Message-ID: <989878.86998.qm@web57314.mail.re1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I'm trying to understand the impact of dynamically adding iptables rules, in terms of the resulting disruption to the firewall's performance. When I add a rule to (or delete a rule from) iptables, while it is running, does that have any effect on the states in the connection tracking table? Will the table be flushed? Are states linked to the rule that allowed the initial packet in, so that if a rule is deleted, only the corresponding state entry will be flushed?

Thank you!
Noa  


      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ

