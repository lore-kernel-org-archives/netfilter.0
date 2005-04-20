From: Jason Opperisano <opie@817west.com>
Subject: Re: Connection tracking via RPC transaction ID
Date: Wed, 20 Apr 2005 15:13:03 -0400
Message-ID: <20050420191303.GA25136@bender.817west.com>
References: <4266A285.1040205@rfmd.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4266A285.1040205@rfmd.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Apr 20, 2005 at 02:42:13PM -0400, Stephen P. Schaefer wrote:
> I'm trying to SNAT an NFS client, but the NFS server (a NetApp) has
> two IP addresses, and though DNS advertises it at the first address,
> e.g. 192.168.200.10, its answers come back from the other address,
> e.g., 192.168.2.150. If I'm not behind the SNAT, there's no problem
> because the client kernel ignores the source IP address and just looks
> at the RPC transaction ID, but behind the SNAT, the fact that the
> answer comes back from a different address than that to which the
> request went breaks connection tracking.  I've currently worked around
> the problem with a DNAT rule:
> 
> iptables -t nat -A PREROUTING -d 192.168.200.10 -i eth1 -j DNAT 
> --to-destination 192.168.2.150
> 
> ...but I'm woried that this is less than robust.  In particular, I
> don't understad why the NetApp uses one address or the other to reply,
> and what will keep it from behaving differently tomorrow.  Is there a
> connection tracking module that works on RPC transaction ID and can
> ignore the source address?  Would it be difficult to write?  Is there
> code that does something similar that I should study?

there's an RPC conntrack module in PoM:

  http://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng/rpc/

it's 2.4-only, and i have no clue if it helps with this specific
situation.

-j

--
"Quagmire: Tuesdays in the '80s I was always in bed by 8... and home
 by 11."
        --Family Guy

