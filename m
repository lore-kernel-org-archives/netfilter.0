From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: bind 9 and iptables
Date: Sat, 28 Aug 2004 01:47:46 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040828004745.GC22322@metastasis.org.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC90512F9@asimail2.alphanumeric.co m>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512F9@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Aug 27, 2004 at 05:19:07PM -0400, Jason Opperisano wrote:

> long answer:  it has been discussed on this list previously that
> connection tracking DNS queries/responses on or for a busy DNS server
> (i think the number was ~ 200 queries/second) will slow the name
> resolution process down.  the reason being that the state creation
> adds noticeable, unnecessary latency, as most (all?) queries are one
> packet request--one packet response.

I've a vague recollection of being able to specify that a rule won't
create an entry in the state table, so for situations like this
netfilter can act faster, as long as you specify the correct rules for
connections both ways.  However I can't find anything in the
documentation about this... after a cursory look... can anyone refresh
my memory?

-- 
mors omnia vincit

