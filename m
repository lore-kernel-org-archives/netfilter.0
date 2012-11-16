From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Rate-limiting to halt brute-force attack
Date: Fri, 16 Nov 2012 09:22:35 -0500
Message-ID: <201211160922.36606.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, folks.

 A few days ago, a major brute-force attack was launched 
against our (sendmail) mail server. It looks like a bot is 
aiming lots of zombies at us. Here's how OSSEC hids reports 
an attempt from one of the zombies:

OSSEC HIDS Notification.
2012 Nov 13 09:08:16

Received From: (plymouth) 192.168.1.2->/var/log/messages
Rule: 40111 fired (level 10) -> "Multiple authentication 
failures."
Portion of the log(s):

Nov 13 09:07:44 plymouth ipop3d[29926]: Login failed 
user=hod auth=hod host=201-93-132-240.dsl.telesp.net.br 
[201.93.132.240]
Nov 13 09:07:44 plymouth ipop3d[29925]: Login failed 
user=lee auth=lee host=201-93-132-240.dsl.telesp.net.br 
[201.93.132.240]
~
~

To remediate, I've put fail2ban in place on the mail server, 
and it's working. However, the attacks are still beating at 
the door, and it's significantly increased the load on the 
mail server . I'm now thinking of adding rules to our 
iptables/Netfilter firewall to rate-limit the brute-force 
connections. The rules I'd add are these:

iptables -A INPUT -p tcp --dport 110 -m state --state NEW -m 
recent --set

iptables -A INPUT -p tcp --dport 110 -m state --state NEW -m 
recent --update --seconds 15 --hitcount 3 -j DROP

As the mail server sits in a DMZ, and packets are forwarded 
to it, is the INPUT chain the best place to put these 
rules, or should they go in the FORWARD chain (with 
appropriate modifications)?

Of course, I don't want to stop legitimate mail. Is this the 
best course of action?

Thanks.

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

