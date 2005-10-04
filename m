From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Tue, 4 Oct 2005 12:37:56 +0200
Message-ID: <200510041237.57236.marek.zachara@conexe.pl>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Just to make sure, i have compiled kernel 2.4.31 and also switched back to=
=20
1.2.11 iptables. But nothing changed. Still the packets don't get SNAT-ed a=
nd=20
there has been no hit on SNAT rule for about an hour (packets are sent ever=
y=20
ten seconds or so). This only applies to UDP packets.

Now i have noticed the same problem on another of my machines. Since its no=
t=20
only me having problems, maybe its some well-hidden bug in the netfilter?

As a side note: both routers that are having this problem are diskless=20
machines with root-over-nfs (mostly R/O) could this be any issue?

Marek


On Tuesday 04 of October 2005 09:09, bernin_a@informatik.haw-hamburg.de wro=
te:
> > Hi,
>
> Hi all!
>
> > I have been having problems with this for some time now. Some packets a=
re
> > not processed correctly by iptables. This applies only to POSTROUTING
> > chain in NAT table.
>
> I have almost the same problem here. Some packets don't seem to traverse
> the POSTROUTING chain of the nat table and don't get Snatted, but i can s=
ee
> them in the mangle table (POSTROUTING) chain. It is also UDP traffic, and=
 i
> am sure that the nat does not work cause cause i can see the not-natted
> traffic on another machine (where the packets get dropped by the firewall=
).
> I am also able to log this traffic in the POSTROUTING chain of table
> mangle, if i try to log them in POSTROUTING of the nat table, they don't
> get there. But, this does not occur with all connections, some are natted
> correctly.
>
> --arne
>
>
>
> _________________________________________________
> Versendet =FCber Webmail der HAW Hamburg
> http://www.haw-hamburg.de/webmail

