From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: DNAT problem /  question
Date: Fri, 18 Jun 2004 18:45:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040618184508.23c93ae6.leslie.polzer@gmx.net>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net>
	<200406181706.28684.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406181706.28684.Antony@Soft-Solutions.co.uk>
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

On Fri, 18 Jun 2004 17:06:28 +0100
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> You have specified an inappropriate combination of address and netmask with 
> 172.25.239.220/27 - the address 220 is not the base address of a /27 range, 
> and it is possible (I am not certain) that this combination is confusing 
> netfilter.
I don't think this is a problem. They'll be masked out anyway.

Leslie

