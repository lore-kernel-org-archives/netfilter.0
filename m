From: Nilesh <niluforalways@yahoo.com>
Subject: Giving trouble when blocking MSN messenger
Date: Mon, 1 Nov 2004 06:21:01 -0800 (PST)
Message-ID: <20041101142101.25476.qmail@web50505.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <squid-users-return-49588-gcwsg-squid-users=m.gmane.org@squid-cache.org>
List-Post: <mailto:squid-users@squid-cache.org>
List-Help: <mailto:squid-users-help@squid-cache.org>
List-Unsubscribe: <mailto:squid-users-unsubscribe@squid-cache.org>
List-Subscribe: <mailto:squid-users-subscribe@squid-cache.org>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Squid <squid-users@squid-cache.org>
Cc: netfilter@lists.netfilter.org

Hello All,

I am not able to block MSN Messenger when I put this
rule in rc.firewall script 
This rule is required for to connect VPN sever at
client side.
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to
$EXTIP
Could any one tell me what needs to be change in
Squid.conf for blocking MSN messenger or tell me the
way to block it.

Thanks and Regards 
Nilesh,



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
