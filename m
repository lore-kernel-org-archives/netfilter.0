From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Windows Broadcast
Date: Mon, 1 Mar 2004 14:21:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403011421.57263.Antony@Soft-Solutions.co.uk>
References: <20040301141547.30501.qmail@flock1.newmail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040301141547.30501.qmail@flock1.newmail.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="koi8-r"
To: Netfilter-List <netfilter@lists.netfilter.org>

On Monday 01 March 2004 2:15 pm, =F0=CF=D0=CF=D7 =E9=C7=CF=D2=D8 =EE=C9=CB=
=CF=CC=C1=C5=D7=C9=DE wrote:

> >As a broadcast packet is a packet internal to a network, it don't have
> >to go through a router, so it will go on INPUT chain.
>
> If I have two networks with windows machines without wins server, what =
I
> can do with iptables to permit broadcats packets for netbios name resol=
ve.

Set up a bridge?

Depends on your subnet addressing arrangements (and why they are two netw=
orks=20
anyway...)

Antony.

--=20
Christmas was just an opportunity to upgrade to kernel 2.6 while no-one w=
as=20
around to notice the downtime.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


