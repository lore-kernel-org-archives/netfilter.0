From: test@seaconindia.com
Subject: [Fwd: Re: DNAT Problem]
Date: Tue, 27 Apr 2004 11:27:31 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1443.80.0.0.23.1083045451.squirrel@80.0.0.175>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All

I am facing a problem with DNAT and the detail of my problem is as follows :

I have an email server running behind the firewall serving POP3 & SMTP.
Now all requests DNAT from the firewall are logged as if received from the
firewall itself and thus considered as trusted ip. I want all the DNAT
requests to be logged as received real source ip and not from firewall ip.

Please find attach a copy of my firewall script so that you all would be
able to suggest me the required changes. (optional : Any suggestion to
make it more secure)

++++++++++++++++++++++++++++++++++++

#!/bin/bash

# Flush All IPTABLE Rules
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING
iptables -t nat -F OUTPUT

# Default Policy Rules
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT

# Allow only incoming connections that we establish first
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Rules for lo
iptables -A INPUT -s 127.0.0.0/255.0.0.0 -i ! lo -j DROP

# Rules for eth0 - LAN
iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT

# Rules for eth1 - Internet
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A INPUT -i eth1 -p icmp -j DROP
iptables -A INPUT -i eth1 -p tcp -m tcp ! --tcp-flags SYN,RST,ACK SYN -j
ACCEPT

# SSH
iptables -A INPUT -i eth1 -p tcp --dport 22 -j ACCEPT

# Email Server Access From Outside
# SMTP
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to
192.168.0.6:25

# Web
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to
192.168.0.190:80

# POP3
iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 110 -j DNAT --to
192.168.0.6:110

# WebMail
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 8000 -j DNAT --to
192.168.0.6:80

iptables -A INPUT -i eth1 -j DROP

++++++++++++++++++++++++++++++++++++


Regards

Joel

---------------------------- Original Message ----------------------------
Subject: Re: DNAT Problem
From:    test@seaconindia.com
Date:    Fri, April 23, 2004 5:52 pm
To:      netfilter@lists.netfilter.org
--------------------------------------------------------------------------

Hi Antony

> On Thursday 22 April 2004 7:18 pm, test@seaconindia.com wrote:
>
>> > > iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT
--to 192.168.0.6:25
>> >
>> > I don't believe that can be your complete ruleset.
>> >
>> > I see nothing wrong with the above rule as it stands, however on its
>> own
>> > it's not much good - you need a FORWARD rule to allow packets through
>> to
>> > the mail server as well.
>>
>> Can you give me an example of the forward rule set.
>
> iptables -A FORWARD -d a.b.c.d -p tcp --dport 25 -j ACCEPT
>
> where a.b.c.d is the real (internal) IP address of your mail server.
>

I modified my script as suggested by you but no luck

>> > Anyway, I thought (I may be mistaken) that the problem was not with
>> the
>> > inbound DNAT, but with SNAT?
>
> I repeat the statement immediately above.
>
>> Or shall I attach my complete bash script ? (is it ok ?)
>
> Please do post the smallest ruleset which demonstrates the problem (ie
it allows access to your internal mailserver, but all accesses appear to
be from
> the firewall's IP address).
>

Please find below the SMTP log of my email server

++++++++++++++++++
@4000000040890aad255365a4 tcpserver: pid 30530 from 192.168.0.151
@4000000040890aad2a6f2e9c tcpserver: ok 30530
mail.localmail.com:192.168.0.6:25 :192.168.0.151::1592
++++++++++++++++++

Please note
Firewall IP = 192.168.0.151
Email Server IP = 192.168.0.6

Regards

Joel





