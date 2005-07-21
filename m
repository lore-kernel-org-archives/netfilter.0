From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: RST packets
Date: Thu, 21 Jul 2005 08:43:28 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507210838001.19151@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hi,


>http://www.knowplace.org/netfilter/ip_overview.html

|Sometimes, if either hosts need to tear down the connection quickly (timeout, 
|port or host unreachable, etc.), a RST (Reset) packet is sent. Note that 
|since a RST packet is not necessarily always part of a TCP connection, it can be 
|sent by itself. RST packets that are part of a TCP connection is usually 
|accompanied by the ACK flag as well.

What would be the use of RST if it is not part of a connection?
Is it...vv?
  A and B are connected
  A crashes
  B tries to send
  A sends RST,!ACK



Jan Engelhardt
-- 

