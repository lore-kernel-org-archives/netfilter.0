From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: vpn under linux
Date: Sat, 10 Apr 2004 10:44:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404101044.23558.Antony@Soft-Solutions.co.uk>
References: <4077B7EF.5070805@tin.it> <200404101018.38664.Antony@Soft-Solutions.co.uk> <4077BEFF.4060902@tin.it>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4077BEFF.4060902@tin.it>
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

On Saturday 10 April 2004 10:31 am, Gianni Pucciani wrote:

> Antony Stone wrote:
> >
> >PPP is Point-to-Point Protocol, and has almost nothing to do with VPNs :)
> >
> >SSH is Secure Shell, and at least it contains some encryption, but again,
> > is almost nothing to do with VPNs (but more on that later).
>
> I thought that they could be used in conjuction to achieve vpn
> functionalities...

Er, well, actually, yes they can, however it is *really* ugly, it breaks some 
of the ways in which TCP works, and I wouldn't normally even let someone know 
it was possible until they'd exhausted all other sane ways to set up a VPN 
and failed for some reason.

The most common reason I know of for people wanting to create a VPN using SSH 
and PPP is when they're behind a firewall which doesn't allow them to create 
VPNs (using PPTP or IPsec) but does allow SSH - ie: as a way to bypass an 
organisation's security policy of not allowing personal VPN setups :)

As I said in my earlier reply, you can tunnel other protocols through an SSH 
link, and it turns out that this includes PPP.

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


