From: cldavis@speakeasy.net
Subject: Re:  Firewall Script Help
Date: Mon, 08 Mar 2004 21:14:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <W7941417650321211078780481@webmail3>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org


Anthony:
> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> Sent: Monday, March 8, 2004 08:32 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Firewall Script Help
> 
> On Monday 08 March 2004 8:12 pm, David Cannings wrote:
> 
> > >     0     0 DROP       tcp  --  any    any     anywhere
> > > anywhere           tcp flags:FIN,ACK/FIN
> >
> > As I understand it, this means "check the flags FIN and ACK, only mat=
ch if
> > FIN is set and ACK isn't".  This would match packets that only have t=
he
> > FIN flag set, which I am fairly sure are valid.  I may need correctin=
g on
> > this issue, however.
> 
> You are correct.
> 
[...]
Packets that only have the FIN flag set are valid -- but I believe would =
be taken care of by the ESTABLISHED,RELATED rule.  The FIN FLAG rule I en=
tered just in case someone decided to bombard my systems with FIN flag pa=
ckets only...
Is that an unneeded rule to protect against a DoS attack?



