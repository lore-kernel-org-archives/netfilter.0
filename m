From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: are these enough now?
Date: Fri, 4 Oct 2002 16:32:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021004203205.GA21206@Ajftl1.ajfthome.on.ca>
References: <200210041218.26636@.> <200210041309.g94D9ML10904@vulcan.rissington.net> <200210042048.36993@.> <20021004191400.YGEY459.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021004191400.YGEY459.mta02-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Fri, Oct 04, 2002 at 15:13:58 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On 2002.10.04 15:13 Antony Stone wrote:
> On Friday 04 October 2002 4:22 pm, PayalR wrote:
> 

	Bulk of message snipped for brevity.


> being
> monitored but not monitoring anything else.
> 
> > Shall I block ICMP?
> 
> No !!!   ICMP is a very important part of traffic management, and you
> should
> not block it outright.   However, I cannot think of any ICMP message
> codes
> you should explicitly allow on this system, since everything you need
> should
> be handled by you ESTABLISHED,RELATED rules (ICMP forms the bulk of
> the
> RELATED category, except for things like ftp).

	Anthony ... My icmp chain ... (seems to work for me,
	and you can toss in limit rules as well)

	 
# $IPTABLES -A icmp_packets -j LOG --log-level 4 --log-prefix "IPT icmp 
IN:"
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
# $IPTABLES -A icmp_packets -j LOG --log-level DEBUG --log-prefix "IPT 
icmp DROP :"
$IPTABLES -A icmp_packets -j DROP



    With debugging rules commented out above,  ... I don't get hammered 
on
	all that often, but once in a while it helps to use both the 
logging rules,
	and I've on occasion had to put in limit rules....

	(P.S. this block is straight out of one of Oskar's HOWTO 
guides...
	thanks for the good tips Oskar)

	Alistair






> 
> > I intend to have some logging for SMTP, HTTP and POP3.
> > I have yet to formulate the rules for them. I will do it in day or
> two and
> > let ask here for opinion.
> 
> If you use syslogd to send log messages to a remote machine you will
> need to
> allow UDP port 514 out of your server.
> 
> > p.s I will drop the telnet also in a day or two :)
> 
> Good :-)
> 
> 
> Antony.
> 
> --
> 
> Perfection in design is achieved not when there is nothing left to
> add,
> but rather when there is nothing left to take away.
> 
>  - Antoine de Saint-Exupery
> 
> 


