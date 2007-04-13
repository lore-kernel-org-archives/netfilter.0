From: Hugo Mildenberger <Hugo.Mildenberger@t-online.de>
Subject: Re: RELATED connections and the feeling of security
Date: Fri, 13 Apr 2007 21:21:59 +0200
Message-ID: <200704132121.59717.Hugo.Mildenberger@t-online.de>
References: <200704131202.27971.Hugo.Mildenberger@t-online.de>
	<200704131457.59976.Hugo.Mildenberger@t-online.de>
	<1176474664.9361.17.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1176474664.9361.17.camel@anduril.intranet.cartel-securite.net>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Am Freitag 13 April 2007 16:31 schrieben Sie:
>There's a few conntrack helper around: FTP, IRC, H323, SIP, etc.

Clearly, but of these, I use only FTP, if any.

> The very first step to me is reliably reproducing your issue.

This is what I tried meanwhile. The result (gained manually by means of 
a telnet client while having established a ssh session in the opposite 
direction) is completely negative: netfilter actually turns down reverse 
directed packets even if RELATED state is configured as acceptable.

It's somewhat hard to admit, but for truth's sake: I must have misinterpreted 
an unusual windows firewall log entry. On  certain conditions, most probably 
when the loading of a web page is interrupted somehow, the receiving socket 
is already shut down while the server still continues sending. Apparently 
because the Windows firewall had started blocking the socket's associated 
port, he drops a message which roughly reads :

"2007-0X-0X 09:XX:XX DROP TCP 193.227.146.1 192.168.XXX.XXX 80 1369 XXXX A 
XXXX XXX - - - RECEIVE"

I probably  -- I don't have the old logs around -- saw only  the DROP, a known 
server's source address and port number 80. But this actually was the source 
port, and the local destination port the number behind it, that port, which 
was closed shortly before. Sorry for any inconvenience.


Best Regards

Hugo Mildenberger




