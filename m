From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: Block MAC Address
Date: Sun, 16 Mar 2003 02:06:06 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030316100606.98881.qmail@web40703.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1597223862-1047809166=:98083"
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

--0-1597223862-1047809166=:98083
Content-Type: text/plain; charset=us-ascii


I have Red Hat Linux 7.3 and complie this iptables script to make this PC to a Internet gatway. 
This script is running well.


#  Flush all Rules
/sbin/iptables --flush
/sbin/iptables --table nat --flush
/sbin/iptables --delete-chain
/sbin/iptables --table nat --delete-cha
/sbin/iptables -N MACtest 

#  to block this MAC Address
/sbin/iptables -A MACtest -m mac --mac-source 00:11:22:33:44:55 -j DROP

#  for transprent proxy
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128

#  for MASQUREADE
/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE

echo "1" > /proc/sys/net/ipv4/ip_forward

 

I want to block a mac address, but this script is not blocking for it, any idea?

 



---------------------------------
Do you Yahoo!?
Yahoo! Web Hosting - establish your business online
--0-1597223862-1047809166=:98083
Content-Type: text/html; charset=us-ascii

<P>I have Red Hat Linux 7.3 and complie this iptables script to make this PC to a Internet gatway. <BR>This script is running well.</P>
<P><BR>#&nbsp; Flush all Rules<BR>/sbin/iptables --flush<BR>/sbin/iptables --table nat --flush<BR>/sbin/iptables --delete-chain<BR>/sbin/iptables --table nat --delete-cha<BR>/sbin/iptables -N MACtest </P>
<P>#&nbsp; to block this MAC Address<BR>/sbin/iptables -A MACtest -m mac --mac-source 00:11:22:33:44:55 -j DROP</P>
<P>#&nbsp; for transprent proxy<BR>/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128</P>
<P>#&nbsp; for MASQUREADE<BR>/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE</P>
<P>echo "1" &gt; /proc/sys/net/ipv4/ip_forward</P>
<P>&nbsp;</P>
<P>I want to block a mac address, but this script is not blocking for it, any idea?</P>
<P>&nbsp;</P><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/webhosting/mail_tagline/evt=7748/*http://webhosting.yahoo.com/ps/wh3/prod/">Yahoo! Web Hosting</a> - establish your business online
--0-1597223862-1047809166=:98083--

