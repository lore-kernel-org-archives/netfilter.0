From: richard lucassen <netfilter@lucassen.org>
Subject: Re: kernel-2.6: ipsec without devices
Date: Thu, 5 Aug 2004 12:25:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040805122501.7bd24f63.netfilter@lucassen.org>
References: <20040805113320.5a1ade04.netfilter@lucassen.org>
	<200408051109.34290.Antony@Soft-Solutions.co.uk>
Reply-To: reply3@lucassen.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408051109.34290.Antony@Soft-Solutions.co.uk>
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

On Thu, 5 Aug 2004 11:09:34 +0100
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Thursday 05 August 2004 10:33 am, richard lucassen wrote:
> 
> > Anyone an explanation (or a link to an explanation) why the IPSEC
> > implementation in kernel-2.6 doesn't use devices like "ipsec0"?
> 
> My understanding of this is that the kernel developers simply didn't
> like the concept of "virtual" interfaces for no (essential) reason.  
> When FreeS/WAN was a patch to the 2.4 kernel, it was necessary to
> create these interfaces to get things working, but now that the code
> is integrated inside the kernel itself, the pseudo-devices are no
> longer needed, so they've been removed.
> 
> I tend to agree with you that they were a useful way to keep track of
> which packets were going where, and I think from a firewalling point
> of view the new 2.6 implementation of IPsec is not as easy to work
> with.

I just found this pdf on the net with a clear explanation of what's
going on. I'm glad to hear that I'm not the only one who's feeling
uncomfortable with the IPSEC implementation in 2.6. Hopefully the newer
versions of 2.6 will give us back the good old ipsec devices.

http://www.xelerance.com/talks/linuxtag2004/IPseconLinux.pdf

R.

-- 
___________________________________________________________________
Recursion: see recursion

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+

