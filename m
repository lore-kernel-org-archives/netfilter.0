From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Wed, 22 Feb 2006 13:57:15 -0800
Message-ID: <5f56302b0602221357k27931798n7d521184123bb1c9@mail.gmail.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
	<54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>
	<5f56302b0602220325p1c66f156y47e8ad569ee7fffb@mail.gmail.com>
	<56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>
	<5f56302b0602220539t2ec885acwda00f0f2eb521854@mail.gmail.com>
	<5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
	<43FCCF82.6010402@certicom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43FCCF82.6010402@certicom.com>
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
To: netfilter@lists.netfilter.org

On 2/22/06, Chinh Nguyen <cnguyen@certicom.com> wrote:
>
> Daniel Nogradi wrote:
> > Anyway, what I have tried is:
> >
> > # make sure we start from zero
> >
> > iptables --flush
> > iptables -t nat --flush
> > iptables --delete-chain
> > iptables -t nat --delete-chain
> >
> > # set up masquerading from LAN to modem which is hook up on eth0
> >
> > iptables -t nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
> >
> > # allow forwarding from LAN which is hookup up on eth1
> >
> > iptables -A FORWARD --in-interface eth1 -j ACCEPT
>
> I think that when you have a rule like this, you need the converse. ie,
> iptables -A FORWARD --in-interface eth0 -j ACCEPT

> If you want restrictions such that connections are initiated from B only,
> you
> could restrict the inbound forward.
>
> iptables -A FORWARD --in-interface eth0 -m state --state ESTABLISHED,RELA=
TED
> -j
> ACCEPT

Hi Chinh, I tried interchanging eth0 and eth1 and still no luck. I
didn't want to restrict the source yet, because I first would like to
see that it works at all, and then start tightening security.
/var/log/messages also says nothing. Is there any other log file which
would be useful to check?

