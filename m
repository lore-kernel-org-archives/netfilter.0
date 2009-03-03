From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: -j LOG not logging to /var/log/messages
Date: Tue, 3 Mar 2009 15:47:20 -0300
Message-ID: <20090303154720.7077a9b1@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi all

Environment:
	Slackware 10.2.0
	iptables v1.3.3
	syslogd 1.4.1
	klogd 1.4.1

Test rule:

$IPTABLES -A INPUT  -s SOME_IP  -m state --state NEW  -j RULE_23
$IPTABLES -A RULE_23  -j LOG  --log-level info --log-prefix "R.23/ACCEPT/global/RULE_23 "
$IPTABLES -A RULE_23  -j ACCEPT 

I can see LOG messages in dmesg but not in /var/log/messages:

R.23/ACCEPT/global/RULE_23 IN=eth0 OUT= MAC=x:x:x... SRC=SOME_IP
DST=X.X.X.X LEN=84 TOS=0x00 PREC=0x00 TTL=54 ID=2 DF PROTO=ICMP TYPE=8
CODE=0 ID=12070 SEQ=512 

syslogd.conf relevant line is:

# Log anything 'info' or higher, but lower than 'warn'.
# Exclude authpriv, cron, mail, and news.  These are logged elsewhere.
*.info;*.!warn;\
        authpriv.none;cron.none;mail.none;news.none     -/var/log/messages

I have another system with these same config (I think they are the same!)
and it is working ok.
Any clue about what is going wrong??

Regards

Ethy
