From: "Babar Kazmi" <babarkazmi@hotmail.com>
Subject: Re: Block MSN Messenger & Yahoo Messenger
Date: Fri, 12 Dec 2003 10:19:39 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY9-F28GRpJqseWAtK000146fc@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mgale@utilitran.com, netfilter@lists.netfilter.org

<html><div style='background-color:'><DIV class=RTE><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>Hello Michael</mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help></DIV>
<DIV class=RTE><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help>&nbsp;</DIV>
<DIV class=RTE><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>Yes, You can block ports on Squid.</mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help></DIV>
<DIV class=RTE><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help>&nbsp;</DIV>
<DIV class=RTE><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>acl msn_messenger req_mime_type -i "illegal-mime-types.txt" <BR>http_access deny msn_messenger </mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help></DIV>
<P><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>Regards </mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help></P>
<P><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>Babar Kazmi.</P>
<DIV class=RTE><BR></DIV></mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help>
<DIV class=RTE><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>&nbsp;</DIV>
<DIV></DIV>&gt;Hello, 
<DIV></DIV>&gt; 
<DIV></DIV>&gt; Would running squid in transparent mode with no cache :) be able to block MSN and yahoo messenger :) 
<DIV></DIV>&gt; 
<DIV></DIV>&gt;Michael. 
<DIV></DIV>&gt; 
<DIV></DIV>&gt; 
<DIV></DIV>&gt;On Thu, 11 Dec 2003 10:43:28 +1000 
<DIV></DIV>&gt;"Lawrence Tang" <INGSIONG@DALTRON.COM.PG>wrote: 
<DIV></DIV>&gt; 
<DIV></DIV>&gt; &gt; Hi, 
<DIV></DIV>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; I have an RH9 with NAT access for the client. I would like to block MSN &amp; Yahoo messenger from the client to access. 
<DIV></DIV>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; Can any body advice me ? Thanks in advance. 
<DIV></DIV>&gt; &gt; 
<DIV></DIV>&gt; &gt; Best Regards, 
<DIV></DIV>&gt; &gt; 
<DIV></DIV>&gt; &gt; Lawrence Tang 
<DIV></DIV>&gt; &gt; 
<DIV></DIV>&gt; 
<DIV></DIV>&gt; 
<DIV></DIV>&gt;-- 
<DIV></DIV>&gt;Michael Gale 
<DIV></DIV>&gt;Network Administrator 
<DIV></DIV>&gt;Utilitran Corporation 
<DIV></DIV>&gt; 
<DIV></DIV></mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help></div><br clear=all><hr>STOP MORE SPAM with <a href="http://g.msn.com/8HMAEN/2728??PS=">the new MSN 8</a> and get 2 months FREE*</html>

