From: bahamin takhtaei <b_takhtaei@yahoo.com>
Subject: unclean match
Date: Sat, 22 Nov 2008 23:59:04 -0800 (PST)
Message-ID: <29091.13104.qm@web111313.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,
What module must be installed for using of "unclean" match?
I use this rule:
     iptables -A INPUT -m unclean -j DROP
but I get this error:
    iptables: No chain/target/match by that name  :(


 


      
