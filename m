From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Questions on load-balancing (-j DNAT)
Date: Fri, 21 Sep 2007 13:20:38 -0400
Message-ID: <00b301c7fc73$ba6cf590$b800a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hello to the list
 
Got a question about iptables capacity
 
We are running a linux box with iptables and DNAT to
load-balance incoming mail on multiple anti-spam servers
(qmail + SpamAssassin + ClamAV) on a 100 mbits link
 
Lately we had some problems connecting to the servers behind
and we noticed our firewall's conntrack maxed out, we saw these
messages appear in system logs :
 
kernel: ip_conntrack: table full, dropping packet.
 
/proc/sys/net/ipv4/ip_conntrack_max contains 16368,
we raised server's RAM and raised this value

we are using kinda old iptables, it is iptables 1.2.9
running on a 2.4 kernel
 
we plan to have more and more domains hosted in the future and
I want to be ready to raise firewall's capacity like 10 times

would an iptables upgrade help us in this situation ?
 
I was also wondering if guys in here have an idea on how we
could load-balance the firewall service itself (conntrack) ?
 
We tought about placing a zone in our DNS with 2 IPs
and round-robin active, and place a second firewall with
the same DNAT instructions
 
The firewall have these kind of instructions :
 
DNAT incoming TCP 25 to multiple LAN anti-spam servers
(-j DNAT $IP1-$IPN)

DNAT incoming POP3, IMAP and HTTP to a single Mail Server
(-j DNAT $MAILSERVER)
 
Our conntrack was filled with incoming TCP 25 sessions (SMTP)
caused by spamming botnets, we have an average of 15000
sessions in the day time.
 
Any other ideas ?
 
Thanks in advance and have a nice day
 
Maxime Ducharme


