From: Michael Sconzo <msconzo@net.tamu.edu>
Subject: Re: again problem with alias / virtual interface
Date: Wed, 21 Jul 2004 11:48:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040721114840.G9160@net.tamu.edu>
References: <007d01c46dae$0a45f330$eb53623e@x> <Pine.LNX.4.44.0407211707490.31223-100000@Megathlon.ESI>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0407211707490.31223-100000@Megathlon.ESI>; from netfilter@esiway.net on Wed, Jul 21, 2004 at 05:34:29PM +0200
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

On Wed, Jul 21, 2004 at 05:34:29PM +0200, Marco Colombo wrote:

> But the whole idea of 'virtual interfaces' is obsolete. The linux kernel
> (and thus iptables) knows only of physical interfaces and ip addresses.
> You can set a label for each ip address, but that's only a trick to make
> the old ifconfig work. Labels are, well, just labels, the kernel doesn't
> need them at all. If you're using 'ip' to configure ip addresses, you
> can forget about labels (but ifconfig won't work).
> 

What is the proper way to do it, tried poking around on google, maybe
I'm just looking for the wrong thing.  Or is it even a proper way to do
it?  I have a box that is using kernel bridging so I have an IP on the 
bridged interface, but would like to have it accessable via another IP 
as well.

Thoughts?

Thanks,
-=Mike


-- 
_
_ Michael J. Sconzo
_ Computing & Information Services, Texas A&M University

The New Testament offers the basis for modern computer coding theory,
in the form of an affirmation of the binary number system.
        But let your communication be Yea, yea; nay, nay: for
        whatsoever is more than these cometh of evil.
                -- Matthew 5:37

