From: "Bob Sauvage" <Bob.sauvage@gmx.fr>
Subject: Some packets flagged INVALID
Date: Tue, 18 Feb 2014 22:52:18 +0100
Message-ID: <20140218215218.194660@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi *, 

I'm running a high volume web application that uses Apache 2.2.15 mod_proxy to reverse proxy content from apache to JBoss 6. 

I found 503 errors which happen sporadically throughout the day on random requests (perhaps 1/1000 of daily requests).

After investigations, I noticed that every error coincides with an invalid tcp packet: 

kernel: invalid:IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=33082 DF PROTO=TCP SPT=48340 DPT=8080 WINDOW=32792 RES=0x00 SYN URGP=0

After some investigations, this SYN packet is not acknowledged by JBoss in order to perform the TCP 3-Way Handshake. Mhmm, strange, I decide to investigate in firewall rules, build by another sysadmin:

In the INPUT chain, I found a rule that logs and REJECTS all INVALID packets: 

iptables -A INPUT -m state --state INVALID -j LOG --log-prefix "invalid:" 
iptables -A INPUT -m state --state INVALID -j REJECT

Then logs and REJECTS not SYN but new: 

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j LOG --log-prefix "new-not-syn:"
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j REJECT --reject-with tcp-reset

I decided to add a rule in order to ACCEPT all packets from 127.0.0.1 to or from port 8080.

Since this update, I don't see this kind of errors anymore.

Why does iptables tag this packet as invalid ?

Thanks,

Bob
