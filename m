From: Mail Lists <lists@sapience.com>
Subject: Re: subnet problem
Date: Wed, 21 Jul 2004 19:46:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040721234657.GE7576@sapience.com>
References: <20040718205007.GA7576@sapience.com> <200407182202.20404.Antony@Soft-Solutions.co.uk> <20040718221008.GB7576@sapience.com> <200407191012.04832.Antony@Soft-Solutions.co.uk> <20040720031542.GC7576@sapience.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040720031542.GC7576@sapience.com>
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


On Mon, Jul 19, 2004 at 11:15:42PM -0400, Mail Lists wrote:
> On Mon, Jul 19, 2004 at 10:12:04AM +0100, Antony Stone wrote:
> > On Sunday 18 July 2004 11:10 pm, Mail Lists wrote:
> > 
> > The first first octet of all the above addresses is an odd number; therefore 
> > the LSB = 1, therefore any netmask shorter than 8 bits is inappropriate.
> Indeed - wacky list - will fix - 

  Just a thank you follow up. After cleaning up the subnet masks
  the only hit on reserved ips I have now (2 days or so) is an 
  ack/rst from 89.205.79.229 which is appropriately dropped.

  Thanks again

  gene/



