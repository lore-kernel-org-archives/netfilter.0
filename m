From: Sandy C <sc_netfiltermail@yahoo.com>
Subject: netfilter machine in between 2 servers
Date: Sun, 14 Mar 2004 01:28:12 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040314092812.74659.qmail@web60006.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-683690491-1079256492=:74656"
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

--0-683690491-1079256492=:74656
Content-Type: text/plain; charset=us-ascii

Hi there,
   I have 3 Linux machines. One configured as a server, the second as a client, and the third sniffing packets transferring between the 2. All 3 machines are hooked up to each other over a hub, and all are running 100MB/s
 
   Using ethereal I can see the packets going between the server and the client. I would like the third, sniffing machine to be able to filter packets going between the client and the server. This doesn't seem to work though.
 
So I have the following rule on the third machine:
iptables -A INPUT -p 80 -j LOG
 
meaning just log all http requests. It doesn't work, but if I have this rule on either the client or the server, it works as expected.
 
I get the feeling I'm missing something very basic. Can anyone help?

Thanks,
S


Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
--0-683690491-1079256492=:74656
Content-Type: text/html; charset=us-ascii

<DIV>Hi there,</DIV>
<DIV>&nbsp;&nbsp; I have 3 Linux machines. One configured as a server, the second as a client, and the third sniffing packets transferring between the 2. All 3 machines are hooked up to each other over a hub, and all are running 100MB/s</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp; Using ethereal I can see the packets going between the server and the client. I would like the third, sniffing machine to be able to filter packets going between the client and the server. This doesn't seem to work though.</DIV>
<DIV>&nbsp;</DIV>
<DIV>So I have the following rule on the third machine:</DIV>
<DIV>iptables -A INPUT -p 80 -j LOG</DIV>
<DIV>&nbsp;</DIV>
<DIV>meaning just log all http requests. It doesn't work, but if I have this rule on either the client or the server, it works as expected.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I get the feeling I'm missing something very basic. Can anyone help?<BR><BR>Thanks,</DIV>
<DIV>S<BR></DIV><p><font face=arial size=-1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/mailtag_us/*http://mail.yahoo.com" target="_blank"><b>Yahoo! Mail</a></b> - More reliable, more storage, less spam
--0-683690491-1079256492=:74656--

