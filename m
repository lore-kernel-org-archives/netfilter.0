From: "Richard" <richard@o-matrix.org>
Subject: RE: iptables and SIP
Date: Thu, 16 Dec 2004 14:05:03 -1000
Message-ID: <EINSTEINt9Cz93MgPPf00000873@einstein.systemmetrics.com>
References: <20041216134803.GA10547@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041216134803.GA10547@sunbeam.de.gnumonks.org>
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
Content-Type: text/plain; charset="us-ascii"
To: 'Harald Welte' <laforge@netfilter.org>, "'Zelmans, Bernard'" <BZelmans@CROSSBEAMSYS.COM>
Cc: netfilter@lists.netfilter.org

> 
> On Tue, Dec 14, 2004 at 12:18:41PM +0100, Zelmans, Bernard wrote:
> > Is there some iptables code that supports SIP:
> > -opening the pinhole
> > -modify the IP address of the end point in the signaling so that the rtp
> > channel is opened properly
> > -closing the pinhole when the call is terminated
> > -preventing DOS attacks
> 
> No, but contributions/patches are always welcome.
> 
> As for now, I think running siproxd (including rtp proxy) is the best
> you can get.
> 
People have been talking/asking for a SIP ALG for long time. Making a
rudimental one is not too hard. You can check Linksys router's gpl code. The
latest code of wrt54g has a SIP conntrack. It is ok to make basic phone
calls.

SIP is a quite complex and flexible protocol. When it gets to some features,
I haven't seen a working SIP ALG yet. For example, with linksys' SIP
conntrack, if you have two phones behind the same NAT and calling between
each other, with certain phones SIP CANCEL message can't be processed
properly. So if one side hangs up before the other side picks up, the callee
still keeps getting the ring.

If you only worry about SIP message having the default 3 minutes timeout,
there is a new contribution for a jump TARGET to change the timeout value.

For media to pass through, you can use some kind of rtp proxy sitting on the
public internet.

Richard



