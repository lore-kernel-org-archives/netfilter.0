From: =?iso-8859-1?q?honey=20grp?= <honeypict@yahoo.co.in>
Subject: Problem Regarding Forwarding
Date: Sun, 2 Mar 2003 21:05:29 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030302210529.74972.qmail@web8206.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1902419674-1046639129=:73668"
Content-Transfer-Encoding: 8bit
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

--0-1902419674-1046639129=:73668
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit


Hi,

I have my network setup as

                                            eth1-----------COMP B

Comp A ------eth0----Gateway---|

                                             eth2------------COMP C

I want to  forward the traffic from CompA to both CompB as well as CompC. The problem is I want to keep same IP address for Both Comp B and Comp C. (I know there will be conflict but I am keeping CompB OFF when CompC is ON and vice versa).

Now, how should I write iptable rules so that traffic will be forwarded to both eth1 as well as eth2 so that the host that is ON will respond

Thanking you,

Regards,

Honeypict group

 

Catch all the cricket action. Download Yahoo! Score tracker
--0-1902419674-1046639129=:73668
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<P><FONT face=Verdana>Hi,</FONT></P>
<P><FONT face=Verdana>I have my network setup as</FONT></P>
<P><FONT face=Verdana>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth1-----------COMP B</FONT></P>
<P><FONT face=Verdana>Comp A ------eth0----Gateway---|</FONT></P>
<P><FONT face=Verdana>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth2------------COMP C</FONT></P>
<P><FONT face=Verdana>I want to&nbsp; forward the&nbsp;traffic&nbsp;from CompA to both CompB as well as CompC. The problem is I want to keep same IP address for Both Comp B and Comp C. (I know there will be conflict but I am keeping CompB&nbsp;OFF when CompC is ON and vice versa).</FONT></P>
<P><FONT face=Verdana>Now, how should I write iptable rules so that traffic will be forwarded to both eth1 as well as eth2 so that the host that is ON will respond</FONT></P>
<P><FONT face=Verdana>Thanking you,</FONT></P>
<P><FONT face=Verdana>Regards,</FONT></P>
<P><FONT face=Verdana>Honeypict group</FONT></P>
<P><FONT face=Verdana size=1></FONT>&nbsp;</P><p><img src="http://sg.yimg.com/i/aa/icons/28/cricket.gif" height=28 width=28>
Catch all the cricket action. Download <a href="http://in.sports.yahoo.com/cricket/tracker.html" target="_blank">
Yahoo! Score tracker</a>
--0-1902419674-1046639129=:73668--

