From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Source Port
Date: 15 Apr 2003 18:20:33 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050411060.6649.1.camel@india>
References: <1050404537.1482.19.camel@india> 
	<1050405086.1439.47.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Ntpz07aWYKw9LRbQFf4M"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050405086.1439.47.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-Ntpz07aWYKw9LRbQFf4M
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Yes, That is how the applications work. The server will connect to the
client's arbitrary ports for communication except some cases. 



On Tue, 2003-04-15 at 16:41, Raymond Leach wrote:

    Why? In the specific example that you give, what would be the
    implications?
    
    
    On Tue, 2003-04-15 at 13:02, Dharmendra.T wrote:
    > Hi Everyone, 
    > 
    > I am a regular reader of this list and I have absorbed that most of
    > the users won't use the source ports in their rules. Say for ex, 
    > 
    > #iptables -A INPUT -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j
    > ACCEPT 
    > 
    > In these kind of rules they will not specify the source port from 1024
    > to 65545. I strongly recommend all Linux Users to specify the exact
    > rules what is allowed and what is not allowed. 
    > 
    > Any Comments? This could be a good practise? 
    > -- 
    > Regards
    > Dharmendra.T
    > 
    > 
    > This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.
    
    

-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-Ntpz07aWYKw9LRbQFf4M
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Yes, That is how the applications work. The server will connect to the client's arbitrary ports for communication except some cases. 
<BR>

<BR>

<BR>

<BR>
On Tue, 2003-04-15 at 16:41, Raymond Leach wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>Why? In the specific example that you give, what would be the</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>implications?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>On Tue, 2003-04-15 at 13:02, Dharmendra.T wrote:</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; Hi Everyone, </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; I am a regular reader of this list and I have absorbed that most of</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; the users won't use the source ports in their rules. Say for ex, </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; #iptables -A INPUT -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; ACCEPT </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; In these kind of rules they will not specify the source port from 1024</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; to 65545. I strongly recommend all Linux Users to specify the exact</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; rules what is allowed and what is not allowed. </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; Any Comments? This could be a good practise? </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; -- </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; Regards</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; Dharmendra.T</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&gt; This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-Ntpz07aWYKw9LRbQFf4M--


