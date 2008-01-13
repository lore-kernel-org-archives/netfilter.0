From: P Zemlja <plodna_zemlja@yahoo.com>
Subject: Can't set up transparent proxy on XO laptop
Date: Sun, 13 Jan 2008 10:53:24 -0800 (PST)
Message-ID: <25397.63399.qm@web51912.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks in advance for looking over this.
I'm trying to set up internet filtering on an OLPC XO
laptop and I'm stuck at the point of 
configuring iptables. I have squid and dansguardian
installed. I've seen this command used 
by many people on the internet, but it just doesn't
work for me.
-----------
bash-3.2# /sbin/iptables -t nat -A OUTPUT -p tcp
--dport 80 -m owner --uid-owner squid -j ACCEPT
iptables: No chain/target/match by that name

-----------
But, if I leave off the user specification it works:
-----------
bash-3.2# /sbin/iptables -t nat -A OUTPUT -p tcp
--dport 80 -j ACCEPT
bash-3.2# /sbin/iptables -t nat -L OUTPUT
Chain OUTPUT (policy ACCEPT)
target	prot	opt	source		destination
ACCEPT	tcp	--	anywhere	anywhere	tcp dpt:http

-----------
The user squid does exist, and if I mutate the name
iptables complains:
-----------
bash-3.2# /sbin/iptables -t nat -A OUTPUT -p tcp
--dport 80 -m owner --uid-owner sqxuid -j ACCEPT
iptables v1.3.8: Bad OWNER UID value 'sqxuid'
Try 'iptables -h' or 'iptables --help' for more
information.

-----------
If I try with user root instead, it doesn't work
either:
-----------
bash-3.2# /sbin/iptables -t nat -A OUTPUT -p tcp
--dport 80 -m owner --uid-owner root -j ACCEPT
iptables: No chain/target/match by that name

-----------
If I try the numeric id of the user squid it doesn't
work:
-----------
bash-3.2# /sbin/iptables -t nat -A OUTPUT -p tcp
--dport 80 -m owner --uid-owner 23 -j ACCEPT
iptables: No chain/target/match by that name

-----------
Although I noticed that I can stick any number in
there and get the same error.
Any help is greatly appreciated.


      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ 

