From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: new iptables user - default options
Date: Tue, 28 Oct 2003 12:54:24 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA578CB@OST_EXCH_USR5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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

Thanks Robert - I appreciate your response.

I have to say I'd agree - it seems to be more of a belt and braces approach
to use your suggestion, and more in the spirit of what we were told in
checkpoint kindergarten ["deny everything unless explicitly asked" - also
sounds a bit like being married].

Are the rules in each chain processed top down?

steve






-----Original Message-----
From: Robert P. J. Day [mailto:rpjday@mindspring.com] 
Sent: 28 October 2003 12.34
To: Knight, Steve
Cc: netfilter@lists.netfilter.org
Subject: Re: new iptables user - default options


On Tue, 28 Oct 2003, Knight, Steve wrote:

> Hi there
> 
> Rh9 has installed all the default filter policies as "accept" and then
> forwards all packets from INPUT and FORWARD to a Lokkit chain.
> 
> Is this normal?  It seems to me [as a iptables n00b, although I am
> checkpoint certified] to be ok, as eventually the traffic is hitting the
> detailed lokkit chain, but is this the default install options that
everyone
> gets?

it seems that it's just a philosophical difference.  you can set the
DENY policy, then explicitly accept only what you want, or as RH did,
accept everything only to pass it all to a user-defined chain that
effectively does the same thing.

personally, i'd rather see a DENY policy so that, if i somehow messed
up some of my rules, i'm more likely to be *more* restrictive than
less restrictive.  but RH's approach seems no worse, just different.

rday



.


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


