From: ke chen <linux_kurt@yahoo.com>
Subject: Iptables Make Rules On Different Interface? "iptables - L" shows no difference!
Date: Sun, 6 Jun 2004 13:57:59 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040606205759.47086.qmail@web41703.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2010730573-1086555479=:46554"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--0-2010730573-1086555479=:46554
Content-Type: text/plain; charset=us-ascii

hi all,
I want to make iptables impose different rules on two ethernet interfaces.

I would like to make restriction on external interface (eth0), but allow any traffic in and out of internal interface (eth1).
iptables -A INPUT -i eth1 -s 0/0 -d 0/0 -j ACCEPT
iptables -A OUTPUT -o eth1 -s 0/0 -d 0/0 -j ACCEPT

when applying these rules, iptables -L
it shows 
Chain INPUT (policy DROP)
target prot opt source destionation
Accept all -- anywhere anywhere

Chain OUTPUT (policy DROP)
target prot opt source destionation
Accept all -- anywhere anywhere

There is no place to differentiate interface eth0 or eth1

Anyone could give me some hints?

Thank you in advance.

BEST REGARDS
kurt 


		
---------------------------------
Do you Yahoo!?
Friends.  Fun. Try the all-new Yahoo! Messenger
--0-2010730573-1086555479=:46554
Content-Type: text/html; charset=us-ascii

<DIV>
<DIV class=postcolor>hi all,<BR>I want to make iptables impose different rules on two ethernet interfaces.<BR><BR>I would like to make restriction on external interface (eth0), but allow any traffic in and out of internal interface (eth1).<BR>iptables -A INPUT -i eth1 -s 0/0 -d 0/0 -j ACCEPT<BR>iptables -A OUTPUT -o eth1 -s 0/0 -d 0/0 -j ACCEPT<BR><BR>when applying these rules, iptables -L<BR>it shows <BR>Chain INPUT (policy DROP)<BR>target prot opt source destionation<BR>Accept all -- anywhere anywhere<BR><BR>Chain OUTPUT (policy DROP)<BR>target prot opt source destionation<BR>Accept all -- anywhere anywhere<BR><BR>There is no place to differentiate interface eth0 or eth1<BR><BR>Anyone could give me some hints?<BR><BR>Thank you in advance.<BR><BR>BEST REGARDS<BR>kurt </DIV><!-- THE POST --></DIV><p>
		<hr size=1><font face=arial size=-1>Do you Yahoo!?<br>Friends.  Fun. <a href="http://messenger.yahoo.com/">Try the all-new Yahoo! Messenger</a>
--0-2010730573-1086555479=:46554--

