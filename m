From: "Anderson, Ray" <rsa@prideindustries.com>
Subject: RE: block msn
Date: Wed, 16 Jul 2003 08:54:37 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9FEBBE3B5C27D311B0B90050041E59B003CFF054@ziggy.prideindustries.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_yp6DmSsqecO18TDUorQ/fg)"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-return: allowed
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: juanca <juanca@sat.com.py>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Boundary_(ID_yp6DmSsqecO18TDUorQ/fg)
Content-type: text/plain

Well, it looks like to me that the source should be 0.0.0.0, or nothing at
all to block all msn on all machines.

-=Ray


-----Original Message-----
From: juanca [mailto:juanca@sat.com.py] 
Sent: Wednesday, July 16, 2003 4:36 AM
To: netfilter@lists.netfilter.org
Subject: block msn


I`ve got this rulset but It doesn`t work what else do I need to add?
All the windows machine work msn, just on linux doesn`t
Any suggetions ?
Thanks in advance

iptables -A FORWARD -s 192.168.0.10 -p TCP --dport 1443:1467 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.33 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.38 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1513:1525 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 66.35.229.204 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 65.54.194.118 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.34 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 208.45.129.195 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP
iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.11 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1601:1603 -d 0/0 -j DROP
iptables -A FORWARD -s 192.168.0.10 -d 64.4.13.0/24 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 64.4.0.0/24 -j REJECT
iptables -A INPUT -p tcp -s 192.168.0.10 -d messenger.microsoft.com -j DROP


--Boundary_(ID_yp6DmSsqecO18TDUorQ/fg)
Content-type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2654.45">
<TITLE>RE: block msn</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>Well, it looks like to me that the source should be 0.0.0.0, or nothing at all to block all msn on all machines.</FONT>
</P>

<P><FONT SIZE=2>-=Ray</FONT>
</P>
<BR>

<P><FONT SIZE=2>-----Original Message-----</FONT>
<BR><FONT SIZE=2>From: juanca [<A HREF="mailto:juanca@sat.com.py">mailto:juanca@sat.com.py</A>] </FONT>
<BR><FONT SIZE=2>Sent: Wednesday, July 16, 2003 4:36 AM</FONT>
<BR><FONT SIZE=2>To: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=2>Subject: block msn</FONT>
</P>
<BR>

<P><FONT SIZE=2>I`ve got this rulset but It doesn`t work what else do I need to add?</FONT>
<BR><FONT SIZE=2>All the windows machine work msn, just on linux doesn`t</FONT>
<BR><FONT SIZE=2>Any suggetions ?</FONT>
<BR><FONT SIZE=2>Thanks in advance</FONT>
</P>

<P><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -p TCP --dport 1443:1467 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.33 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.38 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1513:1525 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 66.35.229.204 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 65.54.194.118 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.34 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 208.45.129.195 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.11 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1601:1603 -d 0/0 -j DROP</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 64.4.13.0/24 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A FORWARD -s 192.168.0.10 -d 64.4.0.0/24 -j REJECT</FONT>
<BR><FONT SIZE=2>iptables -A INPUT -p tcp -s 192.168.0.10 -d messenger.microsoft.com -j DROP</FONT>
</P>

</BODY>
</HTML>

--Boundary_(ID_yp6DmSsqecO18TDUorQ/fg)--

