From: dchemko <dchemko@smgtec.com>
Subject: Re: bind 9 and iptables
Date: Fri, 27 Aug 2004 21:40:04 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41300CA4.5020408@smgtec.com>
References: <D5C9032B2B09C64EA2409D6214E91AC90512F9@asimail2.alphanumeric.co
	m> <20040828004745.GC22322@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040828004745.GC22322@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Nick Drage wrote:

>On Fri, Aug 27, 2004 at 05:19:07PM -0400, Jason Opperisano wrote:
>
>  
>
>>long answer:  it has been discussed on this list previously that
>>connection tracking DNS queries/responses on or for a busy DNS server
>>(i think the number was ~ 200 queries/second) will slow the name
>>resolution process down.  the reason being that the state creation
>>adds noticeable, unnecessary latency, as most (all?) queries are one
>>packet request--one packet response.
>>    
>>
>
>I've a vague recollection of being able to specify that a rule won't
>create an entry in the state table, so for situations like this
>netfilter can act faster, as long as you specify the correct rules for
>connections both ways.  However I can't find anything in the
>documentation about this... after a cursory look... can anyone refresh
>my memory?
>
>  
>
iptables -t raw -A PREROUTING -p udp --dport 53 -j NOTRACK
iptables -t raw -A PREROUTING -p udp --sport 53 -j NOTRACK
# Not sure about if you can turn it off from internally sourced (OUTPUT 
chain packets)
iptables -t raw -A OUTPUT -p udp --dport 53 -j NOTRACK
iptables -t raw -A OUTPUT -p udp --sport 53 -j NOTRACK

CONFIG_IP_NF_RAW
  This option adds a `raw' table to iptables. This table is the very
  first in the netfilter framework and hooks in at the PREROUTING
  and OUTPUT chains.

  If you want to compile it as a module, say M here and read
  <file:Documentation/modules.txt>.  If unsure, say `N'.

NOTRACK target support
CONFIG_IP_NF_TARGET_NOTRACK
  The NOTRACK target allows a select rule to specify
  which packets *not* to enter the conntrack/NAT
  subsystem with all the consequences (no ICMP error tracking,
  no protocol helpers for the selected packets).

  If you want to compile it as a module, say M here and read
  <file:Documentation/modules.txt>.  If unsure, say `N'.


