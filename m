From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: 2 Dialup on single pc
Date: Tue, 22 Apr 2003 11:32:07 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030422183207.35212.qmail@web40701.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1946352552-1051036327=:34836"
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

--0-1946352552-1051036327=:34836
Content-Type: text/plain; charset=us-ascii

Dear Experts,I have Red Hat Linux 7.3, with 25 users with of windows98 sharing internet connection from this pc on single dialup. script is given below iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE
iptables --append FORWARD --in-interface eth0 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward Now I have confgiure second modem dailup, now what should I do to use this both dailup to balance network traffic from singal dialup. please guide me if it is possible then what should I change in my script.


---------------------------------
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
--0-1946352552-1051036327=:34836
Content-Type: text/html; charset=us-ascii

<DIV>Dear Experts,</DIV>
<DIV>I have Red Hat Linux 7.3, with 25 users with of windows98 sharing internet connection from this pc on single dialup. script is given below</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE<BR>iptables --append FORWARD --in-interface eth0 -j ACCEPT<BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward</DIV>
<DIV>&nbsp;</DIV>
<DIV>Now I have confgiure second modem dailup, now what should I do to use this both dailup to balance network traffic from singal dialup.</DIV>
<DIV>&nbsp;</DIV>
<DIV>please guide me if it is possible then what should I change in my script.</DIV><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/search/mailsig/*http://search.yahoo.com">The New Yahoo! Search</a> - Faster. Easier. Bingo.
--0-1946352552-1051036327=:34836--

