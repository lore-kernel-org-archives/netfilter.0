From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Odd question with source based blocking
Date: Fri, 27 Aug 2004 14:12:46 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512F4@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> Hope this provides a bit more Info
>
> On Thu, Aug 26, 2004 at 06:49:07PM -0400, Jason Opperisano wrote:
> >
> > you cannot set the "policy" of a custom chain, policies only apply =
to the built-in chains; i.e., iptables -P FORWARD DROP...etc...so i'm =
not sure what you mean by this.
>
> That would have been ideal, but I didn't think it was possible either.
>
> > if a packets jumps to a custom chain, and reaches the end of it--it =
returnsto the calling chain where it left off.  in the above example--a =
packet with a destination ip of 192.168.1.1 and a src ip of 1.2.3.4 =
would match the second rule; traverse the BLOCKED chain, and if no rule =
matches return to the FORWARD chain at the next rule.
>
> I don't suspect there is anyway to change this, is there?

yeah--make the last rule of the chain BLOCKED a DROP rule:

	iptables -A BLOCKED -j DROP

-j

