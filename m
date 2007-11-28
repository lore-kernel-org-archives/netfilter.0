From: "Shaun Mccullagh" <Shaun.Mccullagh@xb.nl>
Subject: Preventing simple DoS attacks with ipt_recent on Kernel 2.6.9-42.ELsmp
Date: Wed, 28 Nov 2007 17:14:17 +0100
Message-ID: <CC12CD48AEDA1E4B8A3F626DA84E927209CD45BA@ka-cap-sr-3601.xb.local>
References: <333233.67984.qm@web1009.biz.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
In-Reply-To: <333233.67984.qm@web1009.biz.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: John Donath <John.Donath@xb.nl>

Hi,

I would like to use ipt_recent to prevent, or at least reduce, simple
DoS attacks on our webservers.

I've tried

iptables -A FORWARD -p tcp --dport 80 -i eth0 -m state --state NEW -m
recent --set --name browserconn -j ACCEPT

iptables -A FORWARD -p tcp --dport 80 -i eth0 -m state --state NEW -m
recent --rttl --update --seconds 60 --hitcount 100 --name blocked -j
DROP

Both these rules are inserted at the top of the FORWARD chain.

/proc/net/rpt_recent/browserconn is quickly filled with new connections
and everything appears to work perfectly.

But if I login to a remote system and try 

for i in `seq 1 120` ; do 
	echo test | nc 1.2.3.4 80 >/dev/null 2>&1
done 

All the requests are allowed and I can still browse the site.

Nothing appears in /proc/net/ipt_recent/blocked

I've tried removing -name from both rules so that DEFAULT is used to no
avail.

What am I doing wrong?

Is the nc test valid?

TIA

Shaun







Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden is op http://www.xb.nl/disclaimer.html



