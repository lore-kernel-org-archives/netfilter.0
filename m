From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Need some clarification or help
Date: Fri, 23 Apr 2004 09:02:40 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0404230900470.16402-100000@filer.marasystems.com>
References: <20040422213202.GB2328@rie.rie.priv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040422213202.GB2328@rie.rie.priv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Riechmann <riechmann@fgan.de>
Cc: netfilter@lists.netfilter.org

On Thu, 22 Apr 2004, Christian Riechmann wrote:

> I do not know whether this proposal is feasable, because I need a 1-to-n
> tunnel and the tunnel should allow broadcast addressing. Perhaps you
> can help me.

I don't see why tun device can not help you there. It is just another 
method of getting packets in/out of userspace.

It can even be member of a bridge if you like (tap mode), allowing a 
tunneled brigde operation.

Regards
Henrik


