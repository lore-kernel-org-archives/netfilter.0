From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Managing large number of rules
Date: Thu, 03 Jun 2004 11:18:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086275893.3189.13.camel@localhost>
References: <s0bf002f.044@GroupWise>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s0bf002f.044@GroupWise>
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
To: Brett Simpson <Simpsonb@hillsboroughcounty.org>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-06-03 at 10:40, Brett Simpson wrote:
> For those who have a large number (1000 or more) of Iptables rules how are you managing them?
> 
> Do you hand edit the rules or do you use a management gui (i.e. FwBuilder)?
> 
> Brett
I'll mention two items.  First, I always make sure I use the
iptables-restore files and syntax lest loading large rule sets create a
seemingly interminable bootup.

Second, this is exactly the impetus behind the ISCS project
(http://iscs.sourceforge.net).  The need was to handle the potentially
thousands of rules on hundreds and thousands of devices in order to
implement sophisticated, inter and intra office/partner security.  When
attempting to implement Internet style access controls internally to
achieve compartmentalization and a multi-layered defense, the size,
complexity and rate of change of the rule sets skyrocket.  Moreover, one
must manage this complexity without interfering with the NAT, VPN and
routing rules or the existing firewall rules.  Finally, the cost of
managing the complexity must not drive the cost of such multi-layered
security beyond a justifiable expense.

We've achieved these goals in a real world, multi-client distributed
managed service organization including a 90% reduction in the cost of
managing security using a no longer available proprietary product.  ISCS
is an open source replacement that achieves even better results using
completely original code.

Basically, the administrator describes the overall flow of information
and the desired security and the ISCS automatically generates and
distributes a consistent,properly ordered firewall/NAT/VPN/Router rules
set.  This is something beyond even the most expensive commercial tools
like Solsoft, SmartPipes or the global managers available from
NetScreen/Checkpoint/etc.

I would not dream of implementing the kind of security we did at Nexus
Management (http://www.nexusmgmt.com) without such a tool.  We are
between 2/3 and 3/4 of the way to our first release.  If anyone wants to
help with either time or money, we can use all the help we can get for
such an enormous project - John
-- 
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevelopmentcorp.com


