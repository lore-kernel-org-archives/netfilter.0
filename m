From: =?iso-8859-1?q?honey=20grp?= <honeypict@yahoo.co.in>
Subject: Doubt regarding Linuxconf
Date: Thu, 27 Feb 2003 21:37:47 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030227213747.81254.qmail@web8201.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-435145305-1046381867=:77475"
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
To: netfilter@lists.netfilter.org

--0-435145305-1046381867=:77475
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit


Hi,

   We have basic problem regarding routing. We have removed all entries from linuxconf. So, now  if we do        netstat -r              then it should not show anything.

 But, still it  is showing

Kernel IP routing table

Destination Gateway  Genmask    Flags Metric Ref  Use  Iface

172.16.0.0   0.0.0.0   255.255.0.0   U     0         0      0    eth1

10.0.0.0       0.0.0.0  255.0.0.0       U     0         0      0   eth0

127.0.0.0     0.0.0.0  255.0.0.0        U    0         0      0   lo

0.0.0.0       10.0.0.56  0.0.0.0         UG  0         0      0   eth0

 

How to delete those entries permanantly?

If i use "route del" then entries are temprorary deleted and if i do 

"/etc/init.d/network  restart" then above entries are again shown. 

Can any1 plz let me know from where these entries come?

Thanking You,

Regards,

Honeypict

Catch all the cricket action. Download Yahoo! Score tracker
--0-435145305-1046381867=:77475
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<P>Hi,</P>
<P>&nbsp;&nbsp; We have basic problem regarding routing. We have removed all entries from linuxconf. So, now&nbsp;&nbsp;if we do &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; netstat -r&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; then it should not show anything.</P>
<P>&nbsp;But, still it&nbsp; is showing</P><FONT size=2>
<P>Kernel IP routing table</P>
<P>Destination Gateway&nbsp; Genmask&nbsp;&nbsp; &nbsp;Flags Metric Ref&nbsp; Use&nbsp; Iface</P>
<P>172.16.0.0&nbsp; &nbsp;0.0.0.0&nbsp;&nbsp; 255.255.0.0&nbsp; &nbsp;U&nbsp;&nbsp;&nbsp; &nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;0&nbsp;&nbsp; &nbsp;eth1</P>
<P>10.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0.0.0&nbsp; 255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U<FONT size=2></FONT>&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 &nbsp; eth0</P>
<P>127.0.0.0<FONT size=2></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0.0.0&nbsp; 255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp; &nbsp;lo</P>
<P>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.0.0.56 &nbsp;0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;UG &nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;0 &nbsp; eth0</P>
<P>&nbsp;</P>
<P>How to delete those entries permanantly?</P>
<P>If i use "route del" then entries are temprorary deleted and if i do </P>
<P>"/etc/init.d/network&nbsp; restart" then above entries are again shown. </P>
<P>Can any1 plz let me know from where these entries come?</P>
<P>Thanking You,</P>
<P>Regards,</P>
<P>Honeypict</P></FONT><p><img src="http://sg.yimg.com/i/aa/icons/28/cricket.gif" height=28 width=28>
Catch all the cricket action. Download <a href="http://in.sports.yahoo.com/cricket/tracker.html" target="_blank">
Yahoo! Score tracker</a>
--0-435145305-1046381867=:77475--

