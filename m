From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Double rules for using NETFLOW?
Date: Wed, 02 Feb 2011 15:31:43 +0530
Message-ID: <4D492B87.5050008@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: ABC <abc@telekom.ru>

Hi All,
     I am using ipt_NETFLOW 1.7 on my RHEL 6 (2.6.32) box.  Now if I 
want to accept packet destined for some port and at the same time I want 
it to be accounted also, then I have to use the following rules:

iptables -A INPUT --dport <portnum> -j NETFLOW
iptables -A INPUT --dport <portnum> -j ACCEPT

    This makes that every packet that I accept should have two rules 
(one for accepting and one for accounting).  Don't you people think that 
it will increase the number of rules a packet has to traverse?  Or is my 
understanding wrong?

Regards,
Seenu.
