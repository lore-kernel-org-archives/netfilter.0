From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: kernel-2.6: ipsec without devices
Date: Thu, 5 Aug 2004 11:09:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408051109.34290.Antony@Soft-Solutions.co.uk>
References: <20040805113320.5a1ade04.netfilter@lucassen.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040805113320.5a1ade04.netfilter@lucassen.org>
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

On Thursday 05 August 2004 10:33 am, richard lucassen wrote:

> Hello list,
>
> Anyone an explanation (or a link to an explanation) why the IPSEC
> implementation in kernel-2.6 doesn't use devices like "ipsec0"?

My understanding of this is that the kernel developers simply didn't like the 
concept of "virtual" interfaces for no (essential) reason.   When FreeS/WAN 
was a patch to the 2.4 kernel, it was necessary to create these interfaces to 
get things working, but now that the code is integrated inside the kernel 
itself, the pseudo-devices are no longer needed, so they've been removed.

I tend to agree with you that they were a useful way to keep track of which 
packets were going where, and I think from a firewalling point of view the 
new 2.6 implementation of IPsec is not as easy to work with.

Regards,

Antony.

-- 
Late in 1972 President Richard Nixon announced that the rate of increase of 
inflation was decreasing.   This was the first time a sitting president used 
a third derivative to advance his case for re-election.

 - Hugo Rossi, Notices of the American Mathematical Society

                                                     Please reply to the list;
                                                           please don't CC me.


