From: "Darrell A. Escola" <darrell@descola.net>
Subject: Re: log all dropped packets
Date: Tue, 1 Oct 2002 20:38:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021002033836.GA19753@descola.net>
References: <F44BHkJZbK4DAx0hIEA000051cb@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F44BHkJZbK4DAx0hIEA000051cb@hotmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Oct 02, 2002 at 01:18:59AM +0000, SB CH wrote:
> Hello, all.
> 
> Question1. 
> I would like to log all Dropped packet.
> How can I write a log about all dropped packet?
> 
> Question2.
> Surely, my default policy is DROP.
> and one can't log about related default Policy.
> How can I log packet information about default policy related? 
> 
Just add a -j LOG rule before each DROP rule, or as the last rule in a chain
with a policy of DROP.

-- 
Darrell A. Escola, CCNA(R)
Cisco(R) Certified Network Associate

