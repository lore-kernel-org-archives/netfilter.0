From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: What is ACK PSH FIN and why is it blocked?
Date: Thu, 11 Aug 2005 07:47:02 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508110744370.28320@yvahk01.tjqt.qr>
References: <1123600895.17896.40.camel@ws50.darkcore.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123600895.17896.40.camel@ws50.darkcore.net>
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
To: John Lange <john.lange@open-it.ca>
Cc: netfilter <netfilter@lists.netfilter.org>


>I get quite a number of packets dropped as follows; This is packet from
>my web server to a given host:
>
>Aug  8 01:20:12 venus kernel: IN= OUT=eth0 SRC=<myServerIP>
>DST=<someHost> LEN=471 TOS=0x00 PREC=0x00 TTL=64 ID=13332 DF PROTO=TCP
>SPT=80 DPT=10067 WINDOW=1716 RES=0x00 ACK PSH FIN URGP=0

>iptables -P OUTPUT DROP
>iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>iptables -A OUTPUT -m state --state NEW -p tcp --sport 80 -j ACCEPT
>iptables -A OUTPUT -p any -j LOG

I wonder why ACK,PSH,FIN is not seen as ESTABLISHED...

>So what is a packet with "ACK PSH FIN" set?

It's the "I'm closing the connection now" packet. ACK seems to be set most of 
the times, so don't wonder. PSH is to force the packet out-the-door now, i.e. 
disable holding this packet for buffering.

>I assume they are being
>blocked because they are neither "SYN" nor part of an established
>connection? But what are they and should they be allowed?

I think they would match --state INVALID, but IMHO, they should not. Unless of 
course, someone's using RAW sockets and injecting in fact, invalid packets. 
(But that would bypass netfilter anyway, should not it?)



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

