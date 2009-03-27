From: "Scott Miller" <srmiller@interbel.net>
Subject: RE: Verify rules
Date: Fri, 27 Mar 2009 11:15:20 -0600
Message-ID: <15a901c9aeff$9bc91570$d35b4050$@net>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com> <49CBE955.7030507@gmail.com> <0d6001c9ae55$10b9e040$322da0c0$@net> <49CC88BC.8090201@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49CC88BC.8090201@chello.at>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks for the suggestions - I now have the following, combining two replies
I received.  I will implement this afternoon and see what happens.  I am
also using Webmin to moidify the /etc/sysconfig/iptables file.  If anyone
sees anything wrong - please let me know.  My goal is to lock down
everything except for the mentioned ports.  Thanks for your help.

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
# MODIFIED APRIL 27 2009 11:01AM
# TALKING TO OURSLEVES IS ALLOWED
-A INPUT -p icmp -m icmp --icmp-type any -j ACCEPT
-A INPUT -i lo -j ACCEPT
# ALLOW THE FOLLOWING TCP PROTOCOLS HTTP, SSH, DNS, WEBMIN, SMTP, POP3,
IMAP, RSYNC-TCP
-A INPUT -p tcp -m multiport -m state --state NEW,ESTABLISHED -j ACCEPT
--dports 22,25,53,80,110,873,993,10000
# ALLOW THE FOLLOWING UDP PROTOCOLS TIME, RSYNC-UDP
-A INPUT -p UDP -m multiport -m state --state NEW,ESTABLISHED -j ACCEPT
--dports 123,873
# DENY ALL OTHERS ETH0
-A INPUT -i eth0 -j DROP
# DENY ALL OTHERS ETH0:1
-A INPUT -i eth0:1 -j DROP
COMMIT




Scott Miller





-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Mart Frauenlob
Sent: Friday, March 27, 2009 2:05 AM
To: netfilter@vger.kernel.org
Subject: Re: Verify rules

netfilter-owner@vger.kernel.org wrote:
> I was wondering if I could get someone to verify my rules.  What I am
trying
> to do to start with, is make only certain ports available on my outgoing
> mail server - essentially blocking all other ports not listed.  I have the
> below on my server in an inactive state because when I activate it, it
locks
> it completely down.
>
> Could someone please take a look at my rules and share with me what I did
> wrong?  Here is my entire config file:
>
>
> -----------------------------
>
> *mangle
> :PREROUTING ACCEPT [6:948]
> :INPUT ACCEPT [6:948]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [7:3269]
> :POSTROUTING ACCEPT [7:3269]
> COMMIT
> *nat
> :OUTPUT ACCEPT [0:0]
> :PREROUTING ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> COMMIT
> *filter
> :FORWARD ACCEPT [0:0]
> :INPUT ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> # HTTP
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 80 --state NEW -j
> ACCEPT
> # SSH
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 22 --state NEW -j
> ACCEPT
> # DNS
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 53 --state NEW -j
> ACCEPT
> # TIME
> -A INPUT -p udp -m udp -m state NEW,ESTABLISHED --dport 123 --state NEW -j
> ACCEPT
> # WEBMIN
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 10000 --state NEW
-j
> ACCEPT
> # SMTP
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 25 --state NEW -j
> ACCEPT
> # POP3
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 110 --state NEW -j
> ACCEPT
> # IMAP
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 993 --state NEW -j
> ACCEPT
> # RSYNC-TCP
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 873 --state NEW -j
> ACCEPT
> # RSYNC-UDP
> -A INPUT -p udp -m udp -m state NEW,ESTABLISHED --dport 873 --state NEW -j
> ACCEPT
> # DENY ALL OTHERS
> -A INPUT -i eth0 -j REJECT --reject-with icmp-net-unreachable
> COMMIT
>
> --------------------------
>   

The state match syntax is wrong.

correct: -m state --state NEW,ESTABLISHED

you can write all your input allow rules in one line by using multiport 
match:
-A INPUT -p tcp -m multiport --dports 22,25,110,873,993,10000 -m state 
--state NEW,ESTABLISHED -j ACCEPT
same for udp...

Also I suggest setting INPUT policy to DROP.
Personally I'm not a friend of 'reject all unmatched'.
I prefer plain DROP, as I don't really like to send a packet for each 
not accepted connection attempt.

Read the iptables tutorial at frozentux, if you want to continue writing 
your own ruleset.
Otherwise I suggest to use a firewalling program to manage iptables. 
There's lots of them out there.

greets

Mart
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
No virus found in this incoming message.
Checked by AVG - www.avg.com 
Version: 8.0.238 / Virus Database: 270.11.28/2022 - Release Date: 03/26/09
20:05:00

