From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: connection limit per ip
Date: Mon, 19 Jul 2004 22:52:37 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040720055237.12274.qmail@web40702.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-848510314-1090302757=:11935"
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

--0-848510314-1090302757=:11935
Content-Type: text/plain; charset=us-ascii

I have red hat linux 7.3 with normail dialup and i have 15 clients which are connected with my linux box.
 
I am using simple MASQUERADING for internet sharing, now i want to put limit of 1kb limit for each user.
 
here is my rule for internet sharing, please advice me it is good enough or should i change my rule.
 
/sbin/iptables --flush
/sbin/iptables --table nat --flush
/sbin/iptables --delete-chain
/sbin/iptables --table nat --delete-chain
/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward 

		
---------------------------------
Do you Yahoo!?
Vote for the stars of Yahoo!'s next ad campaign!
--0-848510314-1090302757=:11935
Content-Type: text/html; charset=us-ascii

<DIV>I have red hat linux 7.3 with normail dialup and i have 15 clients which are connected with my linux box.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am using simple MASQUERADING for internet sharing, now i want to put limit of 1kb limit for each user.</DIV>
<DIV>&nbsp;</DIV>
<DIV>here is my rule for internet sharing, please advice me it is good enough or should i change my rule.</DIV>
<DIV>&nbsp;</DIV>
<DIV>/sbin/iptables --flush<BR>/sbin/iptables --table nat --flush<BR>/sbin/iptables --delete-chain<BR>/sbin/iptables --table nat --delete-chain<BR>/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE<BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward </DIV><p>
		<hr size=1>Do you Yahoo!?<br>
<a href="http://advision.webevents.yahoo.com/yahoo/votelifeengine/">Vote for the stars of Yahoo!'s next ad campaign!</a>
--0-848510314-1090302757=:11935--

