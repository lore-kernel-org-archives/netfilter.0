From: alvin <alvin.sm@Mail.Linux-Consulting.com>
Subject: iptables based appliances
Date: Sun, 7 Jun 2015 08:04:40 -0700 (PDT)
Message-ID: <201506071504.t57F4fuH020015@Mail.Linux-Consulting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: alvin <alvin.sm@Mail.Linux-Consulting.com>


hi netfilter ml

i was curious, 

does anybody know which ddos appliances uses IPtables to
mitigate incoming ddos attacks ?

----

in the past few years, i've tarpit'd about 10,000 IP# of DDoS attackers
on a little ole box ( EPIA-800 w/ 1GB of memory ) and it barely
can handle the load ... but than again, 10,000 iptables entries 
is fairly steep and semi-ridiculous :-)

http://networknightmare.net/Tarpits/#Install

even if the src IP# might be spoof'd, you, i still do NOT want those
incoming DDoS attacks coming in at 1,000 or 10,000 packets per second

iptables + tarpit is a good way to defend against incoming TCP-based attacks
which includes SSH attacks, SMTP attacks, http attacks, etc

--
thanx
alvin.sm-at-Linux-Consulting.com
alvin-at-DDoS-Mitigator.net  === mitigate incoming TCP-based attacks
