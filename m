From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port scan identification
Date: Thu, 10 Jun 2004 11:37:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406101137.16463.Antony@Soft-Solutions.co.uk>
References: <40C635E0.2010208@wanadoo.fr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C635E0.2010208@wanadoo.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 08 June 2004 10:55 pm, Rakotomandimby Mihamina wrote:

> I have this rule :
>
> iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST \
> -j LOG --log-level debug --log-prefix 'p_scan_: '
>
> and i see this when i tail the output file :
>
> Jun  8 22:52:32 milina kernel: p_scan_: IN=ppp0 OUT= MAC=
> SRC=81.220.171.201 DST=81.248.95.56 LEN=40 TOS=0x00 PREC=0x00 TTL=54
> ID=45424 PROTO=TCP SPT=4391 DPT=80 WINDOW=0 RES=0x00 RST URGP=0
>
> Well . According to me, a port scan is the action to scan _all_ the
> ports ... why is the port scan identified as only scaning the 80th port
> ? I mean, a port scan should not be on one port only ... isn't it ?

A packet can only be sent to one address and one port.   You cannot send a 
single packet to multiple ports.   Therefore what is commonly called a "port 
scan" is a series of packets, each addressed to a different port, which 
between them result in lots of ports being scanned.

You are seeing someone sending a packet to port 80.   Maybe they'll send one 
to port 110 tomorrow, or next week, or five seconds later, or whenever they 
feel like it....

Regards,

Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell 
more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the list;
                                                           please don't CC me.


