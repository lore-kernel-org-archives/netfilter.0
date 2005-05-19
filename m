From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Wed, 18 May 2005 21:09:03 -0500
Message-ID: <428BF53F.5050609@riverviewtech.net>
References: <NDBBKABJBJCIJNAELLKEIEACJFAA.jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NDBBKABJBJCIJNAELLKEIEACJFAA.jimm@simutronics.com>
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
To: netfilter@lists.netfilter.org

>>I am forced to use DROP here instead of TARPIT as the TARPIT isn't
>>supported yet for the 2.6.x kernel branch
> 
> Is this true that Tarpit does not work with 2.6 kernels?  I was going to
> give it a try on one of my no-production firewalls.

No, this is not true at all.  I'm using a 2.6.10 kernel to do the testing of this very script on.  I have patched the kernel via patch-o-matic so it is possible that the TARPIT target is one of the things that I patched in to the kernel.  I can't recall at the moment as there have been a LOT of things patched in to this kernel.



Grant. . . .

