From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: forwarding traffic to different hosts
Date: Sat, 28 Aug 2004 01:34:14 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040828003414.GA22322@metastasis.org.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC90512F1@asimail2.alphanumeric.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512F1@asimail2.alphanumeric.com>
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

On Fri, Aug 27, 2004 at 07:35:21AM -0400, Jason Opperisano wrote:

> > What I'm looking for is for queries to one DNS server from certain
> > IP addresses to be redirected to another... but without any
> > interaction with the BIND daemon itself.
> 
> can you provide a more detailed description of the network
> architecture?  it is unclear to me what you're actually trying to do.
> is 198.81.129.101 a gateway, or just a host?  where is 207.155.252.12
> in relation to the 198.81.129 network?  where's the default gateway in
> this situation?

Good point, how's this?

207.155.252.12 - out on the Internet somewhere
  |
  |
  |
198.81.129.1 - default gateway
  |
  |
  |
-------------------------------------
  |                              |
  |                        198.81.129.101
198.81.129.100

So usually a DNS request from the Internet comes in to 198.81.129.100,
which .100 will answer as normal.  However should .100 receive the DNS
request from 207.155.252.12 it will redirect that packet to
198.81.129.101, back out the interface the packet came in on.  Is that
even possible?

198.81.129.100 and .101 have a single interface, IPtables is just being
to protect the hosts themselves.

-- 
mors omnia vincit

