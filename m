From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: snat to multiple source ip
Date: Thu, 15 Sep 2005 07:21:03 -0500
Message-ID: <200509150721.03842.rob0@gmx.co.uk>
References: <BAY103-DAV1334699C22EB479A7856C6B29E0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-DAV1334699C22EB479A7856C6B29E0@phx.gbl>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 2005-September-15 04:59, Marco Berizzi wrote:
> My firewall script mark all the squid packet and I route them

You did not post your rules.

> through the two adsl connections (I have patched the kernel
> with the equalize patch).

Which patch is this? I have used Julian Anastasov's patches
    http://www.ssi.bg/~ja/#multigw
at numerous sites. The NANO-HOWTO linked therefrom is a step by step 
recipe for how to set up the routing and firewall rules.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

