From: Shashidhar Lakkavalli <lakkavas@yahoo.com>
Subject: High speed filtering using RAW sockets and NetFilter
Date: Sun, 11 Apr 2004 16:47:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040411234713.98707.qmail@web41811.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1002485539-1081727233=:98705"
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

--0-1002485539-1081727233=:98705
Content-Type: text/plain; charset=us-ascii

Hi,
 
I am trying to use iptables to drop all packets received by my interface, so that there could be no IP stack processing. I am then trying to filter specific packets using RAW sockets. For up to 10-12Mbps, my filter accepts 90% of the packets... but increasing the data rate, causes my filter to accept negligible number of packets... I am using IXIA to generate packets, and a LINUX box (2.4 kernel), with a Pentium II CPU.
 
Is my CPU a bottleneck for my filtering??? If someone can guide me on this, it would be very helpful.
 
Thanks,
Lakkavas.
 


---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - File online by April 15th
--0-1002485539-1081727233=:98705
Content-Type: text/html; charset=us-ascii

<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am trying to use iptables to drop all packets received by my interface, so that there could be no IP stack processing. I am then trying to filter specific packets using RAW sockets. For up to 10-12Mbps, my filter accepts 90% of the packets... but increasing the data rate, causes my filter to accept negligible number of packets... I am using IXIA to generate packets, and a LINUX box (2.4 kernel), with a Pentium II CPU.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Is my CPU a bottleneck for my filtering??? If someone can guide me on this, it would be very helpful.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>Lakkavas.</DIV>
<DIV>&nbsp;</DIV><p><hr size=1><font face=arial size=-1>Do you Yahoo!?<br>
Yahoo! Tax Center - <a href="http://taxes.yahoo.com/filing.html">File online by April 15th</a>
--0-1002485539-1081727233=:98705--

