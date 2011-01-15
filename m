From: Jan Rovner <jan.rovner@diadema.cz>
Subject: Conntrack : limit number of NEW outgoing connections per source IP
Date: Sat, 15 Jan 2011 09:21:42 +0100
Message-ID: <6750301E8CE01943922138638F4F1D26016EE7770FD7@diademasrv.diademasw.inkubator.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I have many computers behind a SNAT router (gateway to internet). All internal Computers have assigned private IP adressess in 192.168.0.0/16 range.

I have two questions:

1) I would like to limit the RATE of newly established connections initiated by Computers, i.e. connections with NEW state in kernel conntrack. The important points: 

  a) I NEED to count each computer's rate counters separately (i.e. per SOURCE IP of computer establishing the connection)
  b) I need to count all connection/flow type tracked by conntrack (i.e. TCP, UDP, ICMP,...)!

The solution is probably something like this - each computer is allowed to establish 5 conns per second:

iptables -A FORWARD -s internal_computer_ip1 -m state --state NEW -m limit --limit 5/second -j ACCEPT
iptables -A FORWARD -s internal_computer_ip1 -m state --state NEW -j DROP

iptables -A FORWARD -s internal_computer_ip2 -m state --state NEW -m limit --limit 5/second -j ACCEPT
iptables -A FORWARD -s internal_computer_ip2 -m state --state NEW -j DROP

iptables -A FORWARD -s internal_computer_ip3 -m state --state NEW -m limit --limit 5/second -j ACCEPT
iptables -A FORWARD -s internal_computer_ip3 -m state --state NEW -j DROP

However, there will be many rules and thus a noticable CPU usage.

Is there any suitable iptables "smart" solution for achieving this?

2) Is it possible in similar way to limit a TOTAL NUMBER of established (assured) connections per source IP? 
Important - I need to count all connection/flow type tracked by conntrac (i.e. TCP, UDP, ICMP,...)!

Thank you.

Sincerely,

Jan Rovner
