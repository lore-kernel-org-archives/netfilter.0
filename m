From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FW: Multiple PPTP clients behind iptables.
Date: Sat, 10 Apr 2004 09:17:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404100917.29039.Antony@Soft-Solutions.co.uk>
References: <GHEILNONPACCGBGKBEKKOEBKCFAA.mani@manikandan.org>
Reply-To: "Netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GHEILNONPACCGBGKBEKKOEBKCFAA.mani@manikandan.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Saturday 10 April 2004 6:18 am, Manikandan wrote:

> When I try to apply the patch, using netfilter CVS I am getting an error
> like
>
> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
> Testing patch submitted/03_2.4.21.patch...
> Failed to patch copy of /usr/src/linux-2.4.20-8/
> TEST FAILED: patch NOT applied.
>
> [Press enter to continue]
> What could be wrong?

It could be that the patch is for kernel 2.4.21 (or later, perhaps, I'm not 
sure...), and you're trying to apply it to kernel 2.4.20?

Regards,

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


