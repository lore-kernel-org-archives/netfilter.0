From: salih ahi <salihahi@gmail.com>
Subject: How can I configure linux routing with bridge interfaces to apply
 iptables rules for tcp packets?
Date: Tue, 24 Nov 2015 12:01:06 +0200
Message-ID: <CALZybbdm8ZDa7qmdfBzc-_EbQpFVtOJi9Z81BiSsLwmSr6c4ug@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=z3gvbhof4xHu4qsIkyj9+iRKLff7A35m07b9piOBGsc=;
        b=REk9WeYL2Bw9+d9nPE/gJ20mVz5pa8QPYajtFa/ZJsehoX+v77JiGrCjFIvQn7zfIW
         4cYiZ3eJGRHnh8aQ/uhZP65BZgux2H/vAKP4nb2ysc1mlhQNbfT+OQHIv8kG99te8g9s
         ooXEuHKCSmbHmDajvhcbbyr3/lMC6KL2Oo0oNUNlzbu1K2jiCE31fPKaiLBeL+tBz9h2
         po8N/e70mT/1OkoigkRY1LeuMNXtOU+Q4Kyh6lGseCnayBAvKSntJnCBMIwnBRNzZAFU
         EP4bacIzt1htjaK3yAbZjO6bnEj7kmjrNJk0AHRkDqiKvGXFPE8foczZSwlgdU/RtAIQ
         vIsw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am trying to install a transparent proxy to my current network.
Currently there is only one client machine, directly connected to eth0
of my proxy. eth1 is connected to the switch and goes out from there.
Now eth0 and eth1 is members of a bridge interface and packets are
directly transmitted from one another. For other reasons, I can not
assign IP addresses to these interfaces and use normal IP forwarding.

What I need is, I have a HTTP sniffer on the proxy, to which I want to
send packets with

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
I want to grab these packets from BROUTING chain of BROUTE table. This
is the BROUTE table in ebtables I have configured

*broute
:BROUTING ACCEPT
:NATLOG ACCEPT
-A BROUTING -p IPv4 --ip-proto tcp --ip-dport 80 --log-level info
--log-prefix "LOG_BR" --log-ip -j DROP
But none of the packets are received by iptables. I set some log lines
in the iptables itself but they were never executed, thats why I don't
think packets are coming to iptables chains. Heres the iptables filter
table

Table: filter
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination
1    LOG_INP    tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80

Chain FORWARD (policy ACCEPT)
num  target     prot opt source               destination
1    LOG_FWD    tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination

Chain LOG_FWD (1 references)
num  target     prot opt source               destination
1    LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG
flags 0 level 6 prefix `IP_FIL_FWD'

Chain LOG_INP (1 references)
num  target     prot opt source               destination
1    LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG
flags 0 level 6 prefix `IP_FIL_INP'
I expect to at least see the dropped packets from ebtables BROUTING in
the iptables PREROUTING chain of RAW table. But it's as if those
packets are just discarded. Whereas the man pages say dropped packets
from brouting are handed over to higher network layers.

What are the iptables/ebtables rules I have to use for this scenario
