From: Juergen Stohr <juergen.stohr@lpr.e-technik.tu-muenchen.de>
Subject: Re: bug? blocked packets get shadowed to internal network
Date: Thu, 14 Aug 2003 17:07:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030814170755.A25916@rcs.ei.tum.de>
References: <Pine.LNX.4.44.0308141501421.31438-100000@localhost> <Pine.LNX.4.44.0308141506450.31438-100000@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0308141506450.31438-100000@localhost>; from chris@netservers.co.uk on Thu, Aug 14, 2003 at 03:07:54PM +0100
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

Hi Chris,
> > I've noticed some problems with TCP resets not being generated properly in
> > recent kernels (since 2.4.19 I think). Could you try REJECT without
> > tcp-reset, and see if the ICMP error is sent out of the correct interface?
> 
> It's the same issue. We don't see the TCP resets because they are being
> sent out of the wrong interface. I'm investigating. In the mean time you 
> can try REJECT without tcp-reset, that works for us.
> 

Yes, REJECT without tcp-reset works as expected.

thanks,
	juergen


