From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Spoofing
Date: Fri, 7 Nov 2003 13:56:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071356.hA7DuFj14742@agate.rockstone.co.uk>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br> <1068208010.29753.10.camel@tarkus> <1068212092.1438.8.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068212092.1438.8.camel@main.tqmcube.com>
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
To: IPTables Mailing List <netfilter@lists.netfilter.org>

On Friday 07 November 2003 1:34 pm, David C. Hart wrote:

> On Fri, 2003-11-07 at 07:26, Ted Kaczmarek wrote:
> > I would add an input established on that as well, makes it easier to do
> > upgrades.
> >
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> Hi Ted:
>
> If you have a moment, could you please explain (for the comparative IPT
> nitwits - including me) what that does?

Any packet which arrives at the machine running netfilter (because this rule 
is in the INPUT chain - if it were in the FORWARD chain then it would apply 
to any packet being routed through the machine running netfilter) which is 
part of an ESTABLISHED connection, or which is RELATED to and ESTABLISHED 
connection, is ACCEPTed.

What defines a connection as ESTABLISHED?

Basically, "is there an entry for it in the connection tracking table?"   
Entries get placed in this table when the first packet of a connection gets 
seen (this will only happen if you have an OUTPUT rule, or a FORWARD rule, 
allowing that first packet to be ACCEPTed).   After that, the reply and all 
other packets which are part of the same connection (which is defined by the 
source & destination IP plus the source & destination port numbers) will get 
matched by the rule above, no matter which other rule matched the first 
packet.

What defines a packet as RELATED?

Either, is it known to a connection tracking helper for a specific protocol 
which uses multiple connections (such as FTP), or, is it an ICMP packet in 
response to another packet, indicating a problem somewhere.

HTH

Antony.

-- 

If books were designed by Microsoft, the Anarchist's Cookbook would explode 
when you read it.

 - Mark W Schumann
                                                     Please reply to the list;
                                                           please don't CC me.

