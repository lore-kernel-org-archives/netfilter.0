From: Dave Strydom <strydom.dave@gmail.com>
Subject: Re: ftp conntrack - nat problem
Date: Wed, 9 Nov 2005 17:56:23 +0200
Message-ID: <fc38b710511090756t97d55acvda8f9383274073a8@mail.gmail.com>
References: <fc38b710511072303w6144c3a7i3068e781c871799d@mail.gmail.com>
	<fc38b710511090729n7ab1ba18r2734bcf4ce2c1441@mail.gmail.com>
	<fc38b710511090740s457f85adm94675c541e9072d4@mail.gmail.com>
	<200511090951.35603.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511090951.35603.rob0@gmx.co.uk>
Content-Disposition: inline
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

So if it isnt the firewall, then what on earth could it be?

Because from the tethereal output, you can see that FTP-DATA isnt
being sent, any idea of what could cause this?

If i remove the nat, and ftp things direct the firewall it works fine,
it's only if I nat stuff to a ftp behind the firewall.


----------------------------------
On 11/9/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Wednesday 2005-November-09 09:40, Dave Strydom wrote:
> > Ok, so this is what it has all been reduced to, and I'm still
> > getting the same problem:
>
> What more can I say?
>
> > Calypso ~ # iptables-save
>
> This is like not having a firewall at all. The only functional part is
> the NAT, DNAT FTP inbound, MASQUERADE LAN clients outbound.
>
> Not having a firewall is not necessarily a disaster, BTW. A properly
> configured system should still be safe without it.
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>
>

