From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: Server Connectivity
Date: Wed, 19 Feb 2003 04:02:19 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030219120219.38574.qmail@web40708.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1485481101-1045656139=:37127"
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

--0-1485481101-1045656139=:37127
Content-Type: text/plain; charset=us-ascii


Dear Friends,

I have 4 servers running linux, unix.

site1
------
server1 ppp0=1.2.3.4 eth0=192.168.0.1 OS=linux
server2 eth0=192.168.0.2 OS=unix with oracle9i with listener on port 1526

site2
------
server3 ppp0=5.6.7.8 eth0=192.168.1.1 OS=linux 
server4 eth0=192.168.1.2 OS=unix with oracle9i with listener port 1526


When i send any request from server4 to server3 on port 1526 its automatically forward it on server1, and server1 forward this request to server2 on port 1526.

and viz-versa


When i send any request from server2 to server1 on port 1526 its automatically forward it on server3, and server3 forward this request to server4 on port 1526.


autally i want to make connection between server2 to server4 and remember server2 and server4 is not connect with internet but they are connect on local area network. and server1 and server3 are connected with internet as well as with local area network.

please help me, how i can do this with iptables ?



---------------------------------
Do you Yahoo!?
Yahoo! Shopping - Send Flowers for Valentine's Day
--0-1485481101-1045656139=:37127
Content-Type: text/html; charset=us-ascii

<P>Dear Friends,</P>
<P>I have 4 servers running linux, unix.</P>
<P>site1<BR>------<BR>server1 ppp0=1.2.3.4 eth0=192.168.0.1 OS=linux<BR>server2 eth0=192.168.0.2 OS=unix with oracle9i with listener on port 1526</P>
<P>site2<BR>------<BR>server3 ppp0=5.6.7.8 eth0=192.168.1.1 OS=linux <BR>server4 eth0=192.168.1.2 OS=unix with oracle9i with listener port 1526</P>
<P><BR>When i send any request from server4 to server3 on port 1526 its automatically forward it on server1, and server1 forward this request to server2 on port 1526.</P>
<P>and viz-versa<BR></P>
<P>When i send any request from server2 to server1 on port 1526 its automatically forward it on server3, and server3 forward this request to server4 on port 1526.</P>
<P><BR>autally i want to make connection between server2 to server4 and remember server2 and server4 is not connect with internet but they are connect on local area network. and server1 and server3 are connected with internet as well as with local area network.</P>
<P>please help me, how i can do this with iptables ?</P><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/O=1/I=brandr/vday03/text/flow/*http://shopping.yahoo.com
/shop?d=browse&id=20146735">Yahoo! Shopping</a> - Send Flowers for Valentine's Day
--0-1485481101-1045656139=:37127--

