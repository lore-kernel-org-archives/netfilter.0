From: Matton <Matton@tele2allin.be>
Subject: NAT on the same network
Date: Wed, 28 May 2008 22:10:33 +0200
Message-ID: <1212005433.483dbc39ef035@www.versateladsl.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org



Hi all,

I ave an mail server who can only receive mail from mail-relay for adresses
rewriting.
Then I build rules to forward connection to the mail-relay if the source is not
the mail-relay.
following the rules To do that:
ip_forward=1

PROXY2=10.97.200.156
SMTP=25
MYIP=10.97.24.76


iptables -t nat -N LOG_SNAT
iptables -t nat -A LOG_SNAT -j LOG --log-prefix '[IPT_SNATSMTP]'
iptables -t nat -A LOG_SNAT -j SNAT --to-source ${MYIP}


iptables -t nat -N LOG_NATSMTP
iptables -t nat -A LOG_NATSMTP -j LOG --log-prefix '[IPT_NATSMTP]'
iptables -t nat -A LOG_NATSMTP -j DNAT --to-destination ${PROXY2}

iptables -t nat -A PREROUTING  -s ! {PROXY2} -p tcp --dport ${SMTP} -j
LOG_NATSMTP
iptables -t nat -A POSTROUTING  -o eth0 -p tcp --dport ${SMTP} -j LOG_SNAT

From proxy2 y ave the connection on the mail-server, fine.
for other machine I ave a log for the PREROUTING the log for the POSTROUTING
but
the connection c'ant be up to the mail-relay ( proxy2 )

What can I do ?

Thanks for your help
Jean-Louis--
