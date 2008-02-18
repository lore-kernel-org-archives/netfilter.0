From: Ricardo Teixeira <rteixeira@iportalmais.pt>
Subject: problems deleting conntrack entries with conntrack-tools 0.9.5
Date: Mon, 18 Feb 2008 19:35:45 +0000
Message-ID: <1203363346.5741.11.camel@venus.iportalmais.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!

i am having problems using conntrack-tools to delete entries.

i am using the command "conntrack -D conntrack -s 192.168.69.24 -p tcp
--sport 51266 --dport 22", among others, to try to get it to work.
Though no matter how i try i always get this message : "Operation
failed: such conntrack doesn't exist"

...of course:

#conntrack -L conntrack -s 192.168.69.24 -p tcp --sport 51266 --dport 22

tcp      6 430195 ESTABLISHED src=192.168.69.24 dst=192.168.69.202
sport=51266 dport=22 packets=1860 bytes=127416 src=192.168.69.202
dst=192.168.69.24 sport=22 dport=51266 packets=1501 bytes=205145
[ASSURED] mark=0 use=2
tcp      6 431999 ESTABLISHED src=192.168.69.24 dst=192.168.69.202
sport=51264 dport=22 packets=37328 bytes=2306744 src=192.168.69.202
dst=192.168.69.24 sport=22 dport=51264 packets=42456 bytes=7307109
[ASSURED] mark=0 use=1

though it's weird that, in this case, it doesn't filter by the ports
specified either...

i'm running a debian sarge with 
kernel 2.6.19.4-586 
libnfnetlink-0.0.25
libnetfilter_conntrack-0.0.82

If some nice soul could help me it would me great

Thanks in advance,

Ricardo Teixeira.

