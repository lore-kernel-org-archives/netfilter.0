From: "Hanz F." <hanz852@yahoo.com>
Subject: Re: Block/Accept by MAC Address
Date: Mon, 30 Sep 2002 23:15:47 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021001061547.95787.qmail@web40007.mail.yahoo.com>
References: <003a01c268ea$d98408a0$e951ea43@W2RZ8L4S02>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003a01c268ea$d98408a0$e951ea43@W2RZ8L4S02>
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
Content-Transfer-Encoding: 7bit
To: Jim Gifford <maillist@jg555.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Your situation is similar to mine, and this is what I
did :

******************************************
#eth0 has the IP 192.168.3.133 which is connected 
#to the internet.

iptables -t nat -P POSTROUTING DROP
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to
192.168.3.133


iptbales -P INPUT DROP
iptbales -P FORWARD DROP
iptbales -P OUTPUT ACCEPT

#list here all your clients who are allowed to hace
#access

iptables -A INPUT -p all -s client -m mac --mac-source
client's mac -j ACCEPT
iptables -A FORWARD -p all -s client -m mac
--mac-source client's mac -j ACCEPT

#then block anyone else
iptables -A INPUT -p all -s 0/0 -j DROP
iptables -A FORWARD -p all -s 0/0 -j DROP

************************************************

U can also allow all people and block the buy u want
but in this case he may change his network card and
will be able to have access again.

The problem here (and with every iptables rule) that
ur clients will not be able to use some internet
applications like ICQ, IRC,yahoo messenger ,...... and
that's what I am looking for.
Some guys here have informed me that it's posiible to
use IRC and FTP by using related modules, but it seems
there's no modules to other applications.





__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com

