From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: Need Halp in Netfilter
Date: Wed, 15 Jan 2003 02:41:30 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030115104130.6396.qmail@web40710.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-209013797-1042627290=:4864"
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

--0-209013797-1042627290=:4864
Content-Type: text/plain; charset=us-ascii


I have setup two servers hostname server ip address 192.168.0.1 and hostname proxy ipaddress 192.168.0.2 both servers are connected with dialup sepratly and also configure squid, DHCP, DNS services. I have also 100 PCs of windows 98 as a client with auto ip and set their gateway,dns,dhcpserver and so on from DHCP 192.168.0.1.
 
Now I want that any request for browsing come from client  automatically forward to my squid which is running on 3128 port on server 192.168.0.2 and all others request go on direct ppp0 of 192.168.0.1. Please help me what script I make for this.

I also visited at netfilter website and found some script, I found "DHCP IP Firewall Script" 

http://iptables-tutorial.frozentux.net/scripts/rc.DHCP.firewall.txt

which is on site is little bit match with my requirment but for proxy request what should I do ?

 



---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now


---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-209013797-1042627290=:4864
Content-Type: text/html; charset=us-ascii

<P>I have setup two servers hostname server ip address 192.168.0.1 and hostname proxy ipaddress 192.168.0.2 both servers are connected with dialup sepratly and also configure squid, DHCP, DNS services. I have also 100 PCs of windows 98 as a client with auto ip and set their gateway,dns,dhcpserver and so on from DHCP 192.168.0.1.<BR>&nbsp;<BR>Now I want that any request for browsing come from client&nbsp; automatically forward to my squid which is running on 3128 port on server 192.168.0.2 and all others request go on direct ppp0 of 192.168.0.1. Please help me what script I make for this.</P>
<P>I also visited at netfilter website and found some script, I found "DHCP IP Firewall Script" </P>
<P><A href="http://iptables-tutorial.frozentux.net/scripts/rc.DHCP.firewall.txt">http://iptables-tutorial.frozentux.net/scripts/rc.DHCP.firewall.txt</A></P>
<P>which is on site is little bit match with my requirment but for proxy request what should I do ?</P>
<P>&nbsp;</P>
<P><BR>
<HR SIZE=1>
Do you Yahoo!?<BR><A href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</A> - Powerful. Affordable. <A href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</A><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-209013797-1042627290=:4864--

