From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: trying to get one blessed thing to work
Date: Mon, 8 Jul 2002 19:30:15 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <0207081930150C.14428@Lms>
References: <20020708123223.7107dc16.mt@open2web.com> <02070818562409.14428@Lms> <077c01c226a4$3587a7d0$3200a8c0@jungle.funkybadger.org>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <077c01c226a4$3587a7d0$3200a8c0@jungle.funkybadger.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>, Netfilter Mailing List <netfilter@lists.samba.org>

On Monday 08 July 2002 19:23, Adam D. Barratt wrote:
> Jan Humme wrote:
> > On Monday 08 July 2002 18:32, Mark Tessier wrote:
>
> [...]
>
> > > The first thing I did was to set the policy to drop for the
>
> forward chain
>
> > > as in:
> > >
> > > iptables --policy FORWARD DROP
> >
> > => Response on my machine (and yours) is:
> > iptables v1.2.1a: Unknown arg '--policy'
> > Try 'iptables -h` or 'iptables --help' for more information.
>
> Not on a 1.2.6a (or any version I've ever used) it's not. If you enter
>
>   iptables --policy
>
> without any arguments, then you'll get that error. Enter the line as
> quoted and it'll work perfectly.
>
> > Suppose you mean:
> > #iptables -P FORWARD DROP ?
>
> RFTM. -P is shorthand for --policy, as iptables --help would quickly
> have shown.

Thank you.

I deserved and needed to hear that.

Jan Humme.

