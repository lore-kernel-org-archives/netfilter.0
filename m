From: Frank Gruellich <frank@der-frank.org>
Subject: Re: "No Route: Rusty's brain broke" ??????
Date: Fri, 3 Sep 2004 19:26:32 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040903172632.GE32422@der-frank.org>
References: <200409031401.i83E1R53004651@webmail2.magma.ca>
	<200409031035.25051.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200409031035.25051.Alistair@nerdnet.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

* Alistair Tonner <Alistair@nerdnet.ca>  3. Sep 04:
> On September 3, 2004 10:01 am, dravya wrote:
> > I have two ppp connections setup and I want access the internet via these
> > links.... However, I get the error message "kernel: No Route: Rusty's brain
> > broke".
> 	I think you need to look at your routing setup ...:

ACK.

> 	I believe this is a ROUTING error.

The last time I saw this error a masqerading router received a packet
from its own ip# of an external interface at another (internal) one.  (I
did some really weird routing stuff this days.)  So the output of 'ip
route show' would be a good starting point.

> 	Someone else on the list will be better able to advise you on how to do 
> that... but it DOES require some work beyond the scope of iptables.

I think he wants to read the LARTC-howto.

HTH,
 regards, Frank.
-- 
Sigmentation fault

