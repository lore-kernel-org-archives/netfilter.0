From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re:  Firewall Script Help
Date: Mon, 8 Mar 2004 22:06:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403082206.26777.Antony@Soft-Solutions.co.uk>
References: <W7941417650321211078780481@webmail3>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <W7941417650321211078780481@webmail3>
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

On Monday 08 March 2004 9:14 pm, cldavis@speakeasy.net wrote:

> Antony:
> > >
> > > As I understand it, this means "check the flags FIN and ACK, only match
> > > if FIN is set and ACK isn't".  This would match packets that only have
> > > the FIN flag set, which I am fairly sure are valid.  I may need
> > > correcting on this issue, however.
> >
> > You are correct.
>
> Packets that only have the FIN flag set are valid -- but I believe would be
> taken care of by the ESTABLISHED,RELATED rule.

Yes, that's a fair point.

> The FIN FLAG rule I entered
> just in case someone decided to bombard my systems with FIN flag packets
> only... Is that an unneeded rule to protect against a DoS attack?

I'm not aware of a DoS attack using FIN flags (since no resources get used by 
a system when it receives a FIN packet), however people certainly do carry 
out port scans using FIN packets, and therefore I agree with you, it's 
probably a sensible thing to block.

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


