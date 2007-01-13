From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Need to solve a NAT problem, any takers.
Date: Fri, 12 Jan 2007 23:45:17 -0600
Message-ID: <45A871ED.9070500@riverviewtech.net>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024EF8A@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829024EF8A@pxtbenexd01.pxt.primeexalia.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 01/11/07 21:35, Gary W. Smith wrote:
> Internally our DNS server are split giving us internal IP's when queried
> internally and external's when queried externally.  This works fine.
> Our second DNS server internally slaves the primary.  Because we are
> using this split functionality when it slaves the internal IP's it gets
> the internal IP configuration.  Works great.  But in order to replicate
> the external range it must do so by replicating from the external IP.
> This fails at the IP's is NAT'd in by port only.  Years ago we solved
> this by running a second POSTROUTING rule and an OUTPUT rule on the
> firewall.  When I load these rules now 

I know this is not an IPTables / NAT answer, but I think it may possibly 
be an answer to your need.  What if you add a different subnet to your 
two DNS servers that each of them consider to be for the external view. 
  Tell your secondary to contact the primary on it's IP in this external 
view subnet.

Just a thought.



Grant. . . .

