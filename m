From: Rakotomandimby Mihamina <mrakotom@free.fr>
Subject: Iptables LOG
Date: Thu, 25 Dec 2003 12:25:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312251225.12203.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi every one :-)

I'm using :
kernel 2.4.23 
iptables 1.2.8
a ppp connection . 
into my kernel conf , i have enabled iptables LOG 
( 
CONFIG_IP_NF_TARGET_LOG=y
CONFIG_IP_NF_TARGET_ULOG=y
 )

I try to have iptables logs into a file .

I search and i found this to make it works :
http://lists.netfilter.org/pipermail/netfilter/2003-September/046667.html

What i made is :

#1 give this iptables rule 
iptables -A INPUT -j LOG --log-level debug --log-prefix "iptables_rktmb : "

#2 modifying /etc/syslog.conf 

[...]
*.info;*.!warn;kern.!=debug;\
	authpriv.none;cron.none;mail.none;news.none	-/var/log/messages

[...]
*.=debug                                                /var/log/debug

#3 killall -HUP syslogd

But IT DOES NOT want to work ... i have nothing into /var/log/debug execpt my 
pppd logs ...

How should i manage it ? what did i miss please ? Help me . :-)
--
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina


