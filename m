From: ca96@comcast.net
Subject: ip_conntrack for forwarded IPv4 packets
Date: Sun, 22 Aug 2004 23:35:10 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <082220042335.24480.41292DAE0008E7D600005FA02200750784C0C70E0C@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="NextPart_Webmail_9m3u9jl4l_24480_1093217710_0"
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


--NextPart_Webmail_9m3u9jl4l_24480_1093217710_0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

I have a basic question on connection tracking for IPv4 packets that need to be forwarded.
Is it possible to do connection tracking only for packets that are locally terminated and not for packets that need forwarding? Since, connection tracking requires reassembling IP fragments, I wanted to know if there is any way to avoid reassembly in the forward path when connection tracking is enabled.
Thank you!
-CA
--NextPart_Webmail_9m3u9jl4l_24480_1093217710_0
Content-Type: text/html
Content-Transfer-Encoding: 8bit

<html><body>
<!--StartFragment -->
<DIV class=moz-text-html lang=x-western>
<P><FONT face="Courier New, Courier, mono">I&nbsp;have a basic question on connection tracking for IPv4 packets that need to be forwarded.</FONT></P>
<P><FONT face="Courier New, Courier, mono">Is it possible to do connection tracking only for&nbsp;packets that are locally terminated and not for packets that need forwarding? Since, connection tracking requires reassembling IP fragments, I wanted to know if there is any way to avoid reassembly in the forward path when connection tracking is enabled.</FONT></P>
<P><FONT face="Courier New, Courier, mono">Thank you!</FONT></P>
<P><FONT face="Courier New, Courier, mono">-CA</FONT></P></DIV></body></html>

--NextPart_Webmail_9m3u9jl4l_24480_1093217710_0--

