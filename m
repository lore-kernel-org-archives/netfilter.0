From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: How to Block Mac Address ?
Date: Sat, 14 Jun 2003 23:56:22 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030615065622.27723.qmail@web40707.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2018361082-1055660182=:27585"
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
To: netfilter@lists.samba.org

--0-2018361082-1055660182=:27585
Content-Type: text/plain; charset=us-ascii


I want to block a mac address for this I complie this rule 
but it is not working, any friend who can slove this problem.


#  Flush all Rules
/sbin/iptables --flush
/sbin/iptables --table nat --flush
/sbin/iptables --delete-chain
/sbin/iptables --table nat --delete-cha
/sbin/iptables -N MACtest

#  to block this MAC Address
/sbin/iptables -t filter -A FORWARD -j MACtest
/sbin/iptables -A MACtest -m mac --mac-source 00:02:55:EE:65:D8 -j DROP

#  for MASQUREADE
/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE

echo "1" > /proc/sys/net/ipv4/ip_forward




---------------------------------
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
--0-2018361082-1055660182=:27585
Content-Type: text/html; charset=us-ascii

<P>I want to block a mac address for this I complie this rule <BR>but it is not working, any friend who can slove this problem.</P>
<P><BR>#&nbsp; Flush all Rules<BR>/sbin/iptables --flush<BR>/sbin/iptables --table nat --flush<BR>/sbin/iptables --delete-chain<BR>/sbin/iptables --table nat --delete-cha<BR>/sbin/iptables -N MACtest</P>
<P>#&nbsp; to block this MAC Address<BR>/sbin/iptables -t filter -A FORWARD -j MACtest<BR>/sbin/iptables -A MACtest -m mac --mac-source 00:02:55:EE:65:D8 -j DROP</P>
<P>#&nbsp; for MASQUREADE<BR>/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE</P>
<P>echo "1" &gt; /proc/sys/net/ipv4/ip_forward<BR></P>
<DIV></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://rd.yahoo.com/evt=1207/*http://promo.yahoo.com/sbc/">SBC Yahoo! DSL</a> - Now only $29.95 per month!
--0-2018361082-1055660182=:27585--

