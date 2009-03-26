From: "Scott Miller" <srmiller@interbel.net>
Subject: Verify rules
Date: Thu, 26 Mar 2009 14:54:33 -0600
Message-ID: <0d6001c9ae55$10b9e040$322da0c0$@net>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com> <49CBE955.7030507@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49CBE955.7030507@gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I was wondering if I could get someone to verify my rules.  What I am trying
to do to start with, is make only certain ports available on my outgoing
mail server - essentially blocking all other ports not listed.  I have the
below on my server in an inactive state because when I activate it, it locks
it completely down.

Could someone please take a look at my rules and share with me what I did
wrong?  Here is my entire config file:


-----------------------------

*mangle
:PREROUTING ACCEPT [6:948]
:INPUT ACCEPT [6:948]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [7:3269]
:POSTROUTING ACCEPT [7:3269]
COMMIT
*nat
:OUTPUT ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
COMMIT
*filter
:FORWARD ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
# HTTP
-A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 80 --state NEW -j
ACCEPT
# SSH
-A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 22 --state NEW -j
ACCEPT
# DNS
-A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 53 --state NEW -j
ACCEPT
# TIME
-A INPUT -p udp -m udp -m state NEW,ESTABLISHED --dport 123 --state NEW -j
ACCEPT
# WEBMIN
-A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 10000 --state NEW -j
ACCEPT
# SMTP
-A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 25 --state NEW -j
ACCEPT
# POP3
-A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 110 --state NEW -j
ACCEPT
# IMAP
-A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 993 --state NEW -j
ACCEPT
# RSYNC-TCP
-A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 873 --state NEW -j
ACCEPT
# RSYNC-UDP
-A INPUT -p udp -m udp -m state NEW,ESTABLISHED --dport 873 --state NEW -j
ACCEPT
# DENY ALL OTHERS
-A INPUT -i eth0 -j REJECT --reject-with icmp-net-unreachable
COMMIT

--------------------------

Thanks,
Scott Miller

