From: Ashraf Zia <ashrafszia@yahoo.com>
Subject: NAT + Web based authentication ?
Date: Sun, 17 Aug 2003 17:13:14 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030818001314.67363.qmail@web11504.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1936394537-1061165594=:66911"
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

--0-1936394537-1061165594=:66911
Content-Type: text/plain; charset=us-ascii



HI everybody,

I am new to iptables. Need to figure out a solution.

- Want to create an authentication based NAT. 

- Have the gateway machine running DHCP server on eth1 that gives up 192.168.1.x ip addresses.

- eth0 on the gateway has a real ip. 

- I have an web based authentication working at lets say www.abc.com on a remote web server.

- Now I have the Masquerading working at the gateway machine but I need to restrict the internet access to ip addresses who can authenticate themselves at www.abc.com. How do I interface authentication from web server with Iptables NAT and what rules do I use to get this done.

- Also I need that any port 80 request from address 192.168.1.x by defaults goes to www.abc.com 

I think it can be done using script, but I am not sure how to use iptables for this. 

Thanks in advance.

Zia

 


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-1936394537-1061165594=:66911
Content-Type: text/html; charset=us-ascii

<DIV></DIV>
<P>HI everybody,</P>
<P>I am new to iptables. Need to figure out a solution.</P>
<P>- Want to create an authentication based NAT. </P>
<P>- Have the gateway machine running DHCP server on eth1 that gives up 192.168.1.x ip addresses.</P>
<P>- eth0 on the gateway has a real ip.&nbsp;</P>
<P>- I have an web based authentication working at lets say <A href="http://www.abc.com">www.abc.com</A> on a remote web server.</P>
<P>- Now I have the Masquerading working at the gateway machine but I need to restrict the internet access to ip addresses who can authenticate themselves at <A href="http://www.abc.com">www.abc.com</A>. How do I interface authentication from web server with Iptables NAT and what rules do I use to get this done.</P>
<P>- Also I need that any port 80 request from address 192.168.1.x by defaults goes to <A href="http://www.abc.com">www.abc.com</A> </P>
<P>I think it can be done using script, but I am not sure how to use iptables for this. </P>
<P>Thanks in advance.</P>
<P>Zia</P>
<P>&nbsp;</P><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-1936394537-1061165594=:66911--

