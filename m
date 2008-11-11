From: Eric Lease Morgan <emorgan@nd.edu>
Subject: using iptables to deny ipsec connections
Date: Mon, 10 Nov 2008 19:22:30 -0500
Message-ID: <D50E2D13-F2E8-4830-883A-9495D904A96D@nd.edu>
References: <S1752377AbYKKAIu/20081111000850Z+3277@vger.kernel.org>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <S1752377AbYKKAIu/20081111000850Z+3277@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org


How do I use iptables to deny IPSEC connections?

I am running iptables v1.3.8 on Fedora 5. On a regular basis a remote  
host connects to my machine and gobbles up more than 3 MB/sec of  
bandwidth, makes my swap space almost full, and always seems to be  
associated with a second, remote machine. Not only is this irritating  
but it is also embarrassing. I'm not sure, but I think remote machine  
one is talking to remote machine two.

I have a rule in /etc/sysconfig/iptables that looks like this (with IP  
changed to protect the guilty):

   -A RH-Firewall-1-INPUT -s 123.456.789.109 -j REJECT

I believe this rule says, "Reject any connections coming from  
123.456.789.109", but after I restart iptables the connections  
persist. Using ntop as my diagnostic tool, I see that 0% of the  
connections from 123.456.789.109 are IP-based but rather IPSEC-based.  
(Does such a thing make sense?)

How do I either: 1) deny any access to my machine from  
123.456.789.109, or 2) deny any connections that are IPSEC-based  
because I have no such need for IPSEC, I think. What is host  
123.456.789.109 exploiting?

-- 
Eric Lease Morgan
University of Notre Dame


