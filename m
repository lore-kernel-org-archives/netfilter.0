From: Shyam Prasad <shyam@rocsys.com>
Subject: Reg Stateful firewall
Date: Wed, 28 Nov 2007 07:15:48 -0800 (PST)
Message-ID: <552867.23040.qm@web1007.biz.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I have a doubt regarding statefull feature in iptables firewall

In my iptables filter table i set the default policy for INPUT,OUTPUT and FORWARD as DROP.
so all packets are dropped.
now i added a policy 
iptables -A INPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT

My assumption is that when an external device sends a  ping request(echo-request) its state will be NEW and it will be accepted,since for this a state table is being maintained,the ping reply should be sent through OUTPUT chain with out being blocked.but the packet is dropped in the OUTPUT chain.

I understand that the rule we added is only for INPUT chain,but is a rule in OUTPUT chain required to send the reply packet out even for a legitimate packet that we accepted??

Regards,
Shyam.


