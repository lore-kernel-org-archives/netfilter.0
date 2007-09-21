From: "Wilson, Richard E" <richard.wilson@eds.com>
Subject: RE: Questions on load-balancing (-j DNAT)
Date: Fri, 21 Sep 2007 18:16:01 -0500
Message-ID: <DE0BDC6DCC1F724882C0828AD2D3E684019E93AC@usplm203.amer.corp.eds.com>
References: <00b301c7fc73$ba6cf590$b800a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <00b301c7fc73$ba6cf590$b800a8c0@cybergeneration.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maxime Ducharme <mducharme@cybergeneration.com>, netfilter@vger.kernel.org

Maxime,

Having run into a lot of the same issues, I can offer you the following:

First add a rule to stop tracking localhost traffic:

iptables -t raw -A OUTPUT -o lo -j NOTRACK 

Note: Using the raw table requires a 2.4.23 kernel or better... The two
raw tables, PREROUTING and OUTPUT are hit in that order before any
others and thus the OUTPUT of RAW goes (eventually) to the INPUT
table...

This change cut the size of our ip_conntrack table down by a quarter...

I sent a note to the list that I haven't seen appear asking if it's
possible to stop tracking inbound SMTP traffic -- it may have gotten
filtered, I just resent it.  In some testing I've done I've found that
both regular and TLS SMTP traffic stays on port 25 and thus it *should*
be possible to have a rule like

	iptables -t raw -A OUTPUT -p tcp --dport 25 -j NOTRACK

with no impact to mail.

This last probably won't work in your situation -- NOTRACK packets can't
be NATted.  Other items I've done include adjusting the timeout down to
12 hours:

In /etc/sysctl.conf (for a 2.6 kernel; check with "sysctl -a | grep
ip_conntrack")

net.ipv4.netfilter.ip_conntrack_tcp_timeout_established = 43200

I've also increased the size of the ip_conntrack table to 131072 (on
servers with 2 and 4GB of RAM) -- this translates to the conntrack table
using 1-2% of the available RAM.  Since I'm  still having issues, we'll
probably try the NOTRACK option next.

Hope this helps,

Richard Wilson
EDS
Richard dot Wilson at EDS dot com

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Maxime Ducharme
Sent: Friday, September 21, 2007 10:21 AM
To: netfilter@vger.kernel.org
Subject: Questions on load-balancing (-j DNAT)


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


-
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
