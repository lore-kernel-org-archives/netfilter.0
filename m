From: Mail Lists <lists@sapience.com>
Subject: Re: subnet problem
Date: Mon, 19 Jul 2004 23:15:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040720031542.GC7576@sapience.com>
References: <20040718205007.GA7576@sapience.com> <200407182202.20404.Antony@Soft-Solutions.co.uk> <20040718221008.GB7576@sapience.com> <200407191012.04832.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407191012.04832.Antony@Soft-Solutions.co.uk>
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

On Mon, Jul 19, 2004 at 10:12:04AM +0100, Antony Stone wrote:
> On Sunday 18 July 2004 11:10 pm, Mail Lists wrote:
> 
> > iptables -A INPUT   -s 1.0.0.0/7 -i eth1 -j cRES_LDROP
> > iptables -A INPUT   -s 173.0.0.0/5 -i eth1 -j cRES_LDROP
> > iptables -A INPUT   -s 181.0.0.0/6 -i eth1 -j cRES_LDROP
> > iptables -A INPUT   -s 185.0.0.0/7 -i eth1 -j cRES_LDROP
> > iptables -A INPUT   -s 189.0.0.0/7 -i eth1 -j cRES_LDROP
> 
> The first first octet of all the above addresses is an odd number; therefore 
> the LSB = 1, therefore any netmask shorter than 8 bits is inappropriate.

  Indeed - wacky list - will fix - I'm assuming that might cause
  problems. Looks like 173/5 is an attempt to represent is 
  173/8 thru 180/8 for example. 

  Will repair asap.

  Thanks kindly'

  gene/

> 
> Regards,
> 
> Antony.
> 
> -- 
> RTFM may be the appropriate reply, but please specify exactly which FM to R.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.

