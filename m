From: test@seaconindia.com
Subject: Re: DNAT Problem
Date: Tue, 4 May 2004 11:02:46 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1194.80.0.0.23.1083648766.squirrel@80.0.0.175>
References: <1443.80.0.0.23.1083045451.squirrel@80.0.0.175>   
    <001201c42c28$16064480$1202a8c0@admin>
    <1081.80.0.0.23.1083127867.squirrel@80.0.0.175>
    <000901c42cef$68603d40$1202a8c0@admin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c42cef$68603d40$1202a8c0@admin>
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
Cc: Rob Sterenborg <rob@sterenborg.info>

Hi All / Rob

>> @40000000408f36341674bdbc tcpserver: status: 2/30
>> @40000000408f36341674e0e4 tcpserver: pid 16388 from 192.168.0.151
>> @40000000408f36350e13b4d4 tcpserver: ok 16388
>> mail.localdomain.com:192.168.0.6:25 :192.168.0.151::1346
>> @40000000408f364205f0f924 tcpserver: end 16388 status 0
>> @40000000408f364205f1241c tcpserver: status: 1/30
>>
>> (Firewall internal ip 192.168.0.151)
>
> Hi,
>
> Since AFAICS it should work, I seem to be having trouble understanding
> the whole situation. If you can send me the script you are using maybe
> it's easier to find the problem.
> You're DNAT-ing, so the destination IP/port should be altered, not the
> source IP/port.

This is the script for my tcpserver to log incoming SMTP requests on the
email server (192.168.0.6)

#!/bin/sh
PATH=/var/qmail/bin:/usr/local/bin:/usr/bin:/bin
export PATH
exec setuidgid qmaill multilog t s100000 n20 /var/log/qmail/qmail-smtpd 2>&1

This is the complete firewall script on my firewall (192.168.0.151)


# Default Policy Rules
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT

# Allow only incoming connections that we establish first
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Rules for lo (Modified as per Rob Sterenborg Suggestions)
iptables -A INPUT -i lo -s 127.0.0.0/8 -j ACCEPT
iptables -A INPUT -i ! lo -s 127.0.0.0/255.0.0.0 -j DROP

# Rules for eth0 - LAN
iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT

# Rules for eth1 - Internet

# SSH
iptables -A INPUT -i eth1 -p tcp --dport 22 -j ACCEPT

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


Regards

Joel

